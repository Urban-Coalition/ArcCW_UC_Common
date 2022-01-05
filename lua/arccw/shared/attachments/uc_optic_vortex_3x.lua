att.PrintName = "Vortex SPITFIRE™ 3X PRISM SCOPE (1.5x-3x)"
att.AbbrevName = "Spitfire (1.5x-3x)"
att.Icon = nil
att.Description = "Short to medium range combat scope that allows a more versatile engagement range."

att.SortOrder = 3

att.Desc_Pros = {
    "autostat.holosight",
    "autostat.zoom",
}
att.Desc_Cons = {
}
att.AutoStats = true
att.Slot = {"optic"}

att.Model = "models/weapons/arccw/atts/uc_vortex3x.mdl"
att.ModelOffset = Vector(0, 0, 0.18)

att.AdditionalSights = {
    {
        Pos = Vector(0, 12, -1.6),
        Ang = Angle(0, 0, 0),
        Magnification = 1.1,
        ScrollFunc = ArcCW.SCROLL_ZOOM,
        ScopeMagnificationMin = 1.5,
        ScopeMagnificationMax = 3,
        ScopeMagnification = 3,
        HolosightData = {
            Holosight = true,
            HolosightReticle = Material("hud/scopes/uc_vortex_reticle.png", "mips smooth"),
            HolosightNoFlare = true,
            HolosightSize = 7,
            HolosightPiece = "models/weapons/arccw/atts/uc_vortex3x_hsp.mdl",
            HolosightBlackbox = true,
            HolosightMagnification = 3,
            Colorable = true,
        },
    }
}

-- att.Holosight = true
-- att.HolosightReticle = Material("mifl_tarkov_reticle/dot.png", "mips smooth")

att.HolosightPiece = "models/weapons/arccw/atts/uc_vortex3x_hsp.mdl"
-- att.HolosightNoFlare = true
-- att.HolosightSize = 1
-- att.HolosightBone = "holosight"
att.Colorable = true

att.Mult_SightedSpeedMult = .8