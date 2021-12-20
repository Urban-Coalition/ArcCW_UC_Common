att.PrintName = "MAGPUL PTS AAC Masada SD"
att.Icon = nil
att.Description = "Traps propellant gases from the muzzle, hiding muzzle flash and reducing volume significantly.\nLow-profile and enhances ballistics, but slightly cumbersome."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.AutoStats = true
att.AutoStats = true
att.Slot = {"muzzle"}

att.SortOrder = 150

att.Model = "models/weapons/arccw/atts/uc_magpul_masada.mdl"
att.ModelOffset = Vector(3.5, 0, 0)
att.OffsetAng = Angle(0, 0, 0)

att.Silencer = true
att.Override_MuzzleEffect = "muzzleflash_suppressed"
att.IsMuzzleDevice = true

att.Mult_ShootPitch = 1.1
att.Mult_ShootVol = 0.75
att.Mult_Range = 1.1

att.Add_BarrelLength = 5
att.Mult_SightTime = 1.15

att.AttachSound = "arccw_uc/common/gunsmith/suppressor_thread.ogg"