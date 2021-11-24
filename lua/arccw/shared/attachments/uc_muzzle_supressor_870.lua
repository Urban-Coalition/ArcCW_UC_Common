att.PrintName = "Cylinder Suppressor"
att.Icon = Material("entities/att/acwatt_uc_supressor_870.png", "mips smooth")
att.Description = "Shotgun muzzle device that traps propellant gases, hiding muzzle flash and reducing firing volume. Bulky and heavy, but provides better ballistic performance.\n\n\"By the time you figured it out, it would be too late.\""
att.Desc_Neutrals = {"uc.muzzleblocking"}

att.AutoStats = true
att.Slot = {"muzzle_shotgun"}

att.GivesFlags = {"muzzleblocking"}
att.ExcludeFlags = {"nomuzzleblocking"}

att.SortOrder = 150

att.Model = "models/weapons/arccw/atts/ud_silencer_870.mdl"
att.ModelOffset = Vector(-1, 0, 0)
att.OffsetAng = Angle(0, 0, 0)

att.Silencer = true
att.Override_MuzzleEffect = "muzzleflash_suppressed"
att.IsMuzzleDevice = true

att.Mult_ShootPitch = 1.1
att.Mult_ShootVol = 0.75

att.Add_BarrelLength = 6
att.Mult_SightTime = 1.3
att.Mult_HipDispersion = 1.2
att.Mult_Sway = 1.5
att.Mult_Range = 1.1

att.AttachSound = "arccw_uc/common/gunsmith/suppressor_thread.ogg"