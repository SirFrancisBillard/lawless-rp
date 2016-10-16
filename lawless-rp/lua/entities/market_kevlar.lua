AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Kevlar"
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
		if IsValid(caller) and caller:IsPlayer() then
			if caller:Armor() >= 100 then
				caller:ChatPrint("You are already wearing kevlar!")
			else
				self:EmitSound(Sound("items/ammopickup.wav"))
				caller:SetArmor(100)
				SafeRemoveEntity(self)
			end
		end
	end
end
