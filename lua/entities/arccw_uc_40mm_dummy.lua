AddCSLuaFile()

ENT.Base = "arccw_uc_40mm_he"
ENT.PrintName = "40mm Dummy Grenade"

ENT.GrenadeDamage = 50
ENT.GrenadeRadius = 150
ENT.ExplosionEffect = false
ENT.Scorch = "PaintSplatBlue"

function ENT:DoDetonation()
    local effectdata = EffectData()
    effectdata:SetOrigin(self:GetPos())
    effectdata:SetMagnitude(4)
    effectdata:SetScale(1)
    effectdata:SetRadius(4)
    effectdata:SetNormal(self:GetVelocity():GetNormalized())
    util.Effect("Sparks", effectdata)
end

function ENT:DoImpact(ent)
end

if CLIENT then
    function ENT:Think()
        if self.SmokeTrail then
            if self.Ticks % 3 == 0 then
                local emitter = ParticleEmitter(self:GetPos())
                if not self:IsValid() or self:WaterLevel() > 2 then return end
                if not IsValid(emitter) then return end
                local smoke = emitter:Add("particle/particle_smokegrenade", self:GetPos())
                smoke:SetVelocity(VectorRand() * 2)
                smoke:SetGravity(Vector(math.Rand(-1, 1), math.Rand(-1, 1), math.Rand(-1, 0)))
                smoke:SetDieTime(math.Rand(5, 7))
                smoke:SetStartAlpha(255)
                smoke:SetEndAlpha(0)
                smoke:SetStartSize(math.Rand(5, 10))
                smoke:SetEndSize(75)
                smoke:SetRoll(math.Rand(-180, 180))
                smoke:SetRollDelta(math.Rand(-0.1, 0.1))
                smoke:SetColor(150, 150, math.Rand(220, 255))
                smoke:SetAirResistance(5)
                smoke:SetPos(self:GetPos())
                smoke:SetLighting(false)
                emitter:Finish()
            end
            self.Ticks = self.Ticks + 1
        end
    end
end