att.PrintName = "Cobra EKP-8-16 Reflex Sight"
att.AbbrevName = "Cobra EKP-8-16"
att.Icon = nil
att.Description = "Wwwwwwwwwwwww.\nExclusive to the unorthodox \"dovetail\" optic mount."

att.SortOrder = 300

att.Desc_Pros = {
    "autostat.holosight",
    "preess two times e for new reticle"
}
att.Desc_Cons = {
}
att.AutoStats = true
att.Slot = {"ur_ak_optic"}

att.Model = "models/weapons/arccw/atts/ur_kobra.mdl"
att.ModelOffset = Vector(-2, 0, -4.55)

local R1, R2, R3, R4 = Material("hud/reticles/kobra1.png", "mips smooth"), Material("hud/reticles/kobra2.png", "mips smooth"), Material("hud/reticles/kobra3.png", "mips smooth"), Material("hud/reticles/kobra4.png", "mips smooth")

att.AdditionalSights = {
    {
        Pos = Vector(0, 13, -1.3),
        Ang = Angle(0, 0, 0),
        Magnification = 1.1,
        ScrollFunc = ArcCW.SCROLL_NONE,
        
        HolosightData = {
            HolosightReticle = R1,
            HolosightPiece = "models/weapons/arccw/atts/ur_kobra_hsp.mdl",
            HolosightNoFlare = true,
            HolosightSize = 1.5,
            HolosightBone = "holosight",
            Colorable = true
        }
    },
    {
        Pos = Vector(0, 13, -1.3),
        Ang = Angle(0, 0, 0),
        Magnification = 1.1,
        ScrollFunc = ArcCW.SCROLL_NONE,
        
        HolosightData = {
            HolosightReticle = R2,
            HolosightPiece = "models/weapons/arccw/atts/ur_kobra_hsp.mdl",
            HolosightNoFlare = true,
            HolosightSize = 2,
            HolosightBone = "holosight",
            Colorable = true
        }
    },
    {
        Pos = Vector(0, 13, -1.3),
        Ang = Angle(0, 0, 0),
        Magnification = 1.1,
        ScrollFunc = ArcCW.SCROLL_NONE,
        
        HolosightData = {
            HolosightReticle = R3,
            HolosightPiece = "models/weapons/arccw/atts/ur_kobra_hsp.mdl",
            HolosightNoFlare = true,
            HolosightSize = 2,
            HolosightBone = "holosight",
            Colorable = true
        }
    },
    {
        Pos = Vector(0, 13, -1.3),
        Ang = Angle(0, 0, 0),
        Magnification = 1.1,
        ScrollFunc = ArcCW.SCROLL_NONE,
        
        HolosightData = {
            HolosightReticle = R4,
            HolosightPiece = "models/weapons/arccw/atts/ur_kobra_hsp.mdl",
            HolosightNoFlare = true,
            HolosightSize = 2,
            HolosightBone = "holosight",
            Colorable = true
        }
    },
}

att.Holosight = true
att.HolosightPiece = "models/weapons/arccw/atts/ur_kobra_hsp.mdl"
att.Mult_SightedSpeedMult = .99