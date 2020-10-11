#!/usr/bin/env bashio
# shellcheck shell=bash

set -e

PRIVATE_KEY_FILE=$(bashio::config 'private_key_file')
if [ ! -f "$PRIVATE_KEY_FILE" ]; then
	bashio::log.info 'Generate keypair'

	mkdir -p "$(dirname "$PRIVATE_KEY_FILE")"
	ssh-keygen -t rsa -b 4096 -f "$PRIVATE_KEY_FILE" -N ''

	bashio::log.info "Generated key-pair in $PRIVATE_KEY_FILE"
else
	bashio::log.info "Use private key from $PRIVATE_KEY_FILE"
fi

HOST=$(bashio::config 'remote_host')
USERNAME=$(bashio::config 'username')
FOLDERS=$(bashio::config 'folders')
REMOTE_FOLDER=$(bashio::config 'remote_folder')

if bashio::config.has_value 'remote_port'; then
	PORT=$(bashio::config 'remote_port')
	bashio::log.info "Use port $PORT"
else
	PORT=22
fi

for folder in $FOLDERS; do
	PARENT_FOLDER="$(basename "$folder")"

	bashio::log.info "Sync $folder -> ${REMOTE_FOLDER}/${PARENT_FOLDER}"
	rsync -archive --recursive --compress --delete --checksum --prune-empty-dirs --progress \
	-e "ssh -p ${PORT} -i ${PRIVATE_KEY_FILE} -oStrictHostKeyChecking=no" \
	"$folder" "${USERNAME}@${HOST}:${REMOTE_FOLDER}/${PARENT_FOLDER}"
done

bashio::log.info "Synced all folders"