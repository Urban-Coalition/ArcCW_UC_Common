att.PrintName = "40mm HE Dual Purpose Grenades"
att.AbbrevName = "HE Dual Purpose"
att.Icon = nil -- Material("entities/att/acwatt_lowpolysaiga12extmag.png", "smooth mips")
att.Description = "Grenades with a shaped charge for armor penetration, allowing it to punch through thin walls or deal massive impact damage to enemies or vehicles."
att.Desc_Pros = {
    "uc.40mm.hedp",
    "uc.40mm.impact"
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_40mm"

att.Override_ShootEntity = "arccw_uc_40mm_dp"

att.AutoStats = true

att.Mult_Damage = 0.75
att.Mult_DamageMin = 0.75

-- att.ActivateElements = {"m79_nade_caseless"}