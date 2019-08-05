#!/bin/bash
set -e
archs="${ARCHS}"

for addon in "$@"; do

  if [ -z ${TRAVIS_COMMIT_RANGE} ] || git diff --name-only ${TRAVIS_COMMIT_RANGE} | grep -q ${addon}; then
    if [ -z "$archs" ]; then
      archs=$(jq -r '.arch // ["armv7", "armhf", "amd64", "aarch64", "i386"] | [.[] | "--" + .] | join(" ")' ${addon}/config.json)
    fi

    if [[ "$TRAVIS_BRANCH" != 'master' ]]; then
        test='--test'
        echo 'Prevent docker hub push, since its not the master!'
    fi
     
    echo "Building archs: ${archs}"
    docker run --rm --privileged -v ~/.docker:/root/.docker -v $(pwd)/${addon}:/data homeassistant/amd64-builder ${archs} -t /data ${test}
  else
    echo "No change in commit range ${TRAVIS_COMMIT_RANGE} for ${addon}"
  fi
done
