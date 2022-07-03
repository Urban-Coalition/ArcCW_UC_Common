att.PrintName = "Troy Modular Combat Grip"
att.AbbrevName = "Long Foregrip"
att.Icon = Material("entities/att/longtroy.png", "mips smooth")
att.Description = "Long, massive foregrip tailored for exquisite weapon control. Makes the weapon impossible to conceal well."

att.AutoStats = true
att.Slot = "foregrip"

att.LHIK = true

att.ModelOffset = Vector(0, 0, -0.7)
att.Model = "models/weapons/arccw/atts/uc_troygrip.mdl"
-- att.ModelSkin  = 1

att.Mult_Recoil = .05
att.Mult_HipDispersion = .1
att.Mult_SightTime = 5
att.Mult_DrawTime = 2.5
att.Mult_ReloadTime = 2.5

att.Override_HoldtypeActive = "smg"
att.Override_HoldtypeActive_Priority = 2

-- att.Ignore = true