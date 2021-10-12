AddCSLuaFile()

ENT.Base = "arccw_uc_40mm_he"
ENT.PrintName = "40mm HE Dual Purpose Grenade"

ENT.GrenadeDamage = false
ENT.GrenadeRadius = 300
ENT.ExplosionEffect = false
ENT.Scorch = false

function ENT:PhysicsCollide(colData, collider)
    self.PunchDir = colData.OurOldVelocity:GetNormalized()
    self:Detonate()
end

function ENT:DoDetonation()
    local dir = self.PunchDir
    local attacker = IsValid(self:GetOwner()) and self:GetOwner() or self
    local blastpos = self:GetPos()
    local tr = util.TraceLine({
        start = self:GetPos(),
        endpos = self:GetPos() + dir * 64,
        filter = self
    })
    if IsValid(tr.Entity) and (tr.Entity:IsVehicle() or tr.Entity:IsPlayer() or tr.Entity:IsNPC() or tr.Entity:IsNextBot()) then
        -- do impact damage
        local dmg = DamageInfo()
        dmg:SetAttacker(attacker)
        dmg:SetInflictor(self)
        dmg:SetDamage((self.GrenadeDamage or self.Damage or 0) * 10)
        dmg:SetDamageForce(dir * 3000)
        dmg:SetDamagePosition(tr.HitPos)
        tr.Entity:TakeDamageInfo(dmg)
    end

    if not IsValid(tr.Entity) or not (tr.Entity:IsVehicle() or tr.Entity:IsPlayer() or tr.Entity:IsNPC() or tr.Entity:IsNextBot()) then
        -- attempt to penetrate entity/world and place explosion behind
        local tr2 = util.TraceLine({
            start = tr.HitPos + dir * 48,
            endpos = tr.HitPos,
            filter = self,
        })
        if tr2.Hit and not tr2.StartSolid then
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
    end

    local effectdata = EffectData()
    effectdata:SetOrigin(blastpos)

    if self:WaterLevel() >= 1 then
        util.Effect("WaterSurfaceExplosion", effectdata)
        self:EmitSound("weapons/underwater_explode3.wav", 125, 100, 1, CHAN_AUTO)
    else
        util.Effect("Explosion", effectdata)
        self:EmitSound("phx/kaboom.wav", 125, 100, 1, CHAN_AUTO)
    end

    util.BlastDamage(self, attacker, blastpos, self.GrenadeRadius, self.GrenadeDamage or self.Damage or 0)
end