att.PrintName = "Annihilator Handcannon Laser"
att.AbbrevName = "Annihilator Laser"
--att.Icon = Material("entities/att/acwatt_uc_tac_flashlight1.png", "mips smooth")
att.Description = "Oversized laser module with iron sights, attached on the upper rail."
att.Desc_Cons = {
    "con.beam"
}
att.AutoStats = true

att.Slot = {"ur_deagle_tritium"} -- Deagle exclusive until we figure out the problem with the model
att.SortOrder = 998 -- Remove when att becomes universal

att.Model = "models/weapons/arccw/atts/ur_annihilator_laser.mdl"
att.ModelOffset = Vector(-6,0,-3.8) -- Will need to change when the model recompiles

att.Mult_Sway = 1.25
att.AdditionalSights = {
    {
        Pos = Vector(0, 20, -1.73),
        Ang = Angle(-.2, 0, 0),
        Magnification = 1,
    }
}

att.LaserStrength = 2
att.ToggleStats = {
    {
        PrintName = "On",
        Laser = true,
        LaserBone = "laser",
        LaserColor = Color(50, 255, 50),
        Mult_HipDispersion = .75,
        Mult_SightTime = .8,
    },
    {
        PrintName = "Off",
        Laser = false,
    },
}