#!/usr/bin/env bash
set -e
archs="${ARCHS}"

for addon in "$@"; do
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
  sum=0
  missing=0
  for arch in ${archs}; do
    image_name=${image_template/\{arch\}/$arch}
    sum=$((sum + 1))

    if [[ "$(docker images -q "$image_name:$plugin_version" 2> /dev/null)" == "" ]]; then
      echo -e "${ANSI_RED}No local image for $image_name found.${ANSI_CLEAR}"
      missing=$((missing + 1))
    else
      echo -e "${ANSI_GREEN}Local image $image_name found.${ANSI_CLEAR}"
    fi
  done
  
  if [ "$missing" -eq "$sum" ]; then
    echo 'Images for all architectures missing. Assuming no build and skip.'
    exit 0
  elif [ "$missing" -gt "0" ]; then
    echo -e "${ANSI_RED}There are $missing architecture images missing. Release failed!${ANSI_CLEAR}"
    exit 1
  fi

  if [[ "$FORCE_PUSH" = "true" ]] || { [[ "$TRAVIS_BRANCH" = 'master' ]] && [ -z ${TRAVIS_PULL_REQUEST_BRANCH} ]; }; then
    # Push them
    echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
    for arch in ${archs}; do
      image_name=${image_template/\{arch\}/$arch}

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
