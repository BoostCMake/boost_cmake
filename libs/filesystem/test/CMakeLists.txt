include(CMTest)

find_package(${CMAKE_WORKSPACE_NAME}_align)
find_package(${CMAKE_WORKSPACE_NAME}_thread)
find_package(${CMAKE_WORKSPACE_NAME}_bind)
find_package(${CMAKE_WORKSPACE_NAME}_timer)
find_package(${CMAKE_WORKSPACE_NAME}_test)
find_package(${CMAKE_WORKSPACE_NAME}_utility)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_filesystem
                        ${CMAKE_WORKSPACE_NAME}::align
                        ${CMAKE_WORKSPACE_NAME}::thread
                        ${CMAKE_WORKSPACE_NAME}::bind
                        ${CMAKE_WORKSPACE_NAME}::timer
                        ${CMAKE_WORKSPACE_NAME}::test
                        ${CMAKE_WORKSPACE_NAME}::utility
                        )

# Boost Filesystem Library test Jamfile

# (C) Copyright Beman Dawes 2002-2006
# Distributed under the Boost Software License, Version 1.0.
# See www.boost.org/LICENSE_1_0.txt

#test-suite "filesystem"
cm_test(NAME filesystem_test_convenience_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/convenience_test.cpp)
cm_test(NAME filesystem_test_macro_default_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/macro_default_test.cpp COMPILE_ONLY)
cm_test(NAME filesystem_test_fs_odr_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/odr1_test.cpp ${CURRENT_TEST_SOURCES_DIR}/odr2_test.cpp)
cm_test(NAME filesystem_test_deprecated_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/deprecated_test.cpp)
cm_test(NAME filesystem_test_fstream_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/fstream_test.cpp)
cm_test(NAME filesystem_test_large_file_support_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/large_file_support_test.cpp)
cm_test(NAME filesystem_test_locale_info SOURCES ${CURRENT_TEST_SOURCES_DIR}/locale_info.cpp)
cm_test(NAME filesystem_test_operations_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/operations_test.cpp)
cm_test(NAME filesystem_test_operations_unit_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/operations_unit_test.cpp)
cm_test(NAME filesystem_test_path_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/path_test.cpp)
cm_test(NAME filesystem_test_path_unit_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/path_unit_test.cpp)
cm_test(NAME filesystem_test_relative_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/relative_test.cpp)
cm_test(NAME filesystem_test_example_simple_ls SOURCES ${CURRENT_TEST_SOURCES_DIR}/../example/simple_ls.cpp)
cm_test(NAME filesystem_test_example_file_status SOURCES ${CURRENT_TEST_SOURCES_DIR}/../example/file_status.cpp)
