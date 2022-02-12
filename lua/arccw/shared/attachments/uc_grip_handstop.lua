att.PrintName = "Handstop"
att.AbbrevName = "Handstop"
att.Icon = Material("entities/att/hs.png", "mips smooth")
att.Description = "Prevents the hand from sliding down the barrel, allowing improved point shooting precision via a special \"C-clamp\" grip.\nMay obstruct ironsights, be careful."

att.AutoStats = true
att.Slot = "foregrip"

att.LHIK = true

att.ModelOffset = Vector(2, 0, -0.8)
att.Model = "models/weapons/arccw/atts/uc_handstop.mdl"
att.ModelSkin = 1
att.Override_ActivePos = Vector(-0.5, -0.5, 0.5)
att.Override_ActiveAng = Angle(0, 0, -7)

att.Mult_Recoil = .95
att.Mult_Sway = .75
att.Mult_HipDispersion = .8
att.Mult_SightTime = 1.2
att.Mult_SightedSpeedMult = .8