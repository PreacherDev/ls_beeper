RegisterNetEvent('ls_beeper_SV:PlayWithinDistance')
AddEventHandler('ls_beeper_SV:PlayWithinDistance', function(maxDistance, soundFile, soundVolume)
    local src = source
    local DistanceLimit = 300
    if maxDistance < DistanceLimit then
	    TriggerClientEvent('ls_beeper_CL:PlayWithinDistance', -1, GetEntityCoords(GetPlayerPed(src)), maxDistance, soundFile, soundVolume)
    else
      print(('[interact] [^3WARNING^7] %s attempted to trigger ls_beeper_SV:PlayWithinDistance over the distance limit ' .. DistanceLimit):format(GetPlayerName(src)))
    end
end)
