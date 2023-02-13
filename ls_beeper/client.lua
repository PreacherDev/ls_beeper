local inventory = {}
local loadout = {}
local job = nil 
local connected = false 

RegisterNetEvent('ls_beeper:getUserDataCL', function(weap, inv)
    inventory = inv 
    loadout = weap
end)

RegisterNetEvent('ls_beeper:getJobCL', function(jobname)
    job = jobname
end)

CreateThread(function()
    while true do
        local sleep = Config.CheckInterval['job']*1000
        if connected then 
            TriggerServerEvent('ls_beeper:getJob')
        else
            sleep = 1000
        end
        Wait(sleep)
    end
end)

CreateThread(function()
    while true do
        local sleep = Config.CheckInterval['loadout/inventory']*1000
        if connected then 
            TriggerServerEvent('ls_beeper:getUserData')
        else 
            sleep = 1000
        end
        Wait(sleep)
    end
end)

CreateThread(function()
    while true do
        local beep = false
        local sleep = 200
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        
        for k, v in pairs(Config.Beeper) do 
            local distance = #(v.pos - playerCoords)
            -- print(distance)
            if distance <= v.checkRadius then 
                for k2, weapon in pairs(v.allowedWeapons) do 
                    for k3, loadout in pairs(loadout) do 
                        if loadout.name ~= weapon then 
                            -- -- print(loadout.name)
                            beep = true
                        end
                    end
                end
                for k2, item in pairs(v.disallowedItems) do 
                    for k3, inv in pairs(inventory) do 
                        if inv.name == item and inv.count > 0 then 
                            -- -- print(inv.name)
                            beep = true
                        end
                    end
                end
                
                
                -- print(hasJob(v))
                if beep and not hasJob(v) then 
                    -- print('BEEEEEEEP')
                    TriggerServerEvent('ls_beeper_SV:PlayWithinDistance', v.SoundRadius, 'METALDETECTOR', 0.5)    
                    Wait(1200)
                end
            end  
            
            if distance <= 5.0 then 
                sleep = 1
            end
            
        end
        Wait(sleep)
    end
end)

AddEventHandler('esx:onPlayerSpawn', function(spawn)
    connected = true
end)

function hasJob(tab)
    for k2, jobs in pairs(tab.ignoreJobs) do 
        if jobs == job then 
            -- print('loop',jobs, job)
            return true 
        end 
    end 
    return false
end
