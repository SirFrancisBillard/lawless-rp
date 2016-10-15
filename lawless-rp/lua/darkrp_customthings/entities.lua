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
	max = 4,
	cmd = "buymoneyprinter",
})

DarkRP.createEntity("Pot", {
	ent = "contra_weedplant",
	model = "models/props_junk/terracotta01.mdl",
	price = 600,
	max = 4,
	cmd = "buypot",
})

DarkRP.createEntity("Seed", {
	ent = "contra_seed",
	model = "models/weapons/w_bugbait.mdl",
	price = 200,
	max = 2,
	cmd = "buyseed",
})

