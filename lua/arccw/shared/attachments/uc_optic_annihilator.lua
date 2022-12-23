att.PrintName = "Annihilator Handcannon Laser"
att.AbbrevName = "Annihilator Laser"
att.Icon = Material("entities/att/acwatt_uc_optic_annihilator.png", "mips smooth")
att.Description = "Oversized laser module with iron sights, attached on the upper rail."
att.Desc_Cons = {
    "con.beam"
}
att.AutoStats = true

att.Slot = {"ur_deagle_tritium"} -- Deagle exclusive until we figure out the problem with the model
att.SortOrder = 998 -- Remove when att becomes universal

att.Model = "models/weapons/arccw/atts/ur_annihilator_laser.mdl"
att.ModelOffset = Vector(-6,0,-3.8) -- Will need to change when the model recompiles

att.Mult_Sway = 1.5
att.Mult_SightTime = 1.25
att.Mult_SpeedMult = 0.975

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
        Mult_HipDispersion = 0.75,
        Mult_MoveDispersion = 0.6,
        Mult_SightTime = 0.85
    },
    {
        PrintName = "Off",
        Laser = false,
    },
}