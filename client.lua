local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('nekopeds:client:openmenu', function(identifier)
    local tablePeds = {}
    table.insert(tablePeds, { header = Config.menuLabel, icon = Config.menuIcon, isMenuHeader = true })

    for _, value in ipairs(Config.Players[identifier]) do
        table.insert(tablePeds, {
            header = Config.menuTitle..value.name,
            icon = Config.menuIcon,
            txt = 'pedId: '..value.ped,
            params = { event = 'neko-switchped', args = { ped = value.ped } }
        })
    end

    table.insert(tablePeds, {
        header = Config.reloadSkinLabel,
        icon = Config.reloadIcon,
        txt = Config.reloadSkinDesc,
        params = { event = Config.reloadSkinEvent }
    })

    exports['qb-menu']:openMenu(tablePeds)
end)

RegisterNetEvent('neko-switchped', function(data)
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
