att.PrintName = "Shotgun Suppressor"
att.Icon = Material("entities/att/arccw_uc_tp_operator.png", "mips smooth")
att.Description = "Traps propellant gases from the muzzle, hiding muzzle flash and reducing volume significantly.\nHeavy-duty, made for shotguns."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.AutoStats = true
att.AutoStats = true
att.Slot = {"muzzle_shotgun"}

att.GivesFlags = {"muzzleblocking"}
att.ExcludeFlags = {"nomuzzleblocking"}

att.SortOrder = 150

att.Model = "models/weapons/arccw/atts/ud_silencer_870.mdl"
att.ModelOffset = Vector(-1, 0, 0)
att.OffsetAng = Angle(0, 0, 0)

att.Silencer = true
att.Override_MuzzleEffect = "muzzleflash_suppressed"
att.IsMuzzleDevice = true

att.Mult_ShootPitch = 1.1
att.Mult_ShootVol = 0.75
att.Mult_Range = 0.9

att.Add_BarrelLength = 6
att.Mult_SightTime = 1.15

att.AttachSound = "arccw_uc/common/gunsmith/suppressor_thread.ogg"