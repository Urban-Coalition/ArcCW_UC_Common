att.PrintName = "Masterkey Underslung Shotgun"
att.AbbrevName = "Masterkey Shotgun"
att.Icon = Material("entities/att/acwatt_uc_ubgl_masterkey.png", "mips smooth")
att.Description = "Underslung shotgun primarily used to breach doors, but loaded with #00 Buckshot for your pleasure. Negatively impacts the weapon's handling."
att.Ignore = false

att.SortOrder = -100000

att.AutoStats = true
att.Desc_Pros = {
}
att.Slot = "uc_ubgl"
att.ExcludeFlags = {"uc_noubgl"}

att.LHIK = true

att.ModelOffset = Vector(1.0, 0, -1.7)
att.Model = "models/weapons/arccw/atts/uc_ubgl_masterkey.mdl"

att.SelectUBGLSound =  ""
att.ExitUBGLSound = ""

att.UBGL = true

att.UBGL_PrintName = "UBSG"
att.UBGL_Automatic = false
att.UBGL_MuzzleEffect = "muzzleflash_shotgun"
att.UBGL_Ammo = "buckshot"
att.UBGL_RPM = 600
att.UBGL_Recoil = 1

-- ??
att.UBGL_Capacity = 4
att.UBGL_ClipSize = 4

att.LHIK_GunDriver = 2
att.LHIK_CamDriver = 3

att.Hook_ModifyAttBodygroups = function(wep, data)
    if wep:GetBuff_Override("UC_UseClassicM203Mount") then
        data.element.Model:SetBodygroup(1, 1)
    end
end

local function Ammo(wep)
    return wep:GetOwner():GetAmmoCount("buckshot")
end

att.Hook_LHIK_TranslateAnimation = function(wep, key)
    if key == "idle" then
        if wep:GetInUBGL() then
            return "idle_armed"
        else
            return "idle"
        end
    end
end

att.Hook_ShouldNotSight = function(wep)
    if wep:GetInUBGL() then
        return true
    end
end


att.Hook_OnSelectUBGL = function(wep)
    wep:SetNextSecondaryFire(CurTime() + 0.7)
    wep:DoLHIKAnimation("to_armed", 0.7)
    wep:PlaySoundTable({
        {s = "arccw_uc/common/rattle_b2i_rifle.ogg", t = 0},
        {s = "arccw_uc/common/raise.ogg", t = 0.15},
        {s = "arccw_uc/common/grab.ogg", t = 0.3},
    })
end

att.Hook_OnDeselectUBGL = function(wep)
    wep:SetNextSecondaryFire(CurTime() + 0.7)
    wep:DoLHIKAnimation("to_idle", 0.7)
    wep:PlaySoundTable({
        {s = "arccw_uc/common/rattle_b2i_rifle.ogg", t = 0},
        {s = "arccw_uc/common/shoulder.ogg", t = 0.3},
    })
end

