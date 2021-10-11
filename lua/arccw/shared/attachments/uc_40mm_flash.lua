att.PrintName = "40mm Stun Grenades" -- trol
att.AbbrevName = "Stun"
att.Icon = nil -- Material("entities/att/acwatt_lowpolysaiga12extmag.png", "smooth mips")
att.Description = "Less-than-lethal grenades that create a blinding flash and deafening bang.\nWhile typically used as hand grenades, the larger projectile allows for a more visible and audible effect."
att.Desc_Pros = {
    "uc.40mm.flash"
}
att.Desc_Cons = {
    "uc.40mm.mindmg"
}
att.Desc_Neutrals = {
}
att.Slot = "uc_40mm"

att.Override_ShootEntity = "arccw_uc_40mm_flash"

att.AutoStats = true

--att.Mult_Recoil = 1

-- att.ActivateElements = {"m79_nade_caseless"}