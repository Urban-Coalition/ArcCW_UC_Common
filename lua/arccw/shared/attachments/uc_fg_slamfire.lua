att.PrintName = "Slamfire Kit"

att.Icon = nil -- Material("entities/att/acwatt_lowpolysaiga12extmag.png", "smooth mips")
att.Description = "Reckless removal of trigger safety features allows shells to fire immediately upon being cycled while the trigger is held. This enables rapid \"rack and fire\" behavior similar to old trench guns, but impacts weapon performance."
att.Desc_Pros = {
    "uc.slam"
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_fg"
att.AutoStats = true

att.Hook_Compatible = function(wep)
    if !wep:GetIsShotgun() then
        return false
    end
    for i, v in pairs(wep.Firemodes) do
        if !v then continue end
        if v.Mode and v.Override_ManualAction then
            return
        end
    end
    return false
end

att.Mult_Recoil = 1.2
att.Mult_RecoilSide = 1.5

att.Override_Firemodes = {
    {
        Mode = 2,
        PrintName = "fcg.slam",
        Override_ManualAction = true,
    },
    {
        Mode = 0
    }
}
att.Override_Firemodes_Priority = 11 -- higher than spas-12 manual

att.AttachSound = "arccw_uc/common/gunsmith/internal_modification.ogg"