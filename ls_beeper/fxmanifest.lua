fx_version 'cerulean'
game 'gta5'

author 'LS Scripts - Preacher#6392'
version '1.0'

shared_script '@es_extended/imports.lua'

client_scripts {
  'interact/client/main.lua',
  'config.lua',
  'client.lua',
}

server_scripts {
  'interact/server/main.lua',
  'config.lua',
  'server.lua',
}

ui_page 'interact/client/html/index.html'

files {
  'interact/client/html/index.html',
  'interact/client/html/sounds/**.ogg'
}

