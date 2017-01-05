--[[
local ply = LocalPlayer()

function GM:SpawnMenuEnabled()
	return false
end

function GM:OnSpawnMenuOpen()
	OpenInventoryMenu()
end

function GM:OnSpawnMenuClose()
	CloseInventoryMenu()
end

function UseItem(id)
	RunConsoleCommand("_____use_item_" .. id)
end

function OpenInventoryMenu()
	g_InvMenu = vgui.Create("DFrame")
	g_InvMenu:SetSize(600, 300)
	g_InvMenu:Center()
	g_InvMenu:SetDraggable(false)
	g_InvMenu:MakePopup()
	g_InvMenu:SetTitle(ply:Nick() .. " - Inventory")

	local invPanelLeft = vgui.Create("DPanel", g_InvMenu)
	invPanelLeft:Dock(LEFT)

	local invPanelRight = vgui.Create("DScrollPanel", g_InvMenu)
	invPanelRight:Dock(RIGHT)

	local invPanels = {}
	local invModels = {}
	local invButtons = {}

	local inv = ply:GetInventory()
	for k, v in pairs(inv) do
		invPanels[#invPanels + 1] = vgui.Create("DPanel", invPanelRight)
		invPanels[#invPanels]:SetSize(0, 30)
		invPanels[#invPanels]:Dock(TOP)
		invModels[#invModels + 1] = vgui.Create("DModelPanel", invPanels[#invPanels])
		invModels[#invModels]:SetSize(30, 0)
		invModels[#invModels]:Dock(LEFT)
		invModels[#invModels]:SetModel(g_ItemTable[k][model])
		invButtons[#invButtons + 1] = vgui.Create("DButton", invPanels[#invPanels])
		invButtons[#invButtons]:Dock(RIGHT)
		invButtons[#invButtons]:SetText(g_ItemTable[k][name] .. " (" .. v .. ")")
		invButtons[#invButtons].DoClick = function()
			UseItem(g_ItemTable[k])
			RefreshInventoryMenu()
		end
	end
end

function CloseInventoryMenu()
	if IsValid(g_InvMenu) then
		g_InvMenu:Remove()
	end
end

function RefreshInventoryMenu()
	CloseInventoryMenu()
	OpenInventoryMenu()
end
]]
