cmake_minimum_required(VERSION 3.23.0 FATAL_ERROR)
project(docker_test)

list(APPEND CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake" "${CMAKE_CURRENT_BINARY_DIR}")
include(cmake/Conan.cmake)

run_conan()

add_subdirectory(src)