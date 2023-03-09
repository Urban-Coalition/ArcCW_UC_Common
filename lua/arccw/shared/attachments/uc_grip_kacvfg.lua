att.PrintName = "Knight's Armament Company Vertical Foregrip"
att.AbbrevName = "KAC Vertical Foregrip"
att.Icon = Material("entities/att/acwatt_uc_grip_kacvfg.png", "mips smooth")
att.Description = "Medium-length vertical foregrip that assists in control of the weapon, but detracts from its concealability."

att.SortOrder = 1400

att.AutoStats = true
att.Slot = "foregrip"

att.LHIK = true

att.ModelOffset = Vector(0, 0, -0.25)
att.Model = "models/weapons/arccw/atts/uc_kacvfg1.mdl"

att.Mult_Recoil = 0.8
att.Mult_SightTime = 1.1
att.Mult_DrawTime = 1.15
att.Mult_HolsterTime = 1.15

att.Override_HoldtypeActive = "smg"
att.Override_HoldtypeActive_Priority = 2