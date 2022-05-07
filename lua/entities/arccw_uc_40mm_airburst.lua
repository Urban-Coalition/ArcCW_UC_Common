AddCSLuaFile()

ENT.Base = "arccw_uc_40mm_he"
ENT.PrintName = "40mm Airburst"

ENT.GrenadeDamage = 75
ENT.GrenadeRadius = 300
ENT.ExplosionEffect = false
ENT.Scorch = false
ENT.DragCoefficient = 0.75
ENT.DetonateOnImpact = false

ENT.NextTraceTime = 0

if SERVER then
    function ENT:Think()
        if SERVER and CurTime() - self.SpawnTime >= self.FuseTime then
            self:Detonate()
        end

        if self.SpawnTime + 0.2 < CurTime() and self.NextTraceTime < CurTime() then
            self.NextTraceTime = CurTime() + 0.1

            local dir = self:GetVelocity():GetNormalized()
            local deg = math.Clamp(1.5 - dir:Cross(Vector(0, 0, -1)):Length(), 0.5, 1)

            local tr = util.TraceHull({
                start = self:GetPos(),
                endpos = self:GetPos() + dir * (1024 * deg),
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
    local attacker = IsValid(self:GetOwner()) and self:GetOwner() or self
    local dir = self:GetVelocity():GetNormalized()
    local effectdata = EffectData()
    effectdata:SetOrigin(self:GetPos())

    if self:WaterLevel() >= 1 then
        util.Effect("WaterSurfaceExplosion", effectdata)
        self:EmitSound("weapons/underwater_explode3.wav", 125, 100, 1, CHAN_AUTO)
    else
        effectdata:SetMagnitude(4)
        effectdata:SetScale(1)
        effectdata:SetRadius(4)
        effectdata:SetNormal(dir)
        util.Effect("Sparks", effectdata)
        self:EmitSound("physics/metal/metal_box_break1.wav", 100, 200)
    end

    -- The steeper the vertical angle, the higher the damage
    local deg = math.Clamp(1.5 - dir:Cross(Vector(0, 0, -1)):Length(), 0.5, 1)

    self:FireBullets({
        Attacker = attacker,
        Damage = 25,
        Force = 5,
        Distance = 2048,
        HullSize = 16,
        Num = 64,
        Tracer = 1,
        Src = self:GetPos(),
        Dir = dir,
        Spread = Vector(1, 1, 0),
        IgnoreEntity = self,
    })
    local dmg = DamageInfo()
    dmg:SetAttacker(IsValid(self:GetOwner()) and self:GetOwner() or self)
    dmg:SetDamageType(DMG_BULLET)
    dmg:SetInflictor(self)
    dmg:SetDamageForce(self:GetVelocity() * 100)
    for _, ent in pairs(ents.FindInCone(self:GetPos(), dir, 1024, 0.707)) do
        local tr = util.QuickTrace(self:GetPos(), ent:WorldSpaceCenter() - self:GetPos(), self)
        if tr.Entity == ent then
            dmg:SetDamage(math.Rand(75, 150) * deg * math.Clamp(tr.Fraction, 0.5, 1))
            ent:TakeDamageInfo(dmg)
        end
    end

    util.BlastDamage(self, attacker, self:GetPos(), self.GrenadeRadius, self.GrenadeDamage or self.Damage or 0)
end

--[[]
function ENT:BurstEffect()
    local dir = self:GetVelocity():GetNormalized()
    local emitter = ParticleEmitter(self:GetPos())
    if !self:IsValid() or self:WaterLevel() > 2 then return end
    if !IsValid(emitter) then return end
    for i = 1, 64 do
        local fire = emitter:Add("particles/smokey", self:GetPos())
        fire:SetVelocity( VectorRand() * 500 + dir * 1000 )
        fire:SetGravity( Vector(0, 0, -90) )
        fire:SetDieTime( math.Rand(0.25, 0.5) )
        fire:SetStartAlpha( 200 )
        fire:SetEndAlpha( 0 )
        fire:SetStartSize( 10 )
        fire:SetEndSize( 128 )
        fire:SetRoll( math.Rand(-180, 180) )
        fire:SetRollDelta( math.Rand(-0.2,0.2) )
        fire:SetColor( 255, 255, 255 )
        fire:SetAirResistance( 150 )
        fire:SetPos( self:GetPos() )
        fire:SetLighting( false )
        fire:SetCollide(true)
        fire:SetBounce(0.75)
        fire:SetNextThink( CurTime() + FrameTime() )
        fire:SetThinkFunction( function(pa)
            if !pa then return end
            local col1 = Color(150, 150, 150)
            local col2 = Color(200, 200, 200)

            local col3 = col1
            local d = pa:GetLifeTime() / pa:GetDieTime()
            col3.r = Lerp(d, col1.r, col2.r)
            col3.g = Lerp(d, col1.g, col2.g)
            col3.b = Lerp(d, col1.b, col2.b)

            pa:SetColor(col3.r, col3.g, col3.b)
            pa:SetNextThink( CurTime() + FrameTime() )
        end )
    end
    emitter:Finish()
end
]]