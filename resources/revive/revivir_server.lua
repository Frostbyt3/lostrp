-- REVIVIR @LaiiiCa http://steamcommunity.com/id/SmilyGiirl/


-- REVIVIR
TriggerEvent('es:addGroupCommand', 'revive', "mod", function(source, args, user)
		if(GetPlayerName(tonumber(args[2])))then
			local player = tonumber(args[2])

			-- User permission check
			TriggerEvent("es_em:sv_resurectPlayer", player, function(target)
				if(target)then
					if(tonumber(target.permission_level) > tonumber(user.permission_level))then
						TriggerClientEvent("chatMessage", source, "SYSTEM", {255, 0, 0}, "You cannot revive that person!")
						return
					end

					TriggerClientEvent('es_em:cl_resurectPlayer', player, source)

					TriggerClientEvent('chatMessage', player, "SYSTEM", {255, 0, 0}, "You have been revived by ^2" .. GetPlayerName(source))
					TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "You have revived ^2" .. GetPlayerName(player) .. "")
				end
			end)
		else
			TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Incorrect player ID!")
		end
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficient permissions!")
end)