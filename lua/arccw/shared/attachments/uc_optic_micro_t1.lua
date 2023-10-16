att.PrintName = "AIMPOINT Micro T-1 Red Dot Reflex Sight (RDS)"
att.AbbrevName = "Micro T-1 (RDS)"
att.Icon = Material("entities/att/acwatt_uc_optic_micro_t1.png", "mips smooth")
att.Description = "Improves sighted visibility with a red-dot targeting reticle, while adding minimal extra weight."

att.SortOrder = 1

att.Desc_Pros = {
    "autostat.holosight",
}
att.Desc_Cons = {
}
att.AutoStats = true
att.Slot = {"optic"}

att.Model = "models/weapons/arccw/atts/uc_mirco_t1.mdl"
att.ModelOffset = Vector(0,0,0.2)
att.ModelScale = Vector(1.2,1.2,1.2)

att.AdditionalSights = {
    {
        Pos = Vector(0, 9, -1.59),
        Ang = Angle(0, 0, 0),
        Magnification = 1.1,
        ScrollFunc = ArcCW.SCROLL_NONE
    }
}

att.Holosight = true
att.HolosightReticle = Material("hud/reticles/uc_reddot.png", "mips smooth")
att.HolosightPiece = "models/weapons/arccw/atts/uc_mirco_t1_hsp.mdl"
att.HolosightNoFlare = false
att.HolosightSize = 1.85
att.HolosightBone = "holosight"
att.Colorable = true

att.Mult_SightedSpeedMult = .9