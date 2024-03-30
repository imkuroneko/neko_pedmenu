fx_version  'cerulean'
game        'gta5'
lua54       'yes'
-- ===========================================================
description 'Sistema de PEDs'
author      'KuroNeko'
-- ===========================================================
version     '1.1.0'

-- ===========================================================
shared_scripts { '@ox_lib/init.lua', 'config.lua' }
server_scripts { 'peds.lua', 'server.lua' }
client_scripts { 'client.lua' }
files          { 'locales/es.json' }