att.PrintName = "EOTech XPS3-0 (HOLO)" 
att.AbbrevName = "EOTech (HOLO)" 
att.Icon = Material("entities/att/arccw_uc_tp_operator.png", "mips smooth")
att.Description = "Close range holographic sight that improves sighted visibility and assists target acquisition."

att.SortOrder = 1

att.Desc_Pros = {
    "autostat.holosight",
}

att.AutoStats = true
att.Slot = {"optic", "ud_optic", "ud_acog"}

att.Model = "models/weapons/arccw/atts/ud_eotech.mdl"
att.ModelOffset = Vector(0, 0, 0)
att.OffsetAng = Angle(0, 0, 0)

att.Holosight = true
att.HolosightReticle = Material("hud/reticles/holo.png","mips smooth")
att.HolosightBone = "holosight"
att.HolosightSize = 1.5
att.HolosightMagnification = 1.1
att.Colorable = true

att.Mult_SightTime = 1.05