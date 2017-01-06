SWEP.Base = "tfa_nmrih_base"
SWEP.Category = "TFA NMRIH"
SWEP.Spawnable = true
SWEP.AdminSpawnable = true

SWEP.Slot = 1

SWEP.PrintName = "Ruger MK III"

SWEP.ViewModel			= "models/weapons/tfa_nmrih/v_fa_mkiii.mdl" --Viewmodel path
SWEP.ViewModelFOV = 50

SWEP.WorldModel			= "models/weapons/tfa_nmrih/w_fa_mkiii.mdl" --Viewmodel path
SWEP.HoldType = "pistol"
SWEP.Offset = { --Procedural world model animation, defaulted for CS:S purposes.
        Pos = {
        Up = -5.5,
        Right = 1,
        Forward = 3.5,
        },
        Ang = {
        Up = -1,
        Right = -2,
        Forward = 178
        },
		Scale = 1.1
}

SWEP.Scoped = false

SWEP.Shotgun = false
SWEP.ShellTime = 0.75

SWEP.Primary.ClipSize = 10
SWEP.Primary.DefaultClip = 40

SWEP.Primary.Sound = "Weapon_Mkiii.Fire"
SWEP.Primary.Ammo = "pistol"
SWEP.Primary.Automatic = false
SWEP.Primary.RPM = 400
SWEP.Primary.Damage = 30
SWEP.Primary.NumShots = 1
SWEP.Primary.Spread		= .015					--This is hip-fire acuracy.  Less is more (1 is horribly awful, .0001 is close to perfect)
SWEP.Primary.IronAccuracy = .0075	-- Ironsight accuracy, should be the same for shotguns

SWEP.Primary.KickUp			= 0.4					-- This is the maximum upwards recoil (rise)
SWEP.Primary.KickDown			= 0.4					-- This is the maximum downwards recoil (skeet)
SWEP.Primary.KickHorizontal			= 0.15					-- This is the maximum sideways recoil (no real term)
SWEP.Primary.StaticRecoilFactor = 0.2 	--Amount of recoil to directly apply to EyeAngles.  Enter what fraction or percentage (in decimal form) you want.  This is also affected by a convar that defaults to 0.5.

SWEP.Primary.SpreadMultiplierMax = 3.75 --How far the spread can expand when you shoot.
SWEP.Primary.SpreadIncrement = 1.2 --What percentage of the modifier is added on, per shot.
SWEP.Primary.SpreadRecovery = 3 --How much the spread recovers, per second.

SWEP.Secondary.IronFOV = 80 --Ironsights FOV (90 = same)
SWEP.BoltAction = false --Un-sight after shooting?
SWEP.BoltTimerOffset = 0.0 --How long do we remain in ironsights after shooting?

SWEP.IronSightsPos = Vector(-3.241, 0, 0.755)
SWEP.IronSightsAng = Vector(-0.083, 0, 0)

SWEP.RunSightsPos = Vector(-0.202, -13.664, -9.04)
SWEP.RunSightsAng = Vector(64.019, 0, 0)

SWEP.InspectionPos = Vector(11.112, -13.193, 1.041)
SWEP.InspectionAng = Vector(40, 38.693, 40)

SWEP.ViewModelBoneMods = {
	["ValveBiped.Bip01_R_Finger1"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0.254, 0.09), angle = Angle(15.968, -11.193, 1.437) },
	["ValveBiped.Bip01_R_Finger0"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(3.552, 4.526, 0) },
	["Thumb04"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(6, 0, 0) },
	["MagLite"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, -30), angle = Angle(0, 0, 0) }
}

SWEP.Primary.Range = 16*164.042*2 -- The distance the bullet can travel in source units.  Set to -1 to autodetect based on damage/rpm.
SWEP.Primary.RangeFalloff = 0.3 -- The percentage of the range the bullet damage starts to fall off at.  Set to 0.8, for example, to start falling off after 80% of the range.

SWEP.BlowbackEnabled = true
SWEP.BlowbackVector = Vector(0,-2.5,0)
SWEP.Blowback_PistolMode = true
SWEP.BlowbackBoneMods = {
	["Hammer"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, -0.831) },
	["Slide"] = { scale = Vector(1, 1, 1), pos = Vector(-2.5, 0, 0), angle = Angle(0, 0, 0) }
}

SWEP.MoveSpeed = 1
SWEP.IronSightsMoveSpeed  = SWEP.MoveSpeed * 0.8