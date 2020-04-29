#!/usr/bin/env bash
set -e
archs="${ARCHS}"
buildimage_version='7.2.0'

for addon in "$@"; do

  if [[ "$(jq -r '.image' ${addon}/config.json)" == 'null' ]]; then
    echo -e "${ANSI_YELLOW}No build image set for ${addon}. Skip build!${ANSI_CLEAR}"
    exit 0
  fi
  
if [[ "$TRAVIS_EVENT_TYPE" == 'push' ]]; then
  changed_files=$(git diff --name-only --oneline "${TRAVIS_COMMIT_RANGE}" -- "${addon}"/ | cat)
elif [[ "$TRAVIS_EVENT_TYPE" == 'pull_request' ]]; then
  git remote set-branches --add origin master
  git fetch
  TRAVIS_COMMIT_RANGE="origin/master...$TRAVIS_COMMIT"
  changed_files=$(git diff --name-only --oneline "${TRAVIS_COMMIT_RANGE}" -- "${addon}"/ | cat)
fi
  
  echo "Changed files in ${TRAVIS_COMMIT_RANGE} for ${addon}:"
  echo -e "${ANSI_GREEN}${changed_files}${ANSI_CLEAR}"

  if { [ -z ${TRAVIS_COMMIT_RANGE} ] || [ ! -z "$changed_files" ]; } || [[ "$FORCE_PUSH" = "true" ]]; then
    if [ -z "$archs" ]; then
      archs=$(jq -r '.arch // ["armv7", "armhf", "amd64", "aarch64", "i386"] | [.[] | "--" + .] | join(" ")' ${addon}/config.json)
    fi
     
    echo "Building archs: ${archs}"
    docker run --rm --privileged -v '/var/run/docker.sock:/var/run/docker.sock' -v "$(pwd)/${addon}:/data" \
      "homeassistant/amd64-builder:${buildimage_version}" ${archs} -t /data --test
  else
    echo -e "${ANSI_YELLOW}No change for ${addon}${ANSI_CLEAR}"
  fi
done
