att.PrintName = "Recoil Compensator" -- fictional
att.AbbrevName = "Compensator"
att.Icon = nil
att.Description = "Redirects propellant gases to counter muzzle rise, particularly in the lateral directions."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.AutoStats = true
att.AutoStats = true
att.Slot = {"muzzle"}

att.SortOrder = 150

att.Model = "models/weapons/arccw/atts/uc_muzzle5.mdl"
att.ModelOffset = Vector(1.5, 0, 0)
att.ModelScale = Vector(.85, .85, .85)
att.OffsetAng = Angle(0, 0, 0)

att.IsMuzzleDevice = true

--att.Mult_ShootPitch = .95 please don't
att.Mult_Recoil = .85
att.Mult_RecoilSide = .75

att.Add_BarrelLength = 2
att.Mult_SightTime = 1.2
att.Mult_Sway = 1.5
att.Mult_ShootVol = 1.25

att.AttachSound = "arccw_uc/common/gunsmith/suppressor_thread.ogg"