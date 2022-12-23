att.PrintName = "BCMGUNFIGHTER Vertical Grip Mod 3"
att.AbbrevName = "Stubby Foregrip"
att.Icon = Material("entities/att/acwatt_uc_grip_troyshort.png", "mips smooth")
att.Description = "A short grip providing a more natural holding position, making the weapon easier to use while moving.\n"

att.SortOrder = 9998

att.AutoStats = true
att.Slot = "foregrip"

att.LHIK = true

att.ModelOffset = Vector(0, 0, -0.14)
att.Model = "models/weapons/arccw/atts/ud_foregrip_mod3.mdl"
-- att.ModelSkin  = 1

att.Mult_MoveDispersion = 0.75

att.Mult_SightedSpeedMult = 0.9

att.Override_HoldtypeActive = "smg"
att.Override_HoldtypeActive_Priority = 2

-- att.Ignore = true