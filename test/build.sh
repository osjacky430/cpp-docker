set -eou pipefail

cmake -S /src --preset=release
cmake --build /src/build --target main --config release
ctest --verbose --test-dir /src/build/src