att.PrintName = "Knight's Armament Company Vertical Foregrip"
att.AbbrevName = "Vertical Foregrip"
att.Icon = Material("entities/att/longtroy.png", "mips smooth")
att.Description = "Medium-length vertical foregrip for better control of the weapon."

att.AutoStats = true
att.Slot = "foregrip"

att.LHIK = true

att.ModelOffset = Vector(0, 0, -0.25)
att.Model = "models/weapons/arccw/atts/uc_kacvfg1.mdl"

att.Mult_Recoil = .8
att.Mult_HipDispersion = .9
att.Mult_SightTime = 1.2
att.Mult_DrawTime = 1.15

att.Override_HoldtypeActive = "smg"
att.Override_HoldtypeActive_Priority = 2

-- att.Ignore = true