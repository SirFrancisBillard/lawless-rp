include('shared.lua')

ENT.Sound =  "Weapon_TNT.Spark_Loop2"

function ENT:Initialize()

	self:EmitSound(self.Sound)
	self.NextSound = CurTime() + SoundDuration(self.Sound)
	
end

function ENT:OnRemove()
	self:StopSound(self.Sound)
end

/*---------------------------------------------------------
Draw
---------------------------------------------------------*/
function ENT:Draw()
	
	if CurTime()>self.NextSound then
		self:EmitSound(self.Sound)
		self.NextSound = CurTime() + SoundDuration(self.Sound)
	end
	
	self.Entity:DrawModel()
end


/*---------------------------------------------------------
IsTranslucent
---------------------------------------------------------*/
function ENT:IsTranslucent()
	return true
end


