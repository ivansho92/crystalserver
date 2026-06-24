local outfits = {
	["Citizen"] = {id = {136, 128}, storage = 10001},
	["Hunter"] = {id = {137, 129}, storage = 10002},
	["Knight"] = {id = {139, 131}, storage = 10003},
	["Noblewoman"] = {id = {140, 132}, storage = 10004},
	["Summoner"] = {id = {141, 133}, storage = 10005},
	["Warrior"] = {id = {142, 134}, storage = 10006},
	["Barbarian"] = {id = {147, 143}, storage = 10007},
	["Wizard"] = {id = {149, 145}, storage = 10008},
	["Druid"] = {id = {148, 144}, storage = 10009},
	["Oriental"] = {id = {150, 146}, storage = 10010},
	["Pirate"] = {id = {155, 151}, storage = 10011},
	["Assassin"] = {id = {156, 152}, storage = 10012},
	["Beggar"] = {id = {157, 153}, storage = 10013},
	["Shaman"] = {id = {158, 154}, storage = 10014},
	["Norseman"] = {id = {252, 251}, storage = 10015},
	["Nightmare"] = {id = {269, 268}, storage = 10016},
	["Jester"] = {id = {270, 273}, storage = 10017},
	["Brotherhood"] = {id = {279, 278}, storage = 10018},
	["Demonhunter"] = {id = {288, 289}, storage = 10019},
	["Yalaharian"] = {id = {324, 325}, storage = 10020},
	["Warmaster"] = {id = {336, 335}, storage = 10021},
	["Wayfarer"] = {id = {366, 367}, storage = 10022},
	["Afflicted"] = {id = {431, 430}, storage = 10023},
	["Elementalist"] = {id = {433, 432}, storage = 10024},
	["Deepling"] = {id = {464, 463}, storage = 10025},
	["Insectoid"] = {id = {466, 465}, storage = 10026},
	["Crystal Warlord"] = {id = {513, 512}, storage = 10027},
	["Soil Guardian"] = {id = {514, 516}, storage = 10028}
}

local function sendAddonDollModal(player, item)
	local window = ModalWindow({
		title = "Choose Your Outfit Addon",
		message = "Select one outfit to receive full addons:"
	})

	local addedChoices = 0
	for name, data in pairs(outfits) do
		if player:getStorageValue(data.storage) ~= 1 then
			addedChoices = addedChoices + 1
			window:addChoice(name, function(player, button, choice)
				if button.name ~= "Select" then return true end

				-- Doble verificación por seguridad
				if player:getStorageValue(data.storage) == 1 then
					player:sendCancelMessage("You already received the addons for this outfit.")
					player:getPosition():sendMagicEffect(CONST_ME_POFF)
					return true
				end

				player:addOutfitAddon(data.id[1], 3)
				player:addOutfitAddon(data.id[2], 3)
				player:addOutfitAddon(130, 1) -- montura o especial
				player:addOutfitAddon(138, 1)

				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You received full addons for the " .. name .. " outfit!")
				player:getPosition():sendMagicEffect(CONST_ME_GIFT_WRAPS)
				player:setStorageValue(data.storage, 1)
				item:remove(1)
			end)
		end
	end

	if addedChoices == 0 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You already have all available outfit addons.")
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		return
	end

	window:addButton("Select")
	window:addButton("Cancel")
	window:setDefaultEnterButton(0)
	window:setDefaultEscapeButton(1)
	window:sendToPlayer(player)
end

local addonDollCoin = Action()
function addonDollCoin.onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
	sendAddonDollModal(player, item)
	return true
end

addonDollCoin:id(30317)
addonDollCoin:register()
