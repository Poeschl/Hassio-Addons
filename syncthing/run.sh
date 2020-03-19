#!/usr/bin/env bashio
set -e
bashio::log.info 'Setup config'
mkdir -p /data/config
export STNOUPGRADE=1

bashio::log.info 'Start syncthing'
syncthing -no-browser -no-restart -home=/data/config -gui-address=0.0.0.0:8384
