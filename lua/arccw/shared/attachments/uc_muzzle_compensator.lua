att.PrintName = "Basilisk Heavy Compensator"
att.AbbrevName = "Basilisk Compensator"
att.Icon = Material("entities/att/acwatt_uc_muzzle_compensator.png", "mips smooth")
att.Description = "Redirects propellant gases to reduce weapon recoil.\nImproves recoil stability."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.AutoStats = true
att.AutoStats = true
att.Slot = {"muzzle"}

att.SortOrder = 100

att.Model = "models/weapons/arccw/atts/uc_muzzle5.mdl"
att.ModelOffset = Vector(2.0, 0, 0)
att.ModelScale = Vector(.85, .85, .85)
att.OffsetAng = Angle(0, 0, 0)

att.IsMuzzleDevice = true

att.Mult_RecoilSide = 0.75

att.Mult_ShootSpeedMult = 0.9
att.Mult_Sway = 1.15

att.AttachSound = "arccw_uc/common/gunsmith/suppressor_thread.ogg"