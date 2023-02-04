Config = {}

Config.CheckInterval = {
    ['job']               = 2*60, -- seconds
    ['loadout/inventory'] = 10, -- seconds
}

Config.Beeper = {
    ['LSPD'] = {
        ['pos']            = vec3(611.3975, -386.0951, 24.7951),
        ['checkRadius']    = 1.0, 
        ['SoundRadius']    = 5.0, 
        ['ignoreJobs']     = {'police', 'ambulance'}, 
        ['allowedWeapons'] = {'WEAPON_PISTOL'}, 
        ['disallowedItems']    = {'water'},
    },
}