
if SERVER then
	AddCSLuaFile()
end

SWEP.PrintName			= "Molotov Cocktail"
SWEP.Author			= "Vladimir Putin"
SWEP.Instructions		= "Light the rag and hurl the fucker."
SWEP.Purpose			= "The Molotov Cocktail is a cheap and effective way to cause mayhem."
SWEP.Contact			= "www.csgo-maxbet-ezskins.ru"
SWEP.Base 			= "weapon_sck_base"

SWEP.ViewModel 			= "models/weapons/c_grenade.mdl"
SWEP.WorldModel 		= "models/weapons/w_grenade.mdl"
SWEP.ViewModelFOV		= 60
SWEP.UseHands 			= true

SWEP.Category			= "Putin's Private Reserve"
SWEP.Spawnable			= true

SWEP.Slot 			= 4
SWEP.HoldType 			= "grenade"

SWEP.Primary.ClipSize		= -1
SWEP.Primary.DefaultClip	= -1
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo		= "none"

SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo		= "none"

SWEP.ShowWorldModel 		= false
SWEP.ShowViewModel 		= false

SWEP.WElements = {
	["element_name"] = { type = "Model", model = "models/props_junk/garbage_glassbottle003a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.575, 2.059, -1.792), angle = Angle(12.855, -12.283, 180), size = Vector(0.927, 0.927, 0.927), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}

SWEP.VElements = {
	["element_name"] = { type = "Model", model = "models/props_junk/garbage_glassbottle003a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.631, 2.477, -2.794), angle = Angle(0, 0, 180), size = Vector(0.875, 0.875, 0.875), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}

function SWEP:PrimaryAttack()
	if self:GetNextPrimaryFire() > CurTime() then return end
	self:SendWeaponAnim( ACT_VM_PULLBACK_HIGH )
	self:EmitSound( "npc/vort/claw_swing".. math.random(1, 2).. ".wav" )
	self:SetNextPrimaryFire( CurTime() +1 )
	self:SetNextSecondaryFire( CurTime() +1 )
	if IsFirstTimePredicted() then
		self.Owner:SetAnimation( PLAYER_ATTACK1 )
		timer.Simple( 0.2, function()
			if not IsValid( self ) then return end
			self:SendWeaponAnim( ACT_VM_THROW )
			timer.Simple( 0.3, function()
				if not IsValid( self ) then return end
				self:SendWeaponAnim( ACT_VM_DRAW )
			end )
		end )
		if SERVER then
			local Molotov = ents.Create( "ent_molotov" )
			Molotov:SetPos( self.Owner:GetShootPos() +self.Owner:GetAimVector() * 20 )
			Molotov:Spawn()
			Molotov:GetPhysicsObject():ApplyForceCenter( self.Owner:GetAimVector() * 1500 )
		end
	end
end

function SWEP:SecondaryAttack()
	self:PrimaryAttack()
end

function SWEP:FireAnimationEvent( _, _, intEvent )
	if intEvent == 5001 or intEvent == 6001 then return true end
end
