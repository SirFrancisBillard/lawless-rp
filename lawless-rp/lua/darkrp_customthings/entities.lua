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

DarkRP.createEntity("Money Printer", {
	ent = "contra_moneyprinter",
	model = "models/props_c17/consolebox01a.mdl",
	price = 1000,
	max = 8,
	cmd = "buymoneyprinter",
	category = "Contraband"
})

DarkRP.createEntity("Armored Money Printer", {
	ent = "contra_moneyprinter_armored",
	model = "models/props_c17/consolebox01a.mdl",
	price = 2000,
	max = 4,
	cmd = "buyarmoredmoneyprinter",
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

-- Ammunition

DarkRP.createEntity("Ammo Dispenser", {
	ent = "ent_ammodispenser",
	model = "models/props_lab/reciever_cart.mdl",
	price = 20000,
	max = 2,
	cmd = "buyammodispenser",
	category = "Ammunition"
})

DarkRP.createEntity("Ammo Crate", {
	ent = "ent_ammocrate",
	model = "models/props_junk/cardboard_box001a.mdl",
	price = 800,
	max = 2,
	cmd = "buyammocrate",
	category = "Ammunition"
})

-- Pharmaceutical

DarkRP.createEntity("Health Kit", {
	ent = "pharm_healthkit",
	model = "models/Items/HealthKit.mdl",
	price = 16000,
	max = 2,
	cmd = "buyhealthkit",
	category = "Pharmaceutical",
	allowed = {TEAM_MEDIC, TEAM_SURGEON}
})

DarkRP.createEntity("Health Vial", {
	ent = "pharm_healthvial",
	model = "models/healthvial.mdl",
	price = 8000,
	max = 2,
	cmd = "buyhealthvial",
	category = "Pharmaceutical",
	allowed = {TEAM_MEDIC, TEAM_SURGEON}
})

DarkRP.createEntity("Paracetamol", {
	ent = "pharm_paracetamol",
	model = "models/props_junk/garbage_metalcan002a.mdl",
	price = 6000,
	max = 2,
	cmd = "buyparacetamol",
	category = "Pharmaceutical",
	allowed = {TEAM_MEDIC, TEAM_SURGEON}
})

DarkRP.createEntity("Nitrazepam", {
	ent = "pharm_nitrazepam",
	model = "models/props_c17/TrapPropeller_Lever.mdl",
	price = 400,
	max = 2,
	cmd = "buynitrazepam",
	category = "Pharmaceutical",
	allowed = {TEAM_MEDIC, TEAM_SURGEON}
})

-- Black Market

DarkRP.createEntity("Kevlar", {
	ent = "market_kevlar",
	model = "models/props_c17/SuitCase_Passenger_Physics.mdl",
	price = 20000,
	max = 2,
	cmd = "buykevlar",
	category = "Black Market"
})
