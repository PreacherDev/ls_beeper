RegisterNetEvent('ls_beeper:getUserData', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.triggerEvent('ls_beeper:getUserDataCL', xPlayer.loadout, xPlayer.inventory)
end)

RegisterNetEvent('ls_beeper:getJob', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.triggerEvent('ls_beeper:getJobCL', xPlayer.getJob().name)
end)