att.PrintName = "Insight Technologies ATPIAL AN/PEQ-2"
att.AbbrevName = "AN/PEQ-2"
att.Icon = Material("entities/att/acwatt_uc_tac_anpeq2.png", "mips smooth")
att.Description = "Large flashlight and laser module for rifles, with a stronger, more effective laser that also aids target acquisition.\nThe laser and flashlight can be toggled individually."
att.Desc_Pros = {
    "uc.light"
}
att.Desc_Cons = {
    "con.light"
}
att.Desc_Neutrals = {}
att.AutoStats = true

att.Slot = {"tac"}
att.SortOrder = .9

att.Model = "models/weapons/arccw/atts/uc_anpeq2.mdl"
att.ModelOffset = Vector(0, 0.01, 0.35)
att.OffsetAng = Angle(0, 0,180)
att.ModelScale = Vector(1.2, 1.2, 1.2)
att.ModelSkin = 1

att.Laser = false
att.LaserStrength = 3.5 / 5
att.LaserBone = "laser"

att.ColorOptionsTable = {Color(255, 0, 0, 150)}

att.Mult_SightTime = 1.1
att.Mult_SightedSpeedMult = 0.9
att.Mult_MoveSpeed = 1

att.Flashlight = false
att.FlashlightFOV = 50
att.FlashlightFarZ = 512 -- how far it goes
att.FlashlightNearZ = 1 -- how far away it starts
att.FlashlightAttenuationType = ArcCW.FLASH_ATT_LINEAR -- LINEAR, CONSTANT, QUADRATIC are available
att.FlashlightColor = Color(255, 235, 229)
att.FlashlightTexture = "effects/flashlight001"
att.FlashlightBrightness = 2
att.FlashlightBone = "laser"

att.ToggleStats = {
    {
        PrintName = "Laser",
        Laser = true,
        Mult_HipDispersion = 0.7,
        Mult_MoveDispersion = 0.8,
        Mult_SightTime = .9,
        Mult_SightedSpeedMult = .75
    },
    {
        PrintName = "Both",
        Laser = true,
        Flashlight = true,
        Mult_HipDispersion = 0.7,
        Mult_MoveDispersion = 0.8,
        Mult_SightTime = .9,
        Mult_SightedSpeedMult = .75
    },
    {
        PrintName = "Light",
        Flashlight = true,
    },
    {
        PrintName = "Off",
    }
}