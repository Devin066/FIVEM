local QBCore = exports['qb-core']:GetCoreObject()
-- PRIORITY COOLDOWN (DEVELOPED BY VERTEX MODIFICATIONS)
--
--      #(((((((#%&       //////////(     
--       @@       @@(   /@@       @@      
--        ,@@      .@@ @@       @@,       
--          @@       @@.       @@         
--           (@/      /@@    @@&          
--             @@  @@   @@  @@            
--               @@/     @@@              
--                @@     @@,              
--                 @@, *@@                
--                  *@@@/                 
--                    @  
--
-- CONFIGURATION
CooldownTime = 15 -- The amount of time in minutes the cooldown is. (Example of 15 minutes)
-- CONFIGURATION

-- I suggest you don't touch any of this cus you might fuck it up but I assume since your down here you know what your doing.

cooldown = 0
ispriority = false
ishold = true
isavailable = false
ispending = false
onhold = false
pnotes = ''

RegisterCommand("updtpri", function()
	Citizen.Wait(1)
   TriggerClientEvent('UpdatePriority', -1, ispriority)
	Citizen.Wait(1)
	TriggerClientEvent('UpdateAvailable', -1, isavailable)
	Citizen.Wait(1)
	TriggerClientEvent('UpdateHold', -1, ishold)
	Citizen.Wait(1)
	TriggerClientEvent('UpdateCooldown', -1, cooldown)
	Citizen.Wait(1)
	TriggerClientEvent('UpdatePending', -1, ispending)
	Citizen.Wait(1)
end, false)

RegisterCommand("setp", function(source, args, rawCommand)
    local S = source
	local xPlayer = QBCore.Functions.GetPlayer(source)
	local playerName = xPlayer.PlayerData.charinfo.firstname .." ".. xPlayer.PlayerData.charinfo.lastname
	local time = os.date('%H:%M', os.time() + 8 * 60 * 60)

if xPlayer.PlayerData.job.name == "police" then
	local f = false
	local notes = 'No Notes.'
	local status = 'Error'

	if args[3] == nil then
		rlocation = "7251"
	else
		rlocation = args[3]			
	end 

	if (args[2] ~= nil) then
		if (args[2] == 'store') then
			notes = " Store Robbery " .. string.sub(rawCommand, 19)

		elseif (args[2] == 'smallbank') then
			notes = " Fleeca Bank " .. string.sub(rawCommand, 22)

		elseif (args[2] == 'paletobank') then
			if args[3] == nil then
				rlocation = " 1055"
			else
				rlocation = " " .. args[3]			
			end 
			notes = " Paleto Bank" .. rlocation
		
		elseif (args[2] == 'jewelry') then
			if args[3] == nil then
				rlocation = " 7251"
			else
				rlocation = " " .. args[3]			
			end 
			notes = " Jewelry Vangelico" .. rlocation

		elseif (args[2] == 'bigbank') then
			if args[3] == nil then
				rlocation = " 7090"
			else
				rlocation = " " .. args[3]			
			end 
			notes = " Principal Bank" .. rlocation
		
		elseif (args[2] == 'code4w' or args[2] == 'code4l') then
			notes = " CODE 4"

		else
			notes = string.sub(rawCommand, 5)
		end
		
	end

	if (args[1] ~= nil) then
		if (args[1] == 'available') then

			notes = string.gsub(notes, 'available ', '')
			TriggerEvent('isavailable')
			if onhold then
			onhold = false
			end
			-- TriggerClientEvent('chat:addMessage', -1, {template = '<div class="chat-message police"><b><i class="fas fa-bullhorn"></i> <span style="color: #00000;">[OCPD] </span> | ' .. playerName .. '</b> has set priority to <b style="color:#0aa83a;">Available</b></div>'})
			TriggerClientEvent('chat:addMessage', -1, {template = '<div class="chat-message police"><i class="fas fa-bullhorn"></i> <b><span style="color: #4a6cfd">[OCPD] ' .. playerName .. '</span>&nbsp;<span style="font-size: 14px; color: #e1e1e1;">' ..time.. '</span></b><br><div style="margin-top: 5px;">THE POLICE DEPARTMENT IS NOW READY TO SERVE THE CITY.</div></div>'})
			status = 'Available'

-- THIS IS A TEST CODE BLOCK

		elseif (args[1] == 'active') then
			rtype = args[2]
			notes = string.gsub(notes, 'active ', '')
			notes = string.gsub(notes, 'inprogress ', '')
			TriggerEvent('isPriority')
			if onhold then
			onhold = false
			end
			TriggerClientEvent('chat:addMessage', -1, {template = '<div class="chat-message police"><b><i class="fas fa-bullhorn"></i> <span style="color: #00000;">[OCPD] </span> | ' .. playerName .. '</b> has set priority to <b style="color:#f70015;">Active</b></div>'})
			if rtype == 'store' and args[3] ~= nil  then
				-- TriggerClientEvent('chat:addMessage', -1, {template = '<div class="chat-message police"><i class="fas fa-bullhorn"></i> <b><span style="color: #4a6cfd">[OCPD] ' .. playerName .. '</span>&nbsp;<span style="font-size: 14px; color: #e1e1e1;">' ..time.. '</span></b><br><div style="margin-top: 5px;">THERE IS AN ONGOING ROBBERY AT STORE ' .. string.sub(rawCommand, 19) .. ' THE SAID AREA IS NOW DECLARED A RED ZONE, THUS ALL CITIZENS MUST AVOID THE AREA. EMS PLEASE BE ON STANDBY.</div></div>'})
			
			elseif rtype == 'smallbank' and args[3] ~= nil  then
					-- TriggerClientEvent('chat:addMessage', -1, {template = '<div class="chat-message police"><i class="fas fa-bullhorn"></i> <b><span style="color: #4a6cfd">[OCPD] ' .. playerName .. '</span>&nbsp;<span style="font-size: 14px; color: #e1e1e1;">' ..time.. '</span></b><br><div style="margin-top: 5px;">THERE IS AN ONGOING ROBBERY AT FLEECA BANK ' .. string.sub(rawCommand, 22) .. ' THE SAID AREA IS NOW DECLARED A RED ZONE, THUS ALL CITIZENS MUST AVOID THE AREA. EMS PLEASE BE ON STANDBY.</div></div>'})
			
			elseif rtype == 'paletobank' then
				if args[3] == nil then
					rlocation = "1055"
				else
					rlocation = args[3]	
				end 
				-- TriggerClientEvent('chat:addMessage', -1, {template = '<div class="chat-message police"><i class="fas fa-bullhorn"></i> <b><span style="color: #4a6cfd">[OCPD] ' .. playerName .. '</span>&nbsp;<span style="font-size: 14px; color: #e1e1e1;">' ..time.. '</span></b><br><div style="margin-top: 5px;">THERE IS AN ONGOING ROBBERY AT PALETO BANK ' .. rlocation .. ' THE SAID AREA IS NOW DECLARED A RED ZONE, THUS ALL CITIZENS MUST AVOID THE AREA. EMS PLEASE BE ON STANDBY.</div></div>'})
			
			elseif rtype == 'jewelry' then
				if args[3] == nil then
					rlocation = "7251"
				else
					rlocation = args[3]			
				end 
				-- TriggerClientEvent('chat:addMessage', -1, {template = '<div class="chat-message police"><i class="fas fa-bullhorn"></i> <b><span style="color: #4a6cfd">[OCPD] ' .. playerName .. '</span>&nbsp;<span style="font-size: 14px; color: #e1e1e1;">' ..time.. '</span></b><br><div style="margin-top: 5px;">THERE IS AN ONGOING ROBBERY AT JEWELRY VANGELICO ' .. rlocation .. ' THE SAID AREA IS NOW DECLARED A RED ZONE, THUS ALL CITIZENS MUST AVOID THE AREA. EMS PLEASE BE ON STANDBY.</div></div>'})

			elseif rtype == 'bigbank' then
				if args[3] == nil then
					rlocation = "7090"
				else
					rlocation = args[3]			
				end 

				-- TriggerClientEvent('chat:addMessage', -1, {template = '<div class="chat-message police"><i class="fas fa-bullhorn"></i> <b><span style="color: #4a6cfd">[OCPD] ' .. playerName .. '</span>&nbsp;<span style="font-size: 14px; color: #e1e1e1;">' ..time.. '</span></b><br><div style="margin-top: 5px;">THERE IS AN ONGOING ROBBERY AT PRINCIPAL BANK ' .. rlocation .. ' THE SAID AREA IS NOW DECLARED A RED ZONE, THUS ALL CITIZENS MUST AVOID THE AREA. EMS PLEASE BE ON STANDBY.</div></div>'})
			end
			status = 'Active'

-- THIS IS A TEST CODE BLOCK
		elseif (args[1] == 'cooldown') then
			notes = string.gsub(notes, 'cooldown ', '')
			TriggerEvent("cooldownt")
			if onhold then
			
			onhold = false
			end
			TriggerClientEvent('chat:addMessage', -1, {template = '<div class="chat-message police"><b><i class="fas fa-bullhorn"></i> <span style="color: #00000;">[OCPD] </span> | ' .. playerName .. '</b> has set priority to <b style="color:#919191;">Cooldown</b></div>'})
			status = 'Cooldown'
		elseif (args[1] == 'onhold') or (args[1] == 'hold') then
			notes = string.gsub(notes, 'onhold ', '')
			notes = string.gsub(notes, 'hold ', '')
			TriggerEvent('isOnHold')
			onhold = true
			-- TriggerClientEvent('chat:addMessage', -1, {template = '<div class="chat-message police"><b><i class="fas fa-bullhorn"></i> <span style="color: #00000;">[OCPD] </span> | ' .. playerName .. '</b> has set priority to <b style="color:#f70015;">Hold</b></div>'})
			status = 'Hold'
		elseif (args[1] == 'pending') or (args[1] == 'pend') then
			notes = string.gsub(notes, 'pending ', '')
			notes = string.gsub(notes, 'pend ', '')
			TriggerEvent('isPending')
			if onhold then
			onhold = false
			end
			if args[2] == 'code4w' then
				TriggerClientEvent('chat:addMessage', -1, {template = '<div class="chat-message police"><i class="fas fa-bullhorn"></i> <b><span style="color: #4a6cfd">[OCPD] ' .. playerName .. '</span>&nbsp;<span style="font-size: 14px; color: #e1e1e1;">' ..time.. '</span></b><div style="margin-top: 5px;">Robbery is now CODE 4 | All Robbers Down, EMS please proceed, Thank you.</div></div>'})
			elseif args[2] == 'code4l' then
				TriggerClientEvent('chat:addMessage', -1, {template = '<div class="chat-message police"><i class="fas fa-bullhorn"></i> <b><span style="color: #4a6cfd">[OCPD] ' .. playerName .. '</span>&nbsp;<span style="font-size: 14px; color: #e1e1e1;">' ..time.. '</span></b><div style="margin-top: 5px;">Robbery is now CODE 4 | All Officers Down, EMS please proceed, Thank you.</div></div>'})
			else
				TriggerClientEvent('chat:addMessage', -1, {template = '<div class="chat-message police"><b><i class="fas fa-bullhorn"></i> <span style="color: #00000;">[OCPD] </span> | ' .. playerName .. '</b> has set priority to <b style="color:#d6af20;">Pending</b></div>'})
			end
			status = 'Pending'
		else
			f = true
			TriggerClientEvent('chat:addMessage', S, {template = '<div class="chat-message police"><b style="color:#f70015;"> Error </b> | Possible Status: <span style="color:#0aa83a;>Available</span>, <span style="color:#d6af20;">Pending</span>, <span style="color:#f70015;"> Active</span>, <span style="color:#919191;"> Cooldown</span>, <span style="color:#f70015;"> Hold</span></div>'})
		end
		if (args[2] ~= nil) and (f == false) then
			TriggerClientEvent('chat:addMessage', -1, {template = '<div class="chat-message police"><b><i class="fas fa-bullhorn"></i> <span style="color: #00000;">[OCPD] </span> | <b>Priority Notes:</b> <span style="color:#d9c01e;">'..notes.. '</span></div>'})
			pnotes = notes
			TriggerClientEvent('cooldown:notes', -1, notes)
		elseif (f == false) then
			TriggerClientEvent('cooldown:notes', -1, 'xisoverxy')
		end
	else
			TriggerClientEvent('chat:addMessage', S, {template = '<div class="chat-message police"><b style="color:#f70015;"> Error </b> | Usage: /setp <status> <notes> </div>'})
	end
else
			TriggerClientEvent('chat:addMessage', S, {template = '<div class="chat-message police"><b style="color:#f70015;"> Error </b> | Insufficient Permissions </div>'})
end
end, false)

RegisterCommand("setn", function(source, args, rawCommand)
    local S = source
	local xPlayer = QBCore.Functions.GetPlayer(source)
if xPlayer.PlayerData.job.name == "police" then
	local notes = 'No Notes.'
	if (args[1] ~= nil) then
	notes = string.sub(rawCommand, 5)
	pnotes = notes
	if notes == " clear" then
	TriggerClientEvent('cooldown:notes', -1, 'xisoverxy')
	TriggerClientEvent('chat:addMessage', S, {
		color = { 237, 55, 55},
		multiline = true,
		args = {"Priority Notes", 'Notes Cleared.'}
	})
	else
	TriggerClientEvent('cooldown:notes', -1, notes)
	TriggerClientEvent('chat:addMessage', S, {
		color = { 237, 55, 55},
		multiline = true,
		args = {"Priority Notes", 'Notes Updated.'}
	})
	end
	else
	TriggerClientEvent('chat:addMessage', S, {
		color = { 237, 55, 55},
		multiline = true,
		args = {"Error", 'Usage: ^1/setn <notes>'}
	})
	end
else
			TriggerClientEvent('chat:addMessage', S, {
			color = { 237, 55, 55},
			multiline = true,
			args = {"Error", '^7Insufficient Permissions.'}
			})
end
end, false)

RegisterNetEvent('isPriority')
AddEventHandler('isPriority', function()
	ispriority = true
	isavailable = false
	ishold = false
	isPending = false
	Citizen.Wait(1)
	TriggerClientEvent('UpdatePriority', -1, ispriority)
	Citizen.Wait(1)
	TriggerClientEvent('UpdateAvailable', -1, isavailable)
	Citizen.Wait(1)
	TriggerClientEvent('UpdateHold', -1, ishold)
	Citizen.Wait(1)
	TriggerClientEvent('UpdatePending', -1, isPending)
end)

RegisterNetEvent('isPending')
AddEventHandler('isPending', function()
	ispriority = false
	isavailable = false
	ishold = false
	ispending = true
	Citizen.Wait(1)
	TriggerClientEvent('UpdatePriority', -1, ispriority)
	Citizen.Wait(1)
	TriggerClientEvent('UpdateAvailable', -1, isavailable)
	Citizen.Wait(1)
	TriggerClientEvent('UpdateHold', -1, ishold)
	Citizen.Wait(1)
	TriggerClientEvent('UpdatePending', -1, ispending)
end)

RegisterNetEvent('isOnHold')
AddEventHandler('isOnHold', function()
	ishold = true
	isavailable = false
	ispriority = false
	ispending = false
	Citizen.Wait(1)
	TriggerClientEvent('UpdateHold', -1, ishold)
	Citizen.Wait(1)
	TriggerClientEvent('UpdateAvailable', -1, isavailable)
	Citizen.Wait(1)
	TriggerClientEvent('UpdatePriority', -1, ispriority)
	Citizen.Wait(1)
	TriggerClientEvent('UpdatePending', -1, ispending)
end)

RegisterNetEvent('isavailable')
AddEventHandler('isavailable', function()
	if isavailable == true then
	isavailable = true
	ispriority = false
	ishold = false
	ispending = false
	Citizen.Wait(1)
	TriggerClientEvent('UpdatePriority', -1, ispriority)
	Citizen.Wait(1)
	TriggerClientEvent('UpdateHold', -1, ishold)
	elseif isavailable == false then
	isavailable = true
	ishold = false
	ispriority = false
	cooldown = -1
	end
	Citizen.Wait(1)
	TriggerClientEvent('UpdateAvailable', -1, isavailable)
	Citizen.Wait(1)
	TriggerClientEvent('UpdatePriority', -1, ispriority)
	TriggerClientEvent('UpdateHold', -1, ishold)
	Citizen.Wait(1)
	TriggerClientEvent('UpdatePending', -1, ispending)
end)

RegisterNetEvent("cooldownt")
AddEventHandler("cooldownt", function()
	if ispriority == true then
		ispriority = false
		TriggerClientEvent('UpdatePriority', -1, ispriority)
	end
	Citizen.Wait(1)
	if ishold == true then
		ishold = false
		TriggerClientEvent('UpdateHold', -1, ishold)
	end
	Citizen.Wait(1)
	if isavailable == true then
		isavailable = false
		TriggerClientEvent('UpdateAvailable', -1, isavailable)
	end
	if ispending == true then
	ispending = false
	TriggerClientEvent('UpdatePending', -1, ispending)
	end
	Citizen.Wait(1)
		cooldown = (CooldownTime+1)
		while cooldown > -1 do
			if cooldown > 0 then
				cooldown = cooldown - 1
				TriggerClientEvent('UpdateCooldown', -1, cooldown)
				if cooldown > 0 then
				Citizen.Wait(60000)
				end
			elseif cooldown == 0 then
				isavailable = true
				TriggerClientEvent('UpdateAvailable', -1, isavailable)
				cooldown = -1
			end
		end
end)

RegisterNetEvent("cancelcooldown")
AddEventHandler("cancelcooldown", function()
	Citizen.Wait(1)
	while cooldown > 0 do
		cooldown = cooldown - 1
		TriggerClientEvent('UpdateCooldown', -1, cooldown)
		Citizen.Wait(100)
	end
	
end)