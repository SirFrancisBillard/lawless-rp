
local Hints = {
	"Weapons with large capacity, like the M60, are excellent for sustained fire. Use them to provide covering fire for teammates and supress enemies.",
	"When using a USP or M4A1, press the use key and secondary attack simultaneously to silence your weapon. This will reduce damage but will conceal your position when firing.",
	"When using a glock or famas, press the use key and secondary attack simultaneously to toggle burst fire.",
	"The M249 and minigun are devastating at close ranges. Use them when raiding small rooms.",
	"The double barrel's secondary fire outputs massive amounts of damage, but uses more ammunition. Use it to eliminate heavily armored personnel instantly.",
	"Good positioning and the element of surprise can turn the tables on any firefight. Use this to your advantage by strategically placing props and remaining unseen.",
	"Shady gun dealers sell much better weapons, but be careful, they can scam you!",
	"The deagle is capable of instantly killing personnel within 100 meters, but is very expensive and has high recoil for a pistol.",
	"C4, rockets, and grenade launchers can blow down props and doors. Use them when raiding well-defended bases."
}

timer.Create("ShowRoleplayHints", 300, 0, function()
	PrintMessage(HUD_PRINTTALK, Hints[math.random(#Hints)])
end)
