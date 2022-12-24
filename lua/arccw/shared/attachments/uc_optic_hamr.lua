att.PrintName = "Leupold Mark 4 High Accuracy Multi-Range Riflescope (3x/HOLO)"
att.AbbrevName = "HAMR (3x/HOLO)"
att.Icon = Material("entities/att/acwatt_uc_optic_hamr.png", "mips smooth")
att.Description = "Top-of-the-line magnified combat optic with an integral DeltaPoint.\nThough it is moderately heavy, a skilled operator will be able to make use of it at every typical engagement distance."

att.SortOrder = 3

att.Desc_Pros = {
    "autostat.holosight",
    "autostat.zoom",
}
att.Desc_Neutrals = {"uc.bus"}

att.AutoStats = true
att.Slot = {"optic", "ud_optic", "ud_acog"}

att.Model = "models/weapons/arccw/atts/uc_gso_hamr.mdl"
att.ModelOffset = Vector(0, 0, -0.1)
att.ModelScale = Vector(1, 1, 1)
att.OffsetAng = Angle(0, 0, 0)

att.AdditionalSights = {
    {
        Pos = Vector(0, 8, -1.56325),
        Ang = Angle(0, 0, 0),
        Magnification = 1.25,
        IgnoreExtra = true,
        CrosshairInSights = false,
        HolosightBone = "holosight",
        HolosightData = {
            Holosight = true,
            HolosightReticle = Material("hud/scopes/uc_hamr.png", "smooth"),
            HolosightNoFlare = true,
            HolosightSize = 9.5,
            HolosightPiece = "models/weapons/arccw/atts/uc_gso_hamr_hsp.mdl",
            HolosightBlackbox = true,
            HolosightMagnification = 3,
            Colorable = true,
        },
    },
    {
        Pos = Vector(0, 8, -2.94738),
        Ang = Angle(0, 0, 0),
        Magnification = 1.1,
        IgnoreExtra = true,
        HolosightData = {
            Holosight = true,
            HolosightReticle = Material("hud/reticles/uc_reddot.png", "mips smooth"),
            HolosightSize = 2,
            Colorable = true,
        },
    },
}

att.Colorable = true
att.HolosightPiece = "models/weapons/arccw/atts/uc_gso_hamr_hsp.mdl"

att.Mult_SightedSpeedMult = 0.75