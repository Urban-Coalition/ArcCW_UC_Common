AddCSLuaFile()

ENT.Base = "arccw_uc_40mm_he"
ENT.PrintName = "40mm Napalm"

ENT.GrenadeDamage = 50
ENT.GrenadeRadius = 150
ENT.ExplosionEffect = false
ENT.Scorch = false
ENT.DragCoefficient = 0.75

ENT.NextTraceTime = 0

if SERVER then
    function ENT:Think()
        if SERVER and CurTime() - self.SpawnTime >= self.FuseTime then
            self:Detonate()
        end

        if self.SpawnTime + 0.25 < CurTime() and self.NextTraceTime < CurTime() then
            self.NextTraceTime = CurTime() + 0.1
            local dir = self:GetVelocity():GetNormalized()
            local tr = util.TraceHull({
                start = self:GetPos(),
                endpos = self:GetPos() + dir * 512,
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
        self:EmitSound("ambient/fire/gascan_ignite1.wav", 100, 100, 0.75)
    end

    for i = 1, 5 do
        local cloud = ents.Create("arccw_uc_napalm")
        cloud.FireTime = 20

        if !IsValid(cloud) then return end

        local vel = VectorRand() * 250

        cloud.Order = i
        cloud:SetPos(self:GetPos() - (self:GetVelocity() * FrameTime()) + VectorRand())
        --cloud:SetAbsVelocity(vel + self:GetVelocity())
        cloud:SetOwner(self:GetOwner())
        cloud:Spawn()
        cloud:GetPhysicsObject():SetVelocityInstantaneous(vel + self:GetVelocity())

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