att.PrintName = "Helix Muzzle Brake" -- fictional
att.AbbrevName = "Helix Brake"
att.Icon = Material("entities/att/muzzle5.png", "mips smooth")
att.Description = "Redirects propellant gases to the sides to reduce weapon recoil.\nLighter than alternatives, but not as effective."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.AutoStats = true
att.AutoStats = true
att.Slot = {"muzzle","muzzle_shotgun"}

att.SortOrder = 100

att.Model = "models/weapons/arccw/atts/uc_muzzle3.mdl"
att.ModelOffset = Vector(2.3, 0, 0)
att.ModelScale = Vector(1.0, 1.0, 1.0)
att.OffsetAng = Angle(0, 0, 0)

att.IsMuzzleDevice = true


att.Mult_Recoil = 0.85
att.Mult_RecoilSide = 1.1

att.Add_BarrelLength = 2
att.Mult_SightTime = 1.05
att.Mult_Sway = 1.1
att.Mult_ShootVol = 1.15

att.AttachSound = "arccw_uc/common/gunsmith/suppressor_thread.ogg"
