att.PrintName = "40mm Buckshot Grenades"
att.AbbrevName = "Buckshot"

att.Icon = nil
att.Description = "Officially desginated the 'Multiple Projectile Anti Personnel' ammunition, these grenades are effectively large buckshot rounds containing 20 pellets.\nIntended to be used when the enemy is too close to use explosives."
att.Desc_Pros = {
    "uc.40mm.buckshot"
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_40mm"

att.AutoStats = true

att.Override_ShootEntity = false
att.Override_Num = 20

att.Override_Damage = 20 * 20
att.Override_DamageMin = 8 * 20

att.Override_Range = 75
att.Override_RangeMin = 10
att.Override_HullSize = 4

att.Override_AccuracyMOA = 50

att.ActivateElements = {"m79_nade_1gaugeshell"}

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_shotgun"
end

att.Hook_GetShootSound = function(wep, fsound)
    if fsound == wep.ShootSound then return ")^/arccw_uc/common/gl_fire_buck.ogg" end
end

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if distancesound == wep.DistantShootSound then
        return ")^/arccw_uc/common/gl_fire_buck_dist.ogg" end
end