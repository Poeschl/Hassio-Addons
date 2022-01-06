#!/usr/bin/with-contenv bashio
set -e

bashio::log.info 'Prepare noVNC for Home Assistant ingress'

host_port=$(bashio::core.port)
ingress_url=$(bashio::addon.ingress_entry)

sed -i "/UI.initSetting/ s@'websockify'@'${ingress_url:1}/websockify'@" /noVNC/app/ui.js