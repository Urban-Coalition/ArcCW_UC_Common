att.PrintName = "Troy Modular Combat Grip"
att.AbbrevName = "Long Foregrip"
att.Icon = Material("entities/att/longtroy.png", "mips smooth")
att.Description = "Long, massive foregrip tailored for exquisite weapon control. Makes the weapon difficult to conceal."

att.AutoStats = true
att.Slot = "foregrip"

att.LHIK = true

att.ModelOffset = Vector(0, 0, -0.7)
att.Model = "models/weapons/arccw/atts/uc_troygrip.mdl"
-- att.ModelSkin  = 1

att.Mult_Recoil = .7
att.Mult_HipDispersion = .8
att.Mult_SightTime = 1.3
att.Mult_DrawTime = 1.4

att.Override_HoldtypeActive = "smg"
att.Override_HoldtypeActive_Priority = 2

-- att.Ignore = true