SWEP.Base = "tfa_nmrih_base"
SWEP.Category = "TFA NMRIH"
SWEP.Spawnable = true
SWEP.AdminSpawnable = true

SWEP.Slot = 4

SWEP.PrintName = "Simonov SKS"

SWEP.ViewModel			= "models/weapons/tfa_nmrih/v_fa_sks.mdl" --Viewmodel path
SWEP.ViewModelFOV = 50

SWEP.WorldModel			= "models/weapons/tfa_nmrih/w_fa_sks.mdl" --Viewmodel path
SWEP.HoldType = "ar2"
SWEP.Offset = { --Procedural world model animation, defaulted for CS:S purposes.
        Pos = {
        Up = -2.5,
        Right = 1,
        Forward = 3.5,
        },
        Ang = {
        Up = -1,
        Right = -2,
        Forward = 178
        },
		Scale = 1.0
}

SWEP.Scoped = false

SWEP.Shotgun = false
SWEP.ShellTime = 0.75

SWEP.DisableChambering = true
SWEP.Primary.ClipSize = 10
SWEP.Primary.DefaultClip = 40

SWEP.Primary.Sound = "Weapon_SKS.Single"
SWEP.Primary.Ammo = "ar2"
SWEP.Primary.Automatic = false
SWEP.Primary.RPM = 333
SWEP.Primary.Damage = 65
SWEP.Primary.NumShots = 1
SWEP.Primary.Spread		= .015					--This is hip-fire acuracy.  Less is more (1 is horribly awful, .0001 is close to perfect)
SWEP.Primary.IronAccuracy = .005	-- Ironsight accuracy, should be the same for shotguns
SWEP.Secondary.BashDamageType = DMG_BULLET

SWEP.Secondary.BashDamage = 50
SWEP.Secondary.BashSound = Sound("TFA.Bash")
SWEP.BashHitSound_Flesh  = Sound("weapons/blades/slash.mp3")
SWEP.Secondary.BashDelay = 0.2
SWEP.Secondary.BashLength = 100

SWEP.Primary.KickUp			= 0.9					-- This is the maximum upwards recoil (rise)
SWEP.Primary.KickDown			= 0.6					-- This is the maximum downwards recoil (skeet)
SWEP.Primary.KickHorizontal			= 0.2					-- This is the maximum sideways recoil (no real term)
SWEP.Primary.StaticRecoilFactor = 0.5 	--Amount of recoil to directly apply to EyeAngles.  Enter what fraction or percentage (in decimal form) you want.  This is also affected by a convar that defaults to 0.5.

SWEP.Primary.SpreadMultiplierMax = 4.5 --How far the spread can expand when you shoot.
SWEP.Primary.SpreadIncrement = 1.5 --What percentage of the modifier is added on, per shot.
SWEP.Primary.SpreadRecovery = 3.5 --How much the spread recovers, per second.

SWEP.Secondary.IronFOV = 70 --Ironsights FOV (90 = same)
SWEP.BoltAction = false --Un-sight after shooting?
SWEP.BoltTimerOffset = 0.25 --How long do we remain in ironsights after shooting?

SWEP.IronSightsPos = Vector(-5.861, 0, 1.639)
SWEP.IronSightsAng = Vector(-0.069, 0, 0)

SWEP.RunSightsPos = Vector(0, 0, 0)
SWEP.RunSightsAng = Vector(-11.869, 17.129, -16.056)

SWEP.InspectionPos = Vector(12.8, -10.653, -4.19)
SWEP.InspectionAng = Vector(36.389, 48.549, 22.513)

SWEP.Primary.Range = 16*164.042*20 -- The distance the bullet can travel in source units.  Set to -1 to autodetect based on damage/rpm.
SWEP.Primary.RangeFalloff = 0.8 -- The percentage of the range the bullet damage starts to fall off at.  Set to 0.8, for example, to start falling off after 80% of the range.

SWEP.BlowbackEnabled = true
SWEP.BlowbackVector = Vector(0,-2.5,0)
SWEP.Blowback_PistolMode = true
SWEP.BlowbackBoneMods =  {
	["Bolt"] = { scale = Vector(1, 1, 1), pos = Vector(-4.316, 0, 0), angle = Angle(0, 0, 0) }
}
SWEP.Blowback_Shell_Effect = "RifleShellEject"