att.PrintName = "AIMPOINT CompM2 Red Dot (RDS)"
att.AbbrevName = "CompM2 (RDS)"
att.Icon = Material("entities/att/acwatt_uc_optic_comp_m2.png", "mips smooth")
att.Description = "Improves sighted visibility with a red-dot targeting reticle, while adding minimal extra weight."

att.SortOrder = 1

att.Desc_Pros = {
    "autostat.holosight",
}
att.Desc_Cons = {
}
att.AutoStats = true
att.Slot = {"optic"}

att.Model = "models/weapons/arccw/atts/uc_comp_m2.mdl"
att.ModelOffset = Vector(0, 0, 0)
att.ModelScale = Vector(0.9, 0.9, 0.9)

att.AdditionalSights = {
    {
        Pos = Vector(0, 9, -1.5), -- -1.44
        Ang = Angle(0, 0, 0),
        Magnification = 1.1,
        ScrollFunc = ArcCW.SCROLL_NONE,
    }
}

att.Holosight = true
att.HolosightReticle = Material("hud/reticles/uc_reddot.png", "mips smooth")
att.HolosightPiece = "models/weapons/arccw/atts/uc_comp_m2_hsp.mdl"
att.HolosightNoFlare = false
att.HolosightSize = 1.75
att.HolosightBone = "holosight"
att.Colorable = true

att.Mult_SightedSpeedMult = .9