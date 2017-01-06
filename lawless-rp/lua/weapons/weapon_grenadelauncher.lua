SWEP.PrintName			= "Grenade Launcher"
SWEP.Author				= "Sir Francis Billard"
SWEP.Instructions		= "Primary fire to launch a somewhat weak grenade."

SWEP.Spawnable = true
SWEP.AdminOnly = true

SWEP.Primary.ClipSize		= 1
SWEP.Primary.DefaultClip	= 0
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "SMG1_Grenade"

SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"

SWEP.Weight					= 20
SWEP.AutoSwitchTo			= false
SWEP.AutoSwitchFrom			= false

SWEP.Slot					= 4
SWEP.SlotPos				= 2
SWEP.DrawAmmo				= true
SWEP.DrawCrosshair			= true

SWEP.ViewModel				= "models/weapons/c_shotgun.mdl"
SWEP.WorldModel				= "models/weapons/w_shotgun.mdl"
SWEP.UseHands				= true

SWEP.Reloading = false

local ShootSound = Sound("weapons/grenade_launcher1.wav")

function SWEP:PrimaryAttack()
	if not self:CanPrimaryAttack() or self.Reloading then return end

	self:ShootEffects()
	self:TakePrimaryAmmo(1)
	self:SetNextPrimaryFire(CurTime() + 1)
	self.Owner:ViewPunch(Angle(-10, 0, 0))
	self:EmitSound(ShootSound)

	if CLIENT then return end
	local ent = ents.Create("ent_launchedgrenade")
	if not IsValid(ent) then return end

	ent:SetPos(self.Owner:EyePos() + (self.Owner:GetAimVector() * 64))
	ent:SetAngles(self.Owner:EyeAngles())
	ent:Spawn()

	local phys = ent:GetPhysicsObject()
	if not IsValid(phys) then ent:Remove() return end

	local velocity = self.Owner:GetAimVector()
	velocity = velocity * 4000
	velocity = velocity + (VectorRand() * 10)
	phys:ApplyForceCenter(velocity)
end

function SWEP:SecondaryAttack() end

function SWEP:Deploy()
	self:SetHoldType("shotgun")
	self:SendWeaponAnim(ACT_VM_DRAW)
	self.Reloading = false
end

function SWEP:Reload()
	if self:DefaultReload(ACT_VM_RELOAD) then
		self.Reloading = true
		timer.Simple(self:SequenceDuration(), function()
			if not IsValid(self) then return end
			self:SendWeaponAnim(ACT_SHOTGUN_PUMP)
			timer.Simple(self:SequenceDuration(), function()
				if not IsValid(self) then return end
				self.Reloading = false
			end)
		end)
	end
end
