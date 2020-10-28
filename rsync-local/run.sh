#!/usr/bin/env bashio
# shellcheck shell=bash
set -e

FOLDERS=$(bashio::config 'folders')
REMOTE_FOLDER=$(bashio::config 'remote_folder')

if bashio::config.has_value 'options'; then
	OPTIONS=$(bashio::config 'options')
	bashio::log.info "Use options $OPTIONS"
else
	OPTIONS='-archive --recursive --compress --delete --prune-empty-dirs'
fi

EXTERNAL_DEVICE='/dev/sda1'

for folder in $FOLDERS; do

	bashio::log.info "Sync $folder -> ${EXTERNAL_DEVICE}/${REMOTE_FOLDER}"
	# shellcheck disable=SC2086
	rsync ${OPTIONS} \
	"$folder" "${EXTERNAL_DEVICE}/${REMOTE_FOLDER}"
done

bashio::log.info "Synced all folders"