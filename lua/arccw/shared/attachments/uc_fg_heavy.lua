att.PrintName = "Heavy Bolt"

att.Icon = Material("entities/att/arccw_uc_heavybolt.png", "mips smooth")
att.Description = "Heavyweight bolt springs reduce the cyclic rate of the weapon, improving its controllability."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_fg"
att.AutoStats = true
att.SortOrder = 3

att.Mult_Recoil = 0.9
att.Mult_RPM = 0.8
att.Mult_CycleTime = 1.1

--[[]
att.Hook_Compatible = function(wep)
    if wep:GetIsManualAction() then
        return false
    end
end
]]

att.AttachSound = "arccw_uc/common/gunsmith/internal_modification.ogg"