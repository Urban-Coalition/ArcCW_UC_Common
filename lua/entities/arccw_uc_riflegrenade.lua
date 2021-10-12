AddCSLuaFile()
ENT.Type = "anim"
ENT.Base = "base_entity"
ENT.PrintName = "Base Rifle Grenade"
ENT.Author = ""
ENT.Information = ""
ENT.Spawnable = false

ENT.Ticks = 0
ENT.CollisionGroup = COLLISION_GROUP_PROJECTILE


-- Intentionally not ENT.Damage since ArcCW base overwrites it with weapon damage (for some reason)
ENT.GrenadeDamage = false
ENT.GrenadeRadius = 0
ENT.FuseTime = 10
ENT.DragCoefficient = 1

ENT.Model = "models/weapons/shell.mdl"
ENT.ExplosionEffect = true
ENT.Scorch = true
ENT.SmokeTrail = true

if SERVER then
    function ENT:Initialize()
        local pb_vert = 1
        local pb_hor = 1
        self:SetModel(self.Model)
        self:PhysicsInitBox(Vector(-pb_vert, -pb_hor, -pb_hor), Vector(pb_vert, pb_hor, pb_hor))
        local phys = self:GetPhysicsObject()

        if phys:IsValid() then
            phys:Wake()
            phys:SetDragCoefficient(self.DragCoefficient)
        end

        self.SpawnTime = CurTime()

        timer.Simple(0.1, function()
            if not IsValid(self) then return end
            self:SetCollisionGroup(COLLISION_GROUP_PROJECTILE)
        end)
    end

    function ENT:Think()
        if SERVER and CurTime() - self.SpawnTime >= self.FuseTime then
            self:Detonate()
        end
    end
else
    function ENT:Think()
        if self.SmokeTrail then
            if self.Ticks % 5 == 0 then
                local emitter = ParticleEmitter(self:GetPos())
                if not self:IsValid() or self:WaterLevel() > 2 then return end
                if not IsValid(emitter) then return end
                local smoke = emitter:Add("particle/particle_smokegrenade", self:GetPos())
                smoke:SetVelocity(VectorRand() * 25)
                smoke:SetGravity(Vector(math.Rand(-5, 5), math.Rand(-5, 5), math.Rand(-20, -25)))
                smoke:SetDieTime(math.Rand(1.5, 2.0))
                smoke:SetStartAlpha(255)
                smoke:SetEndAlpha(0)
                smoke:SetStartSize(0)
                smoke:SetEndSize(100)
                smoke:SetRoll(math.Rand(-180, 180))
                smoke:SetRollDelta(math.Rand(-0.2, 0.2))
                smoke:SetColor(20, 20, 20)
                smoke:SetAirResistance(5)
                smoke:SetPos(self:GetPos())
                smoke:SetLighting(false)
                emitter:Finish()
            end
            self.Ticks = self.Ticks + 1
        end
    end
end

-- overwrite to do special explosion things
function ENT:DoDetonation()
    local attacker = IsValid(self:GetOwner()) and self:GetOwner() or self
    util.BlastDamage(self, attacker, self:GetPos(), self.GrenadeRadius, self.GrenadeDamage or self.Damage or 0)
end

function ENT:Detonate()
    if not self:IsValid() then return end

    if self.ExplosionEffect then
        local effectdata = EffectData()
        effectdata:SetOrigin(self:GetPos())

        if self:WaterLevel() >= 1 then
            util.Effect("WaterSurfaceExplosion", effectdata)
            self:EmitSound("weapons/underwater_explode3.wav", 125, 100, 1, CHAN_AUTO)
        else
            util.Effect("Explosion", effectdata)
            self:EmitSound("phx/kaboom.wav", 125, 100, 1, CHAN_AUTO)
        end
    end

    self:DoDetonation()

    if self.Scorch then
        self:FireBullets({
            Attacker = attacker,
            Damage = 0,
            Tracer = 0,
            Distance = 20000,
            Dir = self:GetVelocity(),
            Src = self:GetPos(),
            Callback = function(att, tr, dmg)
                util.Decal("Scorch", tr.StartPos, tr.HitPos - (tr.HitNormal * 16), self)
            end
        })
    end

    self:Remove()
end

function ENT:PhysicsCollide(colData, collider)
    self:Detonate()
end

function ENT:Draw()
    self:DrawModel()
end