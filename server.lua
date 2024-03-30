local QBCore = exports['qb-core']:GetCoreObject()
lib.locale()
local oxmysql = exports.oxmysql
ListPlayers = {}
ListPeds = {}

-- ===== Commands
lib.addCommand(Config.myPedsCommand, { help = locale('command_help_open_peds'), params = {}, restricted = false }, function(source, args)
    local license = GetPlayerLicense(source)

    if ListPlayers[license] == nil then
        TriggerClientEvent('ox_lib:notify', source, { description = locale('peds_not_found'), type = 'info' })
    else
        TriggerClientEvent('neko_pedmenu:client:open_menu_set_ped', source, { peds = ListPlayers[license] })
    end
end)

lib.addCommand('giveped', { help = locale('command_help_giveped'), params = {}, restricted = 'qbcore.mod' }, function(source, args)
    TriggerClientEvent('neko_pedmenu:client:open_menu_give_ped', source)
end)

-- ===== Events
RegisterServerEvent('neko_pedmenu:server:give_ped_to_player')
AddEventHandler('neko_pedmenu:server:give_ped_to_player', function(data)
    local src = source

    if not IsPlayerAceAllowed(src, 'mod') then
        TriggerClientEvent('ox_lib:notify', src, { description = locale('user_not_permissions'), type = 'info' })
    else
        local ped = data.pedName
        local license = data.playerId

        -- === encontrar en persistencia
        local playerHasThisPed = false
        local updatePlayerPed = false
        if ListPlayers[license] ~= nil then
            for _, storedPed in ipairs(ListPlayers[license]) do
                if storedPed.ped == ped then
                    playerHasThisPed = true
                    if not storedPed.permanent then
                        updatePlayerPed = true
                    end
                end
            end
        end

        if playerHasThisPed then
            if updatePlayerPed then
                for key, storedPed in ipairs(ListPlayers[license]) do
                    if storedPed.ped == ped then
                        ListPlayers[license][key].permanent = true
                        oxmysql:execute(" INSERT INTO neko_peds ( license, ped_id ) VALUES ( ?, ? ); ", { license, ped })
                    end
                end
            else
                TriggerClientEvent('ox_lib:notify', src, { description = locale('player_has_this_ped'), type = 'info' })
            end
        else
            if ListPlayers[license] == nil then ListPlayers[license] = {} end
            if data.temporalPed then
                table.insert(ListPlayers[license], { ped = ped, permanent = false })
            else
                table.insert(ListPlayers[license], { ped = ped, permanent = true })
                oxmysql:execute(" INSERT INTO neko_peds ( license, ped_id ) VALUES ( ?, ? ); ", { license, ped })
            end
        end
    end
end)

-- ===== Callbacks
lib.callback.register('neko_pedmenu:server:get_available_peds', function()
    return ListPeds
end)

lib.callback.register('neko_pedmenu:server:get_online_players', function()
    local listOnlinePlayers = {}
    local Players = QBCore.Functions.GetPlayers()
    for k, user in pairs(Players) do
        local player = QBCore.Functions.GetPlayer(user)
        local license = GetPlayerLicense(player.PlayerData.source)
        local playerCfxName = GetPlayerName(user)

        if playerCfxName ~= nil then
            table.insert(listOnlinePlayers, { license = license, name = playerCfxName })
        end
    end

    return listOnlinePlayers
end)


-- ===== Functions
function GetPlayersPedsList()
    ListPlayers = {}

    oxmysql:fetch(" SELECT distinct license FROM neko_peds; ", {}, function(resultLic)
        for _, player in pairs(resultLic) do
            local pedsList = {}

            oxmysql:fetch(" SELECT ped_id FROM neko_peds WHERE license = ?; ", { player.license }, function(resultPeds)
                for _, ped in pairs(resultPeds) do table.insert(pedsList, { ped = ped.ped_id, permanent = true }) end
            end)

            ListPlayers[player.license] = pedsList
        end
    end)
end

function BuildPedsList()
    for key, value in pairs(Peds) do
        table.insert(ListPeds, value)
    end
end

function GetPlayerLicense(source)
    local license = '-'
    for k,v in pairs(GetPlayerIdentifiers(source)) do
        if(string.sub(v, 1, string.len('license:')) == 'license:') then
            license = v
        end
    end
    return license
end

-- ===== FiveM Events
AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
    GetPlayersPedsList()
    BuildPedsList()
end)