att.PrintName = "\"JHP\" Jacketed Hollow-point Rounds"
att.AbbrevName = "\"JHP\" Jacketed Hollow-point"

att.SortOrder = 4
att.Icon = Material("entities/att/arccw_uc_ammo_generic.png", "mips smooth")
att.Description = "A type of bullet with a hollow tip that expands on impact, causing a more lethal hit without penetrating further than necessary.\nFor use in environments where over-penetration could cause collateral damage."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_ammo"

att.AutoStats = true

att.Mult_RangeMin = 0.5
att.Mult_Penetration = 0.25
att.Mult_Damage = 1.17

att.Mult_DamageMin = 0.85

att.Hook_Compatible = function(wep)
    if wep:GetIsShotgun() then
        return false
    end
end