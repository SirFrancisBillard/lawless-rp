SWEP.Base = "tfa_nmrih_base"
SWEP.Category = "TFA NMRIH"
SWEP.Spawnable = true
SWEP.AdminSpawnable = true

SWEP.Slot = 3

SWEP.PrintName = "Beretta Perennia SV10"

SWEP.ViewModel			= "models/weapons/tfa_nmrih/v_fa_sv10.mdl" --Viewmodel path
SWEP.ViewModelFOV = 50

SWEP.WorldModel			= "models/weapons/tfa_nmrih/w_fa_sv10.mdl" --Viewmodel path
SWEP.HoldType = "shotgun"
SWEP.Offset = { --Procedural world model animation, defaulted for CS:S purposes.
        Pos = {
        Up = -2,
        Right = 1,
        Forward = 10,
        },
        Ang = {
        Up = -1,
        Right = -10,
        Forward = 178
        },
		Scale = 1.1
}

SWEP.Scoped = false

SWEP.DisableChambering = true
SWEP.Shotgun = false
SWEP.ShellTime = 8/12

SWEP.Primary.ClipSize = 2
SWEP.Primary.DefaultClip = 12

SWEP.Primary.Sound = "Weapon_ShotgunPump.Single"
SWEP.Primary.Ammo = "buckshot"
SWEP.Primary.Automatic = false
SWEP.Primary.RPM = 400
SWEP.Primary.Damage = 16
SWEP.Primary.NumShots = 16
SWEP.Primary.Spread		= .06					--This is hip-fire acuracy.  Less is more (1 is horribly awful, .0001 is close to perfect)
SWEP.Primary.IronAccuracy = .06	-- Ironsight accuracy, should be the same for shotguns
SWEP.FireModeName = "Break Action"

SWEP.Primary.KickUp			= 2.0					-- This is the maximum upwards recoil (rise)
SWEP.Primary.KickDown			= 1.5					-- This is the maximum downwards recoil (skeet)
SWEP.Primary.KickHorizontal			= 0.5					-- This is the maximum sideways recoil (no real term)
SWEP.Primary.StaticRecoilFactor = 0.25 	--Amount of recoil to directly apply to EyeAngles.  Enter what fraction or percentage (in decimal form) you want.  This is also affected by a convar that defaults to 0.5.

SWEP.Primary.SpreadMultiplierMax = 2.5 --How far the spread can expand when you shoot.
SWEP.Primary.SpreadIncrement = 1 --What percentage of the modifier is added on, per shot.
SWEP.Primary.SpreadRecovery = 1.5 --How much the spread recovers, per second.

SWEP.Primary.Range = 16*164.042 -- The distance the bullet can travel in source units.  Set to -1 to autodetect based on damage/rpm.
SWEP.Primary.RangeFalloff = 0.3 -- The percentage of the range the bullet damage starts to fall off at.  Set to 0.8, for example, to start falling off after 80% of the range.

SWEP.Secondary.IronFOV = 80 --Ironsights FOV (90 = same)
SWEP.BoltAction = true --Un-sight after shooting?
SWEP.BoltTimerOffset = 0.0 --How long do we remain in ironsights after shooting?
SWEP.IronSightsPos = Vector(-3.58, -2.638, 2.4)
SWEP.IronSightsAng = Vector(-0.071, 0.009, 0)

SWEP.RunSightsPos = Vector(0, 0, 0)
SWEP.RunSightsAng = Vector(-8.443, 5.627, 0)

SWEP.InspectionPos = Vector(12.8, -10.653, -4.19)
SWEP.InspectionAng = Vector(36.389, 48.549, 22.513)

SWEP.LuaShellEject = false