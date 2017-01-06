function EFFECT:Init( data )
	self.Position = data:GetOrigin()
	self.Magnitude = data:GetMagnitude() or 1
	self.Scale = data:GetScale() or 1
	
	local dlight = DynamicLight( LocalPlayer():EntIndex()+1 )
	if ( dlight ) then
		dlight.pos = self.Position
		dlight.r = 255
		dlight.g = 32
		dlight.b = 64
		dlight.brightness = 5
		dlight.Decay = 1000
		dlight.Size = 256*math.sqrt(self.Scale)
		dlight.DieTime = CurTime() + 0.05 * math.pow(self.Magnitude,2)
	end
	
	local emitter = ParticleEmitter( self.Position )
		local sparkcount = math.random(1*self.Magnitude,3*math.pow(self.Magnitude,1.5))		
		for i=0, sparkcount do
			local particle = emitter:Add("effects/yellowflare", self.Position)
			if (particle) then
			
				particle:SetVelocity( ( VectorRand() * 40 + dir * math.Rand(40,100) ) * self.Scale )
				particle:SetLifeTime( 0 )
				particle:SetDieTime( math.Rand( 0.4, 0.7 ) )
				particle:SetStartAlpha(255)
				particle:SetEndAlpha( 0 )
				particle:SetStartSize(2*math.sqrt(self.Scale))
				particle:SetEndSize(3*math.sqrt(self.Scale))
				particle:SetRoll( math.rad(math.Rand(0, 360)) )
				particle:SetGravity(Vector(0, 0, -150))
				particle:SetAirResistance(50)
				particle:SetStartLength(0.1)
				particle:SetEndLength(0)
				particle:SetColor( 255 , 32 , 64 ) 
				particle:SetVelocityScale(true)
				particle:SetThinkFunction( function( pa )
					pa:SetVelocity( pa:GetVelocity() + VectorRand()*5)
					pa:SetNextThink( CurTime() + 0.01 )
				end )
				particle:SetNextThink( CurTime() + 0.01 )
				particle:SetCollide(true)
				particle:SetBounce(1)
			end
		end
		for i=0, math.pow(self.Magnitude,1/3)*2 do
		
			local particle = emitter:Add( "particles/smokey", self.Position )
			if (particle) then
				particle:SetVelocity(VectorRand() * 10 * self.Scale )
				particle:SetLifeTime( 0 )
				particle:SetDieTime( math.Rand( 0.6, 0.7 ) )
				particle:SetStartAlpha( math.Rand( 8, 12 ) )
				particle:SetEndAlpha( 0 )
				particle:SetStartSize( math.Rand(5,7) * self.Scale )
				particle:SetEndSize( math.Rand(12,14) * self.Scale )
				particle:SetRoll( math.rad(math.Rand(0, 360)) )
				particle:SetRollDelta( math.Rand(-0.8, 0.8) )
				particle:SetLighting(true)
				
				particle:SetAirResistance( 10 ) 
 				 
 				particle:SetGravity( Vector( 0, 0, 60 ) ) 
				
				particle:SetColor( 255 , 255 , 255 ) 
			end
		
		end
	emitter:Finish()
end

function EFFECT:Think( )
	return false
end

function EFFECT:Render()
end