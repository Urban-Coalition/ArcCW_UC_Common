att.PrintName = "Strafe"

att.Icon = Material("entities/att/arccw_uc_tp_strafe.png", "smooth mips")
att.Description = "Active experience in simulated combat drills has conditioned you to shoot while walking towards the enemy. When firing, you can walk at your normal speed."
att.Desc_Pros = {
    "uc.neverflinch"
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_tp"

att.AutoStats = true
att.SortOrder = 2

att.Override_ShootSpeedMult = 1
att.Mult_SightedSpeedMult = 1.2