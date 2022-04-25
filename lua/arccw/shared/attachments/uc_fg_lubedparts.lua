att.PrintName = "Lubricated Parts"

att.Icon = Material("entities/att/arccw_uc_lubedparts.png", "mips smooth")
att.Description = "Extensive maintenance, high-quality parts, and liberal lubrication greatly reduce the likelihood of malfuntions."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_fg"
att.AutoStats = true
att.SortOrder = 3

att.Mult_MalfunctionMean = 2

--[[]
att.Hook_Compatible = function(wep)
    if wep:GetIsManualAction() then
        return false
    end
end
]]

att.AttachSound = "arccw_uc/common/gunsmith/internal_modification.ogg"