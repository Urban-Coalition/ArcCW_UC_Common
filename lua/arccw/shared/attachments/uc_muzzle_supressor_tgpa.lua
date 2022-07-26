att.PrintName = "TGP-A Suppressor"

att.Icon = Material("entities/att/tgpa.png", "mips smooth")
att.Description = "Traps propellant gas from the muzzle, reducing visual and audible report.\nWell rounded suppressor with no notable downsides."
att.Desc_Neutrals = {"uc.exclusive.545", "uc.supptail"}

att.AutoStats = true
att.Slot = {"ur_ak_muzzle"}

att.SortOrder = 149

att.Model = "models/weapons/arccw/atts/uc_tgpa.mdl"
att.ModelOffset = Vector(1.5, 0, 0)
att.ModelScale = Vector(1.15, 1.15, 1.15)
att.OffsetAng = Angle(0, 0, 0)

att.Silencer = true
att.Override_MuzzleEffect = "muzzleflash_suppressed"
att.IsMuzzleDevice = true

att.Mult_ShootPitch = 1.1
att.Mult_ShootVol = 0.75

att.Add_BarrelLength = 5
att.Mult_Range = 0.9
att.Mult_SightTime = 1.05
att.Mult_Sway = 1.15

att.AttachSound = "arccw_uc/common/gunsmith/suppressor_thread.ogg"

att.Hook_Compatible = function(wep)
    if wep:GetBuff_Override("Override_Ammo", wep.Primary.Ammo) != "smg1" then
        return false
    end
end

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if wep:GetBuff("PhysBulletMuzzleVelocity") < ArcCW.UC.SubsonicThreshold then
        return false
    end
end