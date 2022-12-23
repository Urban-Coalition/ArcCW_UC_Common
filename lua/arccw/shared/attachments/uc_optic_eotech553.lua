att.PrintName = "EOTech 553 (HOLO)"
att.Icon = Material("entities/att/acwatt_uc_optic_eotech553.png", "mips smooth")
att.Description = "Improves target acquisition with a highly precise circle-dot holographic reticle, while adding minimal extra weight."

att.SortOrder = 1

att.Desc_Pros = {
    "autostat.holosight",
}
att.Desc_Cons = {
}
att.AutoStats = true
att.Slot = "optic"

att.Model = "models/weapons/arccw/atts/uc_gso_eotech.mdl"
att.ModelOffset = Vector(-0.5, 0, 0.05)
att.ModelScale = Vector(1.3, 1.3, 1.3)

att.AdditionalSights = {
    {
        Pos = Vector(0, 9, -1.53),
        Ang = Angle(0, 0, 0),
        Magnification = 1.1,
        ScrollFunc = ArcCW.SCROLL_NONE
    }
}

att.Holosight = true
att.HolosightReticle = Material("hud/reticles/ud_holo.png", "smooth")
att.HolosightSize = 1.1
att.HolosightBone = "holosight"
att.HolosightNoFlare = true

att.Colorable = true

att.Mult_SightedSpeedMult = 0.9