att.PrintName = "Flash Hider" -- fictional
att.AbbrevName = "Flash Hider"
att.Icon = Material("entities/att/acwatt_uc_muzzle_fhider1.png", "mips smooth")
att.Description = "Reduces muzzle flash to the point where it can't block the shooter's vision or compromise their position. The enhanced clarity marginally improves hip fire performance."
att.Desc_Pros = {
    "uc.flashhider"
}
att.Desc_Cons = {
}
att.AutoStats = true
att.AutoStats = true
att.Slot = {"muzzle"}

att.SortOrder = 50

att.Model = "models/weapons/arccw/atts/uc_muzzle1.mdl"
att.ModelOffset = Vector(1.85, 0, 0)
att.ModelScale = Vector(.8, .8, .8)
att.OffsetAng = Angle(0, 0, 0)

-- att.Silencer = true
att.Override_MuzzleEffect = "muzzleflash_suppressed"
att.IsMuzzleDevice = true

att.Mult_HipDispersion = 0.9
att.Mult_MoveDispersion = 0.9

att.Mult_ShootSpeedMult = 0.9
att.Mult_Sway = 1.25

att.AttachSound = "arccw_uc/common/gunsmith/suppressor_thread.ogg"