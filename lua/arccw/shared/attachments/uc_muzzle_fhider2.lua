att.PrintName = "idk2 Flash Hider" -- fictional
att.AbbrevName = "idk2 Flash Hider"
att.Icon = Material("entities/att/muzzle5.png", "mips smooth")
att.Description = "nigga hidden twice"
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.AutoStats = true
att.AutoStats = true
att.Slot = {"muzzle"}

att.SortOrder = 100

att.Model = "models/weapons/arccw/atts/uc_muzzle4.mdl"
att.ModelOffset = Vector(1.6, 0, 0)
att.ModelScale = Vector(1.15, 1.15, 1.15)
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

att.Ignore = true