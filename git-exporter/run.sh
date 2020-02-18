#!/usr/bin/env bashio
set -e

local_repository='/data/repository'
repository="$(bashio::config 'repository')"
username="$(bashio::config 'username')"
password="$(bashio::config 'password')"
pull_before_push="$(bashio::config 'pull_before_push')"
check_for_secrets="$(bashio::config 'check_for_secrets')"
check_for_ips="$(bashio::config 'config_folder')"

bashio::log.info 'Start git export'

if [ ! -d $local_repository ]; then
	bashio::log.info 'Create local repository'
	mkdir -p $local_repository
fi
cd $local_repository

if [ ! -d .git ]; then
	fullurl=https://${username}:${password}@${repository##*https://}
	if [ "$pull_before_push" == 'true' ]; then
		bashio::log.info 'Clone existing repository'
		git clone $fullurl $local_repository
	else 
		bashio::log.info 'Initialize new repository'
		git init
		git remote add origin $fullurl
	fi
	git config user.name "${username}"
	git config user.email 'git.exporter@hass.io'
fi

if [ "$pull_before_push" == 'true' ]; then
	bashio::log.info 'Pull latest'
	git pull --rebase
fi

#TODO: make excludes configurable
bashio::log.info 'Update local repository with running config'
rsync -archive --checksum --exclude-from=/exclude.txt -q /config ${local_repository}

bashio::log.info 'Commit changes and push to remote'
git add .
git commit -m "Home Assistant Config Export"

if [ ! "$pull_before_push" == 'true' ]; then
	git push --set-upstream origin master -f
else
	git push origin
fi
