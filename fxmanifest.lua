fx_version 'cerulean'
game 'gta5'

author 'Lone dev'
description 'Announcement'
version '1.0.0'
lua54 'yes'

client_scripts {
    'bridge/client/client.lua',
    'client/client.lua',
}

server_scripts {
    'bridge/server/server.lua',
    'server/server.lua',
}

shared_scripts {
    'config.lua',
}

ui_page{
    'web/dist/index.html'
}

files {
    'web/dist/index.html',
    'web/dist/assets/*.css',
    'web/dist/assets/*.js',
    'web/dist/sounds/*.ogg',
    'web/dist/fonts/*.ttf',
}