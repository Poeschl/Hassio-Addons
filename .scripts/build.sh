#!/usr/bin/env bash
set -e
archs="${ARCHS}"
buildimage_version='6.4'

for addon in "$@"; do

  if [[ "$(jq -r '.image' ${addon}/config.json)" == 'null' ]]; then
    echo "No build image set for ${addon}. Skip build!"
    exit 0
  fi
  
if [[ "$TRAVIS_EVENT_TYPE" == 'pull_request' ]]; then
  changed_files=$(git diff --name-only --oneline "${TRAVIS_COMMIT_RANGE}" -- "${addon}"/ | cat)
elif [[ "$TRAVIS_EVENT_TYPE" == 'push' ]]; then
  git remote set-branches --add origin master
  git fetch
  TRAVIS_COMMIT_RANGE="origin/master...$TRAVIS_COMMIT"
  changed_files=$(git diff --name-only --oneline "${TRAVIS_COMMIT_RANGE}" -- "${addon}"/ | cat)
fi
  
  echo "Changed files in ${TRAVIS_COMMIT_RANGE} for ${addon}:"
  echo "${changed_files}"

  if { [ -z ${TRAVIS_COMMIT_RANGE} ] || [ ! -z "$changed_files" ]; } || [[ "$FORCE_PUSH" = "true" ]]; then
    if [ -z "$archs" ]; then
      archs=$(jq -r '.arch // ["armv7", "armhf", "amd64", "aarch64", "i386"] | [.[] | "--" + .] | join(" ")' ${addon}/config.json)
    fi
     
    echo "Building archs: ${archs}"
    docker run --rm --privileged -v '/var/run/docker.sock:/var/run/docker.sock' -v "$(pwd)/${addon}:/data" \
      "homeassistant/amd64-builder:${buildimage_version}" ${archs} -t /data --test
  else
    echo "No change for ${addon}"
  fi
done
