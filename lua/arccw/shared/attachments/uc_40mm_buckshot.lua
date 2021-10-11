att.PrintName = "40mm Buckshot Grenades"
att.AbbrevName = "Buckshot"

att.Icon = nil
att.Description = "big shotgun"
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_40mm"

att.AutoStats = true

att.Override_ShootEntity = false
att.Override_Num = 20

att.Override_Damage = 50
att.Override_DamageMin = 15

att.Override_Range = 100
att.Override_RangeMin = 25
att.Override_HullSize = 2

att.Mult_AccuracyMOA = 2

att.ActivateElements = {"m79_nade_1gaugeshell"}

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_shotgun"
end

-- att.Hook_GetShootSound = function(wep, fsound)
--     if fsound == wep.ShootSound then return ")^weapons/arccw_ud/870/fire.ogg" end
-- end