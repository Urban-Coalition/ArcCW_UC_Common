att.PrintName = "Hammerhead Muzzle Brake" -- fictional
att.AbbrevName = "Hammerhead Brake"
att.Icon = Material("entities/att/muzzle3.png", "mips smooth")
att.Description = "Redirects propellant gases to reduce weapon recoil.\nReduces muzzle rise substantially."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.AutoStats = true
att.Slot = {"muzzle","muzzle_shotgun"}

att.SortOrder = 100

att.Model = "models/weapons/arccw/atts/uc_muzzle2.mdl"
att.ModelOffset = Vector(2.3, 0, 0)
att.ModelScale = Vector(1.15, 1.15, 1.15)
att.OffsetAng = Angle(0, 0, 0)

att.IsMuzzleDevice = true

att.Mult_Recoil = 0.8

att.Mult_ShootSpeedMult = 0.9
att.Mult_Sway = 1.25

att.AttachSound = "arccw_uc/common/gunsmith/suppressor_thread.ogg"
