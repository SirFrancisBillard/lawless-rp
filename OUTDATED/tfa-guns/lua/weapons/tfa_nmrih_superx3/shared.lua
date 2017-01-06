SWEP.Base = "tfa_nmrih_base"
SWEP.Category = "TFA NMRIH"
SWEP.Spawnable = true
SWEP.AdminSpawnable = true

SWEP.Slot = 3

SWEP.PrintName = "Winchester Super X3"

SWEP.ViewModel			= "models/weapons/tfa_nmrih/v_fa_superx3.mdl" --Viewmodel path
SWEP.ViewModelFOV = 50

SWEP.WorldModel			= "models/weapons/tfa_nmrih/w_fa_superx3.mdl" --Viewmodel path
SWEP.HoldType = "shotgun"
SWEP.Offset = { --Procedural world model animation, defaulted for CS:S purposes.
        Pos = {
        Up = -3,
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

SWEP.Shotgun = true
SWEP.ShellTime = 0.75

SWEP.Primary.ClipSize = 6
SWEP.Primary.DefaultClip = 24

SWEP.Primary.Sound = "Weapon_ShotgunAuto.Single"
SWEP.Primary.Ammo = "buckshot"
SWEP.Primary.Automatic = false
SWEP.Primary.RPM = 240
SWEP.Primary.Damage = 12
SWEP.Primary.NumShots = 12
SWEP.Primary.Spread		= .05					--This is hip-fire acuracy.  Less is more (1 is horribly awful, .0001 is close to perfect)
SWEP.Primary.IronAccuracy = .05	-- Ironsight accuracy, should be the same for shotguns
SWEP.FireModeName = "Semi-Auto"

SWEP.Primary.KickUp			= 1.0					-- This is the maximum upwards recoil (rise)
SWEP.Primary.KickDown			= 0.8					-- This is the maximum downwards recoil (skeet)
SWEP.Primary.KickHorizontal			= 0.7					-- This is the maximum sideways recoil (no real term)
SWEP.Primary.StaticRecoilFactor = 0.35 	--Amount of recoil to directly apply to EyeAngles.  Enter what fraction or percentage (in decimal form) you want.  This is also affected by a convar that defaults to 0.5.

SWEP.Secondary.IronFOV = 80 --Ironsights FOV (90 = same)
SWEP.BoltAction = false --Un-sight after shooting?
SWEP.BoltTimerOffset = 0.0 --How long do we remain in ironsights after shooting?

SWEP.IronSightsPos = Vector(-4.2, -7.43, 2.809)
SWEP.IronSightsAng = Vector(-0.712, 0, 0)

SWEP.RunSightsPos = Vector(12.436, -14.468, 1.75)
SWEP.RunSightsAng = Vector(-10.554, 64.019, 0)

SWEP.InspectionPos = Vector(12.8, -10.653, -4.19)
SWEP.InspectionAng = Vector(36.389, 48.549, 22.513)

SWEP.LuaShellEject = true
SWEP.LuaShellEffect = "ShotgunShellEject"