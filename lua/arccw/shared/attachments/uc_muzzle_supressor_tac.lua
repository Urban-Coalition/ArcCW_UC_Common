att.PrintName = "Mountain Armory Tactical Suppressor" -- fictional
att.AbbrevName = "Tactical Suppressor"
att.Icon = Material("entities/att/acwatt_uc_supressor_tactical.png", "mips smooth")
att.Description = "Traps propellant gas from the muzzle, reducing visual and audible report.\nLow-profile and enhances ballistics, but slightly cumbersome."
att.Desc_Neutrals = {"uc.exclusive.rifle", "uc.supptail"}

att.AutoStats = true
att.Slot = {"muzzle"}

att.SortOrder = 150

att.Model = "models/weapons/arccw/atts/ud_silencer_tactical.mdl"
att.ModelOffset = Vector(1.95, 0, 0)
att.OffsetAng = Angle(0, 0, 0)

att.Silencer = true
att.Override_MuzzleEffect = "muzzleflash_suppressed"
att.IsMuzzleDevice = true

att.Mult_ShootPitch = 1.1
att.Mult_ShootVol = 0.75
att.Mult_Range = 1.1

att.Add_BarrelLength = 4
att.Mult_SightTime = 1.07
att.Mult_Sway = 1.15

att.AttachSound = "arccw_uc/common/gunsmith/suppressor_thread.ogg"

att.Hook_Compatible = function(wep,data)
    if !ArcCW.UC.RifleAmmoTypes[wep:GetBuff_Override("Override_Ammo", wep.Primary.Ammo)] then
        return false
    end
end

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if wep:GetBuff("PhysBulletMuzzleVelocity") < ArcCW.UC.SubsonicThreshold then
        return false
    end
end