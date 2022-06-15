macro (run_conan)
  if (NOT EXISTS "${CMAKE_CURRENT_BINARY_DIR}/conan.cmake")
    message(STATUS "Downloading conan.cmake from https://github.com/conan-io/cmake-conan")
    file(DOWNLOAD "https://raw.githubusercontent.com/conan-io/cmake-conan/0.18.1/conan.cmake" "${CMAKE_BINARY_DIR}/conan.cmake"
         TLS_VERIFY ON)
  endif ()

  include(${CMAKE_CURRENT_BINARY_DIR}/conan.cmake)

  conan_cmake_configure(REQUIRES fmt/8.1.1 GENERATORS cmake_find_package)
  conan_cmake_autodetect(settings BUILD_TYPE Release)

  conan_cmake_install(PATH_OR_REFERENCE . BUILD missing SETTINGS ${settings})
endmacro ()
