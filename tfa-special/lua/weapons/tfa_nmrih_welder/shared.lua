SWEP.Base = "tfa_nmrimelee_base"
SWEP.Category = "TFA NMRIH"
SWEP.Spawnable = true
SWEP.AdminSpawnable = true

SWEP.PrintName = "Welder"

SWEP.ViewModel			= "models/weapons/tfa_nmrih/v_tool_welder.mdl" --Viewmodel path
SWEP.ViewModelFOV = 50

SWEP.WorldModel			= "models/weapons/tfa_nmrih/w_tool_welder.mdl" --Viewmodel path
SWEP.HoldType = "pistol"
SWEP.DefaultHoldType = "pistol"
SWEP.Offset = { --Procedural world model animation, defaulted for CS:S purposes.
        Pos = {
        Up = -5,
        Right = 2,
        Forward = 3.5,
        },
        Ang = {
        Up = -1,
        Right = 5,
        Forward = 178
        },
		Scale = 1.0
}

SWEP.Primary.Sound = Sound("Weapon_Melee.WelderLight")
SWEP.Secondary.Sound = Sound("Weapon_Melee.WelderHeavy")

SWEP.MoveSpeed = 0.935
SWEP.IronSightsMoveSpeed  = SWEP.MoveSpeed

SWEP.InspectPos = Vector(5.5, 1.424, -3.131)
SWEP.InspectAng = Vector(17.086, 3.938, 14.836)

SWEP.Primary.Blunt = true
SWEP.Primary.Damage = 35
SWEP.Primary.Reach = 80
SWEP.Primary.RPM = 60
SWEP.Primary.SoundDelay = 0.15
SWEP.Primary.Delay = 0.25
SWEP.Primary.Window = 0.3

SWEP.Secondary.Blunt = true
SWEP.Secondary.RPM = 60 -- Delay = 60/RPM, this is only AFTER you release your heavy attack
SWEP.Secondary.Damage = 60
SWEP.Secondary.Reach = 60	
SWEP.Secondary.SoundDelay = 0.1
SWEP.Secondary.Delay = 0.25

SWEP.Secondary.BashDamage = 25
SWEP.Secondary.BashDelay = 0.15
SWEP.Secondary.BashLength = 50

SWEP.ViewModelBoneMods = {
	["ValveBiped.Bip01_R_Finger1"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0.254, 0.09), angle = Angle(15.968, -11.193, 1.437) },
	["ValveBiped.Bip01_R_Finger0"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(3.552, 4.526, 0) },
	["Thumb04"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(6, 0, 0) },
	["Maglite"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, -30), angle = Angle(0, 0, 0) }
}

SWEP.AnimSequences = {
	attack_quick = "Attack_Quick",
	charge_begin = "Attack_Charge_Begin",
	charge_loop = "Attack_Charge_Idle",
	charge_end = "Attack_Charge_End",
	turn_on = "idleseqfast",
	turn_off = "idleseqfast",
	idle_on = "fuckyou",
	attack_enter = "idleseqfast",
	attack_loop = "Weld",
	attack_exit = "idleseqfast"
}

SWEP.VMPos = Vector(0,0,1)
SWEP.VMAng = Vector(3,0,0)

SWEP.Primary.Ammo = "propane"
SWEP.Primary.ClipSize = 100
SWEP.Primary.DefaultClip = 400
SWEP.Primary.Motorized_ToggleBuffer = 0.1 --Blend time to idle when toggling
SWEP.Primary.Motorized_ToggleTime = 0.5 --Time until we turn on/off, independent of the above
SWEP.Primary.Motorized_IdleSound = Sound("") --Idle sound, when on
SWEP.Primary.Motorized_SawSound = Sound("") --Rev sound, when on
SWEP.Primary.Motorized_AmmoConsumption_Idle = 0 --Ammo units to consume while idle
SWEP.Primary.Motorized_AmmoConsumption_Saw = 100/10 --Ammo units to consume while sawing
SWEP.Primary.Motorized_RPM = 120
SWEP.Primary.Motorized_Damage = 20 --DPS
SWEP.Primary.Motorized_Reach = 50 --DPS

