att.PrintName = "Competition Internals"

att.Icon = Material("entities/att/arccw_uc_fg_civvy.png", "smooth mips")
att.Description = "High quality, precision manufactured aftermarket parts that improve weapon performance. Because of the parts' civilian origin, the fire control group doesn't support automatic fire."
att.Desc_Pros = {
}
att.Desc_Cons = {
    "uc.semionly"
}
att.Desc_Neutrals = {
}
att.Slot = "uc_fg"
att.AutoStats = true

att.Hook_Compatible = function(wep)
    if wep:GetIsShotgun() then
        return false
    end
    for i, v in pairs(wep.Firemodes) do
        if !v then continue end
        if v.Mode and v.Override_ManualAction then
            return false
        end
    end
end

att.Override_Firemodes = {
    {
        Mode = 1,
    },
    {
        Mode = 0
    }
}
att.Override_Firemodes_Priority = 10

att.Mult_Range = 1.25
att.Mult_AccuracyMOA = 0.75
att.Mult_RPM = 0.75
att.Mult_MalfunctionMean = 1.5

att.AttachSound = "arccw_uc/common/gunsmith/internal_modification.ogg"