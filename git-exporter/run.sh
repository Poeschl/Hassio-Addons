#!/usr/bin/env bashio
set -e

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

if [ "$check_for_secrets" == 'true' ]; then
	bashio::log.info 'Enable check for secrets'
	# Allow !secret lines
	git secrets --add -a '!secret'

	# Set prohibited patterns
	git secrets --add "password:\s?[\'\"]?\w+[\'\"]?\n?"
	git secrets --add "token:\s?[\'\"]?\w+[\'\"]?\n?"
	git secrets --add "client_id:\s?[\'\"]?\w+[\'\"]?\n?"
	git secrets --add "api_key:\s?[\'\"]?\w+[\'\"]?\n?"
	git secrets --add "chat_id:\s?[\'\"]?\w+[\'\"]?\n?"
	git secrets --add "allowed_chat_ids:\s?[\'\"]?\w+[\'\"]?\n?"
	git secrets --add "latitude:\s?[\'\"]?\w+[\'\"]?\n?"
	git secrets --add "longitude:\s?[\'\"]?\w+[\'\"]?\n?"

	# Set existing secrets as prohibited
	git secrets --add-provider -- $(sed '/^#.*/d;/^&/d;s/^.*://g;s/\s//g' /config/secrets.yaml)

	if [ "$check_for_ips" == 'true' ]; then
		bashio::log.info 'Enable check for ip and mac addresses'
		git secrets --add '([0-9]{1,3}\.){3}[0-9]{1,3}'
		git secrets --add '([0-9A-Fa-f]{2}[:-]){5}([0-9A-Fa-f]{2})'
	fi

	git secrets --scan $(find . -name '*.yaml' -o -name '*.yml' -o -name '*.py' -o -name '*.json') \
	|| bashio::log.error 'Found secrets in files!!! Fix them to be able to commit!'; exit 1
fi

bashio::log.info 'Commit changes and push to remote'
git add .
git commit -m "Home Assistant Config Export"

if [ ! "$pull_before_push" == 'true' ]; then
	git push --set-upstream origin master -f
else
	git push origin
fi