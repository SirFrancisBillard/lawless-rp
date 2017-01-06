SWEP.PrintName			= "Rocket Launcher"
SWEP.Author				= "Sir Francis Billard"
SWEP.Instructions		= "Primary fire to launch a devastating rocket."

SWEP.Spawnable = true
SWEP.AdminOnly = true

SWEP.Primary.ClipSize		= 1
SWEP.Primary.DefaultClip	= 0
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "RPG_Round"

SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"

SWEP.Weight					= 50
SWEP.AutoSwitchTo			= false
SWEP.AutoSwitchFrom			= false

SWEP.Slot					= 4
SWEP.SlotPos				= 2
SWEP.DrawAmmo				= true
SWEP.DrawCrosshair			= true

SWEP.ViewModel				= "models/weapons/c_rpg.mdl"
SWEP.WorldModel				= "models/weapons/w_rocket_launcher.mdl"
SWEP.UseHands				= true

local ShootSound = Sound("weapons/grenade_launcher1.wav")

function SWEP:PrimaryAttack()
	if not self:CanPrimaryAttack() then return end

	self:TakePrimaryAmmo(1)

	self.Weapon:SetNextPrimaryFire(CurTime() + 1)
	self.Owner:ViewPunch(Angle(-10, 0, 0))
	self:EmitSound(ShootSound)

	if CLIENT then return end
	local ent = ents.Create("ent_launchedrocket")
	if not IsValid(ent) then return end

	ent:SetPos(self.Owner:EyePos() + (self.Owner:GetAimVector() * 64))
	ent:SetAngles(self.Owner:EyeAngles())
	ent:Spawn()

	local phys = ent:GetPhysicsObject()
	
	if not IsValid(phys) then ent:Remove() return end

	local velocity = self.Owner:GetAimVector()
	velocity = velocity * 1000
	velocity = velocity + (VectorRand() * 10)
	phys:ApplyForceCenter(velocity)
end

function SWEP:SecondaryAttack() end

function SWEP:Deploy()
	self:SendWeaponAnim(ACT_VM_DRAW)
end
