AddCSLuaFile()

ENT.Base = "arccw_uc_40mm_he"
ENT.PrintName = "40mm Incendiary"

ENT.GrenadeDamage = 50
ENT.GrenadeRadius = 150

function ENT:DoDetonation()
    local attacker = IsValid(self:GetOwner()) and self:GetOwner() or self
    util.BlastDamage(self, attacker, self:GetPos(), self.GrenadeRadius, self.GrenadeDamage)
    self:EmitSound("ambient/fire/gascan_ignite1.wav", 100, 100, 1)

    for i = 1, 5 do
        local cloud = ents.Create("arccw_uc_fire")
        cloud.FireTime = 20

        if !IsValid(cloud) then return end

        local vel = Vector(math.Rand(-1, 1), math.Rand(-1, 1), math.Rand(-1, 1)) * 1500

        cloud.Order = i
        cloud:SetPos(self:GetPos() - (self:GetVelocity() * FrameTime()) * 3 + VectorRand())
        cloud:SetAbsVelocity(vel + self:GetVelocity())
        cloud:SetOwner(self:GetOwner())
        cloud:Spawn()
    end
end

--[[att.Hook_FireBullets = function(wep, data)  this thing doesn't actually call firebullets lol
    wep:EmitSound("DB_ADD") -- lua/arccw/shared/sh_0_uc.lua
  end]]