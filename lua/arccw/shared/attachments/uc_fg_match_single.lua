att.PrintName = "Match Trigger"

att.Icon = Material("entities/att/arccw_uc_matchgradetrigger.png", "mips smooth")
att.Description = "Hair trigger for competition shooting allows crisp trigger pulls, improving first shot performance."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = {"uc_fg_singleshot"}
att.SortOrder = 2
att.AutoStats = true

att.Hook_Compatible = function(wep)
    if wep:GetIsManualAction() or wep:GetIsShotgun() then
        return false
    end
end

att.Mult_Recoil = .75

--[[]
att.M_Hook_Mult_AccuracyMOA = function(wep, data)
    if wep:GetBurstCount() == 0 then
        data.mult = data.mult * 0.5
    end
end
]]

att.AttachSound = "arccw_uc/common/gunsmith/internal_modification.ogg"

att.Ignore = true