att.PrintName = "Hammerhead Muzzle Brake" -- fictional
att.AbbrevName = "Hammerhead Brake"
att.Icon = Material("entities/att/muzzle3.png", "mips smooth")
att.Description = "Redirects propellant gases to the sides to reduce the weapon recoil.\nReduces muzzle rise substantially, but makes recoil less stable."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.AutoStats = true
att.AutoStats = true
att.Slot = {"muzzle","muzzle_shotgun"}

att.SortOrder = 100

att.Model = "models/weapons/arccw/atts/uc_muzzle2.mdl"
att.ModelOffset = Vector(2, 0, 0)
att.ModelScale = Vector(1.15, 1.15, 1.15)
att.OffsetAng = Angle(0, 0, 0)

att.IsMuzzleDevice = true

att.Mult_Recoil = 0.75
att.Mult_RecoilSide = 1.25

att.Add_BarrelLength = 2
att.Mult_SightTime = 1.15
att.Mult_Sway = 1.15
att.Mult_ShootVol = 1.35

att.AttachSound = "arccw_uc/common/gunsmith/suppressor_thread.ogg"
