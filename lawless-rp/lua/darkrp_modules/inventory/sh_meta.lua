local meta = FindMetaTable("Player")

function meta:HasItem(id)
	return self:GetAmmoCount(id) != 0
end

function meta:GetInventory()
	local inv = {}
	for k, v in pairs(game.BuildAmmoTypes()) do
		if self:HasItem(v.name) then
			inv[v.name] = self:GetAmmoCount(v.name)
		end
	end
	return inv
end

function meta:UseItem(id)
	if not self:HasItem(id) then return end
	
end
