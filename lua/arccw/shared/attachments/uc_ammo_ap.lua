att.PrintName = "\"AP\" Armor-piercing Rounds"
att.AbbrevName = "\"AP\" Armor-piercing"
att.SortOrder = 5
att.Icon = Material("entities/att/arccw_uc_ammo_generic.png", "mips smooth")
att.Description = "Bullets designed to penetrate body armor, usually built around a penetrator of hardened steel, tungsten, or tungsten carbide.\nUpon impact on a hard target, the case is destroyed, but the penetrator continues its motion and penetrates the target."
att.Desc_Pros = {
    "uc.api.1",
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_ammo"

att.AutoStats = true

att.Mult_Range = 2
att.Mult_Penetration = 2

att.Mult_Damage = 0.9
att.Mult_DamageMin = 0.9

att.Hook_Compatible = function(wep)
    if wep:GetIsShotgun() then
        return false
    end
end

local cov = GetConVar("arccw_uc_apobjmult")
local metalMats = { -- it's actually the good type
    [77] = true,
}
att.Hook_BulletHit = function(wep,data)
    local ent = data.tr.Entity
    local test1 = !(ent:IsNPC() or ent:IsPlayer() or ent:IsNextBot()) and true or false
    local test2 = (metalMats[ent:GetMaterialType()]) and true or false
    print(ent:GetMaterialType())
    if IsValid(ent) and (test1 or test2) then
        data.damage = data.damage * cov:GetFloat()
        local eff = EffectData()
        eff:SetOrigin(data.tr.HitPos)
        util.Effect("cball_bounce", eff)
    end
end
