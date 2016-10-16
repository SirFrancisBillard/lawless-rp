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
	description = [[Locksmiths can use their knowledge and lockpicking ability to commit crimes or help the government.]],
	weapons = {},
	command = "locksmith",
	max = 4,
	salary = GAMEMODE.Config.normalsalary * (1 / 3),
	admin = 0,
	vote = false,
	hasLicense = false,
	candemote = false,
	category = "Citizens",
})

TEAM_HACKER = DarkRP.createJob("Hacker", {
	color = Color(75, 75, 75, 255),
	model = "models/player/magnusson.mdl",
	description = [[Hackers can use their knowledge and hacking ability to commit crimes or help the government.]],
	weapons = {},
	command = "hacker",
	max = 4,
	salary = GAMEMODE.Config.normalsalary * (1 / 3),
	admin = 0,
	vote = false,
	hasLicense = false,
	candemote = false,
	category = "Citizens",
})

TEAM_DOCTOR = DarkRP.createJob("Doctor", {
	color = Color(47, 79, 79, 255),
	model = "models/player/kleiner.mdl",
	description = [[Doctors can use their knowledge and healing ability to aid criminals or government.]],
	weapons = {},
	command = "doctor",
	max = 4,
	salary = GAMEMODE.Config.normalsalary,
	admin = 0,
	vote = false,
	hasLicense = false,
	candemote = false,
	category = "Citizens",
})

TEAM_GUN = DarkRP.createJob("Gun Dealer", {
	color = Color(255, 140, 0, 255),
	model = "models/player/monk.mdl",
	description = [[Gun Dealers are the only people who can sell high-tier illegal weaponry to other people.
		Make sure you aren't caught selling illegal firearms to the public! You might get arrested!]],
	weapons = {},
	command = "gundealer",
	max = 2,
	salary = GAMEMODE.Config.normalsalary * (1 / 3),
	admin = 0,
	vote = false,
	hasLicense = false,
	category = "Citizens",
})

TEAM_BLACKMARKET = DarkRP.createJob("Black Market Dealer", {
	color = Color(0, 200, 255, 255),
	model = "models/player/eli.mdl",
	description = [[Black Market dealers sell highly illegal items to the general public.
		Make sure you don't get caught!]],
	weapons = {},
	command = "blackmarket",
	max = 2,
	salary = GAMEMODE.Config.normalsalary * (1 / 3),
	admin = 0,
	vote = false,
	hasLicense = false,
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
	weapons = {"arrest_stick", "unarrest_stick", "tfa_nmrih_m16_ch", "tfa_nmrih_m92fs", "stunstick", "door_ram", "weaponchecker"},
	command = "police",
	max = 12,
	salary = GAMEMODE.Config.normalsalary * 1.45,
	admin = 1,
	vote = true,
	hasLicense = true,
	ammo = {
		["pistol"] = 60,
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
	salary = GAMEMODE.Config.normalsalary * 1.89,
	admin = 0,
	vote = true,
	hasLicense = false,
	mayor = true,
	category = "Government",
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
-- DarkRP.addHitmanTeam(TEAM_MOB)
