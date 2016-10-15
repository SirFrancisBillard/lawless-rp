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

-- Pistols

DarkRP.createShipment("Glock", {
	model = "models/weapons/tfa_nmrih/w_fa_glock17.mdl",
	entity = "tfa_nmrih_g17",
	price = 2500,
	amount = 1,
	seperate = false,
	pricesep = nil,
	noship = false,
	allowed = {TEAM_GUN},
	category = "Pistols"
})

DarkRP.createShipment("Ruger", {
	model = "models/weapons/tfa_nmrih/w_fa_mkiii.mdl",
	entity = "tfa_nmrih_mkiii",
	price = 3500,
	amount = 1,
	seperate = false,
	pricesep = nil,
	noship = false,
	allowed = {TEAM_GUN},
	category = "Pistols"
})

DarkRP.createShipment("1911", {
	model = "models/weapons/tfa_nmrih/w_fa_1911.mdl",
	entity = "tfa_nmrih_1911",
	price = 3500,
	amount = 1,
	seperate = false,
	pricesep = nil,
	noship = false,
	allowed = {TEAM_GUN},
	category = "Pistols"
})

DarkRP.createShipment("Beretta", {
	model = "models/weapons/tfa_nmrih/w_fa_m92fs.mdl",
	entity = "tfa_nmrih_m92fs",
	price = 4500,
	amount = 1,
	seperate = false,
	pricesep = nil,
	noship = false,
	allowed = {TEAM_GUN},
	category = "Pistols"
})

DarkRP.createShipment("Smith & Wesson", {
	model = "models/weapons/tfa_nmrih/w_fa_sw686.mdl",
	entity = "tfa_nmrih_sw686",
	price = 4500,
	amount = 1,
	seperate = false,
	pricesep = nil,
	noship = false,
	allowed = {TEAM_GUN},
	category = "Pistols"
})

-- Rifles

DarkRP.createShipment("Siminov", {
	model = "models/weapons/tfa_nmrih/w_fa_sks.mdl",
	entity = "tfa_nmrih_sks",
	price = 10500,
	amount = 1,
	seperate = false,
	pricesep = nil,
	noship = false,
	allowed = {TEAM_GUN},
	category = "Rifles"
})

DarkRP.createShipment("Colt", {
	model = "models/weapons/tfa_nmrih/w_fa_m16a4_carryhandle.mdl",
	entity = "tfa_nmrih_m16_ch",
	price = 12500,
	amount = 1,
	seperate = false,
	pricesep = nil,
	noship = false,
	allowed = {TEAM_GUN},
	category = "Rifles"
})

DarkRP.createShipment("AK-47", {
	model = "models/weapons/tfa_nmrih/w_fa_cz858.mdl",
	entity = "tfa_nmrih_cz",
	price = 16500,
	amount = 1,
	seperate = false,
	pricesep = nil,
	noship = false,
	allowed = {TEAM_GUN},
	category = "Rifles"
})

-- Shotguns

DarkRP.createShipment("Mossberg", {
	model = "models/weapons/tfa_nmrih/w_fa_500a.mdl",
	entity = "tfa_nmrih_500a",
	price = 14500,
	amount = 1,
	seperate = false,
	pricesep = nil,
	noship = false,
	allowed = {TEAM_GUN},
	category = "Shotguns"
})

DarkRP.createShipment("Perennia", {
	model = "models/weapons/tfa_nmrih/w_fa_sv10.mdl",
	entity = "tfa_nmrih_sv10",
	price = 16500,
	amount = 1,
	seperate = false,
	pricesep = nil,
	noship = false,
	allowed = {TEAM_GUN},
	category = "Shotguns"
})

DarkRP.createShipment("Remington", {
	model = "models/weapons/tfa_nmrih/v_fa_870.mdl",
	entity = "tfa_nmrih_870",
	price = 18500,
	amount = 1,
	seperate = false,
	pricesep = nil,
	noship = false,
	allowed = {TEAM_GUN},
	category = "Shotguns"
})

-- Other

DarkRP.createShipment("Flare Gun", {
	model = "models/weapons/tfa_nmrih/w_fa_flaregun.mdl",
	entity = "tfa_nmrih_flaregun",
	price = 3500,
	amount = 1,
	seperate = false,
	pricesep = nil,
	noship = false,
	allowed = {TEAM_GUN},
	category = "Other"
})
