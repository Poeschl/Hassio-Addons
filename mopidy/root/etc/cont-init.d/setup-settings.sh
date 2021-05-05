#!/usr/bin/with-contenv bashio
# shellcheck shell=bash
set -e

if [ "$(bashio::config 'custom_config')" != 'null' ]; then
	bashio::log.info 'Use custom config'
    cp "$(bashio::config 'custom_config')" '/etc/mopidy.conf'
else

  bashio::log.info 'Apply addon settings'
  tempio -conf /data/options.json -template /etc/mopidy-template.conf -out /etc/mopidy.conf
fi
