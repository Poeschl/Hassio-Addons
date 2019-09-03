#!/bin/bash
set -e
archs="${ARCHS}"

for addon in "$@"; do

  if [[ "$(jq -r '.image' ${addon}/config.json)" == 'null' ]]; then
    echo "No build image set for ${addon}. Skip build!"
    exit 0
  fi
  
  changed_files=$(git diff --name-only --oneline "${TRAVIS_COMMIT_RANGE}" -- ${addon}/ | cat)
  echo "Changed files in ${TRAVIS_COMMIT_RANGE} for ${addon}:"
  echo "${changed_files}"

  if [ -z ${TRAVIS_COMMIT_RANGE} ] || [ ! -z "$changed_files" ]; then
    if [ -z "$archs" ]; then
      archs=$(jq -r '.arch // ["armv7", "armhf", "amd64", "aarch64", "i386"] | [.[] | "--" + .] | join(" ")' ${addon}/config.json)
    fi

    if [[ "$TRAVIS_BRANCH" != 'master' ]]; then
        test='--test'
        echo 'Prevent docker hub push, since its not the master!'
    else 
        docker login -u $DOCKER_USER -p $DOCKER_PASS
    fi
     
    echo "Building archs: ${archs}"
    docker run --rm --privileged -v ~/.docker:/root/.docker -v $(pwd)/${addon}:/data homeassistant/amd64-builder ${archs} -t /data ${test}
  else
    echo "No change from latest master for ${addon}"
  fi
done
