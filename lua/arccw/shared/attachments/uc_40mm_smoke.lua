att.PrintName = "40mm Smoke Grenades"
att.AbbrevName = "Smoke"
att.Icon = Material("entities/att/arccw_uc_40mm_generic.png", "mips smooth")
att.Description = "Less-than-lethal grenades that create a ring of smoke, obscuring vision."
att.Desc_Pros = {
    "uc.40mm.smoke"
}
att.Desc_Cons = {
    "uc.40mm.nodmg"
}
att.Desc_Neutrals = {
}
att.Slot = "uc_40mm"

att.Override_ShootEntity = "arccw_uc_40mm_smoke"

att.AutoStats = true

att.ActivateElements = {"40mm_smoke"}