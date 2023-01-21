att.PrintName = "Trijicon Tactical Advanced Riflescope (3-8x)"
att.AbbrevName = "TARS (3-8x)"
att.Icon = Material("entities/att/acwatt_uc_optic_trijicon_tars.png", "mips smooth")
att.Description = "Variable power scope, adjustable for a very wide range of magnifications."

att.SortOrder = 8

att.Desc_Pros = {
    "autostat.holosight",
    "autostat.zoom"
}
att.Desc_Cons = {
}
att.AutoStats = true
att.Slot = {"optic"}

att.Model = "models/weapons/arccw/atts/uc_trijicon_tars.mdl"
att.ModelOffset = Vector(0, 0, 0.1)
att.ModelScale = Vector(1.05,1.05,1.05)

att.AdditionalSights = {
    {
        Pos = Vector(0, 10.6, -1.55),
        Ang = Angle(0, 0, 0),
        Magnification = 1.1,
        ScrollFunc = ArcCW.SCROLL_ZOOM,
        ScopeMagnification = 3,
        ScopeMagnificationMin = 3,
        ScopeMagnificationMax = 8,
        HolosightData = {
            Holosight = true,
            HolosightReticle = Material("hud/scopes/uc_tars_reticle.png", "mips smooth"),
            HolosightNoFlare = true,
            HolosightSize = 10.2,
            HolosightPiece = "models/weapons/arccw/atts/uc_trijicon_tars_hsp.mdl",
            HolosightBlackbox = true,
            HolosightMagnification = 3,
            HolosightMagnificationMin = 3,
            HolosightMagnificationMax = 8,
            Colorable = true,
            SpecialScopeFunction = function(screen)
                render.PushRenderTarget(screen)

                DrawBloom(0,0.3,5,5,3,0.5,1,1,1)
                DrawSharpen(1,1.65)
                DrawMotionBlur(0.45,1,1/45)

                render.PopRenderTarget()
            end,
        },
    }
}

-- att.Holosight = true
-- att.HolosightReticle = Material("mifl_tarkov_reticle/dot.png", "mips smooth")

att.HolosightPiece = "models/weapons/arccw/atts/uc_trijicon_tars_hsp.mdl"
-- att.HolosightNoFlare = true
-- att.HolosightSize = 1
-- att.HolosightBone = "holosight"
att.Colorable = true

att.Mult_SightedSpeedMult = .7
att.Mult_SightTime = 1.1