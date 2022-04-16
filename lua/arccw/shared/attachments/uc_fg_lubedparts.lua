att.PrintName = "Lubricated Parts"

att.Icon = Material("entities/att/arccw_uc_lubedparts.png", "mips smooth")
att.Description = "A lubricated set internal components which greatly reduces the likelihood of malfuntion."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_fg"
att.AutoStats = true
att.SortOrder = 3

att.Mult_MalfunctionMean = 1.5

--[[]
att.Hook_Compatible = function(wep)
    if wep:GetIsManualAction() then
        return false
    end
end
]]

att.AttachSound = "arccw_uc/common/gunsmith/internal_modification.ogg"