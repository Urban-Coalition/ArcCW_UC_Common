att.PrintName = "Sightmark Sure Shot Reflex Sight Black (RDS)"
att.AbbrevName = "Sure Shot (RDS)"
att.Icon = nil
att.Description = "Improves sighted visibility with a red-dot targeting reticle, while adding minimal extra weight."

att.SortOrder = 1

att.Desc_Pros = {
    "autostat.holosight",
}
att.Desc_Cons = {
}
att.AutoStats = true
att.Slot = {"optic"}

att.Model = "models/weapons/arccw/atts/uc_sureshot.mdl"

att.AdditionalSights = {
    {
        Pos = Vector(0, 12, -1.375),
        Ang = Angle(0, 0, 0),
        Magnification = 1.1,
        ScrollFunc = ArcCW.SCROLL_NONE
    }
}

att.Holosight = true
att.HolosightReticle = Material("hud/reticles/reddot.png", "mips smooth")
att.HolosightPiece = "models/weapons/arccw/atts/uc_sureshot_hsp.mdl"
att.HolosightNoFlare = true
att.HolosightSize = 1
att.HolosightBone = "holosight"
att.Colorable = true

att.Mult_SightedSpeedMult = .9