att.PrintName = "40mm 'Hornet's Nest' Grenades"
att.AbbrevName = "Hornet's Nest"
att.Icon = Material("entities/att/arccw_uc_40mm_generic.png", "mips smooth")
att.Description = "Aftermarket grenades that fit 16 .22 LR cartridges.\nMade to circumvent legal restrictions, these grenades are less lethal but more accurate than an equivalent 40mm buckshot round."
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

att.Override_Damage = 12 * 16
att.Override_DamageMin = 5 * 16

att.Override_Range = 60
att.Override_RangeMin = 15
att.Override_HullSize = 0.1

att.Override_AccuracyMOA = 25
att.Mult_Recoil = 0.4

-- att.Mult_AccuracyMOA = 1

att.ActivateElements = {"40mm_hornetnest"}

att.Hook_GetShootSound = function(wep, fsound)
    if fsound == wep.ShootSound then return ")^/arccw_uc/common/gl_fire_hornet.ogg" end
end

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if distancesound == wep.DistantShootSound then
        return ")^/arccw_uc/common/gl_fire_hornet_dist.ogg" end
end

if engine.ActiveGamemode() == "urbanstrife" then
    att.PenetrationAmmoType = "plinking"
end