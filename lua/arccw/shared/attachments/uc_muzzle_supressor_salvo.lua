att.PrintName = "Salvo 12 Suppressor"
att.Icon = Material("entities/att/acwatt_uc_supressor_salvo.png", "mips smooth")
att.Description = "Traps propellant gas from the muzzle, reducing visual and audible report.\nLow profile and relatively lightweight, with no negative ballistic impact."
att.Desc_Neutrals = {"uc.muzzleblocking", "uc.exclusive.shotgun"}

att.AutoStats = true
att.Slot = {"muzzle_shotgun","muzzle"}

att.GivesFlags = {"muzzleblocking"}
att.ExcludeFlags = {"nomuzzleblocking"}

att.SortOrder = 150

att.Model = "models/weapons/arccw/atts/ud_silencer_salvo.mdl"
att.ModelOffset = Vector(-1, 0, -0.12)
att.OffsetAng = Angle(0, 0, 0)

att.Silencer = true
att.Override_MuzzleEffect = "muzzleflash_suppressed"
att.IsMuzzleDevice = true

att.Mult_ShootPitch = 1.05
att.Mult_ShootVol = 0.8

att.Add_BarrelLength = 8
att.Mult_SightTime = 1.1
att.Mult_HipDispersion = 1.1
att.Mult_Sway = 1.15

att.AttachSound = "arccw_uc/common/gunsmith/suppressor_thread.ogg"

att.Hook_Compatible = function(wep)
    if !wep:GetIsShotgun() then
        return false
    end
end