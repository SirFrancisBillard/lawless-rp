--[[---------------------------------------------------------------------------
DarkRP custom jobs
---------------------------------------------------------------------------

This file contains your custom jobs.
This file should also contain jobs from DarkRP that you edited.

Note: If you want to edit a default DarkRP job, first disable it in darkrp_config/disabled_defaults.lua
	Once you've done that, copy and paste the job to this file and edit it.

The default jobs can be found here:
https://github.com/FPtje/DarkRP/blob/master/gamemode/config/jobrelated.lua

For examples and explanation please visit this wiki page:
http://wiki.darkrp.com/index.php/DarkRP:CustomJobFields


Add jobs under the following line:
---------------------------------------------------------------------------]]

TEAM_CITIZEN = DarkRP.createJob("Citizen", {
	color = Color(20, 150, 20, 255),
	model = {
		"models/player/Group01/Female_01.mdl",
		"models/player/Group01/Female_02.mdl",
		"models/player/Group01/Female_03.mdl",
		"models/player/Group01/Female_04.mdl",
		"models/player/Group01/Female_06.mdl",
		"models/player/group01/male_01.mdl",
		"models/player/Group01/Male_02.mdl",
		"models/player/Group01/male_03.mdl",
		"models/player/Group01/Male_04.mdl",
		"models/player/Group01/Male_05.mdl",
		"models/player/Group01/Male_06.mdl",
		"models/player/Group01/Male_07.mdl",
		"models/player/Group01/Male_08.mdl",
		"models/player/Group01/Male_09.mdl"
	},
	description = [[The Citizen is the most basic level of society you can hold besides being a hobo. You have no specific role in city life.]],
	weapons = {},
	command = "citizen",
	max = 0,
	salary = GAMEMODE.Config.normalsalary,
	admin = 0,
	vote = false,
	hasLicense = false,
	candemote = false,
	category = "Citizens",
})

TEAM_LOCKSMITH = DarkRP.createJob("Locksmith", {
	color = Color(150, 150, 75, 255),
	model = "models/player/odessa.mdl",
	description = [[Locksmiths can use their knowledge and lockpicking ability to commit crimes or help the government.]],
	weapons = {"lockpick"},
	command = "locksmith",
	max = 4,
	salary = GAMEMODE.Config.normalsalary,
	admin = 0,
	vote = false,
	hasLicense = false,
	candemote = false,
	category = "Citizens",
})

TEAM_HACKER = DarkRP.createJob("Hacker", {
	color = Color(150, 15, 75, 255),
	model = "models/player/magnusson.mdl",
	description = [[Hackers can use their knowledge and hacking ability to commit crimes or help the government.
		Can crack keypads to get into secure bases.]],
	weapons = {"keypad_cracker"},
	command = "hacker",
	max = 4,
	salary = GAMEMODE.Config.normalsalary,
	admin = 0,
	vote = false,
	hasLicense = false,
	candemote = false,
	category = "Citizens",
})

TEAM_BAR = DarkRP.createJob("Bartender", {
	color = Color(100, 100, 200, 255),
	model = "models/player/mossman.mdl",
	description = [[Bartenders have an liquor license, allowing them to set up a bar and sell alcohol.
		Scamming people is NOT allowed.
		Selling alcohol is legal.]],
	weapons = {},
	command = "bartender",
	max = 4,
	salary = GAMEMODE.Config.normalsalary,
	admin = 0,
	vote = false,
	hasLicense = false,
	candemote = false,
	category = "Citizens",
})

TEAM_DAUGHTER = DarkRP.createJob("Mayor's Daughter", {
	color = Color(200, 125, 200, 255),
	model = "models/player/alyx.mdl",
	description = [[The mayor's daughter makes more money than the average citizen, however she is a prime target for kidnapping.
		Be careful.]],
	weapons = {},
	command = "daughter",
	max = 1,
	salary = GAMEMODE.Config.normalsalary * 2,
	admin = 0,
	vote = false,
	hasLicense = false,
	candemote = false,
	category = "Citizens",
})

