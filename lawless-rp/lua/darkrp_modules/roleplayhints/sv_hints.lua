
local Hints = {
	-- "Don't like dropping your items on death? Be more scared of dying!",
	-- "Don't like dropping your items when arrested? Don't get arrested!",
	-- "Wish to be a police officer? Be a vigilante instead!",
	"Witnessed an RDM? Tell the police!",
	-- "Ever get that feeling where you just want to shoot somebody? Go ahead!",
	"Did the person you are mugging pull a gun? Shoot them!",
	"You're a thief because you steal, you don't steal because you're a thief.",
	"Wish you could become a job, but can't find it on the menu? Roleplay it!",
	"Want to be part of the Mafia? Roleplay it!",
	-- "Want to be part of a gang? Make one! There is nothing stopping you.",
	-- "Did somebody raid you without adverting? Put up better security next time!",
	-- "Are you getting mugged, kidnapped, or robbed? Pull a gun!",
	-- "Want to be a gangster as a citizen? Go ahead!",
	-- "Think the police are OP? Don't shoot people then!",
	-- "Think guns should be cheaper? Don't do anything that requires a gun!",
	"Don't like the mayor's laws? Assassinate him!",
	"Bored? Start a war with the government!"
}

timer.Create("ShowRoleplayHints", 360, 0, function()
	PrintMessage(HUD_PRINTTALK, Hints[math.random(#Hints)])
end)
