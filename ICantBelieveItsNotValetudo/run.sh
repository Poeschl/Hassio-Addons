#!/usr/bin/env bashio

bashio::log.info 'Setup config'
echo '{"mqtt":' > /app/config.json
cat /data/options.json >> /app/config.json
echo ', "webserver": { "enabled": true, "port": 3000 }}' >> /app/config.json

bashio::log.info 'Start ICantVelieveItsNotValetudo'
npm start
