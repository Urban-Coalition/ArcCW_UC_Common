att.PrintName = "Light Bolt"

att.Icon = Material("entities/att/arccw_uc_lightbolt.png", "mips smooth")
att.Description = "A low weight set of bolt components increase the cyclic speed of the weapon, at the cost of recoil absorption."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_fg"
att.AutoStats = true
att.SortOrder = 3

att.Mult_Recoil = 1.25
att.Mult_RPM = 1.1

att.Hook_Compatible = function(wep)
    if wep:GetIsManualAction() then
        return false
    end
end

att.AttachSound = "arccw_uc/common/gunsmith/internal_modification.ogg"