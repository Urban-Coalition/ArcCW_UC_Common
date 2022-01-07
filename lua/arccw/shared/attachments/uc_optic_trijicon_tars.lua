att.PrintName = "Trijicon® TARS™ (Tactical Advanced Riflescope) 3-15x50"
att.AbbrevName = "Trijicon TARS (3-15x)"
att.Icon = nil
att.Description = "The Trijicon TARS variable power riflescope is as rugged as the Trijicon ACOG, but with the precise adjustablility that long-range shooting demands. It features an LED first focal plane reticle with ten illumination settings-including three for night vision. With 120 MOA / 36 MIL total elevation adjustment and 30 MOA / 10 MIL adjustments per revolution, the Trijicon TARS allows you to rapidly zero in on your target no matter the distance. Made in the U.S.A., this long-range riflescope is also equipped with locking external adjusters and an elevation zero stop. NOTE: Service and repair for discontinued products may vary. Please contact repairs@trijicon.com for more information. Please have proof of purchase ready to determine repair eligibility."

att.SortOrder = 3

att.Desc_Pros = {
    "autostat.holosight",
}
att.Desc_Cons = {
}
att.AutoStats = true
att.Slot = {"optic"}

att.Model = "models/weapons/arccw/atts/uc_trijicon_tars.mdl"
att.ModelOffset = Vector(0, 0, 0.25)

att.AdditionalSights = {
    {
        Pos = Vector(0, 12, -1.6),
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
            HolosightMagnification = 8,
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

att.Mult_SightedSpeedMult = .8