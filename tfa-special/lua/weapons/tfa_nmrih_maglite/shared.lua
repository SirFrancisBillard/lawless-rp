SWEP.Base = "tfa_nmrimelee_base"
SWEP.Category = "TFA NMRIH"
SWEP.Spawnable = true
SWEP.AdminSpawnable = true

SWEP.PrintName = "Maglite"

SWEP.ViewModel			= "models/weapons/tfa_nmrih/v_item_maglite.mdl" --Viewmodel path
SWEP.ViewModelFOV = 50

SWEP.WorldModel			= "models/weapons/tfa_nmrih/w_item_maglite.mdl" --Viewmodel path
SWEP.HoldType = "knife"
SWEP.DefaultHoldType = "knife"
SWEP.Offset = { --Procedural world model animation, defaulted for CS:S purposes.
        Pos = {
        Up = -0.5,
        Right = 2,
        Forward = 5.5,
        },
        Ang = {
        Up = -1,
        Right = 5,
        Forward = 178
        },
		Scale = 1.2
}

SWEP.Primary.Sound = Sound("Weapon_Melee.CrowbarLight")
SWEP.Secondary.Sound = Sound("Weapon_Melee.CrowbarHeavy")

SWEP.MoveSpeed = 1.0
SWEP.IronSightsMoveSpeed  = SWEP.MoveSpeed

SWEP.InspectPos = Vector(-3.418, -6.433, 8.241)
SWEP.InspectAng = Vector(-9.146, 9.145, 17.709)

SWEP.Primary.Blunt = true
SWEP.Primary.Damage = 25
SWEP.Primary.Reach = 40
SWEP.Primary.RPM = 90
SWEP.Primary.SoundDelay = 0
SWEP.Primary.Delay = 0.3
SWEP.Primary.Window = 0.2

SWEP.Secondary.Blunt = true
SWEP.Secondary.RPM = 60 -- Delay = 60/RPM, this is only AFTER you release your heavy attack
SWEP.Secondary.Damage = 60
SWEP.Secondary.Reach = 40	
SWEP.Secondary.SoundDelay = 0.0
SWEP.Secondary.Delay = 0.2

SWEP.Secondary.BashDamage = 50
SWEP.Secondary.BashDelay = 0.35
SWEP.Secondary.BashLength = 40

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
	if GetConVarNumber("sv_tfa_nmrih_flashlight_required",0)!=1 then
		self.IsOn = IsValid(self.Owner) and self.Owner:FlashlightIsOn() or false
	end
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
	if SERVER and IsValid(self.Owner) then
		if self.AttackStart!=-1 or CurTime()<=self:GetNextSecondaryFire() or self:GetBashing() then
			if self.Owner:FlashlightIsOn() then
				self.Owner:Flashlight(false)
			end
		else
			if !self.Owner:FlashlightIsOn() and self.IsOn then
				self.Owner:Flashlight(true)		
			elseif !self.IsOn and self.Owner:FlashlightIsOn() then
				self.Owner:Flashlight(false)		
			end
		end
	end
end


function SWEP:SecondaryAttack()
	if SERVER or (CLIENT and IsFirstTimePredicted()) then
		--self.Owner:ConCommand("impulse 100")
		self.IsOn = !self.IsOn
	end
end