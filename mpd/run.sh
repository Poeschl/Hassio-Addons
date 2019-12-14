#!/usr/bin/env bashio
set -e

bashio::log.info  'Setup folders and settings'
mkdir -p /data/database \
     /share/mpd/music \
    /share/mpd/playlists

if [ "$(bashio::config 'volume_normalization')" = 'true' ]; then
    sed -i "/^#volume_normalization/s/^#//" /etc/mpd.conf
fi

bashio::log.info  'Start MPD'
mpd --stdout --no-daemon & sleep 3

bashio::log.info  'Start ympd'
ympd -w 6680
