att.PrintName = "\"AP\" Armor-piercing Rounds"
att.AbbrevName = "\"AP\" Armor-piercing"
att.SortOrder = 5
att.Icon = Material("entities/att/arccw_uc_ammo_generic.png", "mips smooth")
att.Description = "Bullets designed to penetrate body armor, usually built around a penetrator of hardened steel, tungsten, or tungsten carbide.\nUpon impact on a hard target, the case is destroyed, but the penetrator continues its motion and penetrates the target."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_ammo"

att.AutoStats = true

att.Mult_Range = 2
att.Mult_Penetration = 2

att.Mult_Damage = 0.85
att.Mult_DamageMin = 0.85

att.Hook_Compatible = function(wep)
    if wep:GetIsShotgun() then
        return false
    end
end