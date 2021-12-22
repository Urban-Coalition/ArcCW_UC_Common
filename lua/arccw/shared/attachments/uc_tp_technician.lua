att.PrintName = "Technician"

--att.Icon = Material("entities/att/arccw_uc_tp_never_flinch.png", "smooth mips") Todo
att.Description = "Life around this particular firearm has given you a solid understanding of its mechanism. When it malfunctions, you can clear the jam with enough speed to stay in the fight."
att.Desc_Pros = {
    "uc.technician"
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_tp"

att.AutoStats = true
att.SortOrder = 1.5

att.Mult_MalfunctionFixTime = .65

att.Ignore = true -- MalfunctionFixTime currently only works visually (8z fix pls)