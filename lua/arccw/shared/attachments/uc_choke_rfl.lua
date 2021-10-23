att.PrintName = "Rifled Barrel"

att.Icon = Material("entities/att/arccw_uc_precisionrifling.png", "mips smooth")
att.Description = "Specially made barrels designed for slug rounds. Improves precision noticably."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
    "uc.reqslug"
}
att.Slot = "choke"
att.AutoStats = true

att.Hook_Compatible = function(wep)
    if !wep:GetIsShotgun() then -- or wep:GetBuff("Num") > 1
        return false
    end
end

att.Mult_AccuracyMOA = .5
att.Mult_SightTime = 1.15
att.Mult_HipDispersion = 1.2
att.Mult_Recoil = 1.2

att.RequireFlags = {"uc_slug"}