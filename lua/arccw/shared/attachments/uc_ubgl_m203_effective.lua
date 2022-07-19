att.PrintName = "M203 Underbarrel Grenade Launcher (usable)"
att.AbbrevName = "M203 UBGL (usable)"
att.Icon = Material("entities/att/shorttroy.png", "mips smooth")
att.Description = "Single-shot underbarrel grenade launcher. Designed to replace the Colt XM148. Versatile and effective."

att.SortOrder = -100000

att.AutoStats = true
att.Slot = "ubgl"

att.LHIK = true

att.ModelOffset = Vector(0, 0, 0)
att.Model = "models/weapons/arccw/atts/uc_ubgl_m203_v5.mdl"


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

att.UBGL_Fire = function(wep, ubgl)
    if wep:Clip2() <= 0 then return end

    local proj = wep:FireRocket("arccw_uc_40mm_he", 10000)
	proj.Damage = 100
    wep:EmitSound("weapons/grenade_launcher1.wav", 100)
    wep:SetClip2(wep:Clip2() - 1)
    wep:DoEffects()
end

att.UBGL_Reload = function(wep, ubgl)
    if wep:Clip2() >= 1 then return end
    if Ammo(wep) <= 0 then return end

    wep:SetNextSecondaryFire(CurTime() + 2)

    wep:DoLHIKAnimation("idle", 2)
    wep:PlaySoundTable({
        {s = "arccw_uc/common/40mm/203open.ogg", t = 0.25},
        {s = "arccw_uc/common/40mm/203insert.ogg", t = 1.25},
        {s = "arccw_uc/common/40mm/203close.ogg", t = 1.75},
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