att.PrintName = "40mm Buckshot Grenades"
att.AbbrevName = "Buckshot"

att.Icon = nil
att.Description = "Officially desginated the 'Multiple Projectile Anti Personnel' ammunition, this is effectively a large buckshot round containing 20 pellets.\nIntended to be used when the enemy is too close to use explosives."
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
att.Override_DamageMin = 5 * 20

att.Override_Range = 75
att.Override_RangeMin = 10
att.Override_HullSize = 2

att.Override_AccuracyMOA = 60

att.ActivateElements = {"m79_nade_1gaugeshell"}

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_shotgun"
end

-- att.Hook_GetShootSound = function(wep, fsound)
--     if fsound == wep.ShootSound then return ")^weapons/arccw_ud/870/fire.ogg" end
-- end