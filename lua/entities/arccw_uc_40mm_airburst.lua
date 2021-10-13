AddCSLuaFile()

ENT.Base = "arccw_uc_40mm_he"
ENT.PrintName = "40mm Airburst"

ENT.GrenadeDamage = 50
ENT.GrenadeRadius = 150
ENT.ExplosionEffect = false
ENT.Scorch = false
ENT.DragCoefficient = 1

ENT.NextTraceTime = 0

if SERVER then
    function ENT:Think()
        if SERVER and CurTime() - self.SpawnTime >= self.FuseTime then
            self:Detonate()
        end

        if self.SpawnTime + 0.25 < CurTime() and self.NextTraceTime < CurTime() then
            self.NextTraceTime = CurTime() + 0.1
            local tr = util.TraceHull({
                start = self:GetPos(),
                endpos = self:GetPos() + self:GetVelocity():GetNormalized() * 512,
                filter = self,
                mins = Vector(-16, -16, -8),
                maxs = Vector(16, 16, 8)
            })
            if tr.Hit then
                self:Detonate()
            end
        end

    end
end

function ENT:DoDetonation()
    local effectdata = EffectData()
    effectdata:SetOrigin(self:GetPos())

    if self:WaterLevel() >= 1 then
        util.Effect("WaterSurfaceExplosion", effectdata)
        self:EmitSound("weapons/underwater_explode3.wav", 125, 100, 1, CHAN_AUTO)
    else
        effectdata:SetMagnitude(4)
        effectdata:SetScale(1)
        effectdata:SetRadius(4)
        effectdata:SetNormal(self:GetVelocity():GetNormalized())
        util.Effect("Sparks", effectdata)
        self:EmitSound("physics/metal/metal_box_break1.wav", 100, 200)
    end

    self:FireBullets({
        Attacker = IsValid(self:GetOwner()) and self:GetOwner() or self,
        Damage = 25,
        Force = 5,
        Distance = 2048,
        HullSize = 16,
        Num = 64,
        Tracer = 4,
        Src = self:GetPos(),
        Dir = self:GetVelocity():GetNormalized(),
        Spread = Vector(1, 1, 0),
        IgnoreEntity = self,
    })
    local dmg = DamageInfo()
    dmg:SetAttacker(IsValid(self:GetOwner()) and self:GetOwner() or self)
    dmg:SetDamageType(DMG_BULLET)
    dmg:SetInflictor(self)
    dmg:SetDamageForce(self:GetVelocity() * 100)
    for _, ent in pairs(ents.FindInCone(self:GetPos(), self:GetVelocity():GetNormalized(), 1024, 0.707)) do
        local tr = util.QuickTrace(self:GetPos(), ent:WorldSpaceCenter() - self:GetPos(), self)
        if tr.Entity == ent then
            dmg:SetDamage(math.Rand(30, 120) * math.min(tr.Fraction + 0.5, 1))
            ent:TakeDamageInfo(dmg)
        end
    end
end

function ENT:PhysicsCollide(colData, collider)
    local effectdata = EffectData()
    effectdata:SetOrigin(self:GetPos())
    effectdata:SetMagnitude(2)
    effectdata:SetScale(1)
    effectdata:SetRadius(2)
    effectdata:SetNormal(colData.OurOldVelocity:GetNormalized())
    util.Effect("Sparks", effectdata)
    self:EmitSound("weapons/rpg/shotdown.wav", 100, 150)
    self:Remove()
end