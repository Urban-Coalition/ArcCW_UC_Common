att.PrintName = "UD-40 Coating"

att.Icon = Material("entities/att/arccw_uc_lubedparts.png", "mips smooth")
att.Description = "Liberal use of a special lubricant greatly reduces the likelihood of jams and other malfuntions."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_fg"
att.AutoStats = true
att.SortOrder = 3

att.HideIfBlocked = true

att.Mult_MalfunctionMean = 2

--[[]
att.Hook_Compatible = function(wep)
    if wep:GetIsManualAction() then
        return false
    end
end
]]

att.AttachSound = "arccw_uc/common/gunsmith/internal_modification.ogg"

att.GivesFlags = {"technician"}
att.ExcludeFlags = {"lubedparts"}
