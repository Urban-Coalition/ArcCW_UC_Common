att.PrintName = "40mm Napalm Grenades"
att.AbbrevName = "Napalm"
att.Icon = Material("entities/att/arccw_uc_40mm_generic.png", "mips smooth")
att.Description = "Extremely illegal airburst grenades loaded with sticky napalm.\nWhile the napalm only disperses in a small radius, it will stick onto targets that come into contact with it, causing a gruesome and fiery death."
att.Desc_Pros = {
    "uc.40mm.napalm",
    "uc.40mm.proximity",
}
att.Desc_Cons = {
    "uc.40mm.nodmg",
    "uc.40mm.arm",
    "uc.40mm.drag.high",
}
att.Desc_Neutrals = {
}
att.Slot = "uc_40mm"

att.AutoStats = true

att.Override_ShootEntity = "arccw_uc_40mm_napalm"

att.Mult_MuzzleVelocity = 0.75

att.Mult_ShootPitch = 0.95

att.ActivateElements = {"40mm_napalm"}