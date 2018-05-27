include(BCMTest)

find_package(${CMAKE_WORKSPACE_NAME}_align)
find_package(${CMAKE_WORKSPACE_NAME}_thread)
find_package(${CMAKE_WORKSPACE_NAME}_bind)
find_package(${CMAKE_WORKSPACE_NAME}_timer)
find_package(${CMAKE_WORKSPACE_NAME}_test)
find_package(${CMAKE_WORKSPACE_NAME}_utility)

bcm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_filesystem
                        boost::align
                        boost::thread
                        boost::bind
                        boost::timer
                        boost::test
                        boost::utility
                        )

# Boost Filesystem Library test Jamfile

# (C) Copyright Beman Dawes 2002-2006
# Distributed under the Boost Software License, Version 1.0.
# See www.boost.org/LICENSE_1_0.txt

# bcm_test(NAME fs_config_info SOURCES config_info.cpp)
bcm_test(NAME filesystem_test_convenience_test SOURCES convenience_test.cpp)
bcm_test(NAME filesystem_test_macro_default_test SOURCES macro_default_test.cpp COMPILE_ONLY)
bcm_test(NAME filesystem_test_fs_odr_test SOURCES odr1_test.cpp odr2_test.cpp)
bcm_test(NAME filesystem_test_deprecated_test SOURCES deprecated_test.cpp)
bcm_test(NAME filesystem_test_fstream_test SOURCES fstream_test.cpp)
bcm_test(NAME filesystem_test_large_file_support_test SOURCES large_file_support_test.cpp)
bcm_test(NAME filesystem_test_locale_info SOURCES locale_info.cpp)
bcm_test(NAME filesystem_test_operations_test SOURCES operations_test.cpp)
bcm_test(NAME filesystem_test_operations_unit_test SOURCES operations_unit_test.cpp)
bcm_test(NAME filesystem_test_path_test SOURCES path_test.cpp)
bcm_test(NAME filesystem_test_path_unit_test SOURCES path_unit_test.cpp)
# bcm_test(NAME filesystem_test_relative_test SOURCES relative_test.cpp)
bcm_test(NAME filesystem_test_example_simple_ls SOURCES ../example/simple_ls.cpp)
bcm_test(NAME filesystem_test_example_file_status SOURCES ../example/file_status.cpp)
