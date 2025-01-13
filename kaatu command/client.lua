RegisterNetEvent('kaatu:spawnMopo')
AddEventHandler('kaatu:spawnMopo', function()
    local mopoModel = GetHashKey('faggio') -- Mopon malli, voit vaihtaa esim. 'sanchez'

    RequestModel(mopoModel)
    while not HasModelLoaded(mopoModel) do
        Wait(10)
    end

    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    local playerHeading = GetEntityHeading(playerPed)

    local mopo = CreateVehicle(mopoModel, playerCoords.x, playerCoords.y, playerCoords.z, playerHeading, true, false)
    SetPedIntoVehicle(playerPed, mopo, -1)
    SetVehicleNumberPlateText(mopo, "KAATU")
end)
