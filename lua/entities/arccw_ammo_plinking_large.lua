AddCSLuaFile()

ENT.Base                      = "arccw_ammo"
ENT.RenderGroup               = RENDERGROUP_TRANSLUCENT

ENT.PrintName                 = "Plinking Ammo (Large)"
ENT.Category                  = "ArcCW - Ammo"

ENT.Spawnable                 = true
ENT.Model                     = "models/items/arccw/plinking_ammo.mdl"
ENT.Scale = 1.5

ENT.AmmoType = "plinking"
ENT.AmmoCount = 500

ENT.DetonationDamage = 10
ENT.DetonationRadius = 128
ENT.DetonationSound = nil

DEFINE_BASECLASS(ENT.Base)
function ENT:DetonateRound()
    BaseClass.DetonateRound(self)
    self:EmitSound("weapons/pistol/pistol_fire2.wav", 70, 175, 0.8)
end