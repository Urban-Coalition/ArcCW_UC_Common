att.PrintName = "Masterkey Underslung Shotgun"
att.AbbrevName = "Masterkey Shotgun"
att.Icon = Material("entities/att/acwatt_uc_ubgl_masterkey.png", "mips smooth")
att.Description = "Underslung shotgun primarily used to breach doors, but loaded with #00 Buckshot for your pleasure."
att.Ignore = true

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
att.UBGL_RPM = 120
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
    if (game.SinglePlayer() and SERVER) or (!game.SinglePlayer() and CLIENT and IsFirstTimePredicted()) then
        wep:DoLHIKAnimation("to_armed", 0.7)
        wep:PlaySoundTable({
            {s = "arccw_uc/common/rattle_b2i_rifle.ogg", t = 0},
            {s = "arccw_uc/common/raise.ogg", t = 0.15},
            {s = "arccw_uc/common/grab.ogg", t = 0.3},
        })
    end
end

att.Hook_OnDeselectUBGL = function(wep)
    wep:SetNextSecondaryFire(CurTime() + 0.7)
    if (game.SinglePlayer() and SERVER) or (!game.SinglePlayer() and CLIENT and IsFirstTimePredicted()) then
        wep:DoLHIKAnimation("to_idle", 0.7)
        wep:PlaySoundTable({
            {s = "arccw_uc/common/rattle_b2i_rifle.ogg", t = 0},
            {s = "arccw_uc/common/shoulder.ogg", t = 0.3},
        })
    end
end

local f1 = {
    ")arccw_uc/common/ub12ga/fire-01.ogg",
    ")arccw_uc/common/ub12ga/fire-02.ogg",
    ")arccw_uc/common/ub12ga/fire-03.ogg",
    ")arccw_uc/common/ub12ga/fire-04.ogg",
    ")arccw_uc/common/ub12ga/fire-05.ogg",
    ")arccw_uc/common/ub12ga/fire-06.ogg",
}
local f2 = {
    ")arccw_uc/common/ub12ga/fire-dist-01.ogg",
    ")arccw_uc/common/ub12ga/fire-dist-02.ogg",
    ")arccw_uc/common/ub12ga/fire-dist-03.ogg",
    ")arccw_uc/common/ub12ga/fire-dist-04.ogg",
    ")arccw_uc/common/ub12ga/fire-dist-05.ogg",
    ")arccw_uc/common/ub12ga/fire-dist-06.ogg",
}
local f3 = {
    ")arccw_uc/common/ub12ga/mech-01.ogg",
    ")arccw_uc/common/ub12ga/mech-02.ogg",
    ")arccw_uc/common/ub12ga/mech-03.ogg",
    ")arccw_uc/common/ub12ga/mech-04.ogg",
    ")arccw_uc/common/ub12ga/mech-05.ogg",
    ")arccw_uc/common/ub12ga/mech-06.ogg",
}

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

    if (game.SinglePlayer() and SERVER) or (!game.SinglePlayer() and CLIENT and IsFirstTimePredicted()) then
        wep:MyEmitSound(table.Random(f1), 80, 100, 1, CHAN_STATIC )
        wep:MyEmitSound(table.Random(f2), 149, 100, 1, CHAN_STATIC )
        wep:MyEmitSound(table.Random(f3), 80, 100, 1, CHAN_STATIC )
    end
    
    if game.SinglePlayer() and SERVER or (!game.SinglePlayer() and CLIENT and IsFirstTimePredicted()) then
        wep:DoEffects()
        wep:DoLHIKAnimation("fire")
    end
    wep:SetNextPrimaryFire(CurTime() + 0.4)
    wep:SetClip2(wep:Clip2() - 1)
    wep:SetNW2Bool("MasterkeyNeedsPump", true)
    wep:SetNW2Float("MasterkeyPumpTime", CurTime() + 0.3)
end

