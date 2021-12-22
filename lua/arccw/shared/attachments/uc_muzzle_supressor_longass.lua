att.PrintName = "ATA Giraffe-556 Suppressor" -- fictional
att.AbbrevName = "Giraffe Suppressor"
att.Icon = nil
att.Description = "Traps propellant gases from the muzzle, hiding muzzle flash and reducing volume significantly.\nExtremely long suppressor tube provides excellent noise reduction, but is also very unwieldy."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.AutoStats = true
att.AutoStats = true
att.Slot = {"muzzle"}

att.SortOrder = 150

att.Model = "models/weapons/arccw/atts/uc_longass_silencer.mdl"
att.ModelOffset = Vector(2.2, 0, 0)
att.ModelScale = Vector(1.5, 1.5, 1.5)
att.OffsetAng = Angle(0, 0, 0)

att.Silencer = true
att.Override_MuzzleEffect = "muzzleflash_suppressed"
att.IsMuzzleDevice = true

att.Mult_ShootPitch = 1.1
att.Mult_ShootVol = 0.7
att.Mult_Range = 1.2

att.Add_BarrelLength = 10
att.Mult_SightTime = 1.25
att.Mult_SightedSpeedMult = 0.85
att.Mult_Sway = 1.5

att.AttachSound = "arccw_uc/common/gunsmith/suppressor_thread.ogg"