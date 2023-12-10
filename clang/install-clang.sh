#!/usr/bin/env bash
set -eoux pipefail

DEBIAN_NAME=$1
LLVM_VERSION=$2

REPO_NAME="deb http://apt.llvm.org/${DEBIAN_NAME}/ llvm-toolchain-${DEBIAN_NAME}-${LLVM_VERSION} main"

wget -nv -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add - 
echo "$REPO_NAME" | tee -a /etc/apt/sources.list
apt-get update -qq && apt-get install -y --no-install-recommends clang-$LLVM_VERSION libc++-$LLVM_VERSION-dev libc++abi-$LLVM_VERSION-dev clang-tools-$LLVM_VERSION