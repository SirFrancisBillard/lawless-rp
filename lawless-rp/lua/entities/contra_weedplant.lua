AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Weed Pot"
ENT.Author = "Sir Francis Billard"
ENT.Category = "Lawless RP"
ENT.Spawnable = true

function ENT:SetupDataTables()
	self:NetworkVar("Int", 0, "price")
	self:NetworkVar("Entity", 0, "owning_ent")
	self:NetworkVar("Bool", 0, "Seeded")
	self:NetworkVar("Bool", 1, "Grown")
end

if SERVER then
	function ENT:Initialize()
		self:SetModel("models/props_junk/terracotta01.mdl")
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:SetSolid(SOLID_VPHYSICS)
		local phys = self:GetPhysicsObject()
		phys:Wake()

		self:SetGrown(false)
		self:SetSeeded(false)
	end

	function ENT:Grow()
		self:SetModel("models/props/cs_office/plant01.mdl")
		self:SetGrown(true)
	end

	function ENT:Harvest(ply)
		self:SetModel("models/props_junk/terracotta01.mdl")
		self:SetGrown(false)
		self:SetSeeded(false)
		local amt = math.random(1200, 3000)
		ply:addMoney(amt)
		ply:ChatPrint("You have harvested $" .. string.Comma(amt) .. " worth of weed.")
	end

	function ENT:StartTouch(ent)
		if IsValid(ent) and ent.IsWeedSeed and not self:GetSeeded() then
			self:SetSeeded(true)
			SafeRemoveEntity(ent)
			timer.Simple(math.random(100, 350), function()
				if not IsValid(self) then return end
				self:Grow()
			end)
		end
	end

	function ENT:Use(activator, caller)
		if IsValid(caller) and caller:IsPlayer() and self:GetGrown() then
			self:Harvest(caller)
		end
	end
end

if CLIENT then
	function ENT:Draw()
		self:DrawModel()
	end
end
