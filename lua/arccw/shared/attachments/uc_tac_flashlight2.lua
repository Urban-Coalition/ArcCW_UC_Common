att.PrintName = "Tactical Rail-Mounted Flashlight"
att.AbbrevName = "Tactical Flashlight"
att.Icon = nil
att.Description = "Illuminates dark areas in front of the muzzle. Military-grade model, adjustable for focus."
att.Desc_Pros = {
    "uc.light"
}
att.Desc_Cons = {
    "con.light"
}
att.Desc_Neutrals = {}
att.AutoStats = true

att.Slot = {"tac","tac_pistol"}
att.SortOrder = 1

att.Model = "models/weapons/arccw/atts/ud_flashlight_2.mdl"
att.ModelOffset = Vector(0,0,-.15)

att.Flashlight = false
att.FlashlightFOV = 55
att.FlashlightFarZ = 512 -- how far it goes
att.FlashlightNearZ = 1 -- how far away it starts
att.FlashlightAttenuationType = ArcCW.FLASH_ATT_LINEAR -- LINEAR, CONSTANT, QUADRATIC are available
att.FlashlightColor = Color(255, 255, 255)
att.FlashlightTexture = "effects/flashlight001"
att.FlashlightBrightness = 2.5
att.FlashlightBone = "light"

att.Mult_SightTime = 1.025

att.ToggleStats = {
    {
        PrintName = "Wide",
        Flashlight = true
    },
    {
        PrintName = "Tight",
        Flashlight = true,
        FlashlightFOV = 30,
        FlashlightFarZ = 896,
        FlashlightBrightness = 4
    },
    {
        PrintName = "Off",
        Flashlight = false,
    }
}