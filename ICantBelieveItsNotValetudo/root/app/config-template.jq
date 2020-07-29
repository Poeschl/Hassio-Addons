{
  "mapSettings": (.mapSettings + {"colors": (.mapColors // {})}),
  "mqtt" : .mqtt,
  "webserver": { 
    "enabled": true,
    "port": 3000 
  }
}