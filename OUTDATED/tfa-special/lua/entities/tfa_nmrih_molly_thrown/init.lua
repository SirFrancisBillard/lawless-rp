AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
include('shared.lua')

function ENT:Initialize()
	
	self.Entity:SetModel("models/weapons/tfa_nmrih/w_exp_molotov.mdl")
	
	self:PhysicsInit(SOLID_VPHYSICS)
	--self.Entity:PhysicsInitSphere( ( self:OBBMaxs() - self:OBBMins() ):Length()/4, "metal" )
	self.Entity:SetMoveType( MOVETYPE_VPHYSICS )
	self.Entity:SetSolid( SOLID_VPHYSICS )
	self.Entity:DrawShadow( false )
	self.Entity:SetCollisionGroup( COLLISION_GROUP_WEAPON )
	
	local phys = self.Entity:GetPhysicsObject()
	if (phys:IsValid()) then
		phys:Wake()
		phys:SetMass(6.5)
		phys:SetDamping(0.1,5)
	end
	
	self:SetFriction(3)
	
	self:Think()
end

/*---------------------------------------------------------
PhysicsCollide
---------------------------------------------------------*/

function ENT:PhysicsCollide(data,phys)
	if data.HitNormal:Dot(Vector(0,0,-1))<0.3 then
		self.Entity:EmitSound(Sound("HEGrenade.Bounce"))
	
		local impulse = (data.OurOldVelocity - 2 * data.OurOldVelocity:Dot(data.HitNormal) * data.HitNormal)*0.25
		phys:ApplyForceCenter(impulse)
	else
		self:Explosion()
	end	
end

function ENT:Think()
	self.Entity:NextThink( CurTime() )
	return true
end

function ENT:Explosion()
	
	local radv = 72
		
	local entstbl = ents.FindInSphere(self:GetPos(),radv)
		
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
					v:Ignite(15*v:GetPos():Distance(self:GetPos())/radv,1)
				end
			end
		end
	end

	if not IsValid(self.Owner) then
		self.Entity:Remove()
		return
	end
	
	local shake = ents.Create("env_shake")
		shake:SetOwner(self.Owner)
		shake:SetPos(self.Entity:GetPos())
		shake:SetKeyValue("amplitude", "1")	// Power of the shake
		shake:SetKeyValue("radius", tostring(radv))		// Radius of the shake
		shake:SetKeyValue("duration", "0.5")	// Time of shake
		shake:SetKeyValue("frequency", "255")	// How har should the screenshake be
		shake:SetKeyValue("spawnflags", "4")	// Spawnflags(In Air)
		shake:Spawn()
		shake:Activate()
		shake:Fire("StartShake", "", 0)

	self.Entity:EmitSound("weapons/firearms/exp_molotov/molotov_explode_01.wav", self.Pos or self:GetPos(), 100, 100 )
	self.Entity:EmitSound("weapons/firearms/exp_molotov/molotov_fire_loop_02.wav", self.Pos or self:GetPos(), 100, 100 )
	
	local tr = {}
	tr.start = self:GetPos()
	tr.filter = self
	local i=1
	while i<=64 do
		local offset = VectorRand()*Vector(radv,radv,0)
		tr.endpos = self:GetPos() + offset
		local traceres = util.TraceLine(tr)
			local ent = ents.Create("env_fire")
			local pos = self:GetPos() + traceres.Normal*math.Clamp(traceres.Fraction,0,1)*offset:Length()
			ent:SetPos(pos)
			ent:SetKeyValue( "health", math.Rand(8,9) )
			ent:SetKeyValue( "firesize", "32" )
			ent:SetKeyValue( "fireattack", "0" )
			ent:SetKeyValue( "damagescale", "2.5" )
			ent:SetKeyValue( "StartDisabled", "0" )
			ent:SetKeyValue( "firetype", "0" )
			ent:SetKeyValue( "spawnflags", "132" )
			ent:Spawn()
			ent:Fire( "StartFire", "", 0 )
			i=i+1
	end
	
	self.Entity:Remove()
end

/*---------------------------------------------------------
OnTakeDamage
---------------------------------------------------------*/
function ENT:OnTakeDamage( dmginfo )
end


/*---------------------------------------------------------
Use
---------------------------------------------------------*/
function ENT:Use( activator, caller, typev, value )
end


/*---------------------------------------------------------
StartTouch
---------------------------------------------------------*/
function ENT:StartTouch( entity )
end


/*---------------------------------------------------------
EndTouch
---------------------------------------------------------*/
function ENT:EndTouch( entity )
end


/*---------------------------------------------------------
Touch
---------------------------------------------------------*/
function ENT:Touch( entity )
end