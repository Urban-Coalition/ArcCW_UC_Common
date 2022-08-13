AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "base_entity"
ENT.PrintName = "Fire Particle"
ENT.Author = ""
ENT.Information = ""
ENT.Spawnable = false
ENT.AdminSpawnable = false

ENT.Model = "models/Items/AR2_Grenade.mdl"

ENT.FireTime = 30
ENT.CollisionGroup = COLLISION_GROUP_PROJECTILE
ENT.Armed = false

ENT.NextDamageTick = 0
ENT.NextStickTick = 0

ENT.Ticks = 0

ENT.ArcCW_Killable = false

function ENT:Initialize()
    if SERVER then
        self:SetModel( self.Model )
        self:SetMoveType( MOVETYPE_VPHYSICS )
        self:SetSolid( SOLID_VPHYSICS )
        local maxs = Vector(1, 1, 1)
        local mins = -maxs
        self:PhysicsInitBox(mins, maxs)
        self:DrawShadow( false )

        local phys = self:GetPhysicsObject()
        if phys:IsValid() then
            phys:Wake()
            phys:SetBuoyancyRatio(0)
        end

        self.SpawnTime = CurTime()
        self:Detonate()

        self.FireTime = math.Rand(self.FireTime - 1, self.FireTime + 1)
    end
end

local fired = {
    "sprites/flamelet1",
    "sprites/flamelet2",
    "sprites/flamelet3",
    "sprites/flamelet4",
    "sprites/flamelet5",
}
local function GetFireParticle()
    return fired[math.random(#fired)]
end

function ENT:Think()
    if !self.SpawnTime then self.SpawnTime = CurTime() end

    if CLIENT then
        local emitter = ParticleEmitter(self:GetPos())

        if !self:IsValid() or self:WaterLevel() > 2 then return end
        if !IsValid(emitter) then return end

        if math.random(1, 100) < 10 then
            local fire = emitter:Add(GetFireParticle(), self:GetPos() + (VectorRand() * 16))
            fire:SetVelocity( VectorRand() * 500 * VectorRand() )
            fire:SetGravity( Vector(0, 0, 100) )
            fire:SetDieTime( math.Rand(0.5, 0.75) )
            fire:SetStartAlpha( 255 )
            fire:SetEndAlpha( 0 )
            fire:SetStartSize( 15 )
            fire:SetEndSize( 100 )
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
                local col1 = Color(255, 255, 175)
                local col2 = Color(0, 0, 0)

                local col3 = col1
                local d = pa:GetLifeTime() / pa:GetDieTime()
                col3.r = Lerp(d, col1.r, col2.r)
                col3.g = Lerp(d, col1.g, col2.g)
                col3.b = Lerp(d, col1.b, col2.b)

                pa:SetColor(col3.r, col3.g, col3.b)
                pa:SetNextThink( CurTime() + FrameTime() )
            end )
        end

        if math.random(1, 100) < 15 then
            local fire = emitter:Add("particles/smokey", self:GetPos())
                fire:SetVelocity( VectorRand() * 100 )
                fire:SetGravity( Vector(0, 0, 1000) )
                fire:SetDieTime( math.Rand(0.5, 2) )
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
                    local col1 = Color(150, 75, 0)
                    local col2 = Color(50, 50, 50)

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

        self.Ticks = self.Ticks + 1
    else

        if self.NextDamageTick > CurTime() then return end

        if self.Stuck and (!IsValid(self:GetParent()) or (self:GetParent():IsPlayer() and !self:GetParent():Alive())) then
            self:SetParent(NULL)
            self:SetMoveType( MOVETYPE_VPHYSICS )
            self:SetSolid( SOLID_VPHYSICS )
            self.Stuck = false
            local maxs = Vector(1, 1, 1)
            local mins = -maxs
            self:PhysicsInitBox(mins, maxs)
            local phys = self:GetPhysicsObject()
            if phys:IsValid() then
                phys:Wake()
            end
            return
        end

        local dmg = DamageInfo()
        dmg:SetDamageType(DMG_BURN)
        dmg:SetDamage(math.random() * 2 + 1)
        dmg:SetInflictor(self)
        dmg:SetAttacker(self:GetOwner())

        if self:WaterLevel() > 2 then
            if math.random() <= 0.075 then self:Remove() return end
            dmg:SetDamage(1)
        end

        util.BlastDamageInfo(dmg, self:GetPos(), 150)

        self.NextDamageTick = CurTime() + 0.15
        if !self.Stuck and self.NextStickTick < CurTime() then
            self.NextStickTick = CurTime() + 0.5
            if math.random() <= 0.25 then
                for _, e in pairs(ents.FindInSphere(self:GetPos(), 96)) do
                    if e:IsNPC() or e:IsNextBot() or e:IsVehicle() or (e:IsPlayer() and e:Alive()) or (simfphys and simfphys.IsCar(e)) then
                        self.Stuck = true
                        timer.Simple(0, function()
                            -- we commit a mild amount of war crimes
                            self:SetSolid(SOLID_NONE)
                            self:SetMoveType(MOVETYPE_NONE)
                            self:SetParent(e)
                            local min, max = e:WorldSpaceAABB()
                            self:SetPos(min + (max - min) * math.random())
                        end)
                        break
                    end
                end
            end
        end


        if self.SpawnTime + self.FireTime <= CurTime() then self:Remove() return end
    end
end

function ENT:OnRemove()
    if !self.FireSound then return end
    self.FireSound:Stop()
end

function ENT:Detonate()
    if !self:IsValid() then return end

    self.Armed = true

    if self.Order and self.Order != 1 then return end

    self.FireSound = CreateSound(self, "arccw_go/molotov/fire_loop_1.wav")
    self.FireSound:Play()

    self.FireSound:ChangePitch(80, self.FireTime)

    timer.Simple(self.FireTime - 1, function()
        if !IsValid(self) then return end

        self.FireSound:ChangeVolume(0, 1)
    end)

    timer.Simple(self.FireTime, function()
        if !IsValid(self) then return end

        self:Remove()
    end)
end


function ENT:PhysicsCollide(data, physobj)
    if self.Stuck then return end

    local tgt = data.HitEntity
    if !tgt:IsWorld() then
        timer.Simple(0, function()
            -- we commit a mild amount of war crimes
            self:SetSolid(SOLID_NONE)
            self:SetMoveType(MOVETYPE_NONE)
            self:SetParent(tgt)
        end)
        self.Stuck = true
    else
        timer.Simple(0, function()
            -- we commit a mild amount of war crimes
            self:SetSolid(SOLID_NONE)
            self:SetMoveType(MOVETYPE_NONE)
        end)
    end
end

function ENT:Draw()
    -- cam.Start3D() -- Start the 3D function so we can draw onto the screen.
    --     render.SetMaterial( GetFireParticle() ) -- Tell render what material we want, in this case the flash from the gravgun
    --     render.DrawSprite( self:GetPos(), math.random(200, 250), math.random(200, 250), Color(255, 255, 255) ) -- Draw the sprite in the middle of the map, at 16x16 in it's original colour with full alpha.
    -- cam.End3D()
end