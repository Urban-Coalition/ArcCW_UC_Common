AddCSLuaFile()

ENT.Base = "arccw_uc_40mm_he"
ENT.PrintName = "40mm Napalm"

ENT.GrenadeDamage = 50
ENT.GrenadeRadius = 150

function ENT:DoDetonation()
    local attacker = IsValid(self:GetOwner()) and self:GetOwner() or self
    util.BlastDamage(self, attacker, self:GetPos(), self.GrenadeRadius, self.GrenadeDamage)

    for i = 1, 4 do
        local cloud = ents.Create("arccw_uc_napalm")
        cloud.FireTime = 20

        if !IsValid(cloud) then return end

        local vel = Vector(math.Rand(-1, 1), math.Rand(-1, 1), math.Rand(-1, 1)) * 500

        cloud.Order = i
        cloud:SetPos(self:GetPos() - (self:GetVelocity() * FrameTime()) * 3 + VectorRand())
        cloud:SetAbsVelocity(vel + self:GetVelocity() * math.Rand(-1, 1) * 1000)
        cloud:SetOwner(self:GetOwner())
        cloud:Spawn()
    end
end