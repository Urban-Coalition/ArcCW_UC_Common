att.PrintName = "High-Power Rail-Mounted Flashlight"
att.AbbrevName = "High-Power Flashlight"
att.Icon = Material("entities/att/flashlight.png", "mips smooth")
att.Description = "Illuminates dark areas in front of the muzzle.\nEmits a strong, orange-tinted light."
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

att.Model = "models/weapons/arccw/atts/uc_flashlight.mdl"
att.ModelOffset = Vector(0.5,0,-0.07)
att.OffsetAng = Angle(0,0,0)
att.ModelScale = Vector(0.75,0.75,0.75)

att.Flashlight = false
att.FlashlightFOV = 40
att.FlashlightFarZ = 1536 -- how far it goes
att.FlashlightNearZ = 1 -- how far away it starts
att.FlashlightAttenuationType = ArcCW.FLASH_ATT_LINEAR -- LINEAR, CONSTANT, QUADRATIC are available
att.FlashlightColor = Color(255, 229, 200)
att.FlashlightTexture = "effects/flashlight001"
att.FlashlightBrightness = 4
att.FlashlightBone = "flashlight"

att.ToggleStats = {
    {
        PrintName = "On",
        Flashlight = true
    },
    {
        PrintName = "Off",
        Flashlight = false,
    }
}