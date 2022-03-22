att.PrintName = "\"API\" Armor-piercing Incendiary Rounds"
att.AbbrevName = "\"API\" Armor-piercing Incendiary"
att.SortOrder = 5
att.Icon = Material("entities/att/arccw_uc_ammo_generic.png", "mips smooth")
att.Description = [[Antimateriel round with a small incendiary charge. By complementing kinetic energy with heat, the rounds burn holes through objects more effectively than standard armor-piercing bullets.
Only effective with full-power cartridges.]]
att.Desc_Pros = {
    "uc.api.1",
    "uc.api.2"
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
    "Physbullets are disabled with this attachment until further notice"
}
att.Slot = "uc_ammo"

att.AutoStats = true

att.Mult_Range = 2
att.Mult_Penetration = 2.5
att.Override_DamageType = DMG_BURN

att.Mult_Damage = 2/3
att.Mult_DamageMin = 2/3

att.Override_NeverPhysBullet = true


local dmgMult = 11

local function blastEff(pos)
    local eff = EffectData()
    eff:SetOrigin(pos)
    util.Effect("cball_bounce",eff)
end

-- att.Hook_PhysBulletHit = function(wep,data) -- why can't BulletHit just fucking work on physbullets
--     if SERVER and data.tr.Entity then
--         if !data.bullet.UC_HitProp and !(data.tr.Entity:IsNPC() or data.tr.Entity:IsPlayer()) then
--             data.bullet.UC_HitProp = true
--             data.bullet.DamageMax = data.bullet.DamageMax * dmgMult
--             data.bullet.DamageMin = data.bullet.DamageMin * dmgMult
--         elseif data.bullet.UC_HitProp == true and (data.tr.Entity:IsNPC() or data.tr.Entity:IsPlayer()) then
--             data.bullet.UC_HitProp = nil
--             data.bullet.DamageMax = data.bullet.DamageMax / dmgMult
--             data.bullet.DamageMin = data.bullet.DamageMin / dmgMult
--         end
--     end

--     blastEff(data.tr.HitPos)
-- end

att.Hook_BulletHit = function(wep,data)
    if SERVER and data.tr.Entity and !(data.tr.Entity:IsNPC() or data.tr.Entity:IsPlayer()) then
        data.damage = data.damage * dmgMult
    end

    blastEff(data.tr.HitPos)
end


att.Hook_Compatible = function(wep)
    if !(wep.Primary.Ammo == "ar2" or wep.Primary.Ammo == "SniperPenetratedRound") then
        return false
    end
end