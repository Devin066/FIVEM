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

--TEXT SHOWN WHEN STATUS IS ON COOLDOWN ( ^t will be replaced with the time left )
--FOR EXAMPLE 'There are ^t minutes left' will display as 'There are 15 minutes left'
StatusCooldownText = 'Priority~c~: ~1~Cooldown ~m~(~w~^tm remaining~m~)'

--TEXT SHOWN WHEN STATUS IS ON AVAILABLE
StatusAvailableText = 'Priority~c~: ~g~Available'
--TEXT SHOWN WHEN STATUS IS ON AVAILABLE ( ^n will be replaced with the notes )
StatusAvailableWithNotesText = 'Priority~c~: ~g~Available ~m~(~c~^n~m~ )'

--TEXT SHOWN WHEN STATUS IS ON PENDING
StatusPendingText = 'Priority~c~: ~y~Pending'
--TEXT SHOWN WHEN STATUS IS ON PENDING ( ^n will be replaced with the notes )
StatusPendingWithNotesText = 'Priority~c~: ~y~Pending ~m~(~c~^n~m~ )'

--TEXT SHOWN WHEN STATUS IS ON ACTIVE
StatusActiveText = 'Priority~c~: ~r~Active'
--TEXT SHOWN WHEN STATUS IS ON ACTIVE ( ^n will be replaced with the notes )
StatusActiveWithNotesText = 'Priority~c~: ~r~Active ~m~(~c~^n~m~ )'

--TEXT SHOWN WHEN STATUS IS ON HOLD
StatusHoldText = 'Priority~c~: ~r~Hold'
--TEXT SHOWN WHEN STATUS IS ON HOLD ( ^n will be replaced with the notes )
StatusHoldWithNotesText = 'Priority~c~: ~r~Hold ~m~(~c~^n~m~ )'

-- HUD CONFIGURATION
HUDx = 0.75 -- HUD Position on the X-Axis
HUDy = 0.01 -- HUD Position on the Y-Axis
HUDs = 0.23  -- HUD Scale (Size)

-- TO CONFIGURE HOW LONG THE COOLDOWN IS GO INTO THE SERVER.LUA FILE

-- LIST OF COLOR CODES FOR FIVEM

--		Common:
--		~r~ = Red
--		~b~ = Blue
--		~g~ = Green
--		~y~ = Yellow
--		~p~ = Purple
--		~c~ = Grey
--		~m~ = Dark Grey
--		~u~ = Black
--		~o~ = Orange

--		Special:
--		~n~ = New line
--		~s~ = Reset Color
--		~h~ = Bold text

-- CONFIGURATION

-- I suggest you don't touch any of this cus you might fuck it up but I assume since your down here you know what your doing.
local cooldown = 0
local ispriority = false
local ishold = true
local isavailable = false
local ispending = false
local joined = false

local notes = "No Notes."
local noteis = false

RegisterCommand("resetpcd", function()
    TriggerServerEvent("cancelcooldown")
end, false)

RegisterNetEvent('UpdateCooldown')
AddEventHandler('UpdateCooldown', function(newCooldown)
    cooldown = newCooldown
end)

RegisterNetEvent('UpdatePriority')
AddEventHandler('UpdatePriority', function(newispriority)
    ispriority = newispriority
end)

RegisterNetEvent('UpdateHold')
AddEventHandler('UpdateHold', function(newishold)
    ishold = newishold
end)

RegisterNetEvent('UpdateAvailable')
AddEventHandler('UpdateAvailable', function(newisavailable)
    isavailable = newisavailable
end)

RegisterNetEvent('UpdatePending')
AddEventHandler('UpdatePending', function(newispending)
    ispending = newispending
end)

RegisterNetEvent('cooldown:notes')
AddEventHandler('cooldown:notes', function(note)
    if note ~= nil and note ~= 'xisoverxy' then
	noteis = true
	notes = note
	else
	noteis = false
	notes = "No Notes."
	end
end)

-- function globalCooldown(robberyStatus)
-- 	return robberyStatus
--  end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		
		if joined == false then
		Wait(1000)
		ExecuteCommand('updtpri')
		joined = true
		end		
		
		if ishold == true then
			-- print(globalCooldown(ishold))
			if noteis then
			DrawText2(StatusHoldWithNotesText:gsub("%^n", notes))
			else
			DrawText2(StatusHoldText)
			end
		elseif ispriority == true then
			if noteis then
			DrawText2(StatusActiveWithNotesText:gsub("%^n", notes))
			else
			DrawText2(StatusActiveText)
			end
		elseif isavailable == true then
			if noteis then
			DrawText2(StatusAvailableWithNotesText:gsub("%^n", notes))
			else
			DrawText2(StatusAvailableText)
			end
		elseif ispending == true then
			if noteis then
			DrawText2(StatusPendingWithNotesText:gsub("%^n", notes))
			else
			DrawText2(StatusPendingText)
			end
		elseif ispriority == false then
			--DrawText2("Priority~c~: ~r~".. cooldown .." Minute Cooldown")
			DrawText2(StatusCooldownText:gsub("%^t", cooldown))
		end
	end
end)

	function DrawText2(text)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextScale(0.0, HUDs)
        SetTextDropshadow(0.5, 0, 0, 0, 255)
		SetTextColour(210,210,210, 255)
        SetTextEdge(1, 0, 0, 0, 255)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        AddTextComponentString(text)
		DrawText(HUDx, HUDy)
    end