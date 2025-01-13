fx_version 'cerulean'
game 'gta5'

description 'Kaatu-komento mopolle'

server_scripts {
    '@es_extended/locale.lua',
    '@ox_lib/init.lua', -- Lisää ox_lib
    'server.lua'
}

client_scripts {
    '@es_extended/locale.lua',
    '@ox_lib/init.lua', -- Lisää ox_lib
    'client.lua'
}

dependencies {
    'es_extended',
    'ox_lib' -- Lisää ox_lib riippuvuuksiin
}
