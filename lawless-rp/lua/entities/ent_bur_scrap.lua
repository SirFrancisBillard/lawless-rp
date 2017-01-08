AddCSLuaFile()

ENT.Type				= "anim"
ENT.Base				= "base_entity"
ENT.PrintName			= "Scrap Metal"

ENT.Category			= "Weapon Crafting"
ENT.Spawnable			= true

local ModelList = {
	"models/props_junk/metalbucket01a.mdl",
	"models/props_c17/tools_wrench01a.mdl",
	"models/props_interiors/pot02a.mdl",
	"models/props_junk/garbage_metalcan001a.mdl",
	"models/props_junk/PopCan01a.mdl",
	"models/props_vehicles/carparts_muffler01a.mdl"
}

if SERVER then
	function ENT:Initialize()
		self:SetModel(ModelList[math.random(1, table.Count(ModelList))])
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:SetSolid(SOLID_VPHYSICS)
		local phys = self:GetPhysicsObject()
		if phys:IsValid() then
			phys:Wake()
			phys:SetBuoyancyRatio(0)
		end
	end

	function ENT:PhysicsCollide(data, physobj)
		local Bench = data.HitEntity
		if Bench:GetClass() == "ent_bur_weaponbench" then
			Bench:SetNWInt("ScrapCount", Bench:GetNWInt("ScrapCount") + 1)
			SafeRemoveEntity(self)
		end
	end
end

function ENT:Use(activator, caller) end


function ENT:Think() end

if CLIENT then
	surface.CreateFont("ScrapFont", {
		font = "Arial",
		size = 50,
		weight = 500,
		blursize = 0,
		scanlines = 0,
		antialias = true,
		underline = false,
		italic = false,
		strikeout = false,
		symbol = false,
		rotary = false,
		shadow = true,
		additive = false,
		outline = false,
	})

	function ENT:Draw()
		self:DrawModel()

		local AdjVec1, AdjAng1 = LocalToWorld(Vector(0, 0, 10),Angle(0, CurTime() * 100, 90), self:GetPos(), Angle(0, 0, 0))
		local AdjVec2, AdjAng2 = LocalToWorld(Vector(0, 0, 10),Angle(0, CurTime() * 100 + 180, 90), self:GetPos(), Angle(0, 0, 0))

		local ObjectName = "Scrap Metal"
		local Width, Height = surface.GetTextSize(ObjectName)

		cam.Start3D2D(AdjVec1, AdjAng1 , 0.1)
			surface.SetFont("ScrapFont")
			surface.SetTextColor(255, 255, 255, 255)
			surface.SetTextPos(-Width / 2, -Height / 2)
			surface.DrawText(ObjectName)
		cam.End3D2D()

		cam.Start3D2D(AdjVec2, AdjAng2  , 0.1)
			surface.SetFont("ScrapFont")
			surface.SetTextColor(255, 255, 255, 255)
			surface.SetTextPos(-Width / 2, -Height / 2)
			surface.DrawText(ObjectName)
		cam.End3D2D()
	end
end
