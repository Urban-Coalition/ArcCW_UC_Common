att.PrintName = "M203 Underbarrel Grenade Launcher (usable)"
att.AbbrevName = "M203 Grenade Launcher (usable)"
att.Icon = Material("entities/att/acwatt_uc_ubgl_m203.png", "mips smooth")
att.Description = "Single-shot underbarrel grenade launcher designed to replace the Colt XM148. Able to fire several basic 40x46mm grenade types."

att.SortOrder = -100000

att.AutoStats = true
att.Desc_Pros = {
    "uc.ubgl"
}
att.Slot = "ubgl"

att.LHIK = true

att.ModelOffset = Vector(0, 0, 0)
att.Model = "models/weapons/arccw/atts/uc_ubgl_m203_v7.mdl"


att.UBGL = true

att.UBGL_PrintName = "UBGL"
att.UBGL_Automatic = false
att.UBGL_MuzzleEffect = "muzzleflash_m79"
att.UBGL_Ammo = "smg1_grenade"
att.UBGL_RPM = 600
att.UBGL_Recoil = 2

-- ??
att.UBGL_Capacity = 1
att.UBGL_ClipSize = 1


local function Ammo(wep)
    return wep:GetOwner():GetAmmoCount("smg1_grenade")
end

att.Hook_LHIK_TranslateAnimation = function(wep, key)
    --if key == "idle" then
    --    if wep:GetInUBGL() then
    --        return "idle_armed"
    --    else
    --        return "idle"
    --    end
    --end
end

att.Hook_OnSelectUBGL = function(wep)
    --wep:DoLHIKAnimation("in", 0.5)
    wep:PlaySoundTable({
        {s = "arccw_uc/common/raise.ogg", t = 0},
        {s = "arccw_uc/common/grab.ogg", t = 0.4},
    })
end

att.Hook_OnDeselectUBGL = function(wep)
    --wep:DoLHIKAnimation("out", 0.5)
    wep:PlaySoundTable({
        {s = "arccw_uc/common/rattle_b2i_rifle.ogg", t = 0},
        {s = "arccw_uc/common/shoulder.ogg", t = 0.4},
    })
end

att.UBGL_Fire = function(wep, ubgl)
    if wep:Clip2() <= 0 then return end

    local owner = wep:GetOwner()
    local class = wep:GetBuff_Override("UBGL_Entity")

    if class == "BUCKSHOT" then
        local dir = (owner:EyeAngles() + wep:GetFreeAimOffset()):Forward()

        local bullet = {
            DamageMax = 18,
            DamageMin = 6,
            Range = 50,
            RangeMin = 5,
            DamageType = DMG_BUCKSHOT + DMG_BULLET,
            Penleft = 0,
            Penetration = 0,
            Num = 1,
            Damaged = {},
            Weapon = wep,
        }

        local data = {
            Attacker = owner,
            Dir        = dir,
            Src        = wep:GetShootSrc(),
            Spread     = Vector(0, 0, 0),
            Damage     = 0,
            Num        = 20,
            Force      = 120,
            HullSize   = 4,
            Weapon     = wep,
            Callback = function(attacker, tr, dmg)
                -- HACK: Pass a fake bullet table instead of ourselves so we don't use the weapon's attributes unintentionally
                bullet.Travelled = (tr.HitPos - tr.StartPos):Length()
                ArcCW:BulletCallback(att, tr, dmg, bullet)
            end
        }

        if wep:GetOwner():IsPlayer() then
            for n = 1, 20 do
                local dirry = Vector(dir.x, dir.y, dir.z)
                math.randomseed(math.Round(util.SharedRandom(n, -1337, 1337, !game.SinglePlayer() and wep:GetOwner():GetCurrentCommand():CommandNumber() or CurTime()) * (wep:EntIndex() % 30241)))
                wep:ApplyRandomSpread(dirry, ArcCW.MOAToAcc * 50)
                data.Dir = dirry
                if GetConVar("arccw_bullet_enable"):GetBool() then
                    ArcCW:ShootPhysBullet(wep, data.Src, (250 / ArcCW.HUToM) * data.Dir:GetNormalized(), 0, bullet)
                else
                    owner:FireBullets(data, true)
                end
            end
        else
            data.Spread = Vector(ArcCW.MOAToAcc * 50, ArcCW.MOAToAcc * 50, 0)
            owner:FireBullets(data, true)
        end
        wep:MyEmitSound(")^/arccw_uc/common/gl_fire_buck.ogg", 100, 100, 1, CHAN_WEAPON )
        wep:MyEmitSound(")^/arccw_uc/common/gl_fire_buck_dist.ogg", 149, 100, 0.5, CHAN_WEAPON + 1)
    else
        local proj = wep:FireRocket(class, 5000 * ArcCW.HUToM)
		if SERVER then
        	proj.Damage = 100
		end
        wep:MyEmitSound(")^/arccw_uc/common/40mm/fire-0" .. math.random(1, 6) .. ".ogg", 100, 100, 1, CHAN_WEAPON)
        wep:MyEmitSound(")^/arccw_uc/common/40mm/fire-dist-0" .. math.random(1, 6) .. ".ogg", 149, 100, 0.5, CHAN_BODY)
        wep:MyEmitSound(")^/arccw_uc/common/40mm/mech-0" .. math.random(1, 6) .. ".ogg", 149, 100, 0.5, CHAN_AUTO)
    end

    wep:SetClip2(wep:Clip2() - 1)
    wep:DoEffects()
end

att.UBGL_Reload = function(wep, ubgl)
    if wep:Clip2() >= 1 then return end
    if Ammo(wep) <= 0 then return end

    wep:SetNextSecondaryFire(CurTime() + 2)

    wep:DoLHIKAnimation("idle", 2)
    wep:PlaySoundTable({
        {s = { "arccw_uc/common/rattle1.ogg", "arccw_uc/common/rattle2.ogg", "arccw_uc/common/rattle3.ogg" }, t = 0},
        {s = "arccw_uc/common/40mm/203open.ogg", t = 0.15},
        {s = "arccw_uc/common/magpouch_replace_small.ogg", t = 0.5},
        {s = "arccw_uc/common/40mm/203insert.ogg", t = 1.15},
        {s = "arccw_uc/common/40mm/203close.ogg", t = 1.65},
        {s = "arccw_uc/common/shoulder.ogg", t = 1.9},
    })

    local reserve = Ammo(wep)
    reserve = reserve + wep:Clip2()
    local clip = 1
    local load = math.Clamp(clip, 0, reserve)
    wep:GetOwner():SetAmmo(reserve - load, "smg1_grenade")
    wep:SetClip2(load)
end

att.Mult_SightTime = 1.2
att.Mult_SpeedMult = 0.9
att.Mult_SightedSpeedMult = 0.85

att.ToggleLockDefault = true
att.ToggleStats = {
    {
        PrintName = "High Explosive",
        UBGL_Entity = "arccw_uc_40mm_he"
    },
    {
        PrintName = "Smoke",
        UBGL_Entity = "arccw_uc_40mm_smoke"
    },
    {
        PrintName = "Buckshot",
        UBGL_Entity = "BUCKSHOT"
    }
}