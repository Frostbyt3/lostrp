-- HERE GOES YOUR CLIENT FUNCTIONALITY!
local nbPolice = 0

RegisterNetEvent('blanchi:drawTransform')
AddEventHandler('blanchi:drawTransform', function (qte)
		if(qte == nil) then
			qte = 0
		end
		if qte > 0 then
			
			ClearPrints()
			SetTextEntry_2("STRING")
			AddTextComponentString("~g~You have laundered your money")
			DrawSubtitleTimed(2000, 1)
		else
			-- ClearPrints()
			-- SetTextEntry_2("STRING")
			-- AddTextComponentString("~r~You do not have any more dirty money")
			-- DrawSubtitleTimed(2000, 1)
		end
end)

Citizen.CreateThread(function()
    while true do
       Citizen.Wait(0)
       playerPed = GetPlayerPed(-1)
		local pos = GetEntityCoords(GetPlayerPed(-1), true)
		if pos then
				if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 1446.99523925781,1152.89562988281,114.334259033203, true) <= 2 then
					if nbPolice > 1 then
						ClearPrints()
						SetTextEntry_2("STRING")
						AddTextComponentString("~g~Laundering in progress...")
						DrawSubtitleTimed(90000, 1)
						Citizen.Wait(90000)
						TriggerServerEvent('blanchi:transform',source)
					else
						TriggerEvent("mt:missiontext", 'At least 2 police officers are required to launder your money', 800)
					end
						
				end				
		end
    end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(15000)
		TriggerServerEvent('blanchi:stestcop')
	end
end)

RegisterNetEvent('blanchi:getcop')
AddEventHandler("blanchi:getcop", function(nbPolicier)
	nbPolice = nbPolicier
	--Citizen.Trace(nbPolice)
end)