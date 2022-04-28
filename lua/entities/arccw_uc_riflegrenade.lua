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

local path = "arccw_uo/frag/"
local path1 = "arccw_uo/common/"
ENT.ExplosionSounds = {path .. "explosion-close-01.ogg", path .. "explosion-close-02.ogg"}
ENT.DebrisSounds = {path1 .. "debris-01.ogg", path1 .. "debris-02.ogg", path1 .. "debris-03.ogg", path1 .. "debris-04.ogg", path1 .. "debris-05.ogg"}


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
            phys:SetBuoyancyRatio(0.1)
        end

        self.SpawnTime = CurTime()
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
    if not self:IsValid() or self.BOOM then return end
    self.BOOM = true

    if self.ExplosionEffect then
        local effectdata = EffectData()
        effectdata:SetOrigin(self:GetPos())

        if self:WaterLevel() >= 1 then
            util.Effect("WaterSurfaceExplosion", effectdata)
            self:EmitSound("weapons/underwater_explode3.wav", 125, 100, 1, CHAN_AUTO)
        else
            -- util.Effect("Explosion", effectdata)
                       
            -- explosion_HE_m79_fas2
            -- explosion_he_grenade_fas2
            -- explosion_HE_claymore_fas2
            -- explosion_grenade_fas2

            self:EmitSound(self.ExplosionSounds[math.random(1,#self.ExplosionSounds)], 125, 100, 1, CHAN_AUTO)
            ParticleEffect("explosion_HE_m79_fas2", self:GetPos(), Angle(-90, 0, 0))

            --self:EmitSound("phx/kaboom.wav", 125, 100, 1, CHAN_AUTO)

            -- Where is the sound zenith ? ???
        end
    end

    self:DoDetonation()

    if self.Scorch then
        self:FireBullets({
            Attacker = attacker,
            Damage = 0,
            Tracer = 0,
            Distance = 20000,
            Dir = self.GrenadeDir or self:GetVelocity():GetNormalized(),
            Src = self:GetPos(),
            Callback = function(att, tr, dmg)
                util.Decal("Scorch", tr.StartPos, tr.HitPos - (tr.HitNormal * 16), self)
            end
        })
    end
    
    local trace = util.TraceLine({
        start = self:GetPos(),
        endpos = self:GetPos() + Vector(0,0,-5),
        mask = MASK_SOLID_BRUSHONLY
    })

    if self.DebrisSounds and trace.Hit then
        self:EmitSound(self.DebrisSounds[math.random(1,#self.DebrisSounds)], 85, 100, 1, CHAN_AUTO)
    end

    self:Remove()
end

function ENT:PhysicsCollide(colData, collider)
    self.GrenadeDir = colData.OurOldVelocity:GetNormalized()
    self:Detonate()
end


function ENT:Draw()
    self:DrawModel()
end