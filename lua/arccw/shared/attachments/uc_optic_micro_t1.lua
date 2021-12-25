att.PrintName = "Micro T-1"
att.AbbrevName = "Micro T-1 Red Dot Reflex Sight"
att.Icon = nil
att.Description = "tiny scope"

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

att.AdditionalSights = {
    {
        Pos = Vector(0, 12, -1.28),
        Ang = Angle(0, 0, 0),
        Magnification = 1.1,
        ScrollFunc = ArcCW.SCROLL_NONE
    }
}

att.Holosight = true
att.HolosightReticle = Material("mifl_tarkov_reticle/dot.png", "mips smooth")

att.HolosightPiece = "models/weapons/arccw/atts/uc_mirco_t1_hsp.mdl"
att.HolosightNoFlare = true
att.HolosightSize = 1
att.HolosightBone = "holosight"
att.Colorable = true