att.PrintName = "Shotgun Suppressor"
att.Icon = Material("entities/att/arccw_uc_tp_operator.png", "mips smooth")
att.Description = "Especially heavy suppressor, compatible with shotguns."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.AutoStats = true
att.AutoStats = true
att.Slot = {"muzzle_shotgun"}

att.SortOrder = 150

att.Model = "models/weapons/arccw/atts/ud_silencer_870.mdl"
att.ModelOffset = Vector(1.25, 0, 0)
att.OffsetAng = Angle(0, 0, 0)

att.Silencer = true
att.Override_MuzzleEffect = "muzzleflash_suppressed"
att.IsMuzzleDevice = true

att.Mult_ShootPitch = 1.1
att.Mult_ShootVol = 0.75
att.Mult_Range = 0.9

att.Add_BarrelLength = 5