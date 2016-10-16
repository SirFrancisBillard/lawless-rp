AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Health Kit"
ENT.Author = "Sir Francis Billard"
ENT.Category = "Lawless RP"
ENT.Spawnable = true

if SERVER then
	function ENT:Initialize()
		self:SetModel("models/Items/HealthKit.mdl")
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:SetSolid(SOLID_VPHYSICS)
		local phys = self:GetPhysicsObject()
		phys:Wake()
		self:SetUseType(SIMPLE_USE)
	end

	function ENT:Use(activator, caller)
		if IsValid(caller) and caller:IsPlayer() and not ply.Sleeping then
			if caller:Health() >= caller:GetMaxHealth() then
				caller:ChatPrint("You already have " .. caller:Health() .. " health!")
			else
				self:EmitSound(Sound("items/medshot4.wav"))
				caller:SetHealth(math.min(caller:Health() + 40, caller:GetMaxHealth()))
				SafeRemoveEntity(self)
			end
		end
	end
end
