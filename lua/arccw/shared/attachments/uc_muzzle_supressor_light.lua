att.PrintName = "Light Suppressor"
att.Icon = Material("entities/att/arccw_uc_tp_operator.png", "mips smooth")
att.Description = "Suppressor of lightweight material. Reduces muzzle report without major impact on weight."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.AutoStats = true
att.AutoStats = true
att.Slot = {"muzzle"}

att.SortOrder = 150

att.Model = "models/weapons/arccw/atts/ud_silencer_light.mdl"
att.ModelOffset = Vector(12, 0, 0)
att.OffsetAng = Angle(0, 0, 0)

att.Silencer = true
att.Override_MuzzleEffect = "muzzleflash_suppressed"
att.IsMuzzleDevice = true

att.Mult_ShootPitch = 1.1
att.Mult_ShootVol = 0.75
att.Mult_Range = 0.9

att.Add_BarrelLength = 8
att.Mult_SightTime = 1.05