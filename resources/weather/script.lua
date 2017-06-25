Citizen.CreateThread(function()
    while true 
    	do
		
		SetWeatherTypePersist("FOGGY")
        SetWeatherTypeNowPersist("FOGGY")
        SetWeatherTypeNow("FOGGY")
        SetOverrideWeather("FOGGY")
		
		Citizen.Wait(90000)

		SetWeatherTypePersist("OVERCAST")
        SetWeatherTypeNowPersist("OVERCAST")
        SetWeatherTypeNow("OVERCAST")
        SetOverrideWeather("OVERCAST")
		
		Citizen.Wait(90000)
		
		SetWeatherTypePersist("RAIN")
        SetWeatherTypeNowPersist("RAIN")
        SetWeatherTypeNow("RAIN")
        SetOverrideWeather("RAIN")
		
		Citizen.Wait(90000)
		
		SetWeatherTypePersist("THUNDER")
        SetWeatherTypeNowPersist("THUNDER")
        SetWeatherTypeNow("THUNDER")
        SetOverrideWeather("THUNDER")
    	
		Citizen.Wait(90000)
		
		SetWeatherTypePersist("CLEARING")
        SetWeatherTypeNowPersist("CLEARING")
        SetWeatherTypeNow("CLEARING")
        SetOverrideWeather("CLEARING")
		
		Citizen.Wait(90000)
		
		SetWeatherTypePersist("CLEAR")
        SetWeatherTypeNowPersist("CLEAR")
        SetWeatherTypeNow("CLEAR")
        SetOverrideWeather("CLEAR")
		
		Citizen.Wait(90000)

		SetWeatherTypePersist("EXTRASUNNY")
        SetWeatherTypeNowPersist("EXTRASUNNY")
        SetWeatherTypeNow("EXTRASUNNY")
        SetOverrideWeather("EXTRASUNNY")
		
		Citizen.Wait(90000)
		
		SetWeatherTypePersist("OVERCAST")
        SetWeatherTypeNowPersist("OVERCAST")
        SetWeatherTypeNow("OVERCAST")
        SetOverrideWeather("OVERCAST")
		
		Citizen.Wait(90000)
		
		SetWeatherTypePersist("RAIN")
        SetWeatherTypeNowPersist("RAIN")
        SetWeatherTypeNow("RAIN")
        SetOverrideWeather("RAIN")
		
		Citizen.Wait(90000)
	end

end)