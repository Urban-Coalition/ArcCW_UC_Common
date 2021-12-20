att.PrintName = "flashlight number 3"
att.AbbrevName = "flashlight number 3"
att.Icon = nil
att.Description = "Illuminates dark areas in front of the muzzle.\n\nCan be adjusted for a wide light."
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
att.ModelOffset = Vector(0.5,0,-0.3)
att.OffsetAng = Angle(0,0,0)
att.ModelScale = Vector(0.75,0.75,0.75)

att.Flashlight = false
att.FlashlightFOV = 50
att.FlashlightFarZ = 1024 -- how far it goes
att.FlashlightNearZ = 1 -- how far away it starts
att.FlashlightAttenuationType = ArcCW.FLASH_ATT_LINEAR -- LINEAR, CONSTANT, QUADRATIC are available
att.FlashlightColor = Color(255, 242, 229)
att.FlashlightTexture = "effects/flashlight001"
att.FlashlightBrightness = 3
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