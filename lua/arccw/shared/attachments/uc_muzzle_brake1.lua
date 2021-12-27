att.PrintName = "Hammerhead Muzzle Brake" -- fictional
att.AbbrevName = "Hammerhead Brake"
att.Icon = nil
att.Description = "A muzzle device that redirects propellant gasses to the sides to reduce the recoil of the gun."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.AutoStats = true
att.AutoStats = true
att.Slot = {"muzzle"}

att.SortOrder = 150

att.Model = "models/weapons/arccw/atts/uc_muzzle2.mdl"
att.ModelOffset = Vector(2, 0, 0)
att.ModelScale = Vector(1.15, 1.15, 1.15)
att.OffsetAng = Angle(0, 0, 0)

att.IsMuzzleDevice = true

att.Mult_Recoil = .75
att.Mult_RecoilSide = .9

att.Add_BarrelLength = 2
att.Mult_SightTime = 1.15
att.Mult_Sway = 1.05
att.Mult_ShootVol = 1.35

att.AttachSound = "arccw_uc/common/gunsmith/suppressor_thread.ogg"
