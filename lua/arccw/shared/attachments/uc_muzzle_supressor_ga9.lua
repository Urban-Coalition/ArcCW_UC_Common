att.PrintName = "GA9 Revolution 9 Suppressor"
att.AbbrevName = "GA9 Suppressor"
att.Icon = nil
att.Description = "Traps propellant gases from the muzzle, hiding muzzle flash and reducing volume significantly.\nCompact and lightweight, with little impact on handling."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.AutoStats = true
att.AutoStats = true
att.Slot = {"muzzle"}

att.SortOrder = 150

att.Model = "models/weapons/arccw/atts/uc_ga_revolution9.mdl"
att.ModelOffset = Vector(2.2, 0, 0)
att.ModelScale = Vector(1.15, 1.15, 1.15)
att.OffsetAng = Angle(0, 0, 0)

att.Silencer = true
att.Override_MuzzleEffect = "muzzleflash_suppressed"
att.IsMuzzleDevice = true

att.Mult_ShootPitch = 1.1
att.Mult_ShootVol = 0.75
att.Mult_Range = 0.9

att.Add_BarrelLength = 5
att.Mult_SightTime = 1.05
att.Mult_Sway = 1.1

att.AttachSound = "arccw_uc/common/gunsmith/suppressor_thread.ogg"