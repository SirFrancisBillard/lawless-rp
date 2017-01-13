
if SERVER then
	AddCSLuaFile()
end

SWEP.PrintName = "Local Vector Finder"
SWEP.Author = "ur boi skinny penis"
SWEP.Purpose = "Runs WorldToLocal on different entities, usually prop_physics. This can be used to create santosrp-esque multi-model entities."
SWEP.Instructions = "Right click to select a base prop. Left click to find the local vector between the base prop and the prop you are looking at."
SWEP.Category = "Admin Tools"

SWEP.ViewModelFOV = 62
SWEP.ViewModelFlip = false
SWEP.ViewModel = "models/weapons/v_pistol.mdl"
SWEP.WorldModel = ""

SWEP.Spawnable = true
SWEP.AdminOnly = true

SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "None"

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "None"

function SWEP:SetupDataTables()
	self:NetworkVar("Entity", 0, "BaseEnt")
end

function SWEP:Initialize()
	self:SetHoldType("normal")
end

function SWEP:PrimaryAttack()
	if CLIENT then return end
	if not IsValid(self:GetBaseEnt()) then self.Owner:ChatPrint("No base entity selected.") return end
	self.Owner:LagCompensation(true)
	local tr = self.Owner:GetEyeTrace()
	self.Owner:LagCompensation(false)
	if IsValid(tr.Entity) and tr.Entity:GetClass() == "prop_physics" then
		self.Owner:ChatPrint(tr.Entity:GetModel() .. " - " .. self:GetBaseEnt():WorldToLocal(tr.Entity:GetPos()))
	else
		self.Owner:ChatPrint("Invalid target entity.")
	end
end

function SWEP:SecondaryAttack()
	if CLIENT then return end
	self.Owner:LagCompensation(true)
	local tr = self.Owner:GetEyeTrace()
	self.Owner:LagCompensation(false)
	if IsValid(tr.Entity) and tr.Entity:GetClass() == "prop_physics" then
		self:SetBaseEnt(tr.Entity)
	else
		self.Owner:ChatPrint("Invalid target entity.")
	end
end
