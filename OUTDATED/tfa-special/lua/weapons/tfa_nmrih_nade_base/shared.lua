DEFINE_BASECLASS("tfa_nmrih_base")

SWEP.Type = "Grenade"

SWEP.DrawCrosshair = false
SWEP.Slot = 4

SWEP.MuzzleFlashEffect = ""
SWEP.data 				= {}
SWEP.data.ironsights			= 0

SWEP.Delay = 0.1 -- Delay to fire entity
SWEP.Delay_Underhand = 0.1 -- Delay to fire entity
SWEP.Primary.Round = ("") -- Nade Entity
SWEP.Velocity = 550 -- Entity Velocity

SWEP.Underhanded = false

SWEP.NadeAttachment = -1
SWEP.CanToss = false
SWEP.CanHold = false

SWEP.Secondary.BashDamage = 15
SWEP.Secondary.BashDelay = 0.1
SWEP.Secondary.BashLength = 54
SWEP.Secondary.BashDamageType = DMG_GENERIC
SWEP.Secondary.BashHitSound = ""

function SWEP:Initialize()
	
	self:SetWeaponHoldType(self.HoldType)
	
	self:SetHoldType(self.HoldType)
	
	if (!self.Primary.Damage) or (self.Primary.Damage<=0.01) then
		self:AutoDetectDamage()
	end
	
	if !self.Primary.Accuracy then
		if self.Primary.ConeSpray then
			self.Primary.Accuracy  = ( 5 / self.Primary.ConeSpray) / 90
		else
			self.Primary.Accuracy = 0.01
		end
	end
	
	if !self.Primary.IronAccuracy then
		self.Primary.IronAccuracy = self.Primary.Accuracy * 0.2
	end
	
	if GetConVarNumber("sv_tfa_blacklist_"..self.Gun,0)==1  then
		self.Spawnable				= false
		self.AdminSpawnable			= false
		
		if SERVER then
			timer.Simple(0, function()
				if IsValid(self) then
					if IsValid(self.Owner) then
						print("Blacklisted weapon was spawned by:")
						print(self.Owner)
						self.Owner:StripWeapon(self:GetClass())
						if self.Owner.SetAmmo then
							self.Owner:SetAmmo( math.Clamp(self:GetAmmoReserve()-self.Primary.DefaultClip,0,99999),self:GetPrimaryAmmoType())
						end
					end
				end
			end)
		end
	end
	
	if self.MuzzleAttachment == "1" then
		self.CSMuzzleFlashes = true
	end
	
	if self.Akimbo then
		self.AutoDetectMuzzleAttachment = true
		self.MuzzleAttachmentRaw = 2-self.AnimCycle
	end	
	
	self:CreateFireModes()
	
	self:AutoDetectMuzzle()
	
	self:AutoDetectRange()
	
	self.DefaultHoldType = self.HoldType
	self.ViewModelFOVDefault = self.ViewModelFOV
	
	self.DrawCrosshairDefault = self.DrawCrosshair
	
	self:SetUpSpread()
	
	self:CorrectScopeFOV( self.DefaultFOV and self.DefaultFOV or self.Owner:GetFOV() )
	
	if CLIENT then
		self:InitMods()
		self:IconFix()
	end
	self.drawcount=0
	self.drawcount2=0
	self.canholster=false
	
	self:DetectValidAnimations()
	self:SetDeploySpeed(self.SequenceLength[ACT_VM_DRAW])
	
	if !self.Primary.ClipMax then
		self.Primary.ClipMax = self.Primary.ClipSize * 3
	end
	
	self:ResetEvents()

	self.ProjectileEntity = self.Primary.Round or self.Primary.ProjectileEntity --Entity to shoot
	self.ProjectileVelocity = self.Velocity and self.Velocity or 550 --Entity to shoot's velocity
	self.ProjectileModel = nil --Entity to shoot's model
	
	self:SetNWBool("Charging",false)
	self:SetNWBool("Ready",false)
	self:SetNWBool("Underhanded",false)

end

