att.PrintName = "Underload"

att.Icon = Material("entities/att/arccw_uc_tp_underload.png", "smooth mips")
att.Description = "Just because it fits, does not mean you have to fill it. Partially filled magazines reduces follower stress and improves feeding rate."
att.Desc_Pros = {
}
att.Desc_Cons = {
    "uc.underload"
}
att.Desc_Neutrals = {
}
att.Slot = "uc_tp"

att.AutoStats = true
att.SortOrder = 1

function att.Hook_GetCapacity(wep, cap)
    return math.max(math.floor(cap * (1 - 0.14)), 1)
end

att.Hook_Compatible = function(wep)
    if wep.RejectMagSizeChange or wep:GetCapacity() == 1 then return false end
end


att.Mult_MalfunctionMean = 1.25
att.Mult_HeatCapacity = 1.25
att.Mult_RPM = 1.05
att.Mult_ReloadTime = 0.95

att.GivesFlags = {"ud_underload"}
att.ExcludeFlags = {"ud_loosesprings"}

att.NotForNPCs = true