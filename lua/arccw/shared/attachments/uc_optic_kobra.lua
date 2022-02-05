att.PrintName = "Kobra EKP-8-16 Reflex Sight (RDS)"
att.AbbrevName = "Kobra (RDS)"
att.Icon = Material("entities/att/kobra.png", "mips smooth")
att.Description = "Improves sighted visibility with a red-dot targeting reticle, while adding minimal extra weight.\nExclusive to the uncommon \"Warsaw Pact\" optic mount."

att.SortOrder = 299

att.Desc_Pros = {
    "autostat.holosight",
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
    "Double-tap +USE to toggle reticles"
}
att.AutoStats = true
att.Slot = {"ur_ak_optic"}

att.Model = "models/weapons/arccw/atts/ur_kobra.mdl"
att.ModelOffset = Vector(-2, 0, -4.55)

local R1, R2, R3, R4 = Material("hud/reticles/uc_kobra1.png", "mips smooth"), Material("hud/reticles/uc_kobra2.png", "mips smooth"), Material("hud/reticles/uc_kobra3.png", "mips smooth"), Material("hud/reticles/uc_kobra4.png", "mips smooth")

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
att.Mult_SightedSpeedMult = .9

att.ExcludeFlags = {"ak_norail","cover_rail"}