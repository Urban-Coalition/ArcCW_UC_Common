att.PrintName = "Leupold DeltaPoint Pro Reflex Sight (RDS)"
att.AbbrevName = "DP-Pro (RDS)"
att.Icon = nil
att.Description = "Low-profile reflex sight. While its lens isn't as wide as other reflex sights, it's significantly lighter and small enough to use on pistols."

att.SortOrder = 0.5

att.Desc_Pros = {
    "autostat.holosight",
}
att.Desc_Cons = {
}
att.AutoStats = true
att.Slot = {"optic", "optic_lp"}

att.Model = "models/weapons/arccw/atts/uc_leupold_dppro.mdl"
att.ModelScale = Vector(1.3, 1.3, 1.3)
att.AdditionalSights = {
    {
        Pos = Vector(-0.026, 12, -0.65),
        Ang = Angle(0, 0, 0),
        Magnification = 1.1,
        ScrollFunc = ArcCW.SCROLL_NONE
    }
}

att.Holosight = true
att.HolosightReticle = Material("hud/reticles/reddot.png", "mips smooth")
att.HolosightPiece = "models/weapons/arccw/atts/uc_leupold_dppro_hsp.mdl"
att.HolosightNoFlare = true
att.HolosightSize = 1
att.HolosightBone = "holosight"
att.Colorable = true

att.Mult_SightedSpeedMult = .99