--[[---------------------------------------------------------------------------
DarkRP custom entities
---------------------------------------------------------------------------

This file contains your custom entities.
This file should also contain entities from DarkRP that you edited.

Note: If you want to edit a default DarkRP entity, first disable it in darkrp_config/disabled_defaults.lua
	Once you've done that, copy and paste the entity to this file and edit it.

The default entities can be found here:
https://github.com/FPtje/DarkRP/blob/master/gamemode/config/addentities.lua#L111

For examples and explanation please visit this wiki page:
http://wiki.darkrp.com/index.php/DarkRP:CustomEntityFields

Add entities under the following line:
---------------------------------------------------------------------------]]

-- Contraband

DarkRP.createEntity("Money Printer", {
	ent = "contra_moneyprinter",
	model = "models/props_c17/consolebox01a.mdl",
	price = 1000,
	max = 4,
	cmd = "buymoneyprinter",
	category = "Contraband"
})

DarkRP.createEntity("Pot", {
	ent = "contra_weedplant",
	model = "models/props_junk/terracotta01.mdl",
	price = 600,
	max = 4,
	cmd = "buypot",
	category = "Contraband"
})

DarkRP.createEntity("Seeds", {
	ent = "contra_seed",
	model = "models/props_junk/garbage_bag001a.mdl",
	price = 200,
	max = 2,
	cmd = "buyseed",
	category = "Contraband"
})

-- Pharmaceutical

DarkRP.createEntity("Health Kit", {
	ent = "pharm_healthkit",
	model = "models/Items/HealthKit.mdl",
	price = 160,
	max = 2,
	cmd = "buyhealthkit",
	allowed = {TEAM_DOCTOR},
	category = "Pharmaceutical"
})

DarkRP.createEntity("Health Vial", {
	ent = "pharm_healthkit",
	model = "models/healthvial.mdl",
	price = 80,
	max = 2,
	cmd = "buyhealthvial",
	allowed = {TEAM_DOCTOR},
	category = "Pharmaceutical"
})

DarkRP.createEntity("Paracetamol", {
	ent = "pharm_paracetamol",
	model = "models/props_junk/garbage_metalcan002a.mdl",
	price = 60,
	max = 2,
	cmd = "buyparacetamol",
	allowed = {TEAM_DOCTOR},
	category = "Pharmaceutical"
})

DarkRP.createEntity("Nitrazepam", {
	ent = "pharm_nitrazepam",
	model = "models/props_c17/TrapPropeller_Lever.mdl",
	price = 40,
	max = 2,
	cmd = "buynitrazepam",
	allowed = {TEAM_DOCTOR},
	category = "Pharmaceutical"
})

-- Black Market

DarkRP.createEntity("Kevlar", {
	ent = "market_kevlar",
	model = "models/props_c17/SuitCase_Passenger_Physics.mdl",
	price = 2000,
	max = 2,
	cmd = "buykevlar",
	allowed = {TEAM_BLACKMARKET},
	category = "Black Market"
})
