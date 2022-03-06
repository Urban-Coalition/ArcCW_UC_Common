att.PrintName = "Rifled Choke"

att.Icon = nil -- Material("entities/att/acwatt_lowpolysaiga12extmag.png", "smooth mips")
att.Description = "A special choke that improves the aerodynamics of slug rounds. It is not as effective as a fully rifled barrel."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
    "uc.reqslug"
}
att.Slot = {"choke","muzzle"}
att.AutoStats = true

att.Hook_Compatible = function(wep)
    if !wep:GetIsShotgun() then
        return false
    end
end

att.Mult_AccuracyMOA = .7
att.Mult_HipDispersion = 1.15
att.Mult_Recoil = 1.05

att.RequireFlags = {"uc_slug"}
att.GivesFlags = {"uc_choke_rifled"}
att.ExcludeFlags = {"uc_fg_sg_rifled"}