function SWEP:Deploy()

	if self.Callback.Deploy then
		local val = self.Callback.Deploy(self)
		if val then return val end
	end
	
	if self:Clip1()<=0 then
		if self:Ammo1()<=0 then
			timer.Simple(0,function()
				if IsValid(self) and self:OwnerIsValid() and SERVER then self.Owner:StripWeapon(self:GetClass()) end
			end)
		else
			self:TakePrimaryAmmo(1)
			self:SetClip1(1)
		end	
	end
	
	if (!self.Primary.Damage) or (self.Primary.Damage<=0.01) then
		self:AutoDetectDamage()
	end
	
	if !self.Primary.Accuracy then
		if self.Primary.ConeSpray then
			self.Primary.Accuracy  = ( 5 / self.Primary.ConeSpray) / 90
		else
			self.Primary.Accuracy = 0.01
		end
	end
	
	if !self.Primary.IronAccuracy then
		self.Primary.IronAccuracy = self.Primary.Accuracy * 0.2
	end
	
	if self.MuzzleAttachment == "1" then
		self.CSMuzzleFlashes = true
	end
	
	self:CreateFireModes()

	self.ViewModelFOVDefault = self.ViewModelFOV
	self.DefaultFOV=self.Owner:GetFOV()
	
	if self.DrawCrosshairDefault==nil then
		self.DrawCrosshairDefault = self.DrawCrosshair
	end
	
	self.isfirstdraw=false
	if !self.hasdrawnbefore then
		self.hasdrawnbefore = true
		self.isfirstdraw=true
		--self.Primary.DefaultClip = 0
	end
	
	if self.isfirstdraw then
		self:SetDeploySpeed(self.SequenceLength[ACT_VM_DRAW])
	end
	
	self:ResetSightsProgress()
	
	self:DetectValidAnimations()
	
	self:AutoDetectRange()
	
	timer.Simple(0, function()
		if IsValid(self) then
			self:DetectValidAnimations()
			self:ChooseDrawAnim()
		end
	end)
	
	if self.Owner:KeyDown(IN_ATTACK2) and self.SightWhileDraw then
		self:SetIronSights(true)
	end
	
	if self.Owner:KeyDown(IN_SPEED) and self.Owner:GetVelocity():Length()>self.Owner:GetWalkSpeed() then
		self:SetSprinting(true)
	end
	
	self:SetHoldType(self.HoldType)
	
	self.OldIronsights=(false)
	self:SetIronSights(false)
	self:SetIronSightsRaw(false)
	self.OldSprinting=(false)
	self.OldSafety=(false)
	self:SetSprinting(false)
	self:SetShooting(false)
	self:SetChangingSilence(false)
	self:SetCanHolster(false)
	self:SetReloading(false)
	self:SetShotgunInsertingShell(false)
	self:SetShotgunCancel( false )
	self:SetShotgunPumping(false)
	self:SetShotgunNeedsPump(false )
	self:SetFireModeChanging( false ) 
	self:SetBoltTimer( false )
	self:SetReloadingEnd(CurTime()-1)
	self:SetShootingEnd(CurTime()-1)
	self:SetDrawingEnd(CurTime()-1)
	self:SetHolsteringEnd(CurTime()-1)
	self:SetNextSilenceChange(CurTime()-1)
	self:SetFireModeChangeEnd(CurTime()-1)
	self:SetHUDThreshold(true)
	self:SetHUDThresholdEnd(CurTime()+0.2)
	self:SetBoltTimerStart(CurTime()-1)
	self:SetBoltTimerEnd(CurTime()-1)
	self:SetDrawing(true)
	self:SetHolstering(false)
	self:SetInspecting(false)
	if self:GetSilenced()==nil then
		self:SetSilenced(self.Silenced and self.Silenced or 0)
	end
	self:SetIronSightsRatio(0)
	self:SetRunSightsRatio(0)
	self:SetCrouchingRatio(0)
	self:SetJumpingRatio(0)
	self:SetSpreadRatio(0)
	self:SetBurstCount(0)
	self:SetInspectingRatio(0)
	self:SetBursting(false)
	self:SetUpSpread()
	self:AutoDetectMuzzle()
	self.PenetrationCounter = 0
	if CLIENT or game.SinglePlayer() then
		self.CLSpreadRatio=1
		self.CLIronSightsProgress = 0
		self.CLRunSightsProgress = 0
		self.CLCrouchProgress = 0
		self.CLInspectingProgress = 0
		self.CLNearWallProgressProgress = 0
	end
	self:SetNextIdleAnim(CurTime()-1)
	local vm = self.Owner:GetViewModel()
	if IsValid(vm) then
		self:SendWeaponAnim(0)
		self.DefaultAtt = vm:GetAttachment(self:GetFPMuzzleAttachment())
	end
	local drawtimerstring=(self.SequenceEnabled[ACT_VM_DRAW] and 1 or 0)..","..(self.SequenceEnabled[ACT_VM_DRAW_EMPTY] and 1 or 0)
	
	if self.InitDrawCode then
		self:InitDrawCode(drawtimerstring)
	end
	
	self:CorrectScopeFOV( self.DefaultFOV and self.DefaultFOV or self.Owner:GetFOV() )
	
	self.customboboffset=Vector(0,0,0)
	
	self:ResetEvents()
	
	if SERVER then
		self:CallOnClient("ResetEvents","")
	end
	
	self:UpdateConDamage()
	
	self:SetNWBool("Charging",false)
	self:SetNWBool("Ready",false)
	self:SetNWBool("Underhanded",false)
	
	self.oldang = self.Owner:EyeAngles()
	self.anga = Angle()
	self.angb = Angle()
	self.angc = Angle()
	
	self:CleanParticles()
	
	return true