att.UBGL_Fire = function(wep, ubgl)
    if wep:Clip2() <= 0 or wep:GetNextPrimaryFire() > CurTime() then return end
    if wep:GetNW2Bool("MasterkeyNeedsPump", false) then return end

    local owner = wep:GetOwner()

    local dir = (owner:EyeAngles() + wep:GetFreeAimOffset()):Forward()

    local bullet = {
        DamageMax = 18, -- 6 pellets to kill
        DamageMin = 13, -- 8 pelllets to kill
        Range = 50,
        RangeMin = 5,
        DamageType = DMG_BUCKSHOT + DMG_BULLET,
        Penleft = 0,
        Penetration = 0,
        Num = 1,
        Damaged = {},
        Weapon = wep,
        BodyDamageMults = ArcCW.UC.BodyDamageMults_Shotgun,
    }

    local data = {
        Attacker = owner,
        Dir        = dir,
        Src        = wep:GetShootSrc(),
        Spread     = Vector(0, 0, 0),
        Damage     = 0,
        Num        = 1,
        Force      = 10,
        HullSize   = 4,
        Weapon     = wep,
        Callback = function(attacker, tr, dmg)
            -- HACK: Pass a fake bullet table instead of ourselves so we don't use the weapon's attributes unintentionally
            bullet.Travelled = (tr.HitPos - tr.StartPos):Length()
            ArcCW:BulletCallback(att, tr, dmg, bullet)
        end
    }

    if wep:GetOwner():IsPlayer() then
        for n = 1, 8 do
            local dirry = Vector(dir.x, dir.y, dir.z)
            math.randomseed(math.Round(util.SharedRandom(n, -1337, 1337, !game.SinglePlayer() and wep:GetOwner():GetCurrentCommand():CommandNumber() or CurTime()) * (wep:EntIndex() % 30241)))
            wep:ApplyRandomSpread(dirry, ArcCW.MOAToAcc * 100)
            data.Dir = dirry
            if GetConVar("arccw_bullet_enable"):GetBool() then
                ArcCW:ShootPhysBullet(wep, data.Src, (250 / ArcCW.HUToM) * data.Dir:GetNormalized(), 0, bullet)
            else
                owner:FireBullets(data, true)
            end
        end
    else
        data.Spread = Vector(ArcCW.MOAToAcc * 50, ArcCW.MOAToAcc * 50, 0)
        data.Num = 8
        owner:FireBullets(data, true)
    end

    wep:MyEmitSound(")^/weapons/arccw_ud/870/fire.ogg", 100, 100, 1, CHAN_WEAPON )
    wep:MyEmitSound(")^/weapons/arccw_ud/870/fire_dist.ogg", 149, 100, 0.5, CHAN_WEAPON + 1)

    wep:DoLHIKAnimation("fire")
    wep:SetNextPrimaryFire(CurTime() + 0.4)
    wep:SetClip2(wep:Clip2() - 1)
    wep:DoEffects()
    wep:SetNW2Bool("MasterkeyNeedsPump", true)
    wep:SetNW2Float("MasterkeyPumpTime", CurTime() + 0.3)
end

att.Hook_Think = function(wep)
    if wep:GetNW2Bool("MasterkeyNeedsPump", false) and wep:GetNW2Float("MasterkeyPumpTime", CurTime()) <= CurTime() and !wep:GetOwner():KeyDown( IN_ATTACK ) then
        wep:SetNW2Bool("MasterkeyNeedsPump", false)
        wep:SetNextPrimaryFire(CurTime() + 0.4)
        if game.SinglePlayer() and SERVER then
            wep:DoLHIKAnimation("cycle")
            wep:PlaySoundTable({
                {s = ")^/weapons/arccw_ud/870/rack_1.ogg", t = 0.05},
                {s = ")^/weapons/arccw_ud/870/eject.ogg", t = 0.15},
                {s = ")^/weapons/arccw_ud/870/rack_2.ogg", t = 0.25},
            })
        end
    end
end

att.UBGL_Reload = function(wep, ubgl)
    if wep:Clip2() >= 4 then return end
    if Ammo(wep) <= 0 then return end

    wep:SetNextSecondaryFire(CurTime() + 2.75)

    wep:DoLHIKAnimation("reload", 2.75)
    wep:PlaySoundTable({
        {s = "arccw_uc/common/raise.ogg", t = 0.15},
        {s = "arccw_uc/common/grab.ogg", t = 0.3},

        {s = ")^/arccw_uc/common/shotgun-insert-alt-01.ogg", t = 0.5},
        {s = ")^/arccw_uc/common/shotgun-insert-alt-02.ogg", t = 1.0},
        {s = ")^/arccw_uc/common/shotgun-insert-alt-03.ogg", t = 1.5},

        {s = "arccw_uc/common/rattle_b2i_rifle.ogg", t = 2.0},

        {s = ")^/weapons/arccw_ud/870/rack_1.ogg", t = 2.3},
        {s = ")^/weapons/arccw_ud/870/rack_2.ogg", t = 2.5},
        {s = "arccw_uc/common/shoulder.ogg", t = 2.6},
    })

    local reserve = Ammo(wep)
    reserve = reserve + wep:Clip2()
    local clip = 4
    local load = math.Clamp(clip, 0, reserve)
    wep:GetOwner():SetAmmo(reserve - load, "smg1_grenade")
    wep:SetClip2(load)
end

att.Mult_SightTime = 1.2
att.Mult_SpeedMult = 0.9
att.Mult_SightedSpeedMult = 0.85