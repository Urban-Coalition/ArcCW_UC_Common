AddCSLuaFile()

ENT.Base = "arccw_uc_40mm_he"
ENT.PrintName = "40mm Flash Grenade"

ENT.GrenadeDamage = 50
ENT.GrenadeRadius = 150
ENT.ExplosionEffect = false
ENT.Scorch = false

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
        self:EmitSound("physics/metal/metal_box_break1.wav", 100, 200, 0.5)
    end

    -- TODO: these sounds need to be replaced (dependency)!
    self:EmitSound("weapons/arccw/flashbang/flashbang_explode1.wav", 100, 100, 1, CHAN_AUTO)
    self:EmitSound("weapons/arccw/flashbang/flashbang_explode1_distant.wav", 140, 100, 1, CHAN_AUTO)

    util.Effect( "arccw_flashexplosion", effectdata)

    local flashorigin = self:GetPos()

    local flashpower = 512
    local targets = ents.FindInSphere(flashorigin, flashpower)

    for _, k in pairs(targets) do
        if k:IsPlayer() then
            local dist = k:EyePos():Distance(flashorigin)
            local dp = (k:EyePos() - flashorigin):Dot(k:EyeAngles():Forward())

            local time = Lerp( dp, 2.5, 0.25 )

            time = Lerp( dist / flashpower, time, 0 )

            if k:VisibleVec( flashorigin ) then
                k:ScreenFade( SCREENFADE.IN, Color( 255, 255, 255, 255 ), 2.5, time )
            end

            k:SetDSP( 37, false )

        elseif k:IsNPC() then

            k:SetNPCState(NPC_STATE_PLAYDEAD)

            if timer.Exists( k:EntIndex() .. "_arccw_flashtimer" ) then
                timer.Remove( k:EntIndex() .. "_arccw_flashtimer" )
            end

            timer.Create( k:EntIndex() .. "_arccw_flashtimer", 10, 1, function()
                if !k:IsValid() then return end
                k:SetNPCState(NPC_STATE_ALERT)
            end)

        end
    end

end