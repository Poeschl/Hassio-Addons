#!/usr/bin/env bashio
set -e

bashio::log.info 'Update Certificates'
update-ca-certificates

bashio::log.info 'Create media folder if not existing'
mkdir -p /share/mopidy/media
mkdir -p /share/mopidy/playlists

bashio::log.info 'Setup config'
local_scan=$(cat /data/options.json | jq -r '.local_scan // empty')
options=$(cat /data/options.json | jq -r 'if .options then [.options[] | "-o "+.name+"="+.value ] | join(" ") else "" end')
config="/var/lib/mopidy/.config/mopidy/mopidy.conf"

bashio::log.info 'Start Mopidy....'
if  [ "$local_scan" == "true" ]; then
    mopidy --config "$config" "$options" local scan
fi
mopidy --config "$config" "$options"
