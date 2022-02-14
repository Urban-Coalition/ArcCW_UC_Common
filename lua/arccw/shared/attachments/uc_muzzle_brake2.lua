att.PrintName = "Helix Light Brake" -- fictional
att.AbbrevName = "Helix Brake"
att.Icon = Material("entities/att/muzzle5.png", "mips smooth")
att.Description = "A light muzzle device that redirects propellant gasses to the sides to reduce the recoil of the gun ableit less efficiently than a normal brake."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.AutoStats = true
att.AutoStats = true
att.Slot = {"muzzle"}

att.SortOrder = 100

att.Model = "models/weapons/arccw/atts/uc_muzzle3.mdl"
att.ModelOffset = Vector(2, 0, 0)
att.ModelScale = Vector(1.15, 1.15, 1.15)
att.OffsetAng = Angle(0, 0, 0)

att.IsMuzzleDevice = true


att.Mult_Recoil = .90
att.Mult_RecoilSide = .95

att.Add_BarrelLength = 2
att.Mult_SightTime = 1.05
att.Mult_ShootVol = 1.15

att.AttachSound = "arccw_uc/common/gunsmith/suppressor_thread.ogg"
