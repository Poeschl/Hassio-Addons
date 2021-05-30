#!/usr/bin/with-contenv bashio
# shellcheck shell=bash
set -e

bashio::log.info 'Apply sudoers rights for mopidy restart'
echo "root ALL=NOPASSWD: /usr/lib/python3.9/site-packages/mopidy_iris/system.sh" >> /etc/sudoers