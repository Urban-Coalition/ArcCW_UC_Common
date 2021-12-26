att.PrintName = "Insight Technologies ATPIAL AN/PEQ-2 (Tan)"
att.AbbrevName = "AN/PEQ-2 (Tan)"
att.Icon = nil
att.Description = "A combined flashlight and laser module for pistols.\nThe laser and flashlight can be toggled individually."
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
att.ModelOffset = Vector(2,0,0.5)
att.OffsetAng = Angle(0,0,180)
att.ModelScale = Vector(1, 1, 1)

att.Laser = false
att.LaserStrength = 2 / 5
att.LaserBone = "laser"

att.ColorOptionsTable = {Color(255, 0, 0, 150)}

att.Mult_SightTime = 1.05
att.Mult_SightedSpeedMult = 0.95
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
        Mult_HipDispersion = 0.8,
        Mult_MoveDispersion = 0.8
    },
    {
        PrintName = "Both",
        Laser = true,
        Flashlight = true,
        Mult_HipDispersion = 0.8,
        Mult_MoveDispersion = 0.8
    },
    {
        PrintName = "Light",
        Flashlight = true,
    },
    {
        PrintName = "Off",
    }
}