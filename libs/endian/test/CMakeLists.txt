include(BCMTest)

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


bcm_test(NAME endian_test_buffer_test SOURCES buffer_test.cpp)
bcm_test(NAME endian_test_endian_test SOURCES endian_test.cpp)
bcm_test(NAME endian_test_endian_operations_test SOURCES endian_operations_test.cpp)
bcm_test(NAME endian_test_endian_in_union_test SOURCES endian_in_union_test.cpp)
bcm_test(NAME endian_test_conversion_test SOURCES conversion_test.cpp)
#         [ run endian_test_floating_point_test.cpp : : : <test-info>always_show_run_output ]

