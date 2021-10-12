att.PrintName = "40mm 'Hornet's Nest' Grenades"
att.AbbrevName = "Hornet's Nest"
att.Icon = nil -- Material("entities/att/acwatt_lowpolysaiga12extmag.png", "smooth mips")
att.Description = "Aftermarket grenade that fits 16 .22 LR cartridges.\nIntended to circumvent legal restrictions, these grenades are less lethal but more accurate than an equivalent 40mm buckshot round."
att.Desc_Pros = {
    "uc.40mm.hornet"
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_40mm"

att.AutoStats = true

att.Override_ShootEntity = false
att.Override_Num = 16

att.Override_Damage = 18 * 16
att.Override_DamageMin = 10 * 16

att.Override_Range = 100
att.Override_RangeMin = 25
att.Override_HullSize = 2

att.Override_AccuracyMOA = 25
att.Mult_Recoil = 0.4

-- att.Mult_AccuracyMOA = 1

att.ActivateElements = {"m79_nade_hornetnest"}

-- att.Hook_GetShootSound = function(wep, fsound)
--     if fsound == wep.ShootSound then return ")^weapons/arccw_ud/870/fire.ogg" end
-- end