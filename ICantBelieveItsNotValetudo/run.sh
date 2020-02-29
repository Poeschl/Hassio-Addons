#!/usr/bin/env bashio
set -e

bashio::log.info 'Setup config'
echo '{' > /app/config.json
cat /data/options.json >> /app/config.json
echo ', "webserver": { "enabled": true, "port": 3000 }}' >> /app/config.json

bashio::log.info 'Start ICantVelieveItsNotValetudo'
npm start
