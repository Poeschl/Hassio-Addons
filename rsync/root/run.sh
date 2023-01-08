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
FOLDERS=$(bashio::addon.config | jq -r ".folders")

if bashio::config.has_value 'remote_port'; then
  PORT=$(bashio::config 'remote_port')
  bashio::log.info "Use port $PORT"
else
  PORT=22
fi
folder_count=$(echo "$FOLDERS" | jq -r '. | length')
for (( i=0; i<folder_count; i=i+1 )); do

  local=$(echo "$FOLDERS" | jq -r ".[$i].source")
  remote=$(echo "$FOLDERS" | jq -r ".[$i].destination")
  options=$(echo "$FOLDERS" | jq -r ".[$i].options // \"-archive --recursive --compress --delete --prune-empty-dirs\"")
  bashio::log.info "Sync ${local} -> ${remote} with options \"${options}\""
  set -x
  # shellcheck disable=SC2086
  rsync ${options} \
  -e "ssh -p ${PORT} -i ${PRIVATE_KEY_FILE} -oStrictHostKeyChecking=no" \
  "$local" "${USERNAME}@${HOST}:${remote}"
  set +x
done

bashio::log.info "Synced all folders"