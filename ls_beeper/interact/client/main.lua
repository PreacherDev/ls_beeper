RegisterNetEvent('ls_beeper_CL:PlayWithinDistance', function(otherPlayerCoords, maxDistance, soundFile, soundVolume)
	local myCoords = GetEntityCoords(PlayerPedId())
	local distance = #(myCoords - otherPlayerCoords)

	if distance < maxDistance then
		SendNUIMessage({
			transactionType = 'playSound',
			transactionFile  = soundFile,
			transactionVolume = soundVolume or standardVolumeOutput
		})
	end
end)

