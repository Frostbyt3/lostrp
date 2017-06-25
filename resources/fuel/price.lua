--fuel = math.random(1.25, 1.55) -- Fuel Cost, this could be made to randomise between 1.05 and 1.30 or something like that
fuel = math.random(2.35, 2.65) -- Randomize fuel cost between 2.35 and 2.65.

function round(num, numDecimalPlaces)
  local mult = 5^(numDecimalPlaces or 0)
  return math.floor(num * mult + 0.5) / mult
end

RegisterServerEvent('frfuel:fuelAdded')
AddEventHandler('frfuel:fuelAdded', function(amount)

local cost = round(fuel * amount)

TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "The price for fuel is $" .. fuel)

TriggerEvent('es:getPlayerFromId', source, function(user)
local curplayer = user.identifier
local wallet = user.money
local new_wallet = wallet - cost
--TriggerClientEvent('chatMessage', source, "SYSTEM", {255,0,0}, "DEBUG: " .. wallet .. " - " .. cost .. " = " .. new_wallet .. " :DEBUG")

    TriggerEvent("es:setPlayerDataId", curplayer, "money", new_wallet, function(response, success)
        user:removeMoney(cost)
        TriggerClientEvent('es:activateMoney', source, new_wallet)
            if(success)then
                TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "You pumped " .. round(amount) .. " litres of fuel.")
                TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Your fuel fill up cost is $" .. round(cost))
                if (new_wallet <= 0)then
                    TriggerClientEvent('chatMessage', -1, "911", {255, 0, 0}, GetPlayerName(source) .." did not pay for his/her fuel. The police have been notified.")
                    SetPlayerWantedLevel(source,  1,  false)
                end
            end
        end)
    end)
end)