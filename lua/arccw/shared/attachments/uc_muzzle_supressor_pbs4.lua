att.PrintName = "PBS-4 Suppressor"

att.Icon = Material("entities/att/pbs4.png", "mips smooth")
att.Description = "Traps propellant gases from the muzzle, hiding muzzle flash and reducing volume significantly.\nRussian-made. Stats are temporary."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.AutoStats = true
att.AutoStats = true
att.Slot = {"ur_ak_muzzle"}

att.SortOrder = 149

att.Model = "models/weapons/arccw/atts/uc_pbs4.mdl"
att.ModelOffset = Vector(2, 0, 0)
att.ModelScale = Vector(1.15, 1.15, 1.15)
att.OffsetAng = Angle(0, 0, 0)

att.Silencer = true
att.Override_MuzzleEffect = "muzzleflash_suppressed"
att.IsMuzzleDevice = true

att.Mult_ShootPitch = 1.1
att.Mult_ShootVol = 0.75
att.Mult_Range = 0.85
att.Mult_RangeMin = 1.25

att.Add_BarrelLength = 5
att.Mult_SightTime = 1.15
att.Mult_Sway = 1.15

att.AttachSound = "arccw_uc/common/gunsmith/suppressor_thread.ogg"
