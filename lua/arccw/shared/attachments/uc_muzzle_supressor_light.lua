att.PrintName = "L15 'Lighthouse' Suppressor" -- fictional
att.AbbrevName = "Lighthouse Suppressor"

att.Icon = Material("entities/att/acwatt_uc_supressor_light.png", "mips smooth")
att.Description = "Traps propellant gases from the muzzle, hiding muzzle flash and reducing volume significantly.\nImproves close range stopping power slightly due to redirection of gas pressure."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.AutoStats = true
att.AutoStats = true
att.Slot = {"muzzle"}

att.SortOrder = 150

att.Model = "models/weapons/arccw/atts/ud_silencer_light.mdl"
att.ModelOffset = Vector(12, 0, 0)
att.OffsetAng = Angle(0, 0, 0)

att.Silencer = true
att.Override_MuzzleEffect = "muzzleflash_suppressed"
att.IsMuzzleDevice = true

att.Mult_ShootPitch = 1.1
att.Mult_ShootVol = 0.75
att.Mult_Range = 0.85
att.Mult_RangeMin = 1.25

att.Add_BarrelLength = 5
att.Mult_SightTime = 1.15
att.Mult_Sway = 1.15

att.AttachSound = "arccw_uc/common/gunsmith/suppressor_thread.ogg"

att.Ignore = true