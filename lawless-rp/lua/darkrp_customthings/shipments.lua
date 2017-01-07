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
	category = "Raiding Tools",
	allowed = {TEAM_BLACKMARKET, TEAM_LOCKSMITH, TEAM_THIEF}
})

DarkRP.createShipment("Keypad Cracker", {
	model = "models/weapons/w_c4_planted.mdl",
	entity = "keypad_cracker",
	price = 120000,
	amount = 10,
	separate = false,
	pricesep = 0,
	noship = false,
	category = "Raiding Tools",
	allowed = {TEAM_BLACKMARKET, TEAM_HACKER}
})

DarkRP.createShipment("Grenade Launcher", {
	model = "models/weapons/w_shotgun.mdl",
	entity = "weapon_grenadelauncher",
	price = 400000,
	amount = 10,
	separate = false,
	pricesep = 0,
	noship = false,
	category = "Raiding Tools",
	allowed = {TEAM_BLACKMARKET, TEAM_EXPLOSIVES}
})

DarkRP.createShipment("C4", {
	model = "models/weapons/w_c4_planted.mdl",
	entity = "weapon_cs_c4",
	price = 1200000,
	amount = 10,
	separate = false,
	pricesep = 0,
	noship = false,
	category = "Raiding Tools",
	allowed = {TEAM_BLACKMARKET, TEAM_EXPLOSIVES}
})

DarkRP.createShipment("Rocket Launcher", {
	model = "models/weapons/w_rocket_launcher.mdl",
	entity = "weapon_rocketlauncher",
	price = 800000,
	amount = 10,
	separate = false,
	pricesep = 0,
	noship = false,
	category = "Raiding Tools",
	allowed = {TEAM_BLACKMARKET, TEAM_EXPLOSIVES}
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
	category = "Machine Guns",
	allowed = {TEAM_GUN_SHADY}
})
 
DarkRP.createShipment("Galil", {
	model = "models/weapons/w_rif_galil.mdl",
	entity = "weapon_cs_galil",
	price = 40000,
	amount = 10,
	separate = false,
	pricesep = 0,
	noship = false,
	category = "Rifles",
	allowed = {TEAM_GUN_SHADY}
})
 
DarkRP.createShipment("AK47", {
	model = "models/weapons/w_rif_ak47.mdl",
	entity = "weapon_cs_ak47",
	price = 40000,
	amount = 10,
	separate = false,
	pricesep = 0,
	noship = false,
	category = "Rifles",
	allowed = {TEAM_GUN_SHADY}
})
 
DarkRP.createShipment("M4A1", {
	model = "models/weapons/w_rif_m4a1.mdl",
	entity = "weapon_cs_m4",
	price = 39000,
	amount = 10,
	separate = false,
	pricesep = 0,
	noship = false,
	category = "Rifles",
	allowed = {TEAM_GUN_SHADY}
})
 
DarkRP.createShipment("Famas", {
	model = "models/weapons/w_rif_famas.mdl",
	entity = "weapon_cs_famas",
	price = 39000,
	amount = 10,
	separate = false,
	pricesep = 0,
	noship = false,
	category = "Rifles",
	allowed = {TEAM_GUN_SHADY}
})
 
DarkRP.createShipment("AWP", {
	model = "models/weapons/w_snip_awp.mdl",
	entity = "weapon_cs_awp",
	price = 50000,
	amount = 10,
	separate = false,
	pricesep = 0,
	noship = false,
	category = "Sniper Rifles",
	allowed = {TEAM_GUN_SHADY}
})
 
DarkRP.createShipment("Scout", {
	model = "models/weapons/w_snip_scout.mdl",
	entity = "weapon_cs_scout",
	price = 45000,
	amount = 10,
	separate = false,
	pricesep = 0,
	noship = false,
	category = "Sniper Rifles",
	allowed = {TEAM_GUN_SHADY}
})
 
DarkRP.createShipment("Aug", {
	model = "models/weapons/w_rif_aug.mdl",
	entity = "weapon_cs_aug",
	price = 40000,
	amount = 10,
	separate = false,
	pricesep = 0,
	noship = false,
	category = "Rifles",
	allowed = {TEAM_GUN_SHADY}
})
 
DarkRP.createShipment("SG552", {
	model = "models/weapons/w_rif_sg552.mdl",
	entity = "weapon_cs_sig552",
	price = 40000,
	amount = 10,
	separate = false,
	pricesep = 0,
	noship = false,
	category = "Rifles",
	allowed = {TEAM_GUN_SHADY}
})
 
