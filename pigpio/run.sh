#!/usr/bin/env bashio
set -e

bashio::log.info  'Started pigpio'
pigpiod -g
