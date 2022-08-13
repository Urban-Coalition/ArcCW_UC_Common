att.PrintName = "\"API\" Armor-piercing Incendiary Rounds"
att.AbbrevName = "\"API\" Armor-piercing Incendiary"
att.SortOrder = 5
att.Icon = Material("entities/att/arccw_uc_ammo_generic.png", "mips smooth")
att.Description = [[Antimateriel round with a small explosive charge. By complementing kinetic energy with heat, the rounds burn holes through objects more effectively than standard armor-piercing bullets.
Only effective with full-power cartridges.]]
att.Desc_Pros = {
    "uc.api.1",
    "uc.api.2"
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
    --"Physbullets are disabled with this attachment until further notice"
}
att.Slot = "uc_ammo"

att.AutoStats = true

att.Mult_Range = 2
att.Mult_Penetration = 2.5
att.Override_DamageType = DMG_BURN + DMG_BULLET

att.Mult_Damage = 0.75
att.Mult_DamageMin = 0.75

att.Override_PhysTracerProfile = "uc_api"

att.Hook_BulletHit = function(wep,data)
    if SERVER and data.tr.Entity and !(data.tr.Entity:IsNPC() or data.tr.Entity:IsPlayer() or data.tr.Entity:IsNextBot()) then
        data.damage = data.damage * 4
    end

    local eff = EffectData()
    eff:SetOrigin(data.tr.HitPos)
    util.Effect("cball_bounce",eff)
end


att.Hook_Compatible = function(wep)
    if !(wep.Primary.Ammo == "ar2" or wep.Primary.Ammo == "SniperPenetratedRound") then
        return false
    end
end