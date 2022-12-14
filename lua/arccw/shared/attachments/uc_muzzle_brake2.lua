att.PrintName = "Helix Muzzle Brake" -- fictional
att.AbbrevName = "Helix Brake"
att.Icon = Material("entities/att/muzzle5.png", "mips smooth")
att.Description = "Redirects propellant gases to reduce weapon recoil.\nSlightly reduces recoil."
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

att.Mult_Recoil = 0.9
att.Mult_RecoilSide = 0.85

att.Mult_ShootSpeedMult = 0.9
att.Mult_Sway = 1.25

att.AttachSound = "arccw_uc/common/gunsmith/suppressor_thread.ogg"