DarkRP.createShipment("G3SG1", {
	model = "models/weapons/w_snip_g3sg1.mdl",
	entity = "weapon_cs_g3",
	price = 40000,
	amount = 10,
	separate = false,
	pricesep = 0,
	noship = false,
	category = "Sniper Rifles",
	allowed = {TEAM_GUN_SHADY}
})
 
DarkRP.createShipment("SG550", {
	model = "models/weapons/w_snip_sg550.mdl",
	entity = "weapon_cs_sig550",
	price = 40000,
	amount = 10,
	separate = false,
	pricesep = 0,
	noship = false,
	category = "Sniper Rifles",
	allowed = {TEAM_GUN_SHADY}
})
 
DarkRP.createShipment("UMP45", {
	model = "models/weapons/w_smg_ump45.mdl",
	entity = "weapon_cs_ump",
	price = 36000,
	amount = 10,
	separate = false,
	pricesep = 0,
	noship = false,
	category = "Submachine Guns",
	allowed = {TEAM_GUN_SHADY}
})
 
DarkRP.createShipment("P90", {
	model = "models/weapons/w_smg_p90.mdl",
	entity = "weapon_cs_p90",
	price = 35000,
	amount = 10,
	separate = false,
	pricesep = 0,
	noship = false,
	category = "Submachine Guns",
	allowed = {TEAM_GUN_SHADY}
})
 
DarkRP.createShipment("TMP", {
	model = "models/weapons/w_smg_tmp.mdl",
	entity = "weapon_cs_tmp",
	price = 35000,
	amount = 10,
	separate = false,
	pricesep = 0,
	noship = false,
	category = "Submachine Guns",
	allowed = {TEAM_GUN_SHADY}
})
 
DarkRP.createShipment("MP5", {
	model = "models/weapons/w_smg_mp5.mdl",
	entity = "weapon_cs_mp5",
	price = 32000,
	amount = 10,
	separate = false,
	pricesep = 0,
	noship = false,
	category = "Submachine Guns",
	allowed = {TEAM_GUN_SHADY}
})
 
DarkRP.createShipment("Mac10", {
	model = "models/weapons/w_smg_mac10.mdl",
	entity = "weapon_cs_mac10",
	price = 30000,
	amount = 10,
	separate = false,
	pricesep = 0,
	noship = false,
	category = "Submachine Guns",
	allowed = {TEAM_GUN_SHADY}
})
 
DarkRP.createShipment("XM1014", {
	model = "models/weapons/w_shot_xm1014.mdl",
	entity = "weapon_cs_xm1014",
	price = 30000,
	amount = 10,
	separate = false,
	pricesep = 0,
	noship = false,
	category = "Shotguns",
	allowed = {TEAM_GUN_SHADY}
})
 
DarkRP.createShipment("Pump Shotgun", {
	model = "models/weapons/w_shot_m3super90.mdl",
	entity = "weapon_cs_m3",
	price = 25000,
	amount = 10,
	separate = false,
	pricesep = 0,
	noship = false,
	category = "Shotguns",
	allowed = {TEAM_GUN_SHADY}
})
 
DarkRP.createShipment("Frag Grenade", {
	model = "models/weapons/w_eq_fraggrenade.mdl",
	entity = "weapon_cs_he",
	price = 35000,
	amount = 10,
	separate = false,
	pricesep = 0,
	noship = false,
	category = "Grenades",
	allowed = {TEAM_GUN_SHADY, TEAM_GUN_FAIR, TEAM_BLACKMARKET}
})
 
DarkRP.createShipment("Flashbang", {
	model = "models/weapons/w_eq_flashbang_thrown.mdl",
	entity = "weapon_cs_flash",
	price = 20000,
	amount = 10,
	separate = false,
	pricesep = 0,
	noship = false,
	category = "Grenades",
	allowed = {TEAM_GUN_SHADY, TEAM_GUN_FAIR, TEAM_BLACKMARKET}
})
 
DarkRP.createShipment("Smoke Grenade", {
	model = "models/weapons/w_eq_smokegrenade.mdl",
	entity = "weapon_cs_smoke",
	price = 20000,
	amount = 10,
	separate = false,
	pricesep = 0,
	noship = false,
	category = "Grenades",
	allowed = {TEAM_GUN_SHADY, TEAM_GUN_FAIR, TEAM_BLACKMARKET}
})
 
DarkRP.createShipment("Dual Elites", {
	model = "models/weapons/w_pist_elite_dropped.mdl",
	entity = "weapon_cs_elites",
	price = 23000,
	amount = 10,
	separate = true,
	pricesep = 2300,
	noship = false,
	category = "Pistols",
	allowed = {TEAM_GUN_SHADY, TEAM_GUN_FAIR}
})
 
