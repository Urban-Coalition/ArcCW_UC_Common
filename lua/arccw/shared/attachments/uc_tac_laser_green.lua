att.PrintName = "Rail-Mounted Laser Sight (Green)"
att.AbbrevName = "Green Laser Sight"
att.Icon = Material("entities/att/acwatt_uc_tac_flashlight2.png", "mips smooth")
att.Description = "Projects a laser in the direction of the target, assisting the user to line up shots without iron sights."
att.Desc_Pros = {
}
att.Desc_Cons = {
    "con.light"
}
att.Desc_Neutrals = {}
att.AutoStats = true

att.Slot = {"tac","tac_pistol"}
att.SortOrder = 29

att.Model = "models/weapons/arccw/atts/ud_flashlight_1.mdl"
att.ModelOffset = Vector(0,0,0)
att.OffsetAng = Angle(0,0,180)
att.ModelScale = Vector(1.2,1.2,1.2)
att.Laser = false
att.LaserStrength = 2 / 5
att.LaserBone = "light"

att.ColorOptionsTable = {Color(0, 255, 0, 150)}

att.ToggleStats = {
    {
        PrintName = "On",
        Laser = true,
        Mult_HipDispersion = 0.8,
        Mult_MoveDispersion = 0.8,
    },
    {
        PrintName = "Off",
        Laser = false,
    }
}