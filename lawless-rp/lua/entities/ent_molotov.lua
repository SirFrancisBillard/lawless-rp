
if SERVER then
	AddCSLuaFile()
end

ENT.Type = "anim"
ENT.Base = "base_anim"

ENT.PrintName = "Thrown Molotov"
ENT.Author = "Vladimir Putin"

if CLIENT then return end

function ENT:Initialize()
	self:SetModel( "models/props_junk/garbage_glassbottle003a.mdl" )
	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetMoveType( MOVETYPE_VPHYSICS )
	self:SetSolid( SOLID_VPHYSICS )
	self:SetAngles( Angle(math.random(0, 360), math.random(0, 360), math.random(0, 360)) )
	
	local Phys = self:GetPhysicsObject()
	if not Phys or not Phys:IsValid() then return end
	self:GetPhysicsObject():Wake()
	self.Created = CurTime()
end

function ENT:Explode( pos )
	sound.Play( "physics/glass/glass_cup_break" .. math.random(1, 2) .. ".wav", self:GetPos(), 150, 150 )
	local Fire = ents.Create( "ent_fire" )
	Fire:SetPos( pos )
	Fire:Spawn()
	self:Remove()
end

function ENT:Think()
	if self.Created + 10 < CurTime() then
		self:Explode( self:GetPos() )
		return false
	end
end

function ENT:PhysicsCollide( tblData, pPhysHit )
	local theirImpactSpeed = tblData.TheirOldVelocity:LengthSqr()
	local impactSpeed = tblData.OurOldVelocity:LengthSqr() + theirImpactSpeed
	if impactSpeed < 5000 then return end
	
	local newImpactSpeed = self:GetVelocity():LengthSqr() + tblData.HitEntity:GetVelocity():LengthSqr()
	local impactSpeedDelta = impactSpeed - newImpactSpeed
	if impactSpeedDelta < 5000 then return end
	self:Explode( self:GetPos() )
end