end

function SWEP:ChoosePullAnim()
	if !self:OwnerIsValid() then return end
	
	if self.Callback.ChoosePullAnim then self.Callback.ChoosePullAnim(self) end
	
	self.Owner:SetAnimation(PLAYER_RELOAD)
	--self:ResetEvents()
	local tanim=ACT_VM_PULLPIN
	local success = true
	self:SendWeaponAnim(ACT_VM_PULLPIN)
	
	if game.SinglePlayer() then
		self:CallOnClient("AnimForce",tanim)
	end
	
	self.lastact = tanim
	return success, tanim
end

function SWEP:ChooseShootAnim()
	if !self:OwnerIsValid() then return end
	
	if self.Callback.ChooseShootAnim then self.Callback.ChooseShootAnim(self) end
	
	self.Owner:SetAnimation(PLAYER_ATTACK1)
	
	--self:ResetEvents()
	local mybool=self:GetNWBool("Underhanded",false)
	local tanim=mybool and ACT_VM_RELEASE or ACT_VM_THROW
	local success = true
	self:SendWeaponAnim(tanim)
	
	if game.SinglePlayer() then
		self:CallOnClient("AnimForce",tanim)
	end
	
	self.lastact = tanim
	return success, tanim
end

function SWEP:ThrowStart()
	if self:Clip1()>0 then
		self:ChooseShootAnim()
		self:SetNWBool("Ready",false)
		local bool = self:GetNWBool("Underhanded",false)
		if bool then
			timer.Simple(self.Delay_Underhand,function()
				if IsValid(self) and self:OwnerIsValid() then self:Throw() end
			end)
		else
			timer.Simple(self.Delay,function()
				if IsValid(self) and self:OwnerIsValid() then self:Throw() end
			end)
		end
	end
end

function SWEP:Throw()
	if self:Clip1()>0 then
		local bool = self:GetNWBool("Underhanded",false)
		if !bool then		
			self.ProjectileVelocity = self.Velocity and self.Velocity or 550 --Entity to shoot's velocity
		else
			if self.Velocity_Underhand then
				self.ProjectileVelocity = self.Velocity_Underhand 
			else
				self.ProjectileVelocity = (self.Velocity and self.Velocity or 550)/1.5 --Entity to shoot's velocity		
			end
		end
		self:TakePrimaryAmmo(1)
		self:ShootBulletInformation()
		self:DoAmmoCheck()
	end
