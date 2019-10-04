#!/usr/bin/env bashio

bashio::log.info 'Setup language packs'

# Get specified language packs
packs=$(cat '/data/options.json' | jq '.languagePacks')

bashio::log.info 'Start MaryTTS'
bin/marytts-server
