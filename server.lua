local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Commands.Add('pedmenu', 'Abrir menú de PEDs', {}, false, function(source)
    local identifier = QBCore.Functions.GetIdentifier(source, 'license')

    if Config.Players[identifier] ~= nil then
        return TriggerClientEvent('nekopeds:client:openmenu', -1, identifier)
    else
        return TriggerClientEvent('QBCore:Notify', source, Config.errorPermission, 'error')
    end
end)
