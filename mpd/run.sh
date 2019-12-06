#!/usr/bin/env bashio
set -e

bashio::log.info  'Setup folders'
mkdir -p /data/database \
     /share/mpd/music \
    /share/mpd/playlists

bashio::log.info  'Start MPD'
mpd --stdout --no-daemon & sleep 3

bashio::log.info  'Start ympd'
ympd -w 6680
