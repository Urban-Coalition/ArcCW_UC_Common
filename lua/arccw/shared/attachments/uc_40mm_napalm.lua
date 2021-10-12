att.PrintName = "40mm Napalm Grenades"
att.AbbrevName = "Napalm"
att.Icon = nil
att.Description = "Extremely illegal airburst grenades loaded with sticky napalm.\nWhile the napalm only disperses in a small radius, it will stick onto targets that come into contact with it, causing a gruesome and firey death."
att.Desc_Pros = {
    "uc.40mm.napalm"
}
att.Desc_Cons = {
    "uc.40mm.mindmg"
}
att.Desc_Neutrals = {
}
att.Slot = "uc_40mm"

att.AutoStats = true

att.Override_ShootEntity = "arccw_uc_40mm_napalm"

--att.Mult_Recoil = 1

att.ActivateElements = {"m79_nade_incendiary"}