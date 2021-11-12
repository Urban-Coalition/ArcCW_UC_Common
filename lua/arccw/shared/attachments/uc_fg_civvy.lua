att.PrintName = "Competitive Internals"

att.Icon = Material("entities/att/arccw_uc_fg_civvy.png", "smooth mips")
att.Description = "High quality, precision manufactured aftermarket parts that improve weapon performance. Because of the parts' civilian origin, this will restrict automatic fire."
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
    if wep:GetIsManualAction() then
        return false
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
att.Mult_AccuracyMOA = 0.5
att.Mult_RPM = .9
att.Mult_MalfunctionMean = 1.5

att.AttachSound = "arccw_uc/common/gunsmith/internal_modification.ogg"