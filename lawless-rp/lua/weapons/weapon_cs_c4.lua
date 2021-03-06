if CLIENT then
	killicon.AddFont( "weapon_cs_c4", "csd", "O", Color( 255, 80, 0, 255 ) ) ; killicon.AddFont( "ent_cs_c4", "csd", "O", Color( 255, 80, 0, 255 ) )
	SWEP.WepSelectIcon 		= surface.GetTextureID("vgui/gfx/vgui/last_match_performance")
end

SWEP.Category				= "Counter-Strike"
SWEP.PrintName				= "C4"
SWEP.Base					= "weapon_cs_base"
SWEP.WeaponType				= "Free"

SWEP.Cost					= 0
SWEP.CSSMoveSpeed			= 250

SWEP.Spawnable				= true
SWEP.AdminOnly				= true

SWEP.Slot					= 4
SWEP.SlotPos				= 1

SWEP.ViewModel 				= "models/weapons/cstrike/c_c4.mdl"
SWEP.WorldModel				= "models/weapons/w_c4.mdl"
SWEP.VModelFlip 			= false
SWEP.HoldType				= "slam"

SWEP.Primary.Damage			= 0
SWEP.Primary.NumShots		= 0
SWEP.Primary.Sound			= Sound("weapons/ak47/ak47-1.wav")
SWEP.Primary.Cone			= 0
SWEP.Primary.ClipSize		= -1
SWEP.Primary.SpareClip		= -1
SWEP.Primary.Delay			= 1
SWEP.Primary.Ammo			= "none"
SWEP.Primary.Automatic 		= false

SWEP.RecoilMul				= 1
SWEP.HasScope 				= false
SWEP.ZoomAmount 			= 1
SWEP.HasCrosshair 			= false
SWEP.HasCSSZoom 			= false

SWEP.HasPumpAction 			= false
SWEP.HasBoltAction 			= true
SWEP.HasBurstFire 			= false
SWEP.HasSilencer 			= false
SWEP.HasDoubleZoom			= true
SWEP.HasSideRecoil			= false

SWEP.IsThrowing 			= false
SWEP.HasAnimated			= false
SWEP.HasThrown				= false
SWEP.CanHolster				= true

function SWEP:Deploy()
	self:SendWeaponAnim(ACT_VM_DRAW)
end

function SWEP:Holster()
	return self.CanHolster
end

function SWEP:Initialize()
	self:SetWeaponHoldType(self.HoldType)
end

function SWEP:PrimaryAttack()
	if self:IsUsing() then return end
	self:SetNextPrimaryFire(CurTime() + self.Primary.Delay + 2)

	self.HasThrown = false
	self.HasAnimated = false

	self.CanHolster = false
	self:SendWeaponAnim(ACT_VM_PRIMARYATTACK)

	self.DefaultWalkSpeed = self.Owner:GetWalkSpeed()
	self.DefaultRunSpeed = self.Owner:GetRunSpeed()

	self.Owner:SetRunSpeed(0.01)
	self.Owner:SetWalkSpeed(0.01)

	self.IsThrowing = true

	self.ThrowAnimation = CurTime() + 3
	self.Throw = CurTime() + 3.1
end

function SWEP:SecondaryAttack() end

function SWEP:EquipThink()
	if self.IsThrowing == true then
	
		if self.ThrowAnimation < CurTime() then
			if self.HasAnimated == false then
				self:SendWeaponAnim(ACT_VM_SECONDARYATTACK)
				self.Owner:SetAnimation(PLAYER_ATTACK1) 
				self.HasAnimated = true
			end
		end
		
		if self.Throw < CurTime() then
			if self.HasThrown == false then
				self:PlantC4()
				self.HasThrown = true
				
				self.IsThrowing = false
				self.HasAnimated = false
				self.CanHolster	= true
			end
		end
	
	end
end

function SWEP:PlantC4()
	if CLIENT then return end
	local EA =  Angle(0,self.Owner:GetAngles().y,0)
	local pos = self.Owner:GetPos()

	self.Owner:SetRunSpeed(self.DefaultRunSpeed)
	self.Owner:SetWalkSpeed(self.DefaultWalkSpeed)

	local ent = ents.Create("ent_cs_c4")		
		ent:SetPos(pos)
		ent:SetAngles(EA)
		ent:Spawn()
		ent:Activate()
		ent:SetNWEntity("owner",self.Owner)
		--ent:SetOwner(self.Owner)
	ent:EmitSound("weapons/c4/c4_plant.wav")
	if not self.Owner.CSS_C4_COUNT then
		self.Owner.CSS_C4_COUNT = 0
	end
	self.Owner.CSS_C4_COUNT = self.Owner.CSS_C4_COUNT - 1
	if self.Owner.CSS_C4_COUNT < 1 then
		self.Owner:StripWeapon(self.ClassName)
	end
end

if SERVER then
	function SWEP:EquipAmmo(ply)
		PrintMessage(HUD_PRINTTALK, "use this")
		if not ply.CSS_C4_COUNT then
			ply.CSS_C4_COUNT = 1
			return
		end
		ply.CSS_C4_COUNT = ply.CSS_C4_COUNT + 1
	end
end

hook.Add("DoPlayerDeath", "CSS_C4_REMOVE_ON_DEATH", function(ply, atk, dmg)
	ply.CSS_C4_COUNT = 0
end)
