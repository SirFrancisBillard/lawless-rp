AddCSLuaFile()

ENT.Type 				= "anim"
ENT.Base 				= "base_entity"
ENT.PrintName 			= "Ammo Crate"
ENT.Author 				= ""
ENT.Information 		= ""

ENT.Spawnable 			= true
ENT.AdminOnly			= false
ENT.Category			= "Lawless Ammunition"

if SERVER then
	function ENT:Initialize()
		self:SetModel("models/props_junk/cardboard_box001a.mdl")
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:SetSolid(SOLID_VPHYSICS)
		self:SetUseType(SIMPLE_USE)

		local phys = self:GetPhysicsObject()
		if phys:IsValid() then
			phys:Wake()
		end
	end
end

function ENT:Use(activator,caller,useType,value)
	if activator:IsPlayer() then
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

		self:EmitSound("items/gift_pickup.wav")
		SafeRemoveEntity(self)
	end
end

if CLIENT then
	function ENT:Draw()
		self:DrawModel()
	end
end