DarkRP.createShipment("Deagle", {
	model = "models/weapons/w_pist_deagle.mdl",
	entity = "weapon_cs_deagle",
	price = 90000,
	amount = 10,
	separate = true,
	pricesep = 9000,
	noship = false,
	category = "Pistols",
	allowed = {TEAM_GUN_SHADY, TEAM_GUN_FAIR}
})
 
DarkRP.createShipment("USP", {
	model = "models/weapons/w_pist_usp.mdl",
	entity = "weapon_cs_usp",
	price = 22000,
	amount = 10,
	separate = true,
	pricesep = 2200,
	noship = false,
	category = "Pistols",
	allowed = {TEAM_GUN_SHADY, TEAM_GUN_FAIR}
})
 
DarkRP.createShipment("P228", {
	model = "models/weapons/w_pist_p228.mdl",
	entity = "weapon_cs_p228",
	price = 21000,
	amount = 10,
	separate = true,
	pricesep = 2100,
	noship = false,
	category = "Pistols",
	allowed = {TEAM_GUN_SHADY, TEAM_GUN_FAIR}
})
 
DarkRP.createShipment("Glock", {
	model = "models/weapons/w_pist_glock18.mdl",
	entity = "weapon_cs_glock",
	price = 20000,
	amount = 10,
	separate = true,
	pricesep = 2000,
	noship = false,
	category = "Pistols",
	allowed = {TEAM_GUN_SHADY, TEAM_GUN_FAIR}
})
 
DarkRP.createShipment("Five Seven", {
	model = "models/weapons/w_pist_fiveseven.mdl",
	entity = "weapon_cs_fiveseven",
	price = 19000,
	amount = 10,
	separate = true,
	pricesep = 1900,
	noship = false,
	category = "Pistols",
	allowed = {TEAM_GUN_SHADY, TEAM_GUN_FAIR}
})
 
DarkRP.createShipment("Knife", {
	model = "models/weapons/w_knife_t.mdl",
	entity = "weapon_cs_knife",
	price = 20000,
	amount = 10,
	separate = false,
	pricesep = 0,
	noship = false,
	category = "Other",
	allowed = {TEAM_GUN_SHADY, TEAM_GUN_FAIR, TEAM_BLACKMARKET}
})

-- DRUGS

DarkRP.createShipment("Beer", "models/drug_mod/alcohol_can.mdl", "durgz_alcohol", 600, 10, false, 10, false, {TEAM_BAR})
DarkRP.createShipment("Water", "models/drug_mod/the_bottle_of_water.mdl", "durgz_water", 400, 10, false, 10, false, {TEAM_BAR})

DarkRP.createShipment("Aspirin", "models/jaanus/aspbtl.mdl", "durgz_aspirin", 130000, 10, false, 10, false, {TEAM_DRUG, TEAM_BLACKMARKET})
DarkRP.createShipment("Cigarettes", "models/boxopencigshib.mdl", "durgz_cigarette", 60000, 10, false, 10, false, {TEAM_DRUG, TEAM_BLACKMARKET})
DarkRP.createShipment("Cocaine", "models/cocn.mdl", "durgz_cocaine", 100000, 10, false, 10, false, {TEAM_DRUG, TEAM_BLACKMARKET})
DarkRP.createShipment("Heroine", "models/katharsmodels/syringe_out/syringe_out.mdl", "durgz_heroine", 1100, 10, false, 10, false, {TEAM_DRUG, TEAM_BLACKMARKET})
DarkRP.createShipment("LSD", "models/smile/smile.mdl", "durgz_lsd", 90000, 10, false, 10, false, {TEAM_DRUG, TEAM_BLACKMARKET})
DarkRP.createShipment("Mushrooms", "models/ipha/mushroom_small.mdl", "durgz_mushroom", 80000, 10, false, 10, false, {TEAM_DRUG, TEAM_BLACKMARKET})
DarkRP.createShipment("Weed", "models/katharsmodels/contraband/zak_wiet/zak_wiet.mdl", "durgz_weed", 100000, 10, false, 10, false, {TEAM_DRUG, TEAM_BLACKMARKET})

-- M9K

local function MakeM9kShipment(name, mdl, cls, cost, amt, sep, sep_cost, no, who, cat)
	DarkRP.createShipment(name, {
		model = mdl,
		entity = cls,
		price = cost * 10,
		amount = amt,
		separate = sep,
		pricesep = sep_cost,
		noship = no,
		category = cat,
		allowed = who
	})
