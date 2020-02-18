#!/usr/bin/env bashio
set -ex

local_repository='/data/repository'
repository="$(bashio::config 'repository.url')"
username="$(bashio::config 'repository.username')"
password="$(bashio::config 'repository.password')"
pull_before_push="$(bashio::config 'repository.pull_before_push')"
excludes=$(bashio::config 'repository.exclude')

check_for_secrets="$(bashio::config 'check.check_for_secrets')"
check_for_ips="$(bashio::config 'check.config_folder')"

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

bashio::log.info 'Update local repository with running config'
exclude_args=$(printf -- '--exclude=%s ' ${excludes[@]})
rsync -archive --checksum -q $exclude_args /config ${local_repository}

bashio::log.info 'Commit changes and push to remote'
git add .
git commit -m "Home Assistant Config Export"

if [ ! "$pull_before_push" == 'true' ]; then
	git push --set-upstream origin master -f
else
	git push origin
fi