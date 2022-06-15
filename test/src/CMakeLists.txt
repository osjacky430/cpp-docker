find_package(fmt REQUIRED)

add_executable(main main.cpp)
target_compile_features(main PRIVATE cxx_std_20)
target_link_libraries(main PRIVATE fmt::fmt)

enable_testing()
add_test(NAME test COMMAND main)