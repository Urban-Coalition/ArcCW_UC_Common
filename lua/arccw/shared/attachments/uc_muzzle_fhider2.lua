att.PrintName = "Cage Compensator" -- fictional
att.AbbrevName = "Cage Compensator"
att.Icon = Material("entities/att/acwatt_uc_muzzle_fhider2.png", "mips smooth")
att.Description = "Dual purpose compensator and flash hider, improving weapon stability while providing a clearer firing view from the hip."
att.Desc_Pros = {
    "uc.flashhider"
}
att.Desc_Cons = {
}
att.AutoStats = true
att.Slot = {"muzzle"}

att.SortOrder = 50

att.Model = "models/weapons/arccw/atts/uc_muzzle4.mdl"
att.ModelOffset = Vector(2.2, 0, 0)
att.ModelScale = Vector(0.95, 0.95, 0.95)
att.OffsetAng = Angle(0, 0, 0)

-- att.Silencer = true
att.Override_MuzzleEffect = "muzzleflash_suppressed"
att.IsMuzzleDevice = true

att.Mult_RecoilSide = 0.85
att.Mult_HipDispersion = 0.9

att.Mult_ShootSpeedMult = 0.9
att.Mult_Sway = 1.15

att.AttachSound = "arccw_uc/common/gunsmith/suppressor_thread.ogg"