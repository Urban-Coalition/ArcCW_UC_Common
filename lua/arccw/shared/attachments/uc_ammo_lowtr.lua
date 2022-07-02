att.PrintName = "\"TR\" Intermittent Tracers"

att.SortOrder = 1
att.Icon = Material("entities/att/arccw_uc_ammo_generic.png", "mips smooth")
att.Description = "Every 5 rounds as well as the last few rounds of the magazine are tracer rounds, providing a visual indication of rounds remaining and make hip firing somewhat easier."
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
att.Mult_HipDispersion = 0.9

att.Hook_AddShootSound = function(wep, data)
    local clip = wep:Clip1()
    if clip <= 5 and clip > 0 then
        wep:MyEmitSound("physics/metal/metal_computer_impact_bullet3.wav", data.volume, data.pitch + (5 - clip) * 7, 0.2, CHAN_AUTO)
    end
end

att.O_Hook_Override_TracerFinalMag = function(wep, data)
    return {current = math.Clamp(math.ceil(wep:GetCapacity() * 0.2), 5, 20)}
end
att.Override_TracerNum = 5
att.Override_Tracer = "arccw_uc_tracer"

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

--[[]
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
]]

att.Hook_Compatible = function(wep)
    if wep:GetIsShotgun() then
        return false
    end
end