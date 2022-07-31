att.PrintName = "\"FLECH\" Flechettes"

att.SortOrder = 3
att.Icon = Material("entities/att/arccw_uc_ammo_shotgun_generic.png", "mips smooth")
att.Description = [[Payload consisting of heavy, aerodynamic metal darts, which have less clump spread and more penetration than buckshot.]]
att.Desc_Pros = {
    "uc.pellet.8",
    "uc.penetration.12"
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = {"ud_ammo_shotgun","uc_ammo"}

att.AutoStats = true

att.Add_Num = 8
att.Mult_AccuracyMOA = .5
att.Add_Penetration = 12
att.Mult_Range = .75
att.Mult_Damage = .8

att.Mult_HullSize = 0.5

att.Override_UC_ShellColor = Color(0.2 * 255, 0.2 * 255, 0.5 * 255)

att.Hook_Compatible = function(wep)
    if !wep:GetIsShotgun() or wep:GetBuff_Override("UC_Shotshell") then
        return false
    end
end