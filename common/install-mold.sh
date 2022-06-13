#!/usr/bin/env bash
set -eou pipefail

VERSION="1.2.1"
MOLD_TAR_NAME="mold-${VERSION}-$(uname -m)-linux"
MIRROR_URL="https://github.com/rui314/mold/releases/download/v${VERSION}/${MOLD_TAR_NAME}.tar.gz"
DOWNLOAD_FILE="mold.tar.gz"

wget -nv -O "${DOWNLOAD_FILE}" "${MIRROR_URL}" -o /dev/null

tar -xf "${DOWNLOAD_FILE}"
mv ${MOLD_TAR_NAME}/libexec/mold /usr/libexec
mv ${MOLD_TAR_NAME}/lib/mold /usr/lib
cp ${MOLD_TAR_NAME}/bin/* /usr/bin
mv ${MOLD_TAR_NAME}/share/man/man1/mold.1 /usr/share/man/main1

# Cleanup
rm -rf "${DOWNLOAD_FILE}" "${MOLD_TAR_NAME}"