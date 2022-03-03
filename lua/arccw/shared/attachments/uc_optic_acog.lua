att.PrintName = "Trijicon Advanced Combat Optical Gunsight (4x)"
att.AbbrevName = "ACOG (4x)"
att.Icon = Material("entities/att/acwatt_uc_optic_acog.png", "mips smooth")
att.Description = "Medium range combat optic for improved precision at longer ranges.\nEquipped with backup iron sights for use in emergencies."

att.SortOrder = 4

att.Desc_Pros = {
    "autostat.holosight",
    "autostat.zoom",
}
att.Desc_Neutrals = {"uc.bus"}

att.AutoStats = true
att.Slot = {"optic", "ud_optic", "ud_acog"}

att.Model = "models/weapons/arccw/atts/ud_acog.mdl"
att.ModelOffset = Vector(0, 0, 0)
att.ModelScale = Vector(1.15, 1.15, 1.15)
att.OffsetAng = Angle(0, 0, 0)

att.AdditionalSights = {
    {
        Pos = Vector(0, 9, -1.48),
        Ang = Angle(0, 0, 0),
        Magnification = 1.25,
        IgnoreExtra = true,
        CrosshairInSights = false,
        HolosightBone = "holosight",
        HolosightData = {
            Holosight = true,
            HolosightReticle = Material("hud/scopes/uc_acog_reticle.png", "mips smooth"),
            HolosightNoFlare = true,
            HolosightSize = 9.5,
            HolosightPiece = "models/weapons/arccw/atts/ud_acog_hsp.mdl",
            HolosightBlackbox = true,
            HolosightMagnification = 4,
            Colorable = true,
        },
    },
    {
        Pos = Vector(-0.005, 11, -2.632),
        Ang = Angle(-1, 0, 0),
        Magnification = 1.1,
        IgnoreExtra = true,
        HolosightData = {
            Holosight = false,
        },
    },
}

att.Colorable = true
att.HolosightPiece = "models/weapons/arccw/atts/ud_acog_hsp.mdl"

att.Mult_SightedSpeedMult = 0.75
