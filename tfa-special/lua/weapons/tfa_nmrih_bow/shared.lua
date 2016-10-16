SWEP.Base = "tfa_nmrih_base"
SWEP.Category = "TFA NMRIH"
SWEP.Spawnable = true
SWEP.AdminSpawnable = true

SWEP.Slot = 0

SWEP.Type = "Compound Bow"
SWEP.PrintName = "Deerhunter Compound Bow"

SWEP.ViewModel			= "models/weapons/tfa_nmrih/v_bow_deerhunter.mdl" --Viewmodel path
SWEP.ViewModelFOV = 50

SWEP.WorldModel			= "models/weapons/tfa_nmrih/w_bow_deerhunter.mdl" --Viewmodel path
SWEP.HoldType = "smg"
SWEP.ThirdPersonReloadDisable = true

SWEP.ProjectileEntity = "tfbow_arrow" --Entity to shoot
SWEP.ProjectileVelocity = 5000 --Entity to shoot's velocity
SWEP.ProjectileModel = "models/weapons/tfa_nmrih/w_bow_deerhunter_arrow.mdl" --Entity to shoot's model

SWEP.Offset = { --Procedural world model animation, defaulted for CS:S purposes.
        Pos = {
        Up = -4,
        Right = 1,
        Forward = 15,
        },
        Ang = {
        Up = 0.5,
        Right = -5,
        Forward = 178
        },
		Scale = 1.1
}

SWEP.Scoped = false

SWEP.Shotgun = false
SWEP.ShellTime = 0.75

SWEP.DisableChambering = true
SWEP.Primary.ClipSize = 1
SWEP.Primary.DefaultClip = 4

SWEP.Primary.Sound = "Weapon_DeerHunter.Single"
SWEP.Primary.Ammo = "tfbow_arrow"
SWEP.Primary.Automatic = true
SWEP.Primary.RPM = 60
SWEP.Primary.Damage = 80
SWEP.Primary.NumShots = 1
SWEP.Primary.Spread		= .02					--This is hip-fire acuracy.  Less is more (1 is horribly awful, .0001 is close to perfect)
SWEP.Primary.IronAccuracy = .01	-- Ironsight accuracy, should be the same for shotguns
SWEP.SelectiveFire = true

SWEP.Primary.KickUp			= 0.6					-- This is the maximum upwards recoil (rise)
SWEP.Primary.KickDown			= 0.5					-- This is the maximum downwards recoil (skeet)
SWEP.Primary.KickHorizontal			= 0.25					-- This is the maximum sideways recoil (no real term)
SWEP.Primary.StaticRecoilFactor = 0.4 	--Amount of recoil to directly apply to EyeAngles.  Enter what fraction or percentage (in decimal form) you want.  This is also affected by a convar that defaults to 0.5.

SWEP.Primary.SpreadMultiplierMax = 4.5 --How far the spread can expand when you shoot.
SWEP.Primary.SpreadIncrement = 0.7 --What percentage of the modifier is added on, per shot.
SWEP.Primary.SpreadRecovery = 4.5 --How much the spread recovers, per second.

SWEP.Secondary.IronFOV = 70 --Ironsights FOV (90 = same)
SWEP.BoltAction = false --Un-sight after shooting?
SWEP.BoltTimerOffset = 0.25 --How long do we remain in ironsights after shooting?

SWEP.IronSightsPos = Vector(-7.4, -8.478, 0.85)
SWEP.IronSightsAng = Vector(0.475, -1.9, -49.929)

SWEP.RunSightsPos = Vector(0, -1.81, 0)
SWEP.RunSightsAng = Vector(-4.222, 0, 11.255)


SWEP.InspectionPos = Vector(12.8, -10.653, -4.19)
SWEP.InspectionAng = Vector(36.389, 48.549, 22.513)

SWEP.Primary.Range = 16*164.042*12 -- The distance the bullet can travel in source units.  Set to -1 to autodetect based on damage/rpm.
SWEP.Primary.RangeFalloff = 0.8 -- The percentage of the range the bullet damage starts to fall off at.  Set to 0.8, for example, to start falling off after 80% of the range.

SWEP.MuzzleFlashEffect = ""
SWEP.Tracer = ""

SWEP.ViewModelBoneMods = {
	["ValveBiped.Bip01_R_Finger1"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0.254, 0.09), angle = Angle(15.968, -11.193, 1.437) },
	["ValveBiped.Bip01_R_Finger0"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(3.552, 4.526, 0) },
	["Thumb04"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(6, 0, 0) },
	["arrow"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) }
}

SWEP.ViewModelBoneModsDefault = {
	["ValveBiped.Bip01_R_Finger1"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0.254, 0.09), angle = Angle(15.968, -11.193, 1.437) },
	["ValveBiped.Bip01_R_Finger0"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(3.552, 4.526, 0) },
	["Thumb04"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(6, 0, 0) },
	["arrow"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) }
}

SWEP.ViewModelBoneModsHide = {
	["ValveBiped.Bip01_R_Finger1"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0.254, 0.09), angle = Angle(15.968, -11.193, 1.437) },
	["ValveBiped.Bip01_R_Finger0"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(3.552, 4.526, 0) },
	["Thumb04"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(6, 0, 0) },
	["arrow"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) }
}

SWEP.Callback = {}
SWEP.Callback.PlayerThinkClientFrame = function(self,ply)
	if IsValid(self) and self:OwnerIsValid() then
		local vm = ply:GetViewModel()
		local seq = vm:GetSequence()
		local act = vm:GetSequenceActivity(seq)
		if !self.shouldhide then self.shouldhide = false end
		if self.BlowbackCurrent>0.95 then self.shouldhide = true end
		if self:Clip1()<=0 and act!=ACT_VM_RELOAD then self.shouldhide = true end
		if ( act == ACT_VM_RELOAD and vm:GetCycle()>0.4 and vm:GetCycle()<0.9  ) then self.shouldhide = false end
		if self.shouldhide then
			self.ViewModelBoneMods = self.ViewModelBoneModsHide
		else
			self.ViewModelBoneMods = self.ViewModelBoneModsDefault
		end
	end
end

SWEP.BlowbackEnabled = true
SWEP.Blowback_Only_Iron = false --Only do blowback on ironsights
SWEP.BlowbackVector = Vector(0,-3.0,0)
SWEP.Blowback_Shell_Effect = ""
SWEP.BlowbackBoneMods = {
	["CATSkeletonRightArmCollarbone"] = { scale = Vector(1, 1, 1), pos = Vector(0, -7.995, 0), angle = Angle(0, 0, 0) },
	["string"] = { scale = Vector(1, 1, 1), pos = Vector(-7, 0, 0), angle = Angle(0, 0, 0) },
	["arrow"] = { scale = Vector(1, 1, 1), pos = Vector(-7.597, -0.659, -0.389), angle = Angle(0, 0, 0) },
	["string 2"] = { scale = Vector(1, 1, 1), pos = Vector(0, -7, 0), angle = Angle(0, 0, 0) }
}