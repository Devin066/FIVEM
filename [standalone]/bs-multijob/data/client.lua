local QBCore = exports['qb-core']:GetCoreObject()
RegisterKeyMapping('changejob', 'Toggle MultiJob Menu', 'keyboard', Config.OpenKey)

RegisterCommand('changejob', function()
    TriggerEvent('multiJob:Client:OpenMenu')
end)

RegisterNetEvent('multiJob:Client:OpenMenu', function()
    local Player = QBCore.Functions.GetPlayerData()
    local citizenid = Player.citizenid
    local Menu = {
        {
            header = "<img style=vertical-align:middle;margin-right:5px src=https://cdn-icons-png.flaticon.com/512/3787/3787787.png width=30vh> <span style=>Job Changer</span>",
            isMenuHeader = true
        },
        {
            header = "Change Jobs".."<br>You are currently working as "..Player.job.label..".<br>",
            txt = '',
            params = {
                isServer = true,
                event = "multiJob:Server:ChangeJob",
                args = {
                    citizenid = citizenid
                }
            }
        },
    }
    exports['qb-menu']:openMenu(Menu)
end)

