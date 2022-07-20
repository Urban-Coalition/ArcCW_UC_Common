att.PrintName = "M203 Underbarrel Greande Launcher (experiment)"
att.AbbrevName = "M203 UBGL (experiment)"
att.Icon = Material("entities/att/shorttroy.png", "mips smooth")
att.Description = "AAAAAAAAAAAAAAA GANGS SHIT STRIAGHT KILLA.>!~!!!!~!~!~ PRA PRA PRA PRA"

att.SortOrder = -100000

att.AutoStats = true
att.Slot = "ubgl"

att.LHIK = true

att.ModelOffset = Vector(0, 0, 0)
att.Model = "models/weapons/arccw/atts/uc_ubgl_m203_v6.mdl"


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

att.LHIK_GunDriver = 2
att.LHIK_CamDriver = 3

local function Ammo(wep)
    return wep:GetOwner():GetAmmoCount("smg1_grenade")
end

--[[]
att.Hook_LHIK_TranslateAnimation = function(wep, key)
    if key == "idle" then
        if wep:GetInUBGL() then
            return "idle_armed"
        else
            return "idle"
        end
    end
end
]]

att.UBGL_Fire = function(wep, ubgl)
    wep:DoLHIKAnimation("fire", 1)
end

att.UBGL_Reload = function(wep, ubgl)
    wep:DoLHIKAnimation("admire", 4)
end