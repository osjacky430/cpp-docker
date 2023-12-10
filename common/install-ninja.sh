#!/usr/bin/env bash
set -eoux pipefail

git clone https://github.com/ninja-build/ninja
cd ninja

./configure.py --bootstrap
mv ./ninja /usr/bin

# Cleanup
cd .. && rm -rf ninja