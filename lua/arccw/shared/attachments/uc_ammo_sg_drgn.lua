att.PrintName = "\"DRGN\" Dragon's Breath"

att.SortOrder = -1
att.Icon = Material("entities/att/arccw_uc_ammo_shotgun_generic.png", "mips smooth")
att.Description = [[Novelty round that creates a spectacular, pyrotechnic flare of magnesium pellets.
Burning at over 3,000 °F, the blast produces enough heat to set objects and people ablaze.]]
att.Desc_Pros = {
    "pro.ignite"
}
att.Desc_Cons = {
    "uc.dragon"
}
att.Desc_Neutrals = {
}
att.Slot = "ud_ammo_shotgun"

att.AutoStats = true

att.Override_DamageType = DMG_BURN

att.Hook_PostBulletHit = function(wep,data)
    if SERVER and data.tr.Entity then
        local dur = math.floor(5.5 - (data.range * 2) / wep.Range)
        
        if dur > 0 then
            data.tr.Entity:Ignite(dur)
        end
    end
end

att.Hook_PhysBulletHit = function(wep,data)
    if SERVER and data.tr.Entity then
        local dur = math.floor(5.5 - (data.bullet.Travelled * 2 * ArcCW.HUToM) / wep.Range)
        if dur > 0 then
            data.tr.Entity:Ignite(dur)
        end
    end
end

att.Mult_AccuracyMOA = 3
att.Mult_Damage = .5
att.Mult_DamageMin = .5
att.Mult_Range = .5
att.Mult_Penetration = .5

att.Override_PhysTracerProfile = 1
-- INSERT NEW MUZZLE EFFECT HERE

att.Hook_AddShootSound = function(wep, data)
    wep:EmitSound("DB_ADD",data.volume,data.pitch,1,CHAN_WEAPON - 1) -- lua/arccw/shared/sh_0_uc.lua
end

att.Hook_Compatible = function(wep)
    if !wep.ManualAction then return false end
end