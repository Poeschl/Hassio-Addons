#!/usr/bin/env bashio

bashio::log.info' Start PicoTTS webserver'
python3 -u src/picowrapper.py
