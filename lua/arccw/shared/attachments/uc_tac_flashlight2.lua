att.PrintName = "Tactical Rail-Mounted Flashlight"
att.AbbrevName = "Tactical Flashlight"
att.Icon = Material("entities/att/acwatt_uc_tac_flashlight2.png", "mips smooth")
att.Description = "Illuminates dark areas in front of the muzzle.\nCan be adjusted for a focused light."
att.Desc_Pros = {
    "uc.light"
}
att.Desc_Cons = {
    "con.light"
}
att.Desc_Neutrals = {}
att.AutoStats = true

att.Slot = {"tac","tac_pistol"}
att.SortOrder = 30+2

att.Model = "models/weapons/arccw/atts/ud_flashlight_2.mdl"
att.ModelOffset = Vector(0,0,-.15)

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
        PrintName = "Tight",
        Flashlight = true,
        FlashlightFOV = 30,
        FlashlightFarZ = 1536,
        FlashlightBrightness = 5
    },
    {
        PrintName = "Off",
        Flashlight = false,
    }
}