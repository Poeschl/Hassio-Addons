#!/usr/bin/env bash
set -e
archs="${ARCHS}"

for addon in "$@"; do

  #Skips release if nothing was build with build.sh
  if [ [[ $NO_BUILD =~ (^|[[:space:]])$addon($|[[:space:]]) ]] ]; then
    echo "No build. Skip release!"
    exit 0
  fi

  if [[ "$(jq -r '.image' ${addon}/config.json)" == 'null' ]]; then
    echo "No build image set for ${addon}. Skip release!"
    exit 0
  fi

  if [ -z "$archs" ]; then
    archs=$(jq -r '.arch // ["armv7", "armhf", "amd64", "aarch64", "i386"] | [.[] | .] | join(" ")' "${addon}/config.json")
  fi
  image_template=$(jq -r '.image' "${addon}/config.json")
  plugin_version=$(jq -r '.version' "${addon}/config.json")

  # Check the existance of all images
  error=0
  for arch in ${archs}; do
    image_name=${image_template/\{arch\}/$arch}

    if [[ "$(docker images -q "$image_name:$plugin_version" 2> /dev/null)" == "" ]]; then
      echo "No local image for $image_name found. Aborting..."
      error=1
    else
      echo "Local image $image_name found."
    fi
  done

  if [ "$error" -gt "0" ]; then
    exit 1
  fi

  if [[ "$TRAVIS_BRANCH" = 'master' ]] && [ -z ${TRAVIS_PULL_REQUEST_BRANCH} ]; then
    # Push them
    docker login -u "$DOCKER_USER" -p "$DOCKER_PASS"
    for arch in ${archs}; do
      image_name=${image_template/{arch}/${arch}}

      echo "Push $image_name..."
      docker push "$image_name:$plugin_version"
      docker push "$image_name:latest"
      echo "Pushed $image_name"
    done

  else
    echo 'Not master, skip docker push.'
  fi
  echo "Finished deployment of ${addon}"
done
