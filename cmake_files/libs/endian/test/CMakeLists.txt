include(BCMTest)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)

find_package(${CMAKE_WORKSPACE_NAME}_random)
find_package(${CMAKE_WORKSPACE_NAME}_detail)
find_package(${CMAKE_WORKSPACE_NAME}_timer)
find_package(${CMAKE_WORKSPACE_NAME}_lexical_cast)

bcm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_endian
                        boost::random
                        boost::detail
                        boost::timer
                        boost::lexical_cast
                        )

# Boost Endian Library test Jamfile

# Copyright Beman Dawes 2006, 2013

# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

# See library home page at http://www.boost.org/libs/endian


bcm_test(NAME endian_test_buffer_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/buffer_test.cpp)
bcm_test(NAME endian_test_endian_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/endian_test.cpp)
bcm_test(NAME endian_test_endian_operations_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/endian_operations_test.cpp)
bcm_test(NAME endian_test_endian_in_union_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/endian_in_union_test.cpp)
bcm_test(NAME endian_test_conversion_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/conversion_test.cpp)
#         [ run endian_test_floating_point_test.cpp : : : <test-info>always_show_run_output ]

