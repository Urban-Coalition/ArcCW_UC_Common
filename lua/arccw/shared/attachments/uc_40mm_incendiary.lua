att.PrintName = "40mm Incendiary Grenades" -- trol
att.AbbrevName = "Incendiary"
att.Icon = nil
att.Description = "Hand-made grenade loaded with a fuel mixture that disperses on impact, burning an area over time."
att.Desc_Pros = {
    "uc.40mm.incendiary"
}
att.Desc_Cons = {
    "uc.40mm.mindmg"
}
att.Desc_Neutrals = {
}
att.Slot = "uc_40mm"

att.AutoStats = true

att.Override_ShootEntity = "arccw_uc_40mm_incendiary"

--att.Mult_Recoil = 1

att.ActivateElements = {"m79_nade_incendiary"}