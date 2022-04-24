att.PrintName = "\"SLUG\" Full-Bore Slug"

att.SortOrder = 1
att.Icon = Material("entities/att/arccw_uc_ammo_shotgun_generic.png", "mips smooth")
att.Description = [[A single heavy projectile, comparable in performance to a high-caliber rifle cartridge at close to medium range.
Applicable in situations that require marksmanship and minimal collateral damage.]]
att.Desc_Pros = {
    "uc.penetration.8"
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
    "uc.oneprojectile"
}
att.Slot = {"ud_ammo_shotgun","uc_ammo"}

att.AutoStats = true

att.Override_Num = 1
att.Override_Num_Priority = 2
att.Mult_Damage = .75
att.Mult_DamageMin = .5
att.Mult_AccuracyMOA = .3
att.Add_Penetration = 8
att.Mult_RangeMin = 2
att.Mult_Range = 2.5
att.Mult_HipDispersion = 2

att.Override_HullSize = 0

att.Override_UC_ShellColor = Color(0.2*255, 0.6*255, 0.2*255)

att.GivesFlags = {"uc_slug"}

att.Hook_Compatible = function(wep)
    if !wep:GetIsShotgun() then
        return false
    end
end