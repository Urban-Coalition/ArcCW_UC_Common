att.PrintName = "Leupold DeltaPoint Pro Reflex Sight (LP)"
att.AbbrevName = "DP-Pro (LP)"
att.Icon = Material("entities/att/acwatt_uc_optic_leupold_dppro.png", "mips smooth")
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
att.ModelScale = Vector(1.32, 1.56, 1.2)
att.ModelOffset = Vector(0, -0.05, 0.15)
att.AdditionalSights = {
    {
        Pos = Vector(0, 9, -0.85),
        Ang = Angle(0, 0, 0),
        Magnification = 1.1,
        ScrollFunc = ArcCW.SCROLL_NONE
    }
}

att.Holosight = true
att.HolosightReticle = Material("hud/reticles/uc_reddot.png", "mips smooth")
att.HolosightPiece = "models/weapons/arccw/atts/uc_leupold_dppro_hsp.mdl"
att.HolosightNoFlare = false
att.HolosightSize = 2.25
att.HolosightBone = "holosight"
att.Colorable = true

att.Mult_SightedSpeedMult = .95