#!/usr/bin/env bashio
set -e

bashio::log.info 'Start mitmproxy'
mitmweb --no-web-open-browser
