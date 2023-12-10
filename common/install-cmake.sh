#!/usr/bin/env bash
set -eoux pipefail

MIRROR_URL="https://github.com/Kitware/CMake/releases/download/v3.28.0/cmake-3.28.0-linux-$(uname -m).sh"
DOWNLOAD_FILE="cmake.sh"

wget -nv -O "${DOWNLOAD_FILE}" "${MIRROR_URL}" -o /dev/null

# Install
bash "${DOWNLOAD_FILE}" --skip-license --prefix=/usr/local --exclude-subdir

# Cleanup
rm "${DOWNLOAD_FILE}"