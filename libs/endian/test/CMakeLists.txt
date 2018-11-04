include(CMTest)

find_package(${CMAKE_WORKSPACE_NAME}_random)
find_package(${CMAKE_WORKSPACE_NAME}_detail)
find_package(${CMAKE_WORKSPACE_NAME}_timer)
find_package(${CMAKE_WORKSPACE_NAME}_lexical_cast)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_endian
                        ${CMAKE_WORKSPACE_NAME}::random
                        ${CMAKE_WORKSPACE_NAME}::detail
                        ${CMAKE_WORKSPACE_NAME}::timer
                        ${CMAKE_WORKSPACE_NAME}::lexical_cast
                        )

# Boost Endian Library test Jamfile

# Copyright Beman Dawes 2006, 2013

# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

# See library home page at http://www.boost.org/libs/endian

#test-suite "endian"
cm_test(NAME endian_test_buffer_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/buffer_test.cpp)
cm_test(NAME endian_test_endian_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/endian_test.cpp)
cm_test(NAME endian_test_endian_operations_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/endian_operations_test.cpp)
cm_test(NAME endian_test_endian_in_union_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/endian_in_union_test.cpp)
cm_test(NAME endian_test_conversion_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/conversion_test.cpp)
#         [ run endian_test_floating_point_test.cpp : : : <test-info>always_show_run_output ]