end

function SWEP:DoAmmoCheck()
	if IsValid(self) then
		if SERVER then 
			local vm = self.Owner:GetViewModel()
			if !IsValid(vm) then return end
			
			local delay = vm:SequenceDuration()
			delay = delay * 1-math.Clamp(vm:GetCycle(),0,1)
			timer.Simple(delay, function()
				if IsValid(self) then
					self:Deploy()
				end
			end)
		end
	end
end

function SWEP:Think()
	if self:GetNWBool("Charging",false) or self:GetNWBool("Ready",false) then self:SetInspecting(false) end
	if self:GetInspecting() then return end
	if self:GetNWBool("Charging",false) and !self:GetNWBool("Ready",false) then
		if self:OwnerIsValid() and self.Owner:KeyDown(IN_ATTACK2) then
			self:SetNWBool("Underhanded",true)
		end
	elseif !self:GetNWBool("Charging",false) and self:GetNWBool("Ready",true) then
		if self:OwnerIsValid() and ( !self.CanHold or ( !self.Owner:KeyDown(IN_ATTACK2) and !self.Owner:KeyDown(IN_ATTACK) ) )then
			self:ThrowStart()
		end
	end
end

function SWEP:PrimaryAttack()
	if self:GetInspecting() then
		return
	end
	if self.GetBashing and self:GetBashing() then
		return
	end
	if ( CLIENT and IsFirstTimePredicted() ) or SERVER then
		if self:Clip1()>0 and self:OwnerIsValid() and self:CanFire() then
			self:ChoosePullAnim()
			self:SetNWBool("Charging",true)
			self:SetNWBool("Underhanded",false)
			timer.Simple(self.Owner:GetViewModel():SequenceDuration(),function()
				if IsValid(self) then
					self:SetNWBool("Charging",false)
					self:SetNWBool("Ready",true)
				end
			end)
		else
			return
		end
	end
end

function SWEP:SecondaryAttack()
	if self:GetInspecting() then return end
	if self.GetBashing and self:GetBashing() then
		return
	end
	if !self.CanToss then return end
	if ( CLIENT and IsFirstTimePredicted() ) or SERVER then
		if self:Clip1()>0 and self:OwnerIsValid() and self:CanFire() then
			self:ChoosePullAnim()
			self:SetNWBool("Charging",true)
			self:SetNWBool("Ready",false)
			self:SetNWBool("Underhanded",true)
			timer.Simple(self.Owner:GetViewModel():SequenceDuration(),function()
				if IsValid(self) then
					self:SetNWBool("Charging",false)
					self:SetNWBool("Ready",true)
				end
			end)
		end
	end
end

function SWEP:Reload()
	if ( CLIENT and IsFirstTimePredicted() ) or SERVER then
		if self:Clip1()<=0 and self:OwnerIsValid() and self:CanFire() then
			self:Deploy()
		end
	end
end

function SWEP:CanFire()
	if !self:OwnerIsValid() then return false end
	local vm = self.Owner:GetViewModel()
	local seq = vm:GetSequence()
	local act = vm:GetSequenceActivity(seq)
	if !(act==ACT_VM_DRAW or act==ACT_VM_IDLE or ( act==ACT_VM_HITCENTER and ( !self.GetBashing or !self:GetBashing() ) ) ) then
		return false
	end
	if act==ACT_VM_DRAW and vm:GetCycle()<0.99 then return false end
	return !(self:GetNWBool("Charging") or self:GetNWBool("Ready") )
end

