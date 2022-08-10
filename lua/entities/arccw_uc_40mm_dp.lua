AddCSLuaFile()

ENT.Base = "arccw_uc_40mm_he"
ENT.PrintName = "40mm HE Dual Purpose Grenade"

ENT.GrenadeDamage = false
ENT.GrenadeRadius = 300
ENT.ExplosionEffect = false
ENT.Scorch = false

function ENT:DoDetonation()
    local dir = self.GrenadeDir or self:GetVelocity():GetNormalized()
    local attacker = IsValid(self:GetOwner()) and self:GetOwner() or self
    local damage = self.GrenadeDamage or self.Damage or 0
    local blastpos = self:GetPos()
    local tr = util.TraceLine({
        start = self:GetPos(),
        endpos = self:GetPos() + dir * 64,
        filter = self
    })
    if IsValid(tr.Entity) then
        -- do impact damage
        local dmg = DamageInfo()
        dmg:SetAttacker(attacker)
        dmg:SetInflictor(self)
        dmg:SetDamage(damage * 10)
        dmg:SetDamageForce(dir * 3000)
        dmg:SetDamagePosition(tr.HitPos)
        tr.Entity:TakeDamageInfo(dmg)
    end
    -- attempt to penetrate entity/world and place explosion behind
    local tr2 = util.TraceLine({
        start = tr.HitPos + dir * 69,
        endpos = tr.HitPos,
        filter = self,
    })

    if tr2.Hit and !tr2.StartSolid then
        -- Produce a weaker blast on the pre-penetration side
        util.BlastDamage(self, attacker, blastpos, self.GrenadeRadius, damage * 0.5)

        blastpos = tr2.HitPos + dir * 16
        self:EmitSound("physics/concrete/concrete_break2.wav", 100, 110)
        local effectdata = EffectData()
        effectdata:SetOrigin(self:GetPos())
        effectdata:SetMagnitude(2)
        effectdata:SetScale(1)
        effectdata:SetRadius(2)
        effectdata:SetNormal(-dir)
        util.Effect("Sparks", effectdata)
        effectdata:SetOrigin(blastpos)
        effectdata:SetNormal(dir)
        util.Effect("Sparks", effectdata)
    end

    local effectdata = EffectData()
    effectdata:SetOrigin(blastpos)

    if self:WaterLevel() >= 1 then
        util.Effect("WaterSurfaceExplosion", effectdata)
        self:EmitSound("weapons/underwater_explode3.wav", 125, 100, 1, CHAN_AUTO)
    else
        self:EmitSound(self.ExplosionSounds[math.random(1,#self.ExplosionSounds)], 125, 100, 1, CHAN_AUTO)
        ParticleEffect("explosion_grenade_fas2", self:GetPos(), tr.HitNormal:Angle())
        if tr2.Hit and !tr2.StartSolid then
            ParticleEffect("explosion_he_m79_fas2", tr2.StartPos, tr.HitNormal:Angle() * -1)
        end
        if self.DebrisSounds then
            self:EmitSound(self.DebrisSounds[math.random(1,#self.DebrisSounds)], 85, 100, 1, CHAN_AUTO)
        end
    end

    util.ScreenShake(self:GetPos(),25,4,.75,self.GrenadeRadius * 4)
    util.BlastDamage(self, attacker, blastpos, self.GrenadeRadius, damage)
end