TEAM_POLICE = DarkRP.createJob("Police Officer", {
	color = Color(25, 25, 170, 255),
	model = {"models/player/police.mdl", "models/player/police_fem.mdl"},
	description = [[The protector of every citizen that lives in the city.
		You are equipped with standard issue government weaponry.
		You have the power to arrest criminals and protect innocents.
		Hit a player with your arrest baton to put them in jail.
		Bash a player with a stunstick and they may learn to obey the law.
		The Battering Ram can break down the door of a criminal, with a warrant for their arrest.
		The Battering Ram can also unfreeze frozen props (if enabled).
		Type /wanted <name> to alert the public to the presence of a criminal.]],
	weapons = {"arrest_stick", "unarrest_stick", "weapon_cs_mp5", "weapon_cs_glock", "weapon_cs_flash", "weapon_pepperspray", "stunstick", "door_ram", "weaponchecker"},
	command = "police",
	max = 12,
	salary = GAMEMODE.Config.normalsalary * 2,
	admin = 0,
	vote = true,
	hasLicense = true,
	PlayerSpawn = function(ply)
		ply:SetMaxHealth(250)
		ply:SetHealth(250)
		ply:SetArmor(250)
	end,
	ammo = {
		["css_9mm"] = 360,
		["css_flashgrenade"] = 4,
		["pepperspray_ammo"] = 9999
	},
	category = "Government",
})

TEAM_CHIEF = DarkRP.createJob("Police Chief", {
	color = Color(25, 25, 170, 255),
	model = "models/player/combine_soldier_prisonguard.mdl",
	description = [[The Chief is the leader of the Civil Protection unit.
		Coordinate the police force to enforce law in the city.
		Hit a player with arrest baton to put them in jail.
		Bash a player with a stunstick and they may learn to obey the law.
		The Battering Ram can break down the door of a criminal, with a warrant for his/her arrest.
		Type /wanted <name> to alert the public to the presence of a criminal.
		Type /jailpos to set the Jail Position.]],
	weapons = {"arrest_stick", "unarrest_stick", "weapon_cs_m4", "weapon_cs_deagle", "weapon_cs_flash", "weapon_pepperspray", "stunstick", "door_ram", "weaponchecker"},
	command = "chief",
	max = 1,
	salary = GAMEMODE.Config.normalsalary * 3,
	admin = 0,
	vote = true,
	hasLicense = true,
	chief = true,
	PlayerSpawn = function(ply)
		ply:SetMaxHealth(500)
		ply:SetHealth(500)
		ply:SetArmor(250)
	end,
	ammo = {
		["css_556mm"] = 240,
		["css_50ae"] = 56,
		["css_flashgrenade"] = 10,
		["pepperspray_ammo"] = 9999
	},
	category = "Government",
})

TEAM_SWAT = DarkRP.createJob("SWAT", {
	color = Color(25, 25, 170, 255),
	model = "models/player/combine_soldier_prisonguard.mdl",
	description = [[The SWAT are an elite special forces unit, called in to neutralize extremely dangerous threats.]],
	weapons = {"arrest_stick", "unarrest_stick", "weapon_cs_m249", "weapon_cs_m4", "weapon_cs_awp", "weapon_cs_deagle", "weapon_cs_usp", "weapon_cs_flash", "weapon_cs_smoke", "weapon_pepperspray", "stunstick", "door_ram", "weaponchecker"},
	command = "swat",
	max = 4,
	salary = GAMEMODE.Config.normalsalary * 4,
	admin = 1,
	vote = false,
	hasLicense = true,
	chief = true,
	PlayerSpawn = function(ply)
		ply:SetMaxHealth(1000)
		ply:SetHealth(1000)
		ply:SetArmor(250)
	end,
	ammo = {
		["css_556mm"] = 2400,
		["css_50ae"] = 560,
		["css_338"] = 600,
		["css_45acp"] = 600,
		["css_flashgrenade"] = 50,
		["css_smokegrenade"] = 50,
		["pepperspray_ammo"] = 9999
	},
	category = "Government",
})

TEAM_MAYOR = DarkRP.createJob("Mayor", {
	color = Color(150, 20, 20, 255),
	model = "models/player/breen.mdl",
	description = [[The Mayor of the city creates laws to govern the city.
		If you are the mayor you may create and accept warrants.
		Type /wanted <name>  to warrant a player.
		Type /jailpos to set the Jail Position.
		Type /lockdown initiate a lockdown of the city.
		Everyone must be inside during a lockdown.
		The cops patrol the area.
		/unlockdown to end a lockdown]],
	weapons = {},
	command = "mayor",
	max = 1,
	salary = GAMEMODE.Config.normalsalary * 5,
	admin = 0,
	vote = true,
	hasLicense = false,
	mayor = true,
	category = "Government",
})

