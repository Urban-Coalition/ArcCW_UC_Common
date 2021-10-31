att.PrintName = "\"TR\" Near-empty tracers"

att.SortOrder = 1
att.Icon = Material("entities/att/obsolete.png", "mips smooth")
att.Description = "The last 5 rounds of the magazine are tracer rounds, providing a visual indication when the magazine is almost empty."
att.Desc_Pros = {
    "uc.lowind"
}
att.Desc_Cons = {
    "uc.tracer"
}
att.Desc_Neutrals = {
}
att.Slot = "uc_ammo"

att.InvAtt = "uc_ammo_tr"

att.AutoStats = true
att.Ignore = true

att.Override_TracerFinalMag = 5 -- this doesn't actually work like this, you know
att.ToggleStats = {
    {
        PrintName = "Red",
        Override_PhysTracerProfile = 1
    },
    {
        PrintName = "Green",
        Override_PhysTracerProfile = 2
    },
    {
        PrintName = "Violet",
        Override_PhysTracerProfile = 5
    },
    {
        PrintName = "Yellow",
        Override_PhysTracerProfile = 4
    },
}