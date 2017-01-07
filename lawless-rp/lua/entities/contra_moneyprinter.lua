AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Money Printer"
ENT.Author = "Sir Francis Billard"
ENT.Category = "Lawless RP"
ENT.Spawnable = true
ENT.Model = "models/props_c17/consolebox01a.mdl"

ENT.damage = 100

ENT.LevelColors = {}
ENT.LevelColors[1] = Color(255, 255, 0)
ENT.LevelColors[2] = ENT.LevelColors[1]
ENT.LevelColors[3] = ENT.LevelColors[1]
ENT.LevelColors[4] = Color(255, 0, 255)
ENT.LevelColors[5] = ENT.LevelColors[4]
ENT.LevelColors[6] = ENT.LevelColors[4]
ENT.LevelColors[7] = Color(0, 255, 0)
ENT.LevelColors[8] = ENT.LevelColors[7]
ENT.LevelColors[9] = ENT.LevelColors[7]
ENT.LevelColors[10] = Color(0, 255, 255)
ENT.LevelColors[11] = ENT.LevelColors[10]
ENT.LevelColors[12] = ENT.LevelColors[10]
ENT.LevelColors[13] = Color(150, 0, 255)
ENT.LevelColors[14] = ENT.LevelColors[13]
ENT.LevelColors[15] = ENT.LevelColors[13]
ENT.LevelColors[16] = Color(255, 0, 0)
ENT.LevelColors[17] = ENT.LevelColors[16]
ENT.LevelColors[18] = ENT.LevelColors[16]
ENT.LevelColors[19] = Color(0, 0, 255)
ENT.LevelColors[20] = ENT.LevelColors[19]

function ENT:SetupDataTables()
	self:NetworkVar("Int", 0, "price")
	self:NetworkVar("Int", 1, "Level")
	self:NetworkVar("Entity", 0, "owning_ent")
end

if SERVER then
	ENT.SeizeReward = 950

	local PrintMore
	function ENT:Initialize()
		self:SetModel(self.Model)
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:SetSolid(SOLID_VPHYSICS)
		local phys = self:GetPhysicsObject()
		phys:Wake()

		self.sparking = false
		self.damage = 100
		self.IsMoneyPrinter = true
		timer.Simple(math.random(30, 60) - self:GetLevel(), function() PrintMore(self) end)

		self.sound = CreateSound(self, Sound("ambient/levels/labs/equipment_printer_loop1.wav"))
		self.sound:SetSoundLevel(52)
		self.sound:PlayEx(1, 100)

		self:SetLevel(0)
		self:SetColor(self.LevelColors[self:GetLevel() + 1])
	end

	function ENT:OnTakeDamage(dmg)
		if self.burningup then return end

		self.damage = (self.damage or 100) - dmg:GetDamage()
		if self.damage <= 0 then
			local rnd = math.random(1, 10)
			if rnd < 3 then
				self:BurstIntoFlames()
			else
				self:Destruct()
				self:Remove()
			end
		end
	end

	function ENT:Destruct()
		local vPoint = self:GetPos()
		local effectdata = EffectData()
		effectdata:SetStart(vPoint)
		effectdata:SetOrigin(vPoint)
		effectdata:SetScale(1)
		util.Effect("Explosion", effectdata)
		DarkRP.notify(self:Getowning_ent(), 1, 4, DarkRP.getPhrase("money_printer_exploded"))
	end

	function ENT:BurstIntoFlames()
		DarkRP.notify(self:Getowning_ent(), 0, 4, DarkRP.getPhrase("money_printer_overheating"))
		self.burningup = true
		local burntime = math.random(8, 18)
		self:Ignite(burntime, 0)
		timer.Simple(burntime, function() self:Fireball() end)
	end

	function ENT:Fireball()
		if not self:IsOnFire() then self.burningup = false return end
		local dist = math.random(20, 280) -- Explosion radius
		self:Destruct()
		for k, v in pairs(ents.FindInSphere(self:GetPos(), dist)) do
			if not v:IsPlayer() and not v:IsWeapon() and v:GetClass() ~= "predicted_viewmodel" and not v.IsMoneyPrinter then
				v:Ignite(math.random(5, 22), 0)
			elseif v:IsPlayer() then
				local distance = v:GetPos():Distance(self:GetPos())
				v:TakeDamage(distance / dist * 100, self, self)
			end
		end
		self:Remove()
	end

	PrintMore = function(ent)
		if not IsValid(ent) then return end

		ent.sparking = true
		timer.Simple(3, function()
			if not IsValid(ent) then return end
			ent:CreateMoneybag()
		end)
	end

	function ENT:CreateMoneybag()
		if not IsValid(self) or self:IsOnFire() then return end

		local MoneyPos = self:GetPos()

		if GAMEMODE.Config.printeroverheat then
			local overheatchance
			if GAMEMODE.Config.printeroverheatchance <= 3 then
				overheatchance = 22
			else
				overheatchance = GAMEMODE.Config.printeroverheatchance or 22
			end
			if math.random(1, overheatchance) == 3 then self:BurstIntoFlames() end
		end

		local amount = GAMEMODE.Config.mprintamount
		if amount == 0 then
			amount = 250
		end

		DarkRP.createMoneyBag(Vector(MoneyPos.x + 15, MoneyPos.y, MoneyPos.z + 15), 750 + (50 * self:GetLevel()))
		self:SetLevel(math.Clamp(self:GetLevel() + 1, 0, 19))
		self:SetColor(self.LevelColors[self:GetLevel() + 1])

		self.sparking = false
		timer.Simple(math.random(30, 60) - self:GetLevel(), function() PrintMore(self) end)
	end

	function ENT:Think()
		if self:WaterLevel() > 0 then
			self:Destruct()
			self:Remove()
			return
		end

		if not self.sparking then return end

		local effectdata = EffectData()
		effectdata:SetOrigin(self:GetPos())
		effectdata:SetMagnitude(1)
		effectdata:SetScale(1)
		effectdata:SetRadius(2)
		util.Effect("Sparks", effectdata)
	end

	function ENT:OnRemove()
		if self.sound then
			self.sound:Stop()
		end
	end
end

if CLIENT then
	function ENT:Initialize()
	end

	function ENT:Draw()
		self:DrawModel()

		local Pos = self:GetPos()
		local Ang = self:GetAngles()

		local owner = self:Getowning_ent()
		owner = (IsValid(owner) and owner:Nick()) or DarkRP.getPhrase("unknown")

		surface.SetFont("HUDNumber5")
		local text = DarkRP.getPhrase("money_printer")

		local level = "Level " .. (self:GetLevel() + 1)

		local TextWidth = surface.GetTextSize(text)
		local TextWidth2 = surface.GetTextSize(level)
		local TextWidth3 = surface.GetTextSize(owner)

		Ang:RotateAroundAxis(Ang:Up(), 90)

		cam.Start3D2D(Pos + Ang:Up() * 11.5, Ang, 0.11)
			draw.WordBox(2, -TextWidth * 0.5, -80, text, "HUDNumber5", Color(140, 0, 0, 100), Color(255,255,255,255))
			draw.WordBox(2, -TextWidth2 * 0.5, -32, level, "HUDNumber5", Color(140, 0, 0, 100), Color(255,255,255,255))
			draw.WordBox(2, -TextWidth3 * 0.5, 16, owner, "HUDNumber5", Color(140, 0, 0, 100), Color(255,255,255,255))
		cam.End3D2D()
	end

	function ENT:Think()
	end
end
