AddCSLuaFile()

ENT.Base = "arccw_uc_40mm_he"
ENT.PrintName = "40mm Flash Grenade"

ENT.GrenadeDamage = 50
ENT.GrenadeRadius = 300

function ENT:DoDetonation()
    local attacker = IsValid(self:GetOwner()) and self:GetOwner() or self
    util.BlastDamage(self, attacker, self:GetPos(), self.GrenadeRadius, self.GrenadeDamage)

    for i = 1, 10 do
        local cloud = ents.Create("arccw_go_fire")

        if !IsValid(cloud) then return end

        local vel = Vector(math.Rand(-1, 1), math.Rand(-1, 1), math.Rand(-1, 1)) * 1500

        cloud.Order = i
        cloud:SetPos(self:GetPos() - (self:GetVelocity() * FrameTime()) + VectorRand())
        cloud:SetAbsVelocity(vel + self:GetVelocity())
        cloud:SetOwner(self:GetOwner())
        cloud:Spawn()
    end
end