att.PrintName = "PBS-4 Suppressor"

att.Icon = Material("entities/att/pbs4.png", "mips smooth")
att.Description = "Traps propellant gas from the muzzle, reducing visual and audible report.\nOriginally designed for carbine barrels, this suppressor compensates for inaccuracy, and can be mounted to other barrels with some gunsmithing work."
att.Desc_Neutrals = {"uc.exclusive.545", "uc.supptail"}

att.AutoStats = true
att.AutoStats = true
att.Slot = {"ur_ak_muzzle"}

att.SortOrder = 149

att.Model = "models/weapons/arccw/atts/uc_pbs4.mdl"
att.ModelOffset = Vector(1.25, 0, 0)
att.ModelScale = Vector(1.3, 1.3, 1.3)
att.OffsetAng = Angle(0, 0, 0)

att.Silencer = true
att.Override_MuzzleEffect = "muzzleflash_suppressed"
att.IsMuzzleDevice = true

att.Mult_ShootPitch = 1.1
att.Mult_ShootVol = 0.75
att.Mult_AccuracyMOA = 0.75

att.Add_BarrelLength = 5
att.Mult_SightTime = 1.15
att.Mult_Sway = 1.25

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