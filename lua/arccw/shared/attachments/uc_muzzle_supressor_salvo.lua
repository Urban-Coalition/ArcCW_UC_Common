att.PrintName = "Salvo Suppressor"
att.Icon = Material("entities/att/arccw_uc_tp_operator.png", "mips smooth")
att.Description = "Traps propellant gases from the muzzle, hiding muzzle flash and reducing volume significantly.\nFront-heavy, but doesn't obstruct iron sights and increases effective range. Made for shotguns."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.AutoStats = true
att.AutoStats = true
att.Slot = {"muzzle_shotgun"}

att.SortOrder = 150

att.Model = "models/weapons/arccw/atts/ud_silencer_salvo.mdl"
att.ModelOffset = Vector(-2, 0, -0.12)
att.OffsetAng = Angle(0, 0, 0)

att.Silencer = true
att.Override_MuzzleEffect = "muzzleflash_suppressed"
att.IsMuzzleDevice = true

att.Mult_ShootPitch = 1.1
att.Mult_ShootVol = 0.75
att.Mult_Range = 1.05

att.Add_BarrelLength = 8
att.Mult_SightTime = 1.2