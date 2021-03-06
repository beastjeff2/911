--------------------------------- Config ----------------------------------


webhookUrl = 'https://discord.com/api/webhooks/8976r8ewyfr89ewg8e9wg89ewgf89ewg7f98ewgrf89g8fg3428r9g3489f4g8f9g348'
callBlips = true -- If you change this to "false", it will turn off the circle that is created when you use the /911 command
disableCallsInChat = false -- If you change this to "false", it will turn off chat calls!


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------




                                                 -- ░█████╗░██████╗░░█████╗░███╗░░░███╗░██████╗████████╗██╗░░██╗███████╗██████╗░███████╗██╗░░░██╗
                                                 -- ██╔══██╗██╔══██╗██╔══██╗████╗░████║██╔════╝╚══██╔══╝██║░░██║██╔════╝██╔══██╗██╔════╝██║░░░██║
                                                 -- ███████║██║░░██║███████║██╔████╔██║╚█████╗░░░░██║░░░███████║█████╗░░██║░░██║█████╗░░╚██╗░██╔╝
                                                 -- ██╔══██║██║░░██║██╔══██║██║╚██╔╝██║░╚═══██╗░░░██║░░░██╔══██║██╔══╝░░██║░░██║██╔══╝░░░╚████╔╝░
                                                 -- ██║░░██║██████╔╝██║░░██║██║░╚═╝░██║██████╔╝░░░██║░░░██║░░██║███████╗██████╔╝███████╗░░╚██╔╝░░
                                                 -- ╚═╝░░╚═╝╚═════╝░╚═╝░░╚═╝╚═╝░░░░░╚═╝╚═════╝░░░░╚═╝░░░╚═╝░░╚═╝╚══════╝╚═════╝░╚══════╝░░░╚═╝░░░

														

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Do not change anything unless you know what your doing! -- 

RegisterServerEvent('call911')
AddEventHandler('call911', function(location, msg, x, y, z, name, p)
	
	local pName = GetPlayerName(source)
	local p = GetPlayerPed(source)

		if disableCallsInChat == false then
				TriggerClientEvent('chatMessage', -1, '^5----------------------------------------------', {0, 255, 238})
				TriggerClientEvent('chatMessage', -1, '^*^5New 911 Report:', {0, 255, 238})
				TriggerClientEvent('chatMessage', -1, '   ^*^5[Caller Name]^r^7', {0, 255, 238}, pName .. " (" .. source .. ")")
				TriggerClientEvent('chatMessage', -1, '   ^*^5[Location]^r^7', {0, 255, 238}, location)
				TriggerClientEvent('chatMessage', -1, '   ^*^5[Report]^r^7', {0, 255, 238}, msg)
				TriggerClientEvent('chatMessage', -1, '^5----------------------------------------------', {0, 255, 238})
			end
			sendDiscord('911 Call Logger \n', '**Caller Name: **' .. pName .. ' (' .. source .. ') \n**  Location: **' .. location .. '\n**  Report: **' .. msg)
		
		if callBlips == true then
				TriggerClientEvent('setBlip', -1, name, x, y, z)
		end
end)

--------------------- Functions -----------------------


function sendDiscord(name, message)
	local content = {
        {
        	["color"] =  "5263615",
            ["title"] = "**New 911 Report**",
            ["description"] = message,
        }
    }
  	PerformHttpRequest(webhookUrl, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = content}), { ['Content-Type'] = 'application/json' })
end


--------------------------------------------------------

	