function SWEP:ShootBullet(damage, recoil, num_bullets, aimcone, disablericochet, bulletoverride)

	if self.Callback.ShootBullet then
		local val = self.Callback.ShootBullet(self, damage, recoil, num_bullets, aimcone, disablericochet, bulletoverride)
		if val then return val end
	end

	if (CLIENT and !game.SinglePlayer()) and !IsFirstTimePredicted() then return end
	
	num_bullets 		= num_bullets or 1
	aimcone 			= aimcone or 0
	
	if self.ProjectileEntity then
		if SERVER then
			local i=0
			local shots = {}
			
			while i<num_bullets do
				local ent = ents.Create(self.ProjectileEntity)
				local dir
				local vm = self.Owner:GetViewModel()
				local pos = self.Owner:GetShootPos()
				local ang = self.Owner:EyeAngles()
				dir = ang:Forward()
				ang:RotateAroundAxis(ang:Right(),-aimcone/2 + math.Rand(0,aimcone))
				ang:RotateAroundAxis(ang:Up(),-aimcone/2 + math.Rand(0,aimcone))
				if IsValid(vm) then
					local angpos = vm:GetAttachment(self.NadeAttachment)
					if self.NadeAttachment and self.NadeAttachment>0 and angpos and angpos.Pos then
						pos = angpos.Pos + (self.Owner:GetShootPos()-self.Owner:GetPos())
						ang = angpos.Ang
					end
				end
				
				ent:SetPos( pos )
				
				ent.Owner = self.Owner
				ent:SetAngles(ang)
				ent.damage = self.Primary.Damage
				ent.mydamage = self.Primary.Damage
				
				if self.ProjectileModel then
					ent:SetModel(self.ProjectileModel)
				end
				
				ent:Spawn()
				
				ent.Owner = self.Owner
				constraint.NoCollide(ent,self.Owner,0,0)
				
				table.insert(shots,#shots+1,ent)
				
				constraint.NoCollide(ent,self.Owner,0,0)
				
				ent:Activate()
				if self.ProjectileModel then
					ent:SetModel(self.ProjectileModel)
				end
				local vel = dir * self.ProjectileVelocity + self.Owner:GetAngles():Up() * self.ProjectileVelocity/4 + self.Owner:GetVelocity() 
				ent:SetVelocity( vel )
				local phys = ent:GetPhysicsObject()
				
				if IsValid(phys) then
					phys:SetVelocity( vel )
				end
				
				if self.ProjectileModel then
					ent:SetModel(self.ProjectileModel)
				end
				i=i+1
			end
			
			for k,v in pairs(shots) do
				for k2,v2 in pairs(shots) do
					if v!=v2 then
						constraint.NoCollide(v,v2,0,0)
					end
				end
			end
			
		end		
	end
	
	self:Recoil( recoil )
end

function SWEP:AltAttack()
	if !self:OwnerIsValid() then return end
	
	if self:GetNWBool("Charging",false) or self:GetNWBool("Ready",false) then return end

	if ( self:GetHolstering() ) then
		if (self.ShootWhileHolster==false) then
			return
		else
			self:SetHolsteringEnd(CurTime()-0.1)
			self:SetHolstering(false)
		end
	end
	
	if (self:GetReloading() and self.Shotgun and !self:GetShotgunPumping() and !self:GetShotgunNeedsPump()) then
		self:SetShotgunCancel( true )
		--[[
		self:SetShotgunInsertingShell(true)
		self:SetShotgunPumping(false)
		self:SetShotgunNeedsPump(true)
		self:SetReloadingEnd(CurTime()-1)
		]]--
		return
	end
	
	if self:IsSafety() then return end
	
	if (self:GetChangingSilence()) then return end
	
	if self:GetNextSecondaryFire()>CurTime() then return end
	
	if self:GetReloading() then
		self:CompleteReload()
	end
	
	local vm = self.Owner:GetViewModel()
	
	--if SERVER then
		self:SendWeaponAnim(ACT_VM_HITCENTER)
	--else
		self:SendWeaponAnim(ACT_VM_HITCENTER)
	--end
	
	
	if !game.SinglePlayer() then
		timer.Simple(vm:SequenceDuration()-0.05,function()
			if IsValid(self) and self:OwnerIsValid() then
				self:SendWeaponAnim(ACT_VM_IDLE)
			end
		end)
	end
	
	self.tmptoggle = !self.tmptoggle
	
	self:SetNextPrimaryFire(CurTime()+vm:SequenceDuration())
	self:SetNextSecondaryFire(CurTime()+vm:SequenceDuration())
	
	if CLIENT then
		self:EmitSound(self.Secondary.BashSound )
	end
	
	timer.Simple(self.Secondary.BashDelay,function()
		if IsValid(self) and self.OwnerIsValid and self:OwnerIsValid() then
			if (SERVER) then
				local pos = self.Owner:GetShootPos()
				local av = self.Owner:EyeAngles():Forward()
				
				local slash = {}
				slash.start = pos
				slash.endpos = pos + (av * self.Secondary.BashLength)
				slash.filter = self.Owner
				slash.mins = Vector(-10, -5, 0)
				slash.maxs = Vector(10, 5, 5)
				local slashtrace = util.TraceHull(slash)
				local pain = self.Secondary.BashDamage
				
				
				
				if slashtrace.Hit then
					if slashtrace.Entity:GetClass() == "func_door_rotating" or slashtrace.Entity:GetClass() == "prop_door_rotating" then
						local ply = self.Owner
						ply:EmitSound("ambient/materials/door_hit1.wav", 100, math.random(80, 120))
						
						ply.oldname = ply:GetName()
						
						ply:SetName( "bashingpl" .. ply:EntIndex() )
						
						slashtrace.Entity:SetKeyValue( "Speed", "500" )
						slashtrace.Entity:SetKeyValue( "Open Direction", "Both directions" )
						slashtrace.Entity:Fire( "unlock", "", .01 )
						slashtrace.Entity:Fire( "openawayfrom", "bashingpl" .. ply:EntIndex() , .01 )
						
						timer.Simple(0.02, function()
							if IsValid(ply) then
								ply:SetName(ply.oldname)
							end
						end)
						
						timer.Simple(0.3, function()
							if IsValid(slashtrace.Entity) then
								slashtrace.Entity:SetKeyValue( "Speed", "100" )
							end
						end)
						
					end
					self:EmitSound( (slashtrace.MatType == MAT_FLESH or slashtrace.MatType == MAT_ALIENFLESH) and self.Secondary.BashHitSound_Flesh or self.Secondary.BashHitSound  )
					if game.GetTimeScale()>0.99 then
						self.Owner:FireBullets({
							Attacker = self.Owner,
							Inflictor = self,
							Damage = pain,
							Force = pain,
							Distance = self.Secondary.BashLength + 10,
							HullSize = 10,
							Tracer = 0,
							Src = self.Owner:GetShootPos(),
							Dir = slashtrace.Normal,
							Callback = function(a,b,c)
								if c then c:SetDamageType(self.Secondary.BashDamageType) end
							end
						})
					else
						local dmg = DamageInfo()
						dmg:SetAttacker(self.Owner)
						dmg:SetInflictor(self)
						dmg:SetDamagePosition(self.Owner:GetShootPos())
						dmg:SetDamageForce(self.Owner:GetAimVector()*(pain))
						dmg:SetDamage(pain)
						dmg:SetDamageType(self.Secondary.BashDamageType)
						slashtrace.Entity:TakeDamageInfo(dmg)
					end		
					
					local ent = slashtrace.Entity
					if IsValid(ent) and ent.GetPhysicsObject then
						
						local phys
						
						if ent:IsRagdoll() then
							phys = ent:GetPhysicsObjectNum(slashtrace.PhysicsBone or 0)
						else						
							phys = ent:GetPhysicsObject()
						end
						
						if IsValid(phys) then
							if ent:IsPlayer() or ent:IsNPC() then
								ent:SetVelocity(ent:GetVelocity()+self.Owner:GetAimVector()*self.Secondary.BashDamage*40)
								phys:SetVelocity(phys:GetVelocity()+self.Owner:GetAimVector()*self.Secondary.BashDamage*40)
							else
								phys:ApplyForceOffset(self.Owner:GetAimVector()*self.Secondary.BashDamage/4,slashtrace.HitPos)
							end
						end
						
					end
				end
			end
		end
	end)
end