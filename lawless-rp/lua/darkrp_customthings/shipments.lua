--[[---------------------------------------------------------------------------
DarkRP custom shipments and guns
---------------------------------------------------------------------------

This file contains your custom shipments and guns.
This file should also contain shipments and guns from DarkRP that you edited.

Note: If you want to edit a default DarkRP shipment, first disable it in darkrp_config/disabled_defaults.lua
	Once you've done that, copy and paste the shipment to this file and edit it.

The default shipments and guns can be found here:
https://github.com/FPtje/DarkRP/blob/master/gamemode/config/addentities.lua

For examples and explanation please visit this wiki page:
http://wiki.darkrp.com/index.php/DarkRP:CustomShipmentFields

Add shipments and guns under the following line:
---------------------------------------------------------------------------]]

-- Raiding Tools

DarkRP.createShipment("Lockpick", {
	model = "models/weapons/w_crowbar.mdl",
	entity = "lockpick",
	price = 100000,
	amount = 10,
	separate = false,
	pricesep = 0,
	noship = false,
	category = "Raiding Tools"
})

DarkRP.createShipment("Keypad Cracker", {
	model = "models/weapons/w_c4_planted.mdl",
	entity = "keypad_cracker",
	price = 120000,
	amount = 10,
	separate = false,
	pricesep = 0,
	noship = false,
	category = "Raiding Tools"
})

DarkRP.createShipment("Grenade Launcher", {
	model = "models/weapons/w_shotgun.mdl",
	entity = "weapon_grenadelauncher",
	price = 400000,
	amount = 10,
	separate = false,
	pricesep = 0,
	noship = false,
	category = "Raiding Tools"
})

DarkRP.createShipment("C4", {
	model = "models/weapons/w_c4_planted.mdl",
	entity = "weapon_cs_c4",
	price = 1200000,
	amount = 10,
	separate = false,
	pricesep = 0,
	noship = false,
	category = "Raiding Tools"
})

DarkRP.createShipment("Rocket Launcher", {
	model = "models/weapons/w_rocket_launcher.mdl",
	entity = "weapon_rocketlauncher",
	price = 800000,
	amount = 10,
	separate = false,
	pricesep = 0,
	noship = false,
	category = "Raiding Tools"
})

-- CSS Weapons

DarkRP.createShipment("M249", {
	model = "models/weapons/w_mach_m249para.mdl",
	entity = "weapon_cs_m249",
	price = 420000,
	amount = 10,
	separate = false,
	pricesep = 0,
	noship = false,
	category = "Machine Guns"
})
 
DarkRP.createShipment("Galil", {
	model = "models/weapons/w_rif_galil.mdl",
	entity = "weapon_cs_galil",
	price = 40000,
	amount = 10,
	separate = false,
	pricesep = 0,
	noship = false,
	category = "Rifles"
})
 
DarkRP.createShipment("AK47", {
	model = "models/weapons/w_rif_ak47.mdl",
	entity = "weapon_cs_ak47",
	price = 40000,
	amount = 10,
	separate = false,
	pricesep = 0,
	noship = false,
	category = "Rifles"
})
 
DarkRP.createShipment("M4A1", {
	model = "models/weapons/w_rif_m4a1.mdl",
	entity = "weapon_cs_m4",
	price = 39000,
	amount = 10,
	separate = false,
	pricesep = 0,
	noship = false,
	category = "Rifles"
})
 
DarkRP.createShipment("Famas", {
	model = "models/weapons/w_rif_famas.mdl",
	entity = "weapon_cs_famas",
	price = 39000,
	amount = 10,
	separate = false,
	pricesep = 0,
	noship = false,
	category = "Rifles"
})
 
DarkRP.createShipment("AWP", {
	model = "models/weapons/w_snip_awp.mdl",
	entity = "weapon_cs_awp",
	price = 50000,
	amount = 10,
	separate = false,
	pricesep = 0,
	noship = false,
	category = "Sniper Rifles"
})
 
DarkRP.createShipment("Scout", {
	model = "models/weapons/w_snip_scout.mdl",
	entity = "weapon_cs_scout",
	price = 45000,
	amount = 10,
	separate = false,
	pricesep = 0,
	noship = false,
	category = "Sniper Rifles"
})
 
DarkRP.createShipment("Aug", {
	model = "models/weapons/w_rif_aug.mdl",
	entity = "weapon_cs_aug",
	price = 40000,
	amount = 10,
	separate = false,
	pricesep = 0,
	noship = false,
	category = "Rifles"
})
 
DarkRP.createShipment("SG552", {
	model = "models/weapons/w_rif_sg552.mdl",
	entity = "weapon_cs_sig552",
	price = 40000,
	amount = 10,
	separate = false,
	pricesep = 0,
	noship = false,
	category = "Rifles"
})
 
DarkRP.createShipment("G3SG1", {
	model = "models/weapons/w_snip_g3sg1.mdl",
	entity = "weapon_cs_g3",
	price = 40000,
	amount = 10,
	separate = false,
	pricesep = 0,
	noship = false,
	category = "Sniper Rifles"
})
 
DarkRP.createShipment("SG550", {
	model = "models/weapons/w_snip_sg550.mdl",
	entity = "weapon_cs_sig550",
	price = 40000,
	amount = 10,
	separate = false,
	pricesep = 0,
	noship = false,
	category = "Sniper Rifles" 
})
 
DarkRP.createShipment("UMP45", {
	model = "models/weapons/w_smg_ump45.mdl",
	entity = "weapon_cs_ump",
	price = 36000,
	amount = 10,
	separate = false,
	pricesep = 0,
	noship = false,
	category = "Submachine Guns"
})
 
DarkRP.createShipment("P90", {
	model = "models/weapons/w_smg_p90.mdl",
	entity = "weapon_cs_p90",
	price = 35000,
	amount = 10,
	separate = false,
	pricesep = 0,
	noship = false,
	category = "Submachine Guns"
})
 
DarkRP.createShipment("TMP", {
	model = "models/weapons/w_smg_tmp.mdl",
	entity = "weapon_cs_tmp",
	price = 35000,
	amount = 10,
	separate = false,
	pricesep = 0,
	noship = false,
	category = "Submachine Guns"
})
 
DarkRP.createShipment("MP5", {
	model = "models/weapons/w_smg_mp5.mdl",
	entity = "weapon_cs_mp5",
	price = 32000,
	amount = 10,
	separate = false,
	pricesep = 0,
	noship = false,
	category = "Submachine Guns"
})
 
DarkRP.createShipment("Mac10", {
	model = "models/weapons/w_smg_mac10.mdl",
	entity = "weapon_cs_mac10",
	price = 30000,
	amount = 10,
	separate = false,
	pricesep = 0,
	noship = false,
	category = "Submachine Guns"
})
 
DarkRP.createShipment("XM1014", {
	model = "models/weapons/w_shot_xm1014.mdl",
	entity = "weapon_cs_xm1014",
	price = 30000,
	amount = 10,
	separate = false,
	pricesep = 0,
	noship = false,
	category = "Shotguns"
})
 
DarkRP.createShipment("Pump Shotgun", {
	model = "models/weapons/w_shot_m3super90.mdl",
	entity = "weapon_cs_m3",
	price = 25000,
	amount = 10,
	separate = false,
	pricesep = 0,
	noship = false,
	category = "Shotguns"
})
 
DarkRP.createShipment("Frag Grenade", {
	model = "models/weapons/w_eq_fraggrenade.mdl",
	entity = "weapon_cs_he",
	price = 35000,
	amount = 10,
	separate = false,
	pricesep = 0,
	noship = false,
	category = "Grenades"
})
 
DarkRP.createShipment("Flashbang", {
	model = "models/weapons/w_eq_flashbang_thrown.mdl",
	entity = "weapon_cs_flash",
	price = 20000,
	amount = 10,
	separate = false,
	pricesep = 0,
	noship = false,
	category = "Grenades"
})
 
DarkRP.createShipment("Smoke Grenade", {
	model = "models/weapons/w_eq_smokegrenade.mdl",
	entity = "weapon_cs_smoke",
	price = 20000,
	amount = 10,
	separate = false,
	pricesep = 0,
	noship = false,
	category = "Grenades"
})
 
DarkRP.createShipment("Dual Elites", {
	model = "models/weapons/w_pist_elite_dropped.mdl",
	entity = "weapon_cs_elites",
	price = 23000,
	amount = 10,
	separate = true,
	pricesep = 2300,
	noship = false,
	category = "Pistols"
})
 
DarkRP.createShipment("Deagle", {
	model = "models/weapons/w_pist_deagle.mdl",
	entity = "weapon_cs_deagle",
	price = 90000,
	amount = 10,
	separate = true,
	pricesep = 9000,
	noship = false,
	category = "Pistols"
})
 
DarkRP.createShipment("USP", {
	model = "models/weapons/w_pist_usp.mdl",
	entity = "weapon_cs_usp",
	price = 22000,
	amount = 10,
	separate = true,
	pricesep = 2200,
	noship = false,
	category = "Pistols"
})
 
DarkRP.createShipment("P228", {
	model = "models/weapons/w_pist_p228.mdl",
	entity = "weapon_cs_p228",
	price = 21000,
	amount = 10,
	separate = true,
	pricesep = 2100,
	noship = false,
	category = "Pistols"
})
 
DarkRP.createShipment("Glock", {
	model = "models/weapons/w_pist_glock18.mdl",
	entity = "weapon_cs_glock",
	price = 20000,
	amount = 10,
	separate = true,
	pricesep = 2000,
	noship = false,
	category = "Pistols"
})
 
DarkRP.createShipment("Five Seven", {
	model = "models/weapons/w_pist_fiveseven.mdl",
	entity = "weapon_cs_fiveseven",
	price = 19000,
	amount = 10,
	separate = true,
	pricesep = 1900,
	noship = false,
	category = "Pistols"
})
 
DarkRP.createShipment("Knife", {
	model = "models/weapons/w_knife_t.mdl",
	entity = "weapon_cs_knife",
	price = 20000,
	amount = 10,
	separate = false,
	pricesep = 0,
	noship = false,
	category = "Other"
})
