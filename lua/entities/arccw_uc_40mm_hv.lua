AddCSLuaFile()

ENT.Base = "arccw_uc_40mm_he"
ENT.PrintName = "40mm High Velocity"

ENT.GrenadeDamage = false
ENT.GrenadeRadius = 200
ENT.DragCoefficient = 0.08

ENT.Model = "models/weapons/shell.mdl"

if CLIENT then
    function ENT:Think()
        if self.Ticks % 3 == 0 then
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
            smoke:SetEndSize(60)
            smoke:SetRoll(math.Rand(-180, 180))
            smoke:SetRollDelta(math.Rand(-0.2, 0.2))
            smoke:SetColor(100, 100, 100)
            smoke:SetAirResistance(5)
            smoke:SetPos(self:GetPos())
            smoke:SetLighting(false)
            emitter:Finish()
        end
        self.Ticks = self.Ticks + 1
    end
end