#!/bin/bash
set -e

mkdir -p /share/mopidy/media
mkdir -p /share/mopidy/playlists

local_scan=$(cat /data/options.json | jq -r '.local_scan // empty')
options=$(cat /data/options.json | jq -r 'if .options then [.options[] | "-o "+.name+"="+.value ] | join(" ") else "" end')
config="/var/lib/mopidy/.config/mopidy/mopidy.conf"

if  [ "$local_scan" == "true" ]; then
    mopidy --config "$config" "$options" local scan
fi
mopidy --config "$config" "$options"
