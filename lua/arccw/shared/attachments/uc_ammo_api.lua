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

local cov = GetConVar("arccw_uc_apobjmult")
local badblood = { -- it's actually the good type
    [-1] = true,
    [3] = true,
}
att.Hook_BulletHit = function(wep,data)
    local ent = data.tr.Entity
    local test1 = !(ent:IsNPC() or ent:IsPlayer() or ent:IsNextBot()) and true or false
    local test2 = (!ent:GetBloodColor() or badblood[ent:GetBloodColor()]) and true or false
    if IsValid(ent) and (test1 or test2) then
        data.damage = data.damage * cov:GetFloat()
        local eff = EffectData()
        eff:SetOrigin(data.tr.HitPos)
        util.Effect("cball_bounce", eff)
    end
end

att.Hook_Compatible = function(wep)
    if !(wep.Primary.Ammo == "SniperPenetratedRound") then
        return false
    end
end

att.Ignore = true -- bullshit att