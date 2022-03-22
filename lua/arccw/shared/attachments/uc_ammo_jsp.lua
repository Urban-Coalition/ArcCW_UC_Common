att.PrintName = "\"JSP\" Jacketed Soft-point Rounds"
att.AbbrevName = "\"JSP\" Jacketed Soft-point"

att.SortOrder = 3
att.Icon = Material("entities/att/arccw_uc_ammo_generic.png", "mips smooth")
att.Description = "Bullets with an exposed lead tip that expands on impact.\nIncreases wounding potential while maintaining an aerodynamic profile."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_ammo"

att.AutoStats = true

att.Mult_Penetration = 0.6
--att.Mult_Damage = 1.1
att.Mult_Range = 0.8
att.Mult_RangeMin = 1.4

att.Hook_Compatible = function(wep)
    if wep:GetIsShotgun() then
        return false
    end
end