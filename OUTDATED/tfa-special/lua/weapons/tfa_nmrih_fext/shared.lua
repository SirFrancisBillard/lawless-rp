SWEP.Base = "tfa_nmrimelee_base"
SWEP.Category = "TFA NMRIH"
SWEP.Spawnable = true
SWEP.AdminSpawnable = true

SWEP.PrintName = "Fire Extinguisher"

SWEP.ViewModel			= "models/weapons/tfa_nmrih/v_tool_extinguisher.mdl" --Viewmodel path
SWEP.ViewModelFOV = 50

SWEP.WorldModel			= "models/weapons/tfa_nmrih/w_tool_extinguisher.mdl" --Viewmodel path
SWEP.HoldType = "ar2"
SWEP.DefaultHoldType = "ar2"
SWEP.Offset = { --Procedural world model animation, defaulted for CS:S purposes.
        Pos = {
        Up = 8,
        Right = 1.25,
        Forward = 9,
        },
        Ang = {
        Up = -1,
        Right = -15,
        Forward = 178
        },
		Scale = 1.0
}

SWEP.Primary.Sound = Sound("Weapon_Melee.PipeLeadLight")
SWEP.Secondary.Sound = Sound("Weapon_Melee.PipeLeadHeavy")

SWEP.MoveSpeed = 0.935
SWEP.IronSightsMoveSpeed  = SWEP.MoveSpeed

SWEP.InspectPos = Vector(5.5, 1.424, -3.131)
SWEP.InspectAng = Vector(17.086, 3.938, 14.836)

SWEP.Primary.Blunt = true
SWEP.Primary.Damage = 55
SWEP.Primary.Reach = 80
SWEP.Primary.RPM = 60
SWEP.Primary.SoundDelay = 0.2
SWEP.Primary.Delay = 0.25
SWEP.Primary.Window = 0.3

SWEP.Secondary.Blunt = true
SWEP.Secondary.RPM = 60 -- Delay = 60/RPM, this is only AFTER you release your heavy attack
SWEP.Secondary.Damage = 85
SWEP.Secondary.Reach = 60	
SWEP.Secondary.SoundDelay = 0.1
SWEP.Secondary.Delay = 0.15

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
	turn_on = "HoseEquip",
	turn_off = "HoseUnequip",
	idle_on = "HoseIdle",
	attack_enter = "HoseSprayFakeTransition",
	attack_loop = "HoseSpray",
	attack_exit = "HoseSprayFakeTransition"
}

SWEP.Primary.Ammo = "co2"
SWEP.Primary.ClipSize = 100
SWEP.Primary.DefaultClip = 400
SWEP.Primary.Motorized_ToggleBuffer = 0.1 --Blend time to idle when toggling
SWEP.Primary.Motorized_ToggleTime = 0.5 --Time until we turn on/off, independent of the above
SWEP.Primary.Motorized_IdleSound = Sound("") --Idle sound, when on
SWEP.Primary.Motorized_SawSound = Sound("Weapon_Extinguisher.Extinguish") --Rev sound, when on
SWEP.Primary.Motorized_AmmoConsumption_Idle = 0 --Ammo units to consume while idle
SWEP.Primary.Motorized_AmmoConsumption_Saw = 100/10 --Ammo units to consume while sawing
SWEP.Primary.Motorized_RPM = 120
SWEP.Primary.Motorized_Damage = 10 --DPS
SWEP.Primary.Motorized_Reach = 200 --DPS

SWEP.ExtinguishRadius = 32

SWEP.Callback = {}
SWEP.Callback.Initialize = function(self)
	self.AttackStart = -1
	self.ChargeTransition = false
	self.LastAttackType = -1
	self:SetNWBool("On",false)
	self:SetNWInt("ChargeStatus",0)
	self:SetNWFloat("Clip",math.Clamp(self.Primary.DefaultClip,0,self.Primary.ClipSize))
end
SWEP.Callback.Deploy = function(self)
	self.AttackStart = -1
	self.ChargeTransition = false
	self.LastAttackType = -1
	self:SetNWBool("On",false)
	self:SetNWInt("ChargeStatus",0)
	if self:GetNWBool("On",false) then
		self:EmitSound(self.Primary.Motorized_IdleSound)	
	end
	self:UpdateClip1()
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
	if !self.svfxvar then
		self.svfxvar = GetConVar("sv_tfa_nmrih_fx_fext_override")
	end
	
	if self:GetNWBool("On",false) then
		if self:GetNWInt("ChargeStatus",0) == 2 then
			if !self.lastspray then self.lastspray = -1 end
			if CurTime()>self.lastspray then
				local dofx = true
				local clientvar = SERVER and self.Owner:GetInfoNum("cl_tfa_nmrih_fx_fext",1) or GetConVarNumber("cl_tfa_nmrih_fx_fext",1)
				local servervar = self.svfxvar and self.svfxvar:GetInt() or -1
				if servervar>=-0.01 then
					if math.Round(servervar)==0 then
						dofx = false
					end
				else
					if math.Round(clientvar)==0 then
						dofx = false
					end				
				end
				if dofx then
					local fx = EffectData()
					fx:SetEntity(self.Owner)
					fx:SetAttachment(1)
					fx:SetMagnitude(2)
					fx:SetScale(3)
					util.Effect("nmrih_fext_fx",fx)
				end
				self.lastspray = CurTime()+0.1
			end
			if SERVER then
				local tr = util.QuickTrace(self.Owner:GetShootPos(),self.Owner:EyeAngles():Forward()*self.Primary.Motorized_Reach,self.Owner)
				local enttbl = ents.FindInSphere(tr.HitPos,self.ExtinguishRadius)
				for k,v in pairs(enttbl) do
					if v.Extinguish and v.IsOnFire and v:IsOnFire() then v:Extinguish() end
					if v:GetClass()=="env_fire" then v:Remove() end
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
			HullSize = 10,
			Tracer = 0,
			Src = self.Owner:GetShootPos(),
			Dir = self.Owner:EyeAngles():Forward(),
			Callback = function(a,b,c)
				--if b and IsValid(self) then
				--	self:HitSound(b.MatType,false,b.Entity:IsNPC() or b.Entity:IsPlayer())
					--self:ApplyForce(b.Entity,self.Primary.Damage,b.HitPos,b.PhysicsBone)
				--end
				if c then c:SetDamageType(bit.bor(DMG_PLASMA,DMG_NEVERGIB)) end
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
			dmg:SetDamageType(bit.bor(DMG_PLASMA,DMG_NEVERGIB))
			slashtrace.Entity:TakeDamageInfo(dmg)
			self:ApplyForce(slashtrace.Entity,pain,slashtrace.HitPos,slashtrace.PhysicsBone)
		end
		self.Owner:LagCompensation(false)
	end
end