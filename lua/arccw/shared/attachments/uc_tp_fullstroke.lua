att.PrintName = "Full Stroke"

att.Icon = Material("entities/att/arccw_uc_tp_full_stroke.png", "smooth mips")
att.Description = "Specialist training and a little extra gun oil allow you to cycle the action more quickly after a shot, improving your rate of fire."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_tp"

att.AutoStats = true
att.SortOrder = 15

att.Mult_CycleTime = .9

att.Hook_Compatible = function(wep)
    if wep:GetBuff_Override("Override_ManualAction", wep.ManualAction) then return end
    for i, v in pairs(wep.Firemodes) do
        if !v then continue end
        if v.Mode and v.Override_ManualAction then
            return
        end
    end
    return false
end

att.NotForNPCs = true