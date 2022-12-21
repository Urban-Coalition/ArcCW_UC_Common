att.PrintName = "N-Vision HALO-LR Thermal Scope (1-6x)"
att.AbbrevName = "HALO-LR (1-6x)"
att.Icon = Material("entities/att/nvis.png", "mips smooth")
att.Description = "Cutting-edge night vision optic that highlights targets via infrared imaging. The complicated electronics result in a massive weight gain for the base weapon."

att.SortOrder = 4

att.Desc_Pros = {
    "autostat.holosight",
    "autostat.zoom",
    "autostat.thermal"
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
    "Double-tap +USE to toggle imaging modes"
}
att.AutoStats = true
att.Slot = {"optic"}

att.Model = "models/weapons/arccw/atts/uc_nvis.mdl"
att.ModelOffset = Vector(0, 0, 0.18)


att.AdditionalSights = {
    {
        Pos = Vector(-0.035, 7, -1.25),
        Ang = Angle(0, 0, 0),
        Magnification = 1.1,
        ScrollFunc = ArcCW.SCROLL_ZOOM,
        ZoomLevels = 5,
        ScopeMagnification = 1.1,
        Thermal = true,
        ThermalScopeColor = Color(255, 255, 255),
        ThermalHighlightColor = Color(255, 255, 255),
        ThermalFullColor = false,
        ThermalScopeSimple = false,
        ThermalNoCC = false,
        ThermalBHOT = false,
        IgnoreExtra = true,
        Contrast = 0.51,
        Brightness = 0.1,
        ForceLowRes = true,
        FPSLock = 42,
    },
    {
        Pos = Vector(-0.035, 7, -1.25),
        Ang = Angle(0, 0, 0),
        Magnification = 1.1,
        ScrollFunc = ArcCW.SCROLL_ZOOM,
        ZoomLevels = 5,
        ScopeMagnification = 1.1,
        Thermal = true,
        ThermalScopeColor = Color(255, 255, 255),
        ThermalHighlightColor = Color(0, 0, 0),
        ThermalFullColor = false,
        ThermalScopeSimple = false,
        ThermalNoCC = false,
        ThermalBHOT = false,
        IgnoreExtra = true,
        Contrast = 0.7,
        Brightness = 0.5,
        ForceLowRes = true,
        FPSLock = 42,
    },
}

att.ScopeGlint = false

att.Holosight = true
att.HolosightReticle = Material("hud/scopes/uc_nvis_reticle1grid.png", "mips smooth")
att.HolosightNoFlare = true
att.HolosightSize = 12
att.HolosightBone = "holosight"
att.HolosightPiece = "models/weapons/arccw/atts/uc_nvis_hsp.mdl"
att.Colorable = false

att.HolosightBlackbox = true

att.HolosightMagnification = 1
att.HolosightMagnificationMin = 1.1
att.HolosightMagnificationMax = 6

att.Mult_SightTime = 1.1
att.Mult_SightedSpeedMult = 0.7
att.Mult_Sway = 1.25