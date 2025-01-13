ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local cooldowns = {} -- Taulukko pelaajien cooldownien seuraamiseen

RegisterCommand('kaatu', function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

    local identifier = xPlayer.getIdentifier()
    local currentTime = os.time()

    -- Tarkistetaan, onko pelaajalla cooldown
    if cooldowns[identifier] and currentTime - cooldowns[identifier] < 300 then
        local remainingTime = 300 - (currentTime - cooldowns[identifier])
        TriggerClientEvent('ox_lib:notify', source, {
            type = 'error',
            description = 'Voit käyttää /kaatu uudestaan ' .. math.ceil(remainingTime) .. ' sekunnin kuluttua.'
        })
        return
    end

    -- Aseta cooldown
    cooldowns[identifier] = currentTime

    -- Luo mopon
    TriggerClientEvent('kaatu:spawnMopo', source)

    -- Lähetä ilmoitus pelaajalle
    TriggerClientEvent('ox_lib:notify', source, {
        type = 'success',
        description = 'Sait kaadun, elä tunaroi.'
    })
end)
