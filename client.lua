lib.locale()

RegisterNetEvent('neko_pedmenu:client:open_menu_give_ped', function(data)

    -- === order players
    local availablePlayers = lib.callback.await('neko_pedmenu:server:get_online_players', false)
    local selPlayersOptions = {}
    for key, value in ipairs(availablePlayers) do
        table.insert(selPlayersOptions, { value = value.license, label = value.name })
    end

    -- === order peds
    local availablePeds = lib.callback.await('neko_pedmenu:server:get_available_peds', false)
    local selPedsOptions = {}
    local defaultPed = ''

    for i = 1, #availablePeds do
        if #selPedsOptions == 0 then
            defaultPed = availablePeds[i]
        end
        selPedsOptions[#selPedsOptions + 1] = { value = availablePeds[i], label = availablePeds[i] }
    end

    local input = lib.inputDialog(locale('menu_giveped_title'), {
        {
            type        = 'select',
            required    = true,
            icon        = { 'fas', 'user' },
            label       = locale('giveped_user'),
            options     = selPlayersOptions,
            searchable  = true
        },
        {
            type        = 'select',
            required    = true,
            icon        = { 'fas', 'list' },
            label       = locale('giveped_ped'),
            default     = defaultPed,
            options     = selPedsOptions,
            searchable  = true
        },
        {
            type        = 'checkbox',
            label       = locale('giveped_temporal')
        },
    })

    if not input then return lib.notify({ description = locale('giveped_cancelled'), type = 'info' }) end

    TriggerServerEvent("neko_pedmenu:server:give_ped_to_player", { playerId = input[1], pedName = input[2], permanentPed = input[3] })
end)

RegisterNetEvent('neko_pedmenu:client:open_menu_set_ped', function(data)
    PedsOptions = {}
    for key, value in pairs(data.peds) do
        PedsOptions[value.ped] = {
            title  = locale('menu_setped_option', value.ped),
            icon   = 'fas fa-person',
            event  = 'neko_pedmenu:client:switchped',
            args   = { ped = value.ped }
        }
    end

    PedsOptions['zzReloadSkin'] = {
        title  = locale('menu_setped_option_reset'),
        icon   = 'fas fa-redo-alt',
        event  = Config.reloadSkinEvent,
    }

    lib.registerContext({ id = 'neko_pedmenu:menu:set', title = locale('menu_setped_title'), options = PedsOptions })
    lib.showContext('neko_pedmenu:menu:set')
end)

RegisterNetEvent('neko_pedmenu:client:switchped', function(data)
    local player = PlayerId()
    local model = GetHashKey(data.ped)

    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(100)
    end

    if not IsModelInCdimage(model) then return end
    SetPlayerModel(player, model)
    SetModelAsNoLongerNeeded(model)
end)
