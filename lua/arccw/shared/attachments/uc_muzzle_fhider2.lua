att.PrintName = "'Cage' Muzzle Compensator" -- fictional
att.AbbrevName = "Cage Compensator"
att.Icon = Material("entities/att/muzzle5.png", "mips smooth")
att.Description = "bithces"
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.AutoStats = true
att.Slot = {"muzzle"}

att.SortOrder = 100

att.Model = "models/weapons/arccw/atts/uc_muzzle4.mdl"
att.ModelOffset = Vector(2.3, 0, 0)
att.ModelScale = Vector(0.95, 0.95, 0.95)
att.OffsetAng = Angle(0, 0, 0)

-- att.Silencer = true
att.Override_MuzzleEffect = "muzzleflash_suppressed"
att.IsMuzzleDevice = true

-- att.Mult_ShootPitch = 1.1 please don't
-- att.Mult_ShootVol = 0.75
-- att.Mult_Range = 1.1

att.Add_BarrelLength = 2
-- att.Mult_SightTime = 1.15
-- att.Mult_Sway = 1.25

att.AttachSound = "arccw_uc/common/gunsmith/suppressor_thread.ogg"