att.PrintName = "M203 Underbarrel Greande Launcher (uni. test)"
att.AbbrevName = "M203 UBGL (uni. test)"
att.Icon = Material("entities/att/shorttroy.png", "mips smooth")
att.Description = "AAAAAAAAAAAAAAA GANGS SHIT STRIAGHT KILLA.>!~!!!!~!~!~ PRA PRA PRA PRA"

att.SortOrder = -100000

att.AutoStats = true
att.Slot = "ubgl"

att.LHIK = true

att.ModelOffset = Vector(0, 0, 0)
att.Model = "models/weapons/arccw/atts/uc_ubgl_m203_v5.mdl"


att.LHIK_Animation = true

att.UBGL = true

att.UBGL_PrintName = "UB (HE)"
att.UBGL_Automatic = false
att.UBGL_MuzzleEffect = "muzzleflash_m79"
att.UBGL_ClipSize = 1
att.UBGL_Ammo = "smg1_grenade"
att.UBGL_RPM = 300
att.UBGL_Recoil = 0
att.UBGL_Capacity = 1

att.LHIK_GunDriver = 1
att.LHIK_CamDriver = 2


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
--    if wep:Clip2() <= 0 then return end

    wep:DoLHIKAnimation("fire", 1)

--    wep:FireRocket("arccw_gl_he", 30000)
--    wep:EmitSound("weapons/grenade_launcher1.wav", 100)
--    wep:SetClip2(wep:Clip2() - 1)
--    wep:DoEffects()
end

att.UBGL_Reload = function(wep, ubgl)
--    if wep:Clip2() >= 1 then return end

--    if Ammo(wep) <= 0 then return end

--    wep:SetNextSecondaryFire(CurTime() + 2.5)

    wep:DoLHIKAnimation("admire", 4)
--    wep:PlaySoundTable({
--        {s = "weapons/arccw/m203/m203_dooropen.wav", t = 0.25},
--        {s = "weapons/arccw/m203/m203_shellin.wav", t = 1.25},
--        {s = "weapons/arccw/m203/m203_doorclose.wav", t = 2},
--    })

--    local reserve = Ammo(wep)

--    reserve = reserve + wep:Clip2()

--    local clip = 1

--    local load = math.Clamp(clip, 0, reserve)
--
--    wep.Owner:SetAmmo(reserve - load, "smg1_grenade")

--    wep:SetClip2(load)
end

att.Mult_SightTime = 1.25
att.Mult_SpeedMult = 0.8
att.Mult_SightedSpeedMult = 0.85