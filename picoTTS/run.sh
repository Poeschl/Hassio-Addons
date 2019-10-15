#!/usr/bin/env bashio
set -e

bashio::log.info 'Start PicoTTS webserver'
python3 -u src/picowrapper.py
