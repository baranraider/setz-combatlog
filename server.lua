--ESCKaybeden - ra1der

AddEventHandler('playerDropped', function(reason)
    local konum = GetEntityCoords(GetPlayerPed(source))
    local players = {}
    local identifier = ""
    if Config.identifier == "Steam" then
        identifier = GetPlayerIdentifier(source, 0)
    elseif Config.identifier == "License" then
        identifier = GetPlayerIdentifier(source, 1)
    end
    if Config.Framework == "ESX" then
        local player = exports.ghmattimysql:executeSync("SELECT * FROM users WHERE identifier = @identifier", {['@identifier'] = identifier})
        if player[1] ~= nil then
            players.firstname = player[1].firstname
            players.lastname = player[1].lastname
        end
    elseif Config.Framework == "QBCore" then
        local player = exports.ghmattimysql:executeSync("SELECT * FROM players WHERE steam = @steam", {['@steam'] = identifier})
        if player[1] ~= nil then
            players.firstname = player[1].firstname
            players.lastname = player[1].lastname
        end
    elseif Config.Framework == "NewQBCore" then 
        local player = exports.ghmattimysql:executeSync("SELECT * FROM players WHERE citizenid = @citizenid", {['@citizenid'] = identifier})
        if player[1] ~= nil then
            players.firstname = player[1].firstname
            players.lastname = player[1].lastname
        end
    end
    TriggerClientEvent('setz_combatlogsend', -1, konum, players, identifier, os.date("%H:%M"), reason)
end)