att.PrintName = "Vortex SPITFIRE™ 3X PRISM SCOPE"
att.AbbrevName = "Vortex Spitfire 3x"
att.Icon = nil
att.Description = "not tiny scope"

att.SortOrder = 1

att.Desc_Pros = {
    "autostat.holosight",
}
att.Desc_Cons = {
}
att.AutoStats = true
att.Slot = {"optic"}

att.Model = "models/weapons/arccw/atts/uc_vortex3x.mdl"
att.ModelOffset = Vector(0,-0.017,0)

att.AdditionalSights = {
    {
        Pos = Vector(0, 12, -1.43),
        Ang = Angle(0, 0, 0),
        Magnification = 1.1,
        ScrollFunc = ArcCW.SCROLL_NONE
    }
}

att.Holosight = true
att.HolosightReticle = Material("mifl_tarkov_reticle/dot.png", "mips smooth")

att.HolosightPiece = "models/weapons/arccw/atts/uc_vortex3x_hsp.mdl"
att.HolosightNoFlare = true
att.HolosightSize = 1
att.HolosightBone = "holosight"
att.Colorable = true