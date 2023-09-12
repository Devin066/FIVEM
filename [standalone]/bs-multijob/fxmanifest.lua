  fx_version 'cerulean'
  game 'gta5'
  
  description 'A MultiJob Script'
  authour 'Panem'
  version '1.0.0'
  
server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'data/server.lua'
}
  
shared_scripts { 
    'config.lua'
}
  
  client_scripts {
    'data/client.lua'
}
  
lua54 'yes'