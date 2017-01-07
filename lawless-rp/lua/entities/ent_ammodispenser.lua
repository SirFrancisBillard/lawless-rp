AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Ammo Dispenser"
ENT.Author = "Sir Francis Billard"
ENT.Category = "Lawless RP"
ENT.Spawnable = true

function ENT:SetupDataTables()
	self:NetworkVar("Int", 0, "price")
	self:NetworkVar("Int", 1, "Charges")
	self:NetworkVar("Entity", 0, "owning_ent")
end

if SERVER then
	function ENT:Generate()
		timer.Simple(10, function()
			if not IsValid(self) then return end
			self:SetCharges(math.Clamp(self:GetCharges() + 1, 0, 100))
			self:Generate()
		end)
	end

	function ENT:Initialize()
		self:SetModel("models/props_lab/reciever_cart.mdl")
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:SetSolid(SOLID_VPHYSICS)
		local phys = self:GetPhysicsObject()
		if phys:IsValid() then
			phys:Wake()
			phys:SetMass(40)
		end

		self:SetCharges(0)6
		self:Generate()
	end

	function ENT:Use(activator, caller)
		if IsValid(caller) and caller:IsPlayer() and self:GetCharges() > 0 then
			for k,v in pairs(activator:GetWeapons()) do
				if v:GetClass() ~= "weapon_ex_ammo" then
					if v:GetPrimaryAmmoType() then
						if v:GetMaxClip1() and v:GetMaxClip1() >= 1 then
							activator:GiveAmmo(v:GetMaxClip1(), v:GetPrimaryAmmoType(), false)
						else
							activator:GiveAmmo(1, v:GetPrimaryAmmoType(), false)
						end
					end
				end
			end

			self:SetCharges(math.Clamp(self:GetCharges() - 1, 0, 100))
			self:EmitSound("items/gift_pickup.wav")
		end
	end
end

if CLIENT then
	function ENT:Draw()
		self:DrawModel()
	end
end
