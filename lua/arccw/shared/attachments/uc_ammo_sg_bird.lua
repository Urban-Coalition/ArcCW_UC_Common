att.PrintName = "\"BIRD\" #9 Birdshot"

att.SortOrder = 4
att.Icon = Material("entities/att/arccw_uc_ammo_shotgun_generic.png", "mips smooth")
att.Description = [[Hunting rounds with a wide spread and a very large number of pellets, designed to shoot birds out of the sky.
While not as lethal as buckshot, the loose clump spread makes it easier to hit small or multiple targets.]]
att.Desc_Pros = {
    "uc.pellet.2x"
}
att.Desc_Cons = {
    "uc.accuracy.20"
}
att.Desc_Neutrals = {
}
att.Slot = {"ud_ammo_shotgun", "uc_ammo"}

att.AutoStats = true

att.Mult_Num = 2
att.Mult_Damage = 0.85
att.Mult_DamageMin = 0.85
att.Mult_Recoil = 0.8

att.Add_AccuracyMOA = 20

att.Mult_HullSize = 0.1

att.Override_UC_ShellColor = Color(0.4 * 255, 0.6 * 255, 0.8 * 255)

att.Hook_Compatible = function(wep)
    if !wep:GetIsShotgun() or wep:GetBuff_Override("UC_Shotshell") then
        return false
    end
end