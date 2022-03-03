att.PrintName = "Magpul PTS AAC Masada Suppressor"
att.AbbrevName = "Masada Suppressor"
att.Icon = Material("entities/att/masada.png", "mips smooth")
att.Description = "Traps propellant gases from the muzzle, hiding muzzle flash and reducing volume significantly.\nReduces recoil by providing extra room for gas expansion."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.AutoStats = true
att.AutoStats = true
att.Slot = {"muzzle"}

att.SortOrder = 150

att.Model = "models/weapons/arccw/atts/uc_magpul_masada.mdl"
att.ModelOffset = Vector(2, 0, 0)
att.ModelScale = Vector(1.15, 1.15, 1.15)
att.OffsetAng = Angle(0, 0, 0)

att.Silencer = true
att.Override_MuzzleEffect = "muzzleflash_suppressed"
att.IsMuzzleDevice = true

att.Mult_ShootPitch = 1.1
att.Mult_ShootVol = 0.75
att.Mult_Recoil = .9

att.Add_BarrelLength = 5
att.Mult_SightTime = 1.15
att.Mult_Sway = 1.25

att.AttachSound = "arccw_uc/common/gunsmith/suppressor_thread.ogg"

att.Hook_Compatible = function(wep,data)
    if !(ArcCW.UC.RifleAmmoTypes[wep.Primary.Ammo]) then
        return false
    end
end