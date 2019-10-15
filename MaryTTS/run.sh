#!/usr/bin/env bashio
set -e

bashio::log.info 'Start MaryTTS'
bin/marytts-server
