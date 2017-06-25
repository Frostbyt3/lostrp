local stores = {
	["paleto_twentyfourseven"] = {
		position = { ['x'] = 1730.35949707031, ['y'] = 6416.7001953125, ['z'] = 35.0372161865234 },
		reward = 5000,
		nameofstore = "Twenty Four Seven. (Paleto Bay)",
		lastrobbed = 0
	},
	["sandyshores_twentyfoursever"] = {
		position = { ['x'] = 1960.4197998047, ['y'] = 3742.9755859375, ['z'] = 32.343738555908 },
		reward = 5000,
		nameofstore = "Twenty Four Seven. (Sandy Shores)",
		lastrobbed = 0
	},
	["bar_one"] = {
		position = { ['x'] = 1986.1240234375, ['y'] = 3053.8747558594, ['z'] = 47.215171813965 },
		reward = 5000,
		nameofstore = "Yellow Jack. (Sandy Shores)",
		lastrobbed = 0
	},
	["littleseoul_twentyfourseven"] = {
		position = { ['x'] = -709.17022705078, ['y'] = -904.21722412109, ['z'] = 19.215591430664 },
		reward = 5000,
		nameofstore = "Twenty Four Seven. (Little Seoul)",
		lastrobbed = 0
	}
}

local robbers = {}


function get3DDistance(x1, y1, z1, x2, y2, z2)
	return math.sqrt(math.pow(x1 - x2, 2) + math.pow(y1 - y2, 2) + math.pow(z1 - z2, 2))
end

RegisterServerEvent('es_holdup:toofar')
AddEventHandler('es_holdup:toofar', function(robb)
	if(robbers[source])then
		TriggerClientEvent('es_holdup:toofarlocal', source)
		robbers[source] = nil
		TriggerClientEvent('chatMessage', -1, 'NEWS', {255, 0, 0}, "Robbery Cancelled: ^2" .. stores[robb].nameofstore)
	end
end)

RegisterServerEvent('es_holdup:stestcop')
AddEventHandler('es_holdup:stestcop', function(k)
	getPoliceInService( function(nbPolice) 
	TriggerEvent('es_holdup:rob',k,nbPolice,source)
	end)
end)

RegisterServerEvent('es_holdup:notifycop')
AddEventHandler('es_holdup:notifycop', function(storename)

	TriggerClientEvent('es_holdup:notifycop2',-1, "Robbery in Progress: " .. storename .. ".")

end)


RegisterServerEvent('es_holdup:rob')
AddEventHandler('es_holdup:rob', function(robb,nbPolice,source)
	if nbPolice >= 3 then
		if stores[robb] then
			local store = stores[robb]

			if (os.time() - store.lastrobbed) < 600 and store.lastrobbed ~= 0 then
				TriggerClientEvent('chatMessage', source, 'ROBBERY', {255, 0, 0}, "This store has already been robbed. Wait ^2" .. (1800 - (os.time() - store.lastrobbed)) .. "^0 more seconds.")
				return
			end
			TriggerClientEvent('chatMessage', -1, 'NEWS', {255, 0, 0}, "Robbery in progress at ^2" .. store.nameofstore)
			TriggerClientEvent('chatMessage', source, 'SYSTEM', {255, 0, 0}, "You have started a robbery at ^2" .. store.nameofstore .. "^0, do not move away from here.")
			TriggerClientEvent('chatMessage', source, 'SYSTEM', {255, 0, 0}, "The silent alarm was triggered!")
			TriggerClientEvent('chatMessage', source, 'SYSTEM', {255, 0, 0}, "Hold your position for ^13 ^0minutes to claim the money")
			TriggerClientEvent('es_holdup:currentlyrobbing', source, robb)
			stores[robb].lastrobbed = os.time()
			robbers[source] = robb
			local savedSource = source
			SetTimeout(180000, function()
				if(robbers[savedSource])then
					TriggerClientEvent('es_holdup:robberycomplete', savedSource, job)
					TriggerEvent('es:getPlayerFromId', savedSource, function(target) 
						if(target)then
						target:addDirty_Money(store.reward) 
						TriggerClientEvent('chatMessage', -1, 'NEWS', {255, 0, 0}, "Robbery Successful: ^2" .. store.nameofstore)
						end
					end)
				end
			end)		
		end
	else
		TriggerClientEvent('chatMessage', source, 'HOLDUP', {255, 0, 0}, "Not enough police are on duty.")
	end
end)



function getPoliceInService(cb)
	TriggerEvent('es:getPlayers', function(players)
		local nbPolice = 0
		for i,p in pairs(players) do
			if p:getSessionVar('policeInService') == true then
				nbPolice = nbPolice + 1
			end
		end
		cb(nbPolice)
	end)
end