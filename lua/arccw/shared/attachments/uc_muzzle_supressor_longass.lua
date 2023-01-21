att.PrintName = "ATA Giraffe-556 Suppressor" -- fictional
att.AbbrevName = "Giraffe Suppressor"
att.Icon = Material("entities/att/acwatt_uc_muzzle_supressor_longass.png", "mips smooth")
att.Description = "Traps propellant gas from the muzzle, reducing visual and audible report.\nExtremely long suppressor tube provides excellent noise reduction, but is also very unwieldy."
att.Desc_Neutrals = {"uc.supptail"}

att.AutoStats = true
att.Slot = {"muzzle"}

att.SortOrder = 150

att.Model = "models/weapons/arccw/atts/uc_longass_silencer.mdl"
att.ModelOffset = Vector(2.1, 0, 0.00)
att.ModelScale = Vector(0.9, 1.25, 1.25)
att.OffsetAng = Angle(0, 0, 0)

att.Silencer = true
att.Override_MuzzleEffect = "muzzleflash_suppressed"
att.IsMuzzleDevice = true

att.Mult_ShootPitch = 1.1
att.Mult_ShootVol = 0.7
att.Mult_Range = 1.2

att.Add_BarrelLength = 10
att.Mult_SightTime = 1.15
att.Mult_SightedSpeedMult = 0.9
att.Mult_Sway = 1.15

att.AttachSound = "arccw_uc/common/gunsmith/suppressor_thread.ogg"

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if wep:GetBuff("PhysBulletMuzzleVelocity") < ArcCW.UC.SubsonicThreshold then
        return false
    end
end