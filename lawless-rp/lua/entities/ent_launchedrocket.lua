AddCSLuaFile()

ENT.Type 		= "anim"
ENT.Base 		= "base_gmodentity"

ENT.PrintName	= "Rocket"
ENT.Author		= "Sir Francis Billard"

ENT.Spawnable = false

if SERVER then
	function ENT:Initialize()
		util.SpriteTrail(self, 0, Color(150, 150, 150), false, 8, 0, 1, 0.07, "trails/smoke.vmt")

		self.model = "models/Weapons/W_missile_closed.mdl"
		self.Entity:SetModel(self.model) 
		
		self.Entity:PhysicsInit(SOLID_VPHYSICS)
		self.Entity:SetMoveType(MOVETYPE_VPHYSICS)
		self.Entity:SetSolid(SOLID_VPHYSICS)

		local phys = self.Entity:GetPhysicsObject()

		if phys:IsValid() then
			phys:Wake()
			phys:AddAngleVelocity(Vector(15,0,0))
		end

		self.Noise = CreateSound(self, Sound("weapons/rpg/rocket1.wav"))
		self.Noise:SetSoundLevel(300)
		self.Noise:PlayEx(1, 100)
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
				constraint.RemoveAll(v)
				phys:EnableMotion(true)
				phys:Wake()
			end
		end

		self:Remove()
	end

	function ENT:Think()
		self:SetAngles(self:GetVelocity():Angle()) 
		local phys = self:GetPhysicsObject()
		if phys:IsValid() then
			phys:AddAngleVelocity(Vector(1500,0,0))
		end
	end
	
	function ENT:PhysicsUpdate(phys)
		local angles = phys:GetAngles()
		local velocity = phys:GetVelocity()
		phys:SetAngles(velocity:Angle())
		phys:SetVelocity(velocity * 2)
	end

	function ENT:OnRemove()
		if self.Noise then
			self.Noise:Stop()
		end
	end
end