end

--ASSAULT GUNS
MakeM9kShipment("Acr", "models/weapons/w_masada_acr.mdl", "m9k_acr", 4000, 10, false, nil, false, {TEAM_GUN_SHADY}, "Rifles")
MakeM9kShipment("AMD 65", "models/weapons/w_amd_65.mdl", "m9k_amd65", 5000, 10, false, nil, false, {TEAM_GUN_SHADY}, "Rifles")
MakeM9kShipment("FN FAL", "models/weapons/w_fn_fal.mdl", "m9k_fal", 4000, 10, false, nil, false, {TEAM_GUN_SHADY}, "Rifles")
MakeM9kShipment("M14", "models/weapons/w_snip_m14sp.mdl", "m9k_m14sp", 5000, 10, false, nil, false, {TEAM_GUN_SHADY}, "Rifles")
MakeM9kShipment("M16 Scoped", "models/weapons/w_dmg_m16ag.mdl", "m9k_m16a4_acog", 5250, 10, false, nil, false, {TEAM_GUN_SHADY}, "Rifles")
MakeM9kShipment("HK 16", "models/weapons/w_hk_416.mdl", "m9k_m416", 5000, 10, false, nil, false, {TEAM_GUN_SHADY}, "Rifles")
MakeM9kShipment("Scar", "models/weapons/w_fn_scar_h.mdl", "m9k_scar", 6000, 10, false, nil, false, {TEAM_GUN_SHADY}, "Rifles")
MakeM9kShipment("TAR-21", "models/weapons/w_imi_tar21.mdl", "m9k_tar21", 5000, 10, false, nil, false, {TEAM_GUN_SHADY}, "Rifles")
MakeM9kShipment("Val", "models/weapons/w_dmg_vally.mdl", "m9k_val", 5575, 10, false, nil, false, {TEAM_GUN_SHADY}, "Rifles")
MakeM9kShipment("SR-3M Vikhr", "models/weapons/w_dmg_vikhr.mdl", "m9k_vikhr", 5000, 10, false, nil, false, {TEAM_GUN_SHADY}, "Rifles")
MakeM9kShipment("Winchester 73", "models/weapons/w_winchester_1873.mdl", "m9k_winchester73", 3500, 10, false, nil, false, {TEAM_GUN_SHADY}, "Rifles")

--SHOTGUNS
MakeM9kShipment("1887 Winchester", "models/weapons/w_winchester_1887.mdl", "m9k_1887winchester", 4000, 10, false, nil, false, {TEAM_GUN_SHADY}, "Shotguns")
MakeM9kShipment("Double Barrel", "models/weapons/w_double_barrel_shotgun.mdl", "m9k_dbarrel", 2000, 10, false, nil, false, {TEAM_GUN_SHADY}, "Shotguns")
MakeM9kShipment("Jack Hammer", "models/weapons/w_pancor_jackhammer.mdl", "m9k_jackhammer", 8000, 10, false, nil, false, {TEAM_GUN_SHADY}, "Shotguns")
MakeM9kShipment("Benelli M3", "models/weapons/w_benelli_m3.mdl", "m9k_m3", 4500, 10, false, nil, false, {TEAM_GUN_SHADY}, "Shotguns")
MakeM9kShipment("Ithaca M37", "models/weapons/w_ithaca_m37.mdl", "m9k_ithacam37", 3000, 10, false, nil, false, {TEAM_GUN_SHADY}, "Shotguns")
MakeM9kShipment("Mossberg", "models/weapons/w_mossberg_590.mdl", "m9k_mossberg590", 3000, 10, false, nil, false, {TEAM_GUN_SHADY}, "Shotguns")
MakeM9kShipment("Remington 870", "models/weapons/w_remington_870_tact.mdl", "m9k_remington870", 2500, 10, false, nil, false, {TEAM_GUN_SHADY}, "Shotguns")
MakeM9kShipment("1897 Winchester", "models/weapons/w_winchester_1897_trench.mdl", "m9k_1897winchester", 4000, 10, false, nil, false, {TEAM_GUN_SHADY}, "Shotguns")
MakeM9kShipment("XM1014", "models/weapons/w_shot_xm1014.mdl", "weapon_mad_xm1014", 9000, 10, false, nil, false, {TEAM_GUN_SHADY}, "Shotguns")