SWEP.IgniteRadius = 4

SWEP.Callback = {}
SWEP.Callback.Initialize = function(self)
	self.AttackStart = -1
	self.ChargeTransition = false
	self.LastAttackType = -1
	self:SetNWBool("On",false)
	self:SetNWInt("ChargeStatus",2)
	self:SetNWFloat("Clip",math.Clamp(self.Primary.DefaultClip,0,self.Primary.ClipSize))
end
SWEP.Callback.Deploy = function(self)
	self.AttackStart = -1
	self.ChargeTransition = false
	self.LastAttackType = -1
	self:SetNWBool("On",true)
	self:SetNWInt("ChargeStatus",2)
	if self:GetNWBool("On",false) then
		self:EmitSound(self.Primary.Motorized_IdleSound)	
	end
	local am = self.Owner:GetAmmoCount(self:GetPrimaryAmmoType())
	if !(am<=0 or self:GetNWFloat("Clip",0)>=self.Primary.ClipSize) then
		local ammototake = math.max(math.min(am,self.Primary.ClipSize-self:GetNWFloat("Clip",0)),0)
		self:SetNWFloat("Clip",self:GetNWFloat("Clip",0)+ammototake)
		self.Owner:SetAmmo(am-ammototake,self:GetPrimaryAmmoType())
		self:UpdateClip1()
		if IsValid(self.Owner) and self.Owner:KeyDown(IN_ATTACK) then
			self:EmitSound(self.Primary.Motorized_SawSound)
			self:StopSound(self.Primary.Motorized_IdleSound)	
		end
	end
end
SWEP.Callback.Holster = function(self)
	self:StopSound(self.Primary.Motorized_SawSound)	
	self:StopSound(self.Primary.Motorized_IdleSound)
end
SWEP.Callback.OnDrop = function(self)
	self:StopSound(self.Primary.Motorized_SawSound)	
	self:StopSound(self.Primary.Motorized_IdleSound)
end
SWEP.Callback.OnRemove = function(self)
	self:StopSound(self.Primary.Motorized_SawSound)	
	self:StopSound(self.Primary.Motorized_IdleSound)
end
SWEP.Callback.Think = function(self) 
	
	if self:GetNWBool("On",false) then
		if self:GetNWInt("ChargeStatus",0) == 2 and !self:GetHolstering() and !self:GetDrawing() then
			if !self.lastspray then self.lastspray = -1 end
			if CurTime()>self.lastspray then
				self.lastspray = CurTime()+0.1
			else
				return
			end
			self:EmitSound("ambient/energy/spark1.wav", 60)
			if SERVER then
				local tr = util.QuickTrace(self.Owner:GetShootPos(),self.Owner:EyeAngles():Forward()*self.Primary.Motorized_Reach,self.Owner)
				
				if tr.Hit and tr.Fraction<1 then
					local fx = EffectData()
					fx:SetMagnitude(1)
					fx:SetScale(1)
					fx:SetRadius(2)
					fx:SetOrigin(tr.HitPos)
					fx:SetNormal(tr.HitNormal)
					util.Effect("Sparks",fx)
				end
				
				if tr.HitWorld and !tr.HitSky and tr.Fraction<1 then
					--[[
					local ent = ents.Create( "env_firesource" )
					ent:SetPos( tr.HitPos + tr.HitNormal )
					
					ent:SetKeyValue( "fireradius", 16 )
					ent:SetKeyValue( "firedamage", 100 )
					ent:SetKeyValue( "spawnflags", 1 )
					
					ent:Spawn( )
					ent:Fire( "Enable", "", 0 )
					
					timer.Simple(0.2,function()
						if IsValid(ent) then ent:Remove() end
					end)
					]]--
					
					--[[
					local ent = ents.Create("env_fire")
					local pos = tr.HitPos + tr.HitNormal
					ent:SetPos(pos)
					ent:SetKeyValue( "health", "0.1" )
					ent:SetKeyValue( "firesize", "1" )
					ent:SetKeyValue( "fireattack", "0" )
					ent:SetKeyValue( "damagescale", "0.1" )
					ent:SetKeyValue( "StartDisabled", "0" )
					ent:SetKeyValue( "firetype", "0" )
					ent:SetKeyValue( "spawnflags", "132" )
					ent:SetKeyValue( "spawnflags", "132" )
					ent:Spawn()
					ent:Fire( "StartFire", "", 0 )
					timer.Simple(0.1,function()
						if IsValid(ent) then ent:Remove() end
					end)
					]]--
				end
				
				local enttbl = ents.FindInSphere(tr.HitPos,self.IgniteRadius)
				for k,v in pairs(enttbl) do
					if v.Ignite and v.IsOnFire and v!=self.Owner and !v:IsWeapon() and !string.find(v:GetClass(),"view") then v:Ignite(3,1) end
				end
				for k,v in pairs(enttbl) do
					if v:GetClass()=="env_fire" then
						v:Fire( "Enable", "", 0 )
						v:Fire( "StartFire", "", 0 )
					end
				end
			end
		end
	end
