att.PrintName = "Handstop"
att.AbbrevName = "Handstop"
att.Icon = Material("entities/att/acwatt_uc_grip_handstop.png", "mips smooth")
att.Description = "Prevents the hand from sliding down the barrel, allowing improved point shooting precision."

att.SortOrder = 1100

att.AutoStats = true
att.Slot = "foregrip"

--att.LHIK = true

att.ModelOffset = Vector(2, 0, -0.8)
att.Model = "models/weapons/arccw/atts/uc_handstop.mdl"
att.ModelSkin = 1

--[[] need to add add_activepos
att.Override_ActivePos = Vector(-0.5, -0.5, 0.5)
att.Override_ActiveAng = Angle(0, 0, -7) no it looks shit on everything STOP!!!]]

att.Mult_HipDispersion = 0.8
att.Mult_ShootSpeedMult = 0.9
att.Mult_Sway = 0.85