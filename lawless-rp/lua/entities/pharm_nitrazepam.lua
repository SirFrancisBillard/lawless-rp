AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Nitrazepam"
ENT.Author = "Sir Francis Billard"
ENT.Category = "Lawless RP"
ENT.Spawnable = true

if SERVER then
	function ENT:Initialize()
		self:SetModel("models/props_c17/TrapPropeller_Lever.mdl")
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:SetSolid(SOLID_VPHYSICS)
		local phys = self:GetPhysicsObject()
		phys:Wake()
	end

	function ENT:Use(activator, caller)
		if IsValid(caller) and caller:IsPlayer() then
			DarkRP.toggleSleep(caller, "force")
			SafeRemoveEntity(self)
		end
	end
end
