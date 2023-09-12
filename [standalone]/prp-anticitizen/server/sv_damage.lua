RegisterServerEvent('prp-anticheat:funTime', function(dmg, acc)
    local src = source
    local reason = 'Suspected FiveM Citizen Modifications | Damage: ' .. dmg .. ' | Accuracy ' .. acc
    DropPlayer(src, reason)
--     TriggerClientEvent('clique-anticheat:receivedBan', src, {reason = "Damage - " .. dmg .. " Accuracy - " .. acc, trigger = "Citizen Freak"})
end)    
