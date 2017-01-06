NMRIHParticleFiles={}
table.insert(NMRIHParticleFiles,#NMRIHParticleFiles,"nmrih_gas")
table.insert(NMRIHParticleFiles,#NMRIHParticleFiles,"nmrih_tnt")
--Particle Effects
NMRIHParticleFX={}
table.insert(NMRIHParticleFX,#NMRIHParticleFX,"nmrih_lighter_fire")
table.insert(NMRIHParticleFX,#NMRIHParticleFX,"nmrih_tnt_sparks")
table.insert(NMRIHParticleFX,#NMRIHParticleFX,"explosion_tnt_1")

local function NMRIHPrecache()

	for k,v in pairs(NMRIHParticleFiles) do
		game.AddParticles("particles/"..v..".pcf")
	end
	
	for k,v in pairs(NMRIHParticleFX) do 
		PrecacheParticleSystem(v)
	end
	
end

NMRIHPrecache()

hook.Add("InitPostEntity","TFANMRIHPrecache",NMRIHPrecache)