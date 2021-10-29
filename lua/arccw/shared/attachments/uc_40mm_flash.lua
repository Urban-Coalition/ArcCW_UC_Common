att.PrintName = "40mm Stun Grenades" -- trol
att.AbbrevName = "Stun"
att.Icon = Material("entities/att/arccw_uc_40mm_generic.png", "mips smooth")
att.Description = "Less-than-lethal grenades that create a blinding flash and deafening bang.\nWhile typically used as hand grenades, the larger projectile allows for a more visible and audible effect."
att.Desc_Pros = {
    "uc.40mm.flash"
}
att.Desc_Cons = {
    "uc.40mm.nodmg"
}
att.Desc_Neutrals = {
}
att.Slot = "uc_40mm"

att.Override_ShootEntity = "arccw_uc_40mm_flash"

att.AutoStats = true

--att.Mult_Recoil = 1

att.ActivateElements = {"40mm_flash"}