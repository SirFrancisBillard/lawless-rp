ENT.Type 			= "anim"      
ENT.PrintName			= "Flare"  
ENT.Author			= "Generic Default"  
ENT.Contact			= ""  
ENT.Purpose			= ""  
ENT.Instructions			= ""  
 
ENT.Spawnable			= false
ENT.AdminOnly = false 
ENT.DoNotDuplicate = true 
ENT.DisableDuplicator = true

if SERVER then
	
	local col  = Color(255,0,0,255)
	
	AddCSLuaFile( "shared.lua" )

	function ENT:Initialize()  
		self.CanTool = false
		self.timeleft = CurTime() + 1.5
		self.Owner = self.Owner or self:GetOwner()
		if IsValid(self.Owner) then self:SetOwner(self.Owner) end
		self:SetModel( "models/maxofs2d/light_tubular.mdl" )
		
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:SetSolid(SOLID_VPHYSICS)
		
		self:SetModelScale(0.1,0)
		self:SetColor(col)
		
		self:EmitSound("Flare.Screech")
		
		util.SpriteTrail( self, 0, col, false, 3, 1.5, 0.5, 4, "cable/smoke.vmt" )
	end   

	 function ENT:Think()
		--[[
		if not IsValid(self) then return end
		
		if !self.filtertbl then self.filtertbl = {} end
		self.filtertbl[1]	= self.Owner
		self.filtertbl[2]	= self

		local trace = {}
		trace.start = self:GetPos()
		trace.endpos = self:GetPos() + self.flightvector
		trace.filter = self.filtertbl
		local tr = util.TraceLine( trace )
		
		if tr.HitSky then
			self:Remove()
			return true
		end
		
		if tr.Hit and tr.Fraction>0 and tr.Fraction<0 then
			util.Decal("Scorch", tr.HitPos + tr.HitNormal, tr.HitPos - tr.HitNormal)
		end
			
		if self.InFlight then
			self:SetPos(self:GetPos() + self.flightvector)
			self.flightvector = self.flightvector - (self.flightvector/350)  + Vector(math.Rand(-0.2,0.2), math.Rand(-0.2,0.2),math.Rand(-0.1,0.1)) + Vector(0,0,-0.111)
			self:SetAngles(self.flightvector:Angle() + Angle(90,0,0))
		end
		
		]]--
		
		if CurTime() > self.timeleft then
			self:Explosion()
		end
		
		local effectdata = EffectData()
		effectdata:SetOrigin(self:GetPos())			// Where is hits
		effectdata:SetScale(3)
		effectdata:SetMagnitude(1)
		util.Effect( "flare_sparktrail", effectdata )
		
		self:NextThink( CurTime() )
		return true
	end
	
	function ENT:PhysicsCollide( colData, collider )
		self:Explosion()
	end
	 
	function ENT:Explosion()

		if not IsValid(self.Owner) then
			self:Remove()
			return
		end

		util.BlastDamage(self.Entity, self.Owner, self.Entity:GetPos(), 192, 25)
		
		local entstbl = ents.FindInSphere(self:GetPos(),192)
		
		local tr = {}
		tr.start = self:GetPos()
		tr.mask = MASK_VISIBLE
		
		for k,v in pairs(entstbl) do
				if IsValid(v) and v.Ignite then
				tr.endpos = v.GetShootPos and v:GetShootPos() or v:GetPos()
				tr.filter = { self, v, (v.GetActiveWeapon and v:GetActiveWeapon() or v) }
				local traceres = util.TraceLine(tr)
				if !traceres.Hit or traceres.Fraction>=1 or traceres.Fraction<=0 then
					if !v:IsOnFire() and v:IsPlayer() or v:IsNPC() or v:GetClass()=="prop_physics" or v:IsRagdoll() then
						v:Ignite(15*v:GetPos():Distance(self:GetPos())/384,1)
					end
				end
			end
		end
		
		self:EmitSound("Flare.Touch")
		
		local effectdata = EffectData()
		effectdata:SetOrigin(self:GetPos())			// Where is hits
		effectdata:SetScale(10)
		effectdata:SetMagnitude(50)
		util.Effect( "flare_sparktrail", effectdata )
		util.ScreenShake(self:GetPos(), 1, 5, 1, 16*30 )
		self:Remove()

	end

end

if CLIENT then    
	function ENT:Draw()            
		self:DrawModel()
	end
end