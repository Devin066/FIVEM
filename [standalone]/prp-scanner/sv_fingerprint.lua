local QBCore = exports['qb-core']:GetCoreObject()


QBCore.Functions.CreateUseableItem("policetablet", function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent("randol:client:policetablet", src)
    local ped = GetPlayerPed(src)
    local pCoords = GetEntityCoords(ped)
    local msg = "~b~[SCANNING FINGERPRINT]"
    local Players = QBCore.Functions.GetPlayers()
    for i=1, #Players do
        local Player = Players[i]
        local target = GetPlayerPed(Player)
        local tCoords = GetEntityCoords(target)
        if target == ped or #(pCoords - tCoords) < 20 then
            TriggerClientEvent('QBCore:Command:ShowMe3D', Player, source, msg)
        end
    end
end)

QBCore.Functions.CreateUseableItem("emstablet", function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent("randol:client:emstablet", src)
    local ped = GetPlayerPed(src)
    local pCoords = GetEntityCoords(ped)
    local msg = "~r~[CHECKING PATIENT RECORD]"
    local Players = QBCore.Functions.GetPlayers()
    for i=1, #Players do
        local Player = Players[i]
        local target = GetPlayerPed(Player)
        local tCoords = GetEntityCoords(target)
        if target == ped or #(pCoords - tCoords) < 20 then
            TriggerClientEvent('QBCore:Command:ShowMe3D', Player, source, msg)
        end
    end
end)

RegisterServerEvent('randolio:server:fingerprintmenu') 
AddEventHandler('randolio:server:fingerprintmenu', function(playerId)
    local src = source
    local Target = QBCore.Functions.GetPlayer(playerId)
    local pdata = Target.PlayerData
	if Target then
        TriggerClientEvent('randolio:client:fingerprintmenu', src, pdata)
    end
end)

RegisterServerEvent('randolio:server:fingerprintmenu2') 
AddEventHandler('randolio:server:fingerprintmenu2', function(playerId)
    local src = source
    local Target = QBCore.Functions.GetPlayer(playerId)
    local pdata = Target.PlayerData
	if Target then
        TriggerClientEvent('randolio:client:fingerprintmenu2', src, pdata)
    end
end)