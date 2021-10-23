att.PrintName = "Wide Choke"

att.Icon = nil -- Material("entities/att/acwatt_lowpolysaiga12extmag.png", "smooth mips")
att.Description = "A loose choke that widens pellet spread, potentailly making targets easier to hit."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "choke"
att.AutoStats = true

att.Hook_Compatible = function(wep)
    if !wep:GetIsShotgun() then
        return false
    end
end

att.Mult_Recoil = 0.75
att.Mult_AccuracyMOA = 1.25