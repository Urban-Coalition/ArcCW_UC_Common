att.PrintName = "Trijicon Tactical Advanced Riflescope (3-15x)"
att.AbbrevName = "TARS (3-15x)"
att.Icon = Material("entities/att/tars.png", "mips smooth")
att.Description = "Variable power scope, adjustable for a very wide range of magnifications."

att.SortOrder = 15

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
        Pos = Vector(0, 16, -1.55),
        Ang = Angle(0, 0, 0),
        Magnification = 1.1,
        ScrollFunc = ArcCW.SCROLL_ZOOM,
        ScopeMagnificationMin = 3,
        ScopeMagnificationMax = 15,
        ScopeMagnification = 8,
        HolosightData = {
            Holosight = true,
            HolosightReticle = Material("hud/scopes/uc_tars_reticle.png", "mips smooth"),
            HolosightNoFlare = true,
            HolosightSize = 10.2,
            HolosightPiece = "models/weapons/arccw/atts/uc_trijicon_tars_hsp.mdl",
            HolosightBlackbox = true,
            HolosightMagnification = 9,
            HolosightMagnificationMin = 3,
            HolosightMagnificationMax = 15,
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