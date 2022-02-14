#!/bin/bash

set -eu -o pipefail

DOCKER_IMAGE=kalilinux/kali-rolling

docker pull ${DOCKER_IMAGE}
docker run \
  --privileged \
  -t \
  --rm \
  -v "$(pwd)":/repo \
  ${DOCKER_IMAGE} \
  /bin/bash -c 'cd /repo && chmod +x build.sh && chmod +x patch_driver.sh && ./build.sh'