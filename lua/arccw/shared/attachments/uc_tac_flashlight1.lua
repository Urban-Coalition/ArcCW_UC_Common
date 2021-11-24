att.PrintName = "Civilian Rail-Mounted Flashlight"
att.AbbrevName = "Civilian Flashlight"
att.Icon = Material("entities/att/acwatt_uc_tac_flashlight1.png", "mips smooth")
att.Description = "Illuminates dark areas in front of the muzzle.\n\nCan be adjusted for a wide light."
att.Desc_Pros = {
    "uc.light"
}
att.Desc_Cons = {
    "con.light"
}
att.Desc_Neutrals = {}
att.AutoStats = true

att.Slot = {"tac","tac_pistol"}
att.SortOrder = .9

att.Model = "models/weapons/arccw/atts/ud_flashlight_1.mdl"
att.ModelOffset = Vector(0,0,.1)
att.OffsetAng = Angle(0,0,180)
att.ModelScale = Vector(1.2,1.2,1.2)

att.Flashlight = false
att.FlashlightFOV = 50
att.FlashlightFarZ = 1024 -- how far it goes
att.FlashlightNearZ = 1 -- how far away it starts
att.FlashlightAttenuationType = ArcCW.FLASH_ATT_LINEAR -- LINEAR, CONSTANT, QUADRATIC are available
att.FlashlightColor = Color(255, 255, 255)
att.FlashlightTexture = "effects/flashlight001"
att.FlashlightBrightness = 3
att.FlashlightBone = "light"

att.ToggleStats = {
    {
        PrintName = "On",
        Flashlight = true
    },
    {
        PrintName = "Wide",
        Flashlight = true,
        FlashlightFOV = 80,
        FlashlightFarZ = 768,
        FlashlightBrightness = 1
    },
    {
        PrintName = "Off",
        Flashlight = false,
    }
}