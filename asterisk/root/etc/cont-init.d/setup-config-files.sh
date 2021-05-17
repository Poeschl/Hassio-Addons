#!/usr/bin/with-contenv bashio
# shellcheck shell=bash
set -e

CONFIG_FILES=$(bashio::config 'config_files')

for config in $CONFIG_FILES; do
	bashio::log.info "Apply '$config'"
	cp "$config" '/etc/asterisk/'
done

chown -R asterisk:asterisk /etc/asterisk
chmod 640 -R /etc/asterisk
