att.PrintName = "BCM Mod. 3"
att.AbbrevName = "Stubby Foregrip"
att.Icon = Material("entities/att/shorttroy.png", "mips smooth")
att.Description = "Decreases recoil marginally by providing a more natural forearm position."

att.AutoStats = true
att.Slot = "foregrip"
att.SortOrder = 1

att.LHIK = true

att.ModelOffset = Vector(0, 0, -0.14)
att.Model = "models/weapons/arccw/atts/ud_foregrip_mod3.mdl"
-- att.ModelSkin  = 1

att.Mult_Recoil = .85
att.Mult_SightTime = 1.1
att.Mult_MoveDispersion = 1.25

att.Override_HoldtypeActive = "smg"
att.Override_HoldtypeActive_Priority = 2

-- att.Ignore = true