att.Hook_Think = function(wep)
    local pred = game.SinglePlayer() and SERVER or (!game.SinglePlayer() and CLIENT and IsFirstTimePredicted())
    if wep:GetNW2Bool("MasterkeyInReload", false) then
        if wep:GetNW2Float("MasterkeyReloadTime", CurTime()) <= CurTime() then
            if Ammo(wep) <= 0 or wep:Clip2() == 4 then
                wep:SetReloading(CurTime() + 0.5)
                wep:SetNW2Float("MasterkeyPumpTime", CurTime() + 0.5)
                wep:SetNW2Float("MasterkeyReloadTime", CurTime() + 0.5)
                if pred then
                    wep:DoLHIKAnimation("sgreload_end")
                    wep:PlaySoundTable({
                        {s = ")arccw_uc/common/shoulder.ogg", t = 0.1},
                    })
                end
                wep:SetNW2Bool("MasterkeyInReload", false)
            else
                wep:SetReloading(CurTime() + 0.7)
                wep:SetNW2Float("MasterkeyReloadTime", CurTime() + 0.7)
                if pred then
                    wep:DoLHIKAnimation("sgreload_insert", 0.7)
                    wep:PlaySoundTable({
                        {s = ")arccw_uc/common/shotgun-insert-alt-01.ogg", t = 0.05},
                    })
                end
                wep:SetClip2(wep:Clip2() + 1)
                wep:GetOwner():RemoveAmmo(1, "buckshot")
            end
        end
    elseif wep:GetNW2Bool("MasterkeyNeedsPump", false) and wep:GetNW2Float("MasterkeyPumpTime", CurTime()) <= CurTime() and wep:Clip2() > 0 and !wep:GetOwner():KeyDown( IN_ATTACK ) then
        wep:SetNW2Bool("MasterkeyNeedsPump", false)
        wep:SetPriorityAnim(CurTime() + 0.4)
        if pred then
            wep:DoLHIKAnimation("cycle", 1.0)
            wep:PlaySoundTable({
                {s = ")weapons/arccw_ud/870/rack_1.ogg", t = 0.02},
                {s = ")weapons/arccw_ud/870/eject.ogg", t = 0.13},
                {s = ")weapons/arccw_ud/870/rack_2.ogg", t = 0.17},
            })
        end
    end
end

att.UBGL_Reload = function(wep, ubgl)
    if wep:Clip2() >= 4 then return end
    if Ammo(wep) <= 0 then return end

    wep:SetNextSecondaryFire(CurTime() + 2.75)

    local holy = (game.SinglePlayer() and SERVER) or (!game.SinglePlayer() and CLIENT and IsFirstTimePredicted())
    if false and wep:Clip2() == 0 then
        if holy then
            wep:DoLHIKAnimation("sgreload_start_empty", 2)
            wep:PlaySoundTable({
                {s = ")weapons/arccw_ud/870/rack_1.ogg", t = 0},
                {s = ")arccw_uc/common/shotgun-insert-alt-01.ogg", t = 0.8},
                {s = ")weapons/arccw_ud/870/rack_2.ogg", t = 1.5},
                {s = ")arccw_uc/common/shoulder.ogg", t = 1.6},
            })
        end
        wep:SetNW2Bool("MasterkeyNeedsPump", false)
        wep:SetReloading(CurTime() + 2)
        wep:SetNW2Float("MasterkeyReloadTime", CurTime() + 2)

        wep:SetClip2(wep:Clip2() + 1)
        wep:GetOwner():RemoveAmmo(1, "buckshot")
    else
        if holy then
            wep:DoLHIKAnimation("sgreload_start", 0.7)
            wep:PlaySoundTable({
                {s = ")arccw_uc/common/raise.ogg", t = 0.15},
                {s = ")arccw_uc/common/grab.ogg", t = 0.3},
            })
        end
        wep:SetReloading(CurTime() + 0.7)
        wep:SetNW2Float("MasterkeyReloadTime", CurTime() + 0.7)
    end
    wep:SetNW2Bool("MasterkeyInReload", true)

    --local reserve = Ammo(wep)
    --reserve = reserve + wep:Clip2()
    --local clip = 4
    --local load = math.Clamp(clip, 0, reserve)
    --wep:GetOwner():SetAmmo(reserve - load, "smg1_grenade")
    --wep:SetClip2(load)
end

att.Mult_SightTime = 1.2
att.Mult_SpeedMult = 0.9
att.Mult_SightedSpeedMult = 0.85