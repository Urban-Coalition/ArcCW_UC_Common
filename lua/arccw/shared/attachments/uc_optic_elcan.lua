att.PrintName = "ELCAN C79 (3.4x)"
att.Icon = Material("entities/att/uc_optic_elcan.png", "mips smooth")
att.Description = "Medium range combat scope for improved precision at longer ranges.\nEquipped with backup iron sights for use in emergencies."

att.SortOrder = 3.4

att.Desc_Pros = {
    "autostat.holosight",
    "autostat.zoom",
}
att.Desc_Neutrals = {"uc.bus"}

att.AutoStats = true
att.Slot = {"optic", "ud_optic", "ud_acog"}

att.Model = "models/weapons/arccw/atts/uc_gso_elcan.mdl"
att.ModelOffset = Vector(0, 0, 0)
att.ModelScale = Vector(1, 1, 1)
att.OffsetAng = Angle(0, 0, 0)

att.AdditionalSights = {
    {
        Pos = Vector(0, 8, -1.51577),
        Ang = Angle(0, 0, 0),
        Magnification = 1.25,
        IgnoreExtra = true,
        CrosshairInSights = false,
        HolosightBone = "holosight",
        HolosightData = {
            Holosight = true,
            HolosightReticle = Material("hud/scopes/uc_elcan.png", "smooth"),
            HolosightNoFlare = true,
            HolosightSize = 9.5,
            HolosightPiece = "models/weapons/arccw/atts/uc_gso_elcan_hsp.mdl",
            HolosightBlackbox = true,
            HolosightMagnification = 4,
            Colorable = true,
        },
    },
    {
        Pos = Vector(0, 11, -2.62),
        Ang = Angle(-0.25, 0, 0),
        Magnification = 1.1,
        IgnoreExtra = true,
        HolosightData = {
            Holosight = false,
        },
    },
}

att.Colorable = true
att.HolosightPiece = "models/weapons/arccw/atts/uc_gso_elcan_hsp.mdl"

att.Mult_SightedSpeedMult = 0.75