g_ItemTable = {}

function RegisterInventoryItem(tab)
	local item = tab
	if not item.id or not item.name then return end
	game.AddAmmoType({name = item.id, dmgtype = DMG_BULLET})
	if CLIENT then
		language.Add(item.id .. "_ammo", item.name)
	end
	item.use = item.use or function(ply) end
	item.model = item.model or "models/error.mdl"
	item.price = item.price or 10
	concommand.Add("_____use_item_" .. item.id, function(ply, cmd, args)
		if ply:HasItem(item.id) and SERVER then
			ply:TakeItem(item.id, 1)
			item.use(ply)
		end
	end)
	g_ItemTable[item.id] = item
end
