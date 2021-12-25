att.PrintName = "Leupold DeltaPoint Pro Reflex Sight"
att.AbbrevName = "Leupold DP-Pro"
att.Icon = nil
att.Description = "tiny scope"

att.SortOrder = 1

att.Desc_Pros = {
    "autostat.holosight",
}
att.Desc_Cons = {
}
att.AutoStats = true
att.Slot = {"optic", "optic_lp"}

att.Model = "models/weapons/arccw/atts/uc_leupold_dppro.mdl"
-- att.ModelOffset = Vector(0.1, 0, 0)
att.AdditionalSights = {
    {
        Pos = Vector(-0.026, 12, -0.54),
        Ang = Angle(0, 0, 0),
        Magnification = 1.1,
        ScrollFunc = ArcCW.SCROLL_NONE
    }
}

att.Holosight = true
att.HolosightReticle = Material("mifl_tarkov_reticle/dot.png", "mips smooth")
att.HolosightPiece = "models/weapons/arccw/atts/uc_leupold_dppro_hsp.mdl"
att.HolosightNoFlare = true
att.HolosightSize = 1
att.HolosightBone = "holosight"
att.Colorable = true