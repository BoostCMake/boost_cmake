include(BCMTest)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)

find_package(${CMAKE_WORKSPACE_NAME}_core)

bcm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_throw_exception
                        boost::core
                        )

# Boost Exception Library test Jamfile
#
# Copyright (c) 2006-2009 Emil Dotchevski and Reverge Studios, Inc.
#
# Distributed under the Boost Software License, Version 1.0. (See accompanying
# file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)


bcm_test(NAME throw_exception_test_throw_exception_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/throw_exception_test.cpp)
bcm_test(NAME throw_exception_test_throw_exception_no_exceptions_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/throw_exception_no_exceptions_test.cpp)
bcm_test(NAME throw_exception_test_throw_exception_no_integration_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/throw_exception_no_integration_test.cpp)
bcm_test(NAME throw_exception_test_throw_exception_no_both_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/throw_exception_no_both_test.cpp)

bcm_test(NAME throw_exception_test_throw_exception_fail SOURCES ${CMAKE_WORKSPACE_SOURCE}/throw_exception_fail.cpp COMPILE_ONLY WILL_FAIL)
