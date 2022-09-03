#!/usr/bin/env bashio
# shellcheck shell=bash
set -e

FOLDERS=$(bashio::config 'folders')
EXTERNAL_FOLDER=$(bashio::config 'external_folder')

if ! bashio::config.has_value 'external_device'; then
  bashio::log.info "Detected devices..."
  ls -h1 /dev/sd*

  bashio::log.info "Select your device and insert it in the 'external_device' addon option."
  bashio::log.info "For example: \"External_device: /dev/sda1\""
  bashio::log.info "Then restart the addon for the first sync."

else
  bashio::log.info "Starting sync..."
  EXTERNAL_DEVICE=$(bashio::config 'external_device')


  bashio::log.info "Mounting device ${EXTERNAL_DEVICE}"
  mkdir -p /external
  mount "${EXTERNAL_DEVICE}" /external

  for folder in $FOLDERS; do

    local=$(echo "$folder" | jq -r '.source')
    options=$(echo "$folder" | jq -r '.options // "-archive --recursive --compress --delete --prune-empty-dirs"')
    bashio::log.info "Sync ${local} -> ${EXTERNAL_DEVICE}/${EXTERNAL_FOLDER} with options \"${options}\""
    # shellcheck disable=SC2086
    rsync ${options} \
    "$local" "/external/${EXTERNAL_FOLDER}"
  done

  umount /external
  bashio::log.info "Synced all folders"
fi
