# Docker
A self learning repo regarding docker usage, including development, CI, and deployment.

## Compiler used
Additional versions of the compiler will be added in the future. These two are the one I'm using for my own project recently.

- gcc: 12 on bullseye
- clang: 14 on bullseye

## Tool used

These tools will be kept as up-to-date as possible
- cmake: build system generator
- ninja: build system
- ccache: compiler cache
- [mold](https://github.com/rui314/mold): linker
- conan: c++ package manager

## Some notes

To use clang's stl implementation, remember to compile the code with libc++, by specifying build flag:

``` cmake
if (CMAKE_CXX_COMPILER_ID MATCHES "Clang" AND NOT ANDROID)
  add_compile_options(-stdlib=libc++)
  add_link_options(-stdlib=libc++)
endif()
```

## Reference
- [foonathan/docker](https://github.com/foonathan/docker)
- [dockerized cpp build](https://ddanilov.me/dockerized-cpp-build)
- [libc++ usage in CMake with Clang](https://cmake.org/pipermail/cmake/2018-August/068100.html)