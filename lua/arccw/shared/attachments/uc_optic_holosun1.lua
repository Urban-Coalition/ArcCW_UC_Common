att.PrintName = "Holosun HS510C (Riser) (RDS)"
att.AbbrevName = "Holosun (R) (RDS)"
att.Icon = Material("entities/att/t1.png", "mips smooth")
att.Description = "Improves sighted visibility with a red-dot targeting reticle, while adding minimal extra weight."

att.SortOrder = 1

att.Desc_Pros = {
    "autostat.holosight",
}
att.Desc_Cons = {
}
att.AutoStats = true
att.Slot = {"optic"}

att.Model = "models/weapons/arccw/atts/uc_holosun1.mdl"
att.ModelScale = Vector( 1.5, 1.5, 1.5 )

att.AdditionalSights = {
    {
        Pos = Vector(0, 3, -1.5),
        Ang = Angle(0, 0, 0),
        Magnification = 1.1,
        ScrollFunc = ArcCW.SCROLL_NONE
    }
}

att.Holosight = true
att.HolosightReticle = Material("hud/reticles/uc_reddot.png", "mips smooth")
att.HolosightNoFlare = false
att.HolosightSize = 1.5
att.HolosightBone = "holosight"
att.Colorable = true

att.Mult_SightedSpeedMult = .9