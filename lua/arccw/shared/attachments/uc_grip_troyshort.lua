att.PrintName = "Troy Modular Combat Grip (Stubby)"
att.AbbrevName = "Stubby Foregrip"
att.Icon = Material("entities/att/shorttroy.png", "mips smooth")
att.Description = "Decreases recoil by providing a more natural forearm position."

att.AutoStats = true
att.Slot = "foregrip"

att.LHIK = true

att.ModelOffset = Vector(0, 0, -0.7)
att.Model = "models/weapons/arccw/atts/uc_troygrip_short.mdl"
-- att.ModelSkin  = 1

att.Mult_Recoil = .8
att.Mult_SightTime = 1.15
att.Mult_MoveDispersion = 1.25

att.Override_HoldtypeActive = "smg"
att.Override_HoldtypeActive_Priority = 2

-- att.Ignore = true