#!/bin/bash
set -e
archs="${ARCHS}"

for addon in "$@"; do

  if [[ "$(jq -r '.image' ${addon}/config.json)" == 'null' ]]; then
    echo "No build image set for ${addon}. Skip build!"
    exit 0
  fi

  if [ -z ${TRAVIS_COMMIT_RANGE} ] || [ "$TRAVIS_BRANCH" == 'master' ] || git diff --name-only origin/master ${TRAVIS_COMMIT} origin/${TRAVIS_BRANCH} | grep -q ${addon}; then
    if [ -z "$archs" ]; then
      archs=$(jq -r '.arch // ["armv7", "armhf", "amd64", "aarch64", "i386"] | [.[] | "--" + .] | join(" ")' ${addon}/config.json)
    fi

    echo 'Changed files:'
    git diff --name-only origin/master ${TRAVIS_COMMIT} origin/${TRAVIS_BRANCH} origin/${TRAVIS_BRANCH}

    if [[ "$TRAVIS_BRANCH" != 'master' ]]; then
        test='--test'
        echo 'Prevent docker hub push, since its not the master!'
    fi
     
    echo "Building archs: ${archs}"
    docker run --rm --privileged -v ~/.docker:/root/.docker -v $(pwd)/${addon}:/data homeassistant/amd64-builder ${archs} -t /data ${test}
  else
    echo "No change from latest master for ${addon}"
  fi
done
