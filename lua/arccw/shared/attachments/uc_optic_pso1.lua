att.PrintName = "PSO-1 (4x)"
att.AbbrevName = "PSO-1 (4x)"
att.Icon = Material("entities/att/acwatt_uc_optic_pso1.png", "mips smooth")
att.Description = "Medium range combat scope for improved precision at longer ranges.\nExclusive to the \"Warsaw Pact\" optic mount, and is slightly more agile than rail mounted optics."

att.SortOrder = 300

att.Desc_Pros = {
    "autostat.holosight",
    "autostat.zoom",
}
att.Desc_Cons = {
}
att.AutoStats = true
att.Slot = {"ur_ak_optic"}

att.Model = "models/weapons/arccw/atts/ur_pso1.mdl"
att.ModelOffset = Vector(-2, 0, -4.55)

att.AdditionalSights = {
    {
        Pos = Vector(0, 13, -1.5),
        Ang = Angle(0, 0, 0),
        Magnification = 1.25,
        HolosightData = {
            Holosight = true,
            HolosightReticle = Material("hud/scopes/uc_pso.png", "mips smooth"),
            HolosightNoFlare = true,
            HolosightSize = 10.5,
            HolosightPiece = "models/weapons/arccw/atts/ur_pso1_hsp.mdl",
            HolosightBlackbox = true,
            HolosightMagnification = 4,
            Colorable = true,
        },
    }
}

-- att.Holosight = true
-- att.HolosightReticle = Material("mifl_tarkov_reticle/dot.png", "mips smooth")

att.HolosightPiece = "models/weapons/arccw/atts/ur_pso1_hsp.mdl"
-- att.HolosightNoFlare = true
-- att.HolosightSize = 1
-- att.HolosightBone = "holosight"
att.Colorable = true

att.Mult_SightedSpeedMult = .8
att.ExcludeFlags = {"ak_norail","cover_rail"}
