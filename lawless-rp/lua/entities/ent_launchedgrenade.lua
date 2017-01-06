AddCSLuaFile()

ENT.Type 		= "anim"
ENT.Base 		= "base_gmodentity"

ENT.PrintName	= "Grenade"
ENT.Author		= "Sir Francis Billard"

ENT.Spawnable = false

if SERVER then
	function ENT:Initialize()
		self.model = "models/Items/AR2_Grenade.mdl"
		self.Entity:SetModel(self.model) 
		
		self.Entity:PhysicsInit(SOLID_VPHYSICS)
		self.Entity:SetMoveType(MOVETYPE_VPHYSICS)
		self.Entity:SetSolid(SOLID_VPHYSICS)

		local phys = self.Entity:GetPhysicsObject()

		if phys:IsValid() then
			phys:Wake()
			phys:AddAngleVelocity(Vector(15,0,0))
		end
	end

	function ENT:PhysicsCollide( data, physobj )
		if not self:IsValid() then return end
		local effectdata = EffectData()
			effectdata:SetStart(self:GetPos() + Vector(0,0,100))
			effectdata:SetOrigin(self:GetPos())
			effectdata:SetScale(0.8)
			effectdata:SetRadius(128)
		util.Effect("HelicopterMegaBomb", effectdata)

		self:EmitSound("phx/explode0" .. math.random(0, 6) .. ".wav",100,100)

		util.BlastDamage(self,self:GetNWEntity("owner",self),self:GetPos(),128,150)

		for k, v in pairs(ents.FindInSphere(self.Entity:GetPos(),128)) do
			if v:GetClass() == "prop_physics" then
				local phys = v:GetPhysicsObject()
				if math.random(1, 3) == 1 then
					constraint.RemoveAll(v)
					phys:EnableMotion(true)
				end
				phys:Wake()
			end
		end

		self:Remove()
	end
end
