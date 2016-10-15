AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Seed"
ENT.Author = "Sir Francis Billard"
ENT.Category = "Lawless RP"
ENT.Spawnable = true

if SERVER then
	function ENT:Initialize()
		self:SetModel("models/weapons/w_bugbait.mdl")
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:SetSolid(SOLID_VPHYSICS)
		local phys = self:GetPhysicsObject()
		phys:Wake()
	end
end
