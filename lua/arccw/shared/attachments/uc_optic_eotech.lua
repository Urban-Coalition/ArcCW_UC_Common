att.PrintName = "EOTech XPS3-0 (HOLO)"
att.AbbrevName = "EOTech (HOLO)"
att.Icon = Material("entities/att/acwatt_uc_optic_eotech.png", "mips smooth")
att.Description = "Close range holographic sight that improves sighted visibility and assists target acquisition."

att.SortOrder = 1

att.Desc_Pros = {
    "autostat.holosight",
}
att.Desc_Cons = {
}
att.AutoStats = true
att.Slot = "optic"

att.Model = "models/weapons/arccw/atts/ud_eotech.mdl"

att.AdditionalSights = {
    {
        Pos = Vector(0, 14, -1.25),
        Ang = Angle(0, 0, 0),
        Magnification = 1.1,
        ScrollFunc = ArcCW.SCROLL_NONE,
        IgnoreExtra = false
    }
}

--[[att.ModelScale = Vector(1.25, 1.25, 1.25)
att.ModelOffset = Vector(0, -0.05, 0)]]

att.Holosight = true
att.HolosightReticle = Material("hud/reticles/uc_holo.png", "mips smooth")
att.HolosightSize = 1
att.HolosightBone = "holosight"
att.HolosightNoFlare = true

att.Colorable = true
att.Ignore = true

att.Mult_SightedSpeedMult = 0.9