--SNIPER RIFLES
MakeM9kShipment("SVT 40 Single", "models/weapons/w_svt_40.mdl", "m9k_svt40", 600, 1, false, 0, false, {TEAM_GUN_SHADY}, "Sniper Rifles")
MakeM9kShipment("Dragunov SVU", "models/weapons/w_dragunov_svu.mdl", "m9k_svu", 8000, 10, false, 0, false, {TEAM_GUN_SHADY}, "Sniper Rifles")
MakeM9kShipment("Dragunov SVU Single", "models/weapons/w_dragunov_svu.mdl", "m9k_svu", 900, 1, false, 0, false, {TEAM_GUN_SHADY}, "Sniper Rifles")
MakeM9kShipment("SVD Dragunov", "models/weapons/w_svd_dragunov.mdl", "m9k_dragunov", 8500, 10, false, 123, false, {TEAM_GUN_SHADY}, "Sniper Rifles")
MakeM9kShipment("SVD Dragunov Single", "models/weapons/w_svd_dragunov.mdl", "m9k_dragunov", 950, 1, false, 123, false, {TEAM_GUN_SHADY}, "Sniper Rifles")
MakeM9kShipment("Intervention", "models/weapons/w_snip_int.mdl", "m9k_intervention", 12500, 10, false, 0, false, {TEAM_GUN_SHADY}, "Sniper Rifles")
MakeM9kShipment("Intervention Single", "models/weapons/w_snip_int.mdl", "m9k_intervention", 1500, 1, false, 0, false, {TEAM_GUN_SHADY}, "Sniper Rifles")
MakeM9kShipment("PSG-1", "models/weapons/w_hk_psg1.mdl", "m9k_psg1", 7000, 10, false, 0, false, {TEAM_GUN_SHADY}, "Sniper Rifles")
MakeM9kShipment("PSG-1 Single", "models/weapons/w_hk_psg1.mdl", "m9k_psg1", 800, 1, false, 0, false, {TEAM_GUN_SHADY}, "Sniper Rifles")
MakeM9kShipment("AW 50", "models/weapons/w_acc_int_aw50.mdl", "m9k_aw50", 10000, 10, false, 123, false, {TEAM_GUN_SHADY}, "Sniper Rifles")
MakeM9kShipment("AW 50 Single", "models/weapons/w_acc_int_aw50.mdl", "m9k_aw50", 1200, 1, false, 123, false, {TEAM_GUN_SHADY}, "Sniper Rifles")
MakeM9kShipment("M24", "models/weapons/w_snip_m24_6.mdl", "m9k_m24", 7000, 10, false, 123, false, {TEAM_GUN_SHADY}, "Sniper Rifles")
MakeM9kShipment("M24 Single", "models/weapons/w_snip_m24_6.mdl", "m9k_m24", 775, 1, false, 123, false, {TEAM_GUN_SHADY}, "Sniper Rifles")
MakeM9kShipment("Remington 7615P", "models/weapons/w_remington_7615p.mdl", "m9k_remington7615p", 8000, 10, false, 123, false, {TEAM_GUN_SHADY}, "Sniper Rifles")
MakeM9kShipment("Remington 7615P Single", "models/weapons/w_remington_7615p.mdl", "m9k_remington7615p", 900, 1, false, 123, false, {TEAM_GUN_SHADY}, "Sniper Rifles")
MakeM9kShipment("Thompson Condender", "models/weapons/w_g2_contender.mdl", "m9k_contender", 5000, 10, false, 123, false, {TEAM_GUN_SHADY}, "Sniper Rifles")
MakeM9kShipment("Thompson Condender Single", "models/weapons/w_g2_contender.mdl", "m9k_contender", 600, 1, false, 123, false, {TEAM_GUN_SHADY}, "Sniper Rifles")

--MACHINE GUNS
MakeM9kShipment("FG42", "models/weapons/w_fg42.mdl", "m9k_fg42", 5000, 10, false, 123, false, {TEAM_GUN_SHADY}, "Machine Guns")
MakeM9kShipment("FG42 Single", "models/weapons/w_fg42.mdl", "m9k_fg42", 7550, 1, false, 123, false, {TEAM_GUN_SHADY}, "Machine Guns")
MakeM9kShipment("M60", "models/weapons/w_m60_machine_gun.mdl", "m9k_m60", 20000, 10, false, 123, false, {TEAM_GUN_SHADY}, "Machine Guns")
MakeM9kShipment("M60 Single", "models/weapons/w_m60_machine_gun.mdl", "m9k_m60", 7000, 1, false, 123, false, {TEAM_GUN_SHADY}, "Machine Guns")
MakeM9kShipment("Mini Gun Single", "models/weapons/w_m134_minigun.mdl", "m9k_minigun", 150000, 1, false, 0, false, {TEAM_BLACKMARKET}, "Machine Guns")