end

function SWEP:MotorSlash()
	
	local delta = 60/self.Primary.Motorized_RPM
	
	self:SetNextSecondaryFire(CurTime()+delta)
	
	self.Owner.tmpdmgtype = self.Primary.Blunt and DMG_CLUB or DMG_SLASH
	local pain = self.Primary.Motorized_Damage * delta
	if game.GetTimeScale()>0.99 then
		self.Owner:FireBullets({
			Attacker = self.Owner,
			Inflictor = self,
			Damage = pain,
			Force = pain*0.3,
			Distance = self.Primary.Motorized_Reach,
			HullSize = 1,
			Tracer = 0,
			Src = self.Owner:GetShootPos(),
			Dir = self.Owner:EyeAngles():Forward(),
			Callback = function(a,b,c)
				--if b and IsValid(self) then
				--	self:HitSound(b.MatType,false,b.Entity:IsNPC() or b.Entity:IsPlayer())
					--self:ApplyForce(b.Entity,self.Primary.Damage,b.HitPos,b.PhysicsBone)
				--end
				if c then c:SetDamageType(bit.bor(DMG_BURN,DMG_NEVERGIB)) end
			end
		})
	else
		self.Owner:LagCompensation(true)
		local pos = self.Owner:GetShootPos()
		local slash = {}
		slash.start = pos
		slash.endpos = pos + (self.Owner:EyeAngles():Forward() * self.Primary.Motorized_Reach)
		slash.filter = self.Owner
		slash.mins = Vector(-10, -5, 0)
		slash.maxs = Vector(10, 5, 5)
		local slashtrace = util.TraceHull(slash)
		if slashtrace.Hit then
			--if !slashtrace.HitSky then self:HitSound(slashtrace.MatType,false,slashtrace.Entity:IsNPC() or slashtrace.Entity:IsPlayer()) end
			local dmg = DamageInfo()
			dmg:SetAttacker(self.Owner)
			dmg:SetInflictor(self)
			dmg:SetDamagePosition(self.Owner:GetShootPos())
			dmg:SetDamageForce(self.Owner:GetAimVector()*(pain*0.25))
			dmg:SetDamage(pain)
			dmg:SetDamageType(bit.bor(DMG_BURN,DMG_NEVERGIB))
			slashtrace.Entity:TakeDamageInfo(dmg)
			self:ApplyForce(slashtrace.Entity,pain,slashtrace.HitPos,slashtrace.PhysicsBone)
		end
		self.Owner:LagCompensation(false)
	end
end

function SWEP:Reload()
	local am = self.Owner:GetAmmoCount(self:GetPrimaryAmmoType())
	if (am<=0 or self:GetNWFloat("Clip",0)>=self.Primary.ClipSize) then return end
	if SERVER or (CLIENT and IsFirstTimePredicted()) then
		self:Holster(self.Owner)
	end
end


function SWEP:Cough()
	if !self:OwnerIsValid() then return end
	local vm = self.Owner:GetViewModel()
	
	self:StopSound(self.Primary.Motorized_SawSound)	
	self:StopSound(self.Primary.Motorized_IdleSound)
	
	self:SetNWBool("On",false)
	self:SetNWInt("ChargeStatus",0)
	self.ChargeTransition = false
end