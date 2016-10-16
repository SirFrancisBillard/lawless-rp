AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Paracetamol"
ENT.Author = "Sir Francis Billard"
ENT.Category = "Lawless RP"
ENT.Spawnable = true

if SERVER then
	function ENT:Initialize()
		self:SetModel("models/props_junk/garbage_metalcan002a.mdl")
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:SetSolid(SOLID_VPHYSICS)
		local phys = self:GetPhysicsObject()
		phys:Wake()
	end

	function ENT:Use(activator, caller)
		if IsValid(caller) and caller:IsPlayer() and caller:Health() <= 180 then
			caller:SetHealth(math.min(caller:Health() + 20, caller:GetMaxHealth() * 2))
			for i = 1, 20 do
				timer.Simple(i, function()
					if not IsValid(caller) then return end
					caller:SetHealth(math.max(caller:Health() - 1, 1))
				end)
			end
			SafeRemoveEntity(self)
		end
	end
end
