SWEP.Base = "tfa_nmrih_nade_base"
SWEP.Category = "TFA NMRIH"
SWEP.Spawnable = true
SWEP.AdminSpawnable = true

SWEP.Slot = 4

SWEP.Type = "Grenade"
SWEP.PrintName = "TNT"

SWEP.ViewModel			= "models/weapons/tfa_nmrih/v_exp_tnt.mdl" --Viewmodel path
SWEP.ViewModelFOV = 50

SWEP.WorldModel			= "models/weapons/tfa_nmrih/w_exp_tnt.mdl" --Viewmodel path
SWEP.HoldType = "melee"
SWEP.ThirdPersonReloadDisable = true

SWEP.Offset = { --Procedural world model animation, defaulted for CS:S purposes.
        Pos = {
        Up = -1,
        Right = 1,
        Forward = 3,
        },
        Ang = {
        Up = 0.5,
        Right = -90,
        Forward = 178
        },
		Scale = 0.9
}

SWEP.Scoped = false

SWEP.Shotgun = false
SWEP.ShellTime = 0.75

SWEP.DisableChambering = true
SWEP.Primary.ClipSize = 1
SWEP.Primary.DefaultClip = 4

SWEP.Primary.Ammo = "tnt"
SWEP.Primary.Automatic = false
SWEP.Primary.RPM = 60
SWEP.Primary.Damage = 80
SWEP.Primary.NumShots = 1
SWEP.Primary.Spread		= .01					--This is hip-fire acuracy.  Less is more (1 is horribly awful, .0001 is close to perfect)
SWEP.Primary.IronAccuracy = .00	-- Ironsight accuracy, should be the same for shotguns
SWEP.SelectiveFire = false

SWEP.Primary.KickUp			= -0.15					-- This is the maximum upwards recoil (rise)
SWEP.Primary.KickDown			= -0.15					-- This is the maximum downwards recoil (skeet)
SWEP.Primary.KickHorizontal			= 0.0					-- This is the maximum sideways recoil (no real term)
SWEP.Primary.StaticRecoilFactor = 0.0 	--Amount of recoil to directly apply to EyeAngles.  Enter what fraction or percentage (in decimal form) you want.  This is also affected by a convar that defaults to 0.5.

SWEP.Primary.SpreadMultiplierMax = 4.5 --How far the spread can expand when you shoot.
SWEP.Primary.SpreadIncrement = 0.7 --What percentage of the modifier is added on, per shot.
SWEP.Primary.SpreadRecovery = 4.5 --How much the spread recovers, per second.

SWEP.Secondary.IronFOV = 70 --Ironsights FOV (90 = same)
SWEP.BoltAction = false --Un-sight after shooting?
SWEP.BoltTimerOffset = 0.25 --How long do we remain in ironsights after shooting?

SWEP.RunSightsPos = Vector(0, -1.81, 0)
SWEP.RunSightsAng = Vector(-4.222, 0, 11.255)


SWEP.InspectionPos = Vector(12.8, -10.653, -4.19)
SWEP.InspectionAng = Vector(36.389, 48.549, 22.513)

SWEP.Primary.Range = 16*164.042 -- The distance the bullet can travel in source units.  Set to -1 to autodetect based on damage/rpm.
SWEP.Primary.RangeFalloff = 0.8 -- The percentage of the range the bullet damage starts to fall off at.  Set to 0.8, for example, to start falling off after 80% of the range.

SWEP.MuzzleFlashEffect = ""
SWEP.Tracer = ""

SWEP.Primary.Round = "tfa_nmrih_tnt_thrown"