att.PrintName = "EOTech 552 (HOLO)"
att.Icon = Material("entities/att/acwatt_uc_optic_eotech.png", "mips smooth")
att.Description = "Improves target acquisition with a highly precise circle-dot holographic reticle, while adding minimal extra weight."

att.SortOrder = 1

att.Desc_Pros = {
    "autostat.holosight",
}
att.Desc_Cons = {
}
att.AutoStats = true
att.Slot = "optic"

att.Model = "models/weapons/arccw/atts/uc_eotech552.mdl"
att.ModelOffset = Vector(-0.5, 0, 0)
att.ModelScale = Vector(0.67, 0.67, 0.67)

att.AdditionalSights = {
    {
        Pos = Vector(0, 6, -1.35),
        Ang = Angle(0, 0, 0),
        Magnification = 1.1,
        ScrollFunc = ArcCW.SCROLL_NONE
    }
}

att.Holosight = true
att.HolosightReticle = Material("hud/reticles/ud_holo.png", "smooth")
att.HolosightSize = 1.5
att.HolosightBone = "holosight"
att.HolosightNoFlare = true

att.Colorable = true

att.Mult_SightedSpeedMult = 0.9