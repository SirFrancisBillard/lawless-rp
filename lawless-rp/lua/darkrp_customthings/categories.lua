--[[-----------------------------------------------------------------------
Categories
---------------------------------------------------------------------------
The categories of the default F4 menu.

Please read this page for more information:
http://wiki.darkrp.com/index.php/DarkRP:Categories

In case that page can't be reached, here's an example with explanation:

DarkRP.createCategory{
	name = "Citizens", -- The name of the category.
	categorises = "jobs", -- What it categorises. MUST be one of "jobs", "entities", "shipments", "weapons", "vehicles", "ammo".
	startExpanded = true, -- Whether the category is expanded when you open the F4 menu.
	color = Color(0, 107, 0, 255), -- The color of the category header.
	canSee = function(ply) return true end, -- OPTIONAL: whether the player can see this category AND EVERYTHING IN IT.
	sortOrder = 100, -- OPTIONAL: With this you can decide where your category is. Low numbers to put it on top, high numbers to put it on the bottom. It's 100 by default.
}


Add new categories under the next line!
---------------------------------------------------------------------------]]

-- Jobs

DarkRP.createCategory{
	name = "Citizens",
	categorises = "jobs",
	startExpanded = true,
	color = Color(0, 107, 0, 255),
	canSee = function(ply) return true end,
	sortOrder = 95,
}

DarkRP.createCategory{
	name = "Criminals",
	categorises = "jobs",
	startExpanded = true,
	color = Color(75, 75, 75, 255),
	canSee = function(ply) return true end,
	sortOrder = 96,
}

DarkRP.createCategory{
	name = "Government",
	categorises = "jobs",
	startExpanded = true,
	color = Color(25, 25, 170, 255),
	canSee = function(ply) return true end,
	sortOrder = 97,
}

DarkRP.createCategory{
	name = "Dealers",
	categorises = "jobs",
	startExpanded = true,
	color = Color(0, 255, 200, 255),
	canSee = function(ply) return true end,
	sortOrder = 98,
}

DarkRP.createCategory{
	name = "Medical",
	categorises = "jobs",
	startExpanded = true,
	color = Color(47, 79, 79, 255),
	canSee = function(ply) return true end,
	sortOrder = 99,
}

DarkRP.createCategory{
	name = "Homeless",
	categorises = "jobs",
	startExpanded = true,
	color = Color(47, 79, 79, 255),
	canSee = function(ply) return true end,
	sortOrder = 100,
}

DarkRP.createCategory{
	name = "Rebels",
	categorises = "jobs",
	startExpanded = true,
	color = Color(75, 75, 75, 255),
	canSee = function(ply) return true end,
	sortOrder = 101,
}

DarkRP.createCategory{
	name = "Characters",
	categorises = "jobs",
	startExpanded = true,
	color = Color(244, 66, 209, 255),
	canSee = function(ply) return true end,
	sortOrder = 102,
}

-- Entities

DarkRP.createCategory{
	name = "Black Market",
	categorises = "entities",
	startExpanded = true,
	color = Color(0, 107, 0, 255),
	canSee = function(ply) return true end,
	sortOrder = 100,
}

DarkRP.createCategory{
	name = "Contraband",
	categorises = "entities",
	startExpanded = true,
	color = Color(0, 107, 0, 255),
	canSee = function(ply) return true end,
	sortOrder = 100,
}

DarkRP.createCategory{
	name = "Drugs",
	categorises = "entities",
	startExpanded = true,
	color = Color(0, 107, 0, 255),
	canSee = function(ply) return true end,
	sortOrder = 100,
}

DarkRP.createCategory{
	name = "Ammunition",
	categorises = "entities",
	startExpanded = true,
	color = Color(0, 107, 0, 255),
	canSee = function(ply) return true end,
	sortOrder = 100,
}

DarkRP.createCategory{
	name = "Weapon Crafting",
	categorises = "entities",
	startExpanded = true,
	color = Color(0, 107, 0, 255),
	canSee = function(ply) return true end,
	sortOrder = 100,
}

DarkRP.createCategory{
	name = "Pharmaceutical",
	categorises = "entities",
	startExpanded = true,
	color = Color(0, 107, 0, 255),
	canSee = function(ply) return true end,
	sortOrder = 100,
}

-- Shipments

DarkRP.createCategory{
	name = "Raiding Tools",
	categorises = "shipments",
	startExpanded = true,
	color = Color(0, 107, 0, 255),
	canSee = function(ply) return true end,
	sortOrder = 10,
}

DarkRP.createCategory{
	name = "Grenades",
	categorises = "shipments",
	startExpanded = true,
	color = Color(0, 107, 0, 255),
	canSee = function(ply) return true end,
	sortOrder = 20,
}

DarkRP.createCategory{
	name = "Pistols",
	categorises = "shipments",
	startExpanded = true,
	color = Color(0, 107, 0, 255),
	canSee = function(ply) return true end,
	sortOrder = 100,
}

DarkRP.createCategory{
	name = "Rifles",
	categorises = "shipments",
	startExpanded = true,
	color = Color(0, 107, 0, 255),
	canSee = function(ply) return true end,
	sortOrder = 100,
}

DarkRP.createCategory{
	name = "Shotguns",
	categorises = "shipments",
	startExpanded = true,
	color = Color(0, 107, 0, 255),
	canSee = function(ply) return true end,
	sortOrder = 100,
}

DarkRP.createCategory{
	name = "Sniper Rifles",
	categorises = "shipments",
	startExpanded = true,
	color = Color(0, 107, 0, 255),
	canSee = function(ply) return true end,
	sortOrder = 100,
}

DarkRP.createCategory{
	name = "Machine Guns",
	categorises = "shipments",
	startExpanded = true,
	color = Color(0, 107, 0, 255),
	canSee = function(ply) return true end,
	sortOrder = 100,
}

DarkRP.createCategory{
	name = "Submachine Guns",
	categorises = "shipments",
	startExpanded = true,
	color = Color(0, 107, 0, 255),
	canSee = function(ply) return true end,
	sortOrder = 100,
}
