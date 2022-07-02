att.PrintName = "\"TR\" Tracer Rounds"
att.AbbrevName = "\"TR\" Tracer"

att.SortOrder = 1
att.Icon = Material("entities/att/arccw_uc_ammo_generic.png", "mips smooth")
att.Description = "A pyrotechnic charge inside the bullet creates a bright, colorful trail behind it during flight. The bright trails can help the shooter predict ballistic trajectories without using sights."
att.Desc_Pros = {
}
att.Desc_Cons = {
    "uc.tracer"
}
att.Desc_Neutrals = {
}
att.Slot = "uc_ammo"

att.AutoStats = true

att.Mult_HipDispersion = 0.85

att.ToggleStats = {
    {
        PrintName = "Green",
        Override_PhysTracerProfile = "uc_tracer_g"
    },
    {
        PrintName = "Red",
        Override_PhysTracerProfile = "uc_tracer_r"
    },
    {
        PrintName = "White",
        Override_PhysTracerProfile = "uc_tracer_w"
    },
}
att.Override_Tracer = "arccw_uc_tracer"

att.Hook_Compatible = function(wep)
    if wep:GetIsShotgun() then
        return false
    end
end