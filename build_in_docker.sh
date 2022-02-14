#!/bin/bash

set -eu -o pipefail

DOCKER_IMAGE=kalilinux/kali-rolling

docker pull ${DOCKER_IMAGE}
docker run \
  -t \
  --rm \
  -v "$(pwd)":/repo \
  ${DOCKER_IMAGE} \
  /bin/bash -c 'cd /repo && ./build.sh'