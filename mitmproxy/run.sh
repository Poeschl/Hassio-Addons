#!/usr/bin/env bashio
set -e
OPTIONS=$(jq -r '.options | map("\(.name)=\(.value|tostring)") | [.[] | "--set "  + .] |  join(" ")' /data/options.json)

bashio::log.info 'Start mitmproxy'
bashio::log.info "with options: $OPTIONS"
# shellcheck disable=SC2086
mitmweb $OPTIONS --set 'web_host=0.0.0.0' --set 'web_port=8081' --set 'listen_port=8080' --set 'confdir=/data/mitmproxy' --no-web-open-browser
