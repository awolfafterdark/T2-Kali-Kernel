#!/bin/bash

set -eu -o pipefail

BUILD_PATH=/tmp/build-kernel

# Patches
PATCHES_GIT_URL=https://github.com/Redecorating/mbp-16.1-linux-wifi.git
PATCHES_BRANCH_NAME=main
PATCHES_COMMIT_HASH=c1dc3beb31f1c5b05f0f2319472d4323b19dc3a7

rm -rf "${BUILD_PATH}"
mkdir -p "${BUILD_PATH}"
cd "${BUILD_PATH}" || exit

### AppleSMC and BT aunali fixes
git clone --single-branch --branch ${PATCHES_BRANCH_NAME} ${PATCHES_GIT_URL} \
  "${BUILD_PATH}/linux-mbp-arch"
cd "${BUILD_PATH}/linux-mbp-arch" || exit
git checkout ${PATCHES_COMMIT_HASH}
rm 2001*
rm 100*

while IFS= read -r file; do
  echo "==> Adding ${file}"
  cp -rfv "${file}" "${WORKING_PATH}"/patches/"${file##*/}"
done < <(find "${BUILD_PATH}/linux-mbp-arch" -type f -name "*.patch" | grep -vE '000[0-9]')