TEAM_GUN_SHADY = DarkRP.createJob("Shady Gun Dealer", {
	color = Color(255, 140, 0, 255),
	model = "models/player/monk.mdl",
	description = [[Shady gun dealers are the only people who can sell high-tier automatic weapons and shotguns.
		Scamming people is allowed.
		Selling high-tier weapons is illegal.]],
	weapons = {},
	command = "shadygun",
	max = 4,
	salary = GAMEMODE.Config.normalsalary / 5,
	admin = 0,
	vote = false,
	hasLicense = false,
	category = "Dealers",
})

TEAM_GUN_FAIR = DarkRP.createJob("Government Gun Dealer", {
	color = Color(255, 140, 0, 255),
	model = "models/player/monk.mdl",
	description = [[Government gun dealers can sell low-tier firearms.
		Scamming people is NOT allowed.
		Selling low-tier firearms is legal.]],
	weapons = {},
	command = "governmentgun",
	max = 4,
	salary = GAMEMODE.Config.normalsalary,
	admin = 0,
	vote = false,
	hasLicense = false,
	category = "Dealers",
})

TEAM_BLACKMARKET = DarkRP.createJob("Black Market Dealer", {
	color = Color(45, 255, 255, 255),
	model = "models/player/eli.mdl",
	description = [[Black market dealers can sell highly illegal items to other people.
		Scamming people is allowed.
		Selling black market items is illegal.]],
	weapons = {},
	command = "blackmarket",
	max = 6,
	salary = GAMEMODE.Config.normalsalary / 5,
	admin = 0,
	vote = false,
	hasLicense = false,
	category = "Dealers",
})

TEAM_DRUG = DarkRP.createJob("Drug Dealer", {
	color = Color(45, 255, 255, 255),
	model = "models/player/soldier_stripped.mdl",
	description = [[Drug dealers sell drugs to people.
		Scamming people is allowed.
		Selling drugs is illegal.]],
	weapons = {},
	command = "drug",
	max = 4,
	salary = GAMEMODE.Config.normalsalary / 5,
	admin = 0,
	vote = false,
	hasLicense = false,
	category = "Dealers",
})

TEAM_EXPLOSIVES = DarkRP.createJob("Explosive Dealer", {
	color = Color(45, 255, 255, 255),
	model = "models/player/soldier_stripped.mdl",
	description = [[Explosive dealers sell explosive weapons and raiding tools.
		Scamming people is allowed.
		Selling explosives is highly illegal.]],
	weapons = {},
	command = "explosive",
	max = 4,
	salary = GAMEMODE.Config.normalsalary / 5,
	admin = 0,
	vote = false,
	hasLicense = false,
	category = "Dealers",
})

TEAM_MEDIC = DarkRP.createJob("Paramedic", {
	color = Color(47, 79, 79, 255),
	model = {"models/player/hostage/hostage_02.mdl", "models/player/hostage/hostage_03.mdl"},
	description = [[Paramedics charge into the fray to heal any wounded people.
		Can work for free or demand payment.
		Can work for criminals or the government.]],
	weapons = {"med_kit"},
	command = "paramedic",
	max = 4,
	salary = GAMEMODE.Config.normalsalary,
	admin = 0,
	vote = false,
	hasLicense = false,
	category = "Medical",
})

TEAM_SURGEON = DarkRP.createJob("Surgeon", {
	color = Color(47, 79, 79, 255),
	model = "models/player/kleiner.mdl",
	description = [[Surgeons can set up hospitals to perform surgery.
		Extract bullets out of flesh, amputate limbs, and all the other fucked up stuff you do.
		Can set up a hospital where people come to heal or charge into the battle to team up with paramedics.]],
	weapons = {"med_kit", "weapon_cs_knife"},
	command = "surgeon",
	max = 2,
	salary = GAMEMODE.Config.normalsalary,
	admin = 0,
	vote = false,
	hasLicense = false,
	category = "Medical",
})

TEAM_THIEF = DarkRP.createJob("Thief", {
	color = Color(75, 75, 75, 255),
	model = {"models/player/phoenix.mdl", "models/player/arctic.mdl"},
	description = [[Thieves break into homes and steal things.]],
	weapons = {"lockpick"},
	command = "thief",
	max = 8,
	salary = GAMEMODE.Config.normalsalary / 5,
	admin = 0,
	vote = false,
	hasLicense = false,
	candemote = false,
	category = "Criminals",
})

TEAM_HITMAN = DarkRP.createJob("Hitman", {
	color = Color(75, 75, 75, 255),
	model = "models/player/leet.mdl",
	description = [[Hitmen get paid to kill people.]],
	weapons = {"weapon_cs_glock"},
	command = "hitman",
	max = 2,
	salary = GAMEMODE.Config.normalsalary / 5,
	admin = 0,
	vote = false,
	hasLicense = false,
	candemote = false,
	category = "Criminals",
})

TEAM_REBEL = DarkRP.createJob("Rebel", {
	color = Color(75, 75, 75, 255),
	model = {
		"models/player/Group03/Female_01.mdl",
		"models/player/Group03/Female_02.mdl",
		"models/player/Group03/Female_03.mdl",
		"models/player/Group03/Female_04.mdl",
		"models/player/Group03/Female_06.mdl",
		"models/player/group03/male_01.mdl",
		"models/player/Group03/Male_02.mdl",
		"models/player/Group03/male_03.mdl",
		"models/player/Group03/Male_04.mdl",
		"models/player/Group03/Male_05.mdl",
		"models/player/Group03/Male_06.mdl",
		"models/player/Group03/Male_07.mdl",
		"models/player/Group03/Male_08.mdl",
		"models/player/Group03/Male_09.mdl"
	},
	description = [[Follow orders from the rebel leader and start a war with the government.]],
	weapons = {"weapon_cs_glock"},
	command = "rebel",
	max = 12,
	salary = GAMEMODE.Config.normalsalary / 5,
	admin = 0,
	vote = false,
	hasLicense = false,
	candemote = false,
	ammo = {
		["css_9mm"] = 180,
	},
	category = "Rebels",
})

TEAM_REBELLEADER = DarkRP.createJob("Rebel Leader", {
	color = Color(25, 25, 25, 255),
	model = "models/player/gman_high.mdl",
	description = [[The rebel leader leads the rebellion into a war against the government.
		Recruit memebers into your rebellion and start a war
		Can recruit not only rebels, but citizens, criminals, and dealers.]],
	weapons = {"weapon_cs_deagle", "lockpick", "keypad_cracker"},
	command = "rebelleader",
	max = 1,
	salary = GAMEMODE.Config.normalsalary * 2,
	admin = 0,
	vote = false,
	hasLicense = false,
	candemote = false,
	ammo = {
		["css_50ae"] = 56,
	},
	category = "Rebels",
})

TEAM_HOBO = DarkRP.createJob("Hobo", {
	color = Color(80, 45, 0, 255),
	model = "models/player/corpse1.mdl",
	description = [[The lowest member of society. Everybody laughs at you.
		You have no home.
		Beg for your food and money
		Sing for everyone who passes to get money
		Make your own wooden home somewhere in a corner or outside someone else's door]],
	weapons = {"weapon_bugbait"},
	command = "hobo",
	max = 4,
	salary = 0,
	admin = 0,
	vote = false,
	hasLicense = false,
	candemote = false,
	hobo = true,
	category = "Homeless",
})

TEAM_SUPERHOBO = DarkRP.createJob("Super Hobo", {
	color = Color(80, 45, 0, 255),
	model = "models/player/charple.mdl",
	description = [[The highest member of the lowest member of society.
		You lead the hobos with your makeshift pistol.
		You carry a bent paperclip to pick locks.]],
	weapons = {"weapon_bugbait", "weapon_cs_glock", "lockpick"},
	command = "superhobo",
	max = 1,
	salary = 1,
	admin = 0,
	vote = false,
	hasLicense = false,
	candemote = false,
	hobo = true,
	category = "Homeless",
})

--[[---------------------------------------------------------------------------
Define which team joining players spawn into and what team you change to if demoted
---------------------------------------------------------------------------]]
GAMEMODE.DefaultTeam = TEAM_CITIZEN


--[[---------------------------------------------------------------------------
Define which teams belong to civil protection
Civil protection can set warrants, make people wanted and do some other police related things
---------------------------------------------------------------------------]]
GAMEMODE.CivilProtection = {
	[TEAM_POLICE] = true,
	[TEAM_MAYOR] = true,
}

--[[---------------------------------------------------------------------------
Jobs that are hitmen (enables the hitman menu)
---------------------------------------------------------------------------]]
DarkRP.addHitmanTeam(TEAM_HITMAN)

-- CHARACTER JOBS

TEAM_BILLCLINTON = DarkRP.createJob("Bill Clinton", {
	color = Color(244, 66, 209, 255),
	model = "models/player/hostage/hostage_02.mdl",
	description = [[You did not have sexual relations with that woman.]],
	weapons = {},
	command = "billclinton",
	max = 1,
	salary = GAMEMODE.Config.normalsalary,
	admin = 0,
	vote = false,
	hasLicense = false,
	category = "Characters",
})
