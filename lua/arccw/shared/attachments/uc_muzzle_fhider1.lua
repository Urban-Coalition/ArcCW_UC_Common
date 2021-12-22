att.PrintName = "Flash Suppressor" -- fictional
att.AbbrevName = "Flash Hider"
att.Icon = nil
att.Description = "Reduces muzzle flash to the point where it can't block the shooter's vision or compromise their position."
att.Desc_Pros = {
    "uc.flashhider"
}
att.Desc_Cons = {
}
att.AutoStats = true
att.AutoStats = true
att.Slot = {"muzzle"}

att.SortOrder = 150

att.Model = "models/weapons/arccw/atts/uc_muzzle1.mdl"
att.ModelOffset = Vector(2.2, 0, 0)
att.ModelScale = Vector(.85, .85, .85)
att.OffsetAng = Angle(0, 0, 0)

-- att.Silencer = true
att.Override_MuzzleEffect = "muzzleflash_suppressed"
att.IsMuzzleDevice = true

-- att.Mult_ShootPitch = 1.1
-- att.Mult_ShootVol = 0.75
-- att.Mult_Range = 1.1

att.Add_BarrelLength = 2
-- att.Mult_SightTime = 1.15
-- att.Mult_Sway = 1.25

att.AttachSound = "arccw_uc/common/gunsmith/suppressor_thread.ogg"