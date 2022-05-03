att.PrintName = "\"DRGN\" Dragon's Breath"

att.SortOrder = -1
att.Icon = Material("entities/att/arccw_uc_ammo_shotgun_generic.png", "mips smooth")
att.Description = [[Novelty magnesium-based round that projects a spectacular jet of sparks and fire.
Burning at over 3,000 °F, the blast isn't immediately lethal, but can easily set objects and people ablaze.

Only compatible with manual action shotguns due to a weak pressure curve.]]
att.Desc_Pros = {
    "uc.ignite",
    "uc.pellet.12",
}
att.Desc_Cons = {
    "uc.accuracy.35",
    "uc.dragon",
    "uc.alwaysphys",
}
att.Desc_Neutrals = {
    "uc.manualonly",
}
att.Slot = {"ud_ammo_shotgun", "uc_ammo"}
att.ActivateElements = {"uc_manualonly"}
att.AutoStats = true

att.Add_Num = 12

-- zombies don't take damage from DMG_BURN (hardcoded to set them on fire)
local dontburn = {
    npc_zombie = true,
    npc_zombie_torso = true,
    npc_zombine = true,
    npc_fastzombie = true,
    npc_fastzombie_torso = true,
    npc_headcrab = true,
    npc_headcrab_fast = true,
    npc_headcrab_black = true,
}

att.Hook_PhysBulletHit = function(wep, data)
    if SERVER and data.tr.Entity then
        local d = data.bullet.Travelled * ArcCW.HUToM
        local dur = 6 - d * 2 / wep.Range
        if dur > 0 then
            data.tr.Entity:Extinguish()
            data.tr.Entity:Ignite(dur)
        end

        local delta = math.Clamp(d / data.bullet.Range, 0, 1)

        -- Impact is disabled (no bullet holes) so we do damage ourselves
        local dmg = DamageInfo()
        dmg:SetAttacker(data.bullet.Attacker)
        dmg:SetInflictor(data.bullet.Weapon)
        dmg:SetDamage(Lerp(delta, data.bullet.DamageMax, data.bullet.DamageMin))
        dmg:SetDamagePosition(data.bullet.Pos)
        dmg:SetDamageForce(data.bullet.Vel)
        dmg:SetDamageType(dontburn[data.tr.Entity:GetClass()] and DMG_BUCKSHOT or (DMG_BURN + DMG_BUCKSHOT))

        data.tr.Entity:TakeDamageInfo(dmg)
    end

    local effect = EffectData()
    effect:SetOrigin(data.tr.HitPos)
    util.Effect("StunstickImpact",effect)
end

att.Override_PhysBulletImpact = false

att.Override_DamageType = DMG_BURN + DMG_BUCKSHOT

att.Add_AccuracyMOA = 35
att.Mult_Damage = .5
att.Mult_DamageMin = .5

att.Override_AlwaysPhysBullet = true
att.Mult_PhysBulletMuzzleVelocity = 0.25
att.Mult_PhysBulletGravity = 1.5

--att.Override_PhysTracerProfile = 1
att.Override_MuzzleEffect = "muzzleflash_dragonbreath"

att.Override_UC_ShellColor = Color(0.9 * 255, 0.3 * 255, 0.1 * 255)

att.Hook_AddShootSound = function(wep, data)
    wep:EmitSound("DB_ADD", data.volume,data.pitch,1,CHAN_WEAPON - 1) -- lua/arccw/shared/sh_0_uc.lua
end

att.GivesFlags = {"needsmanual"}
att.Hook_Compatible = function(wep)
    if (!wep.ManualAction and !wep.UC_CanManualAction) or !wep:GetIsShotgun() then return false end
end