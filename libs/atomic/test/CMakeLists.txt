include(CMTest)

find_package(${CMAKE_WORKSPACE_NAME}_function)
find_package(${CMAKE_WORKSPACE_NAME}_core)
find_package(${CMAKE_WORKSPACE_NAME}_thread)
find_package(${CMAKE_WORKSPACE_NAME}_date_time)
find_package(${CMAKE_WORKSPACE_NAME}_bind)
find_package(${CMAKE_WORKSPACE_NAME}_align)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_atomic
                        ${CMAKE_WORKSPACE_NAME}::align
                        ${CMAKE_WORKSPACE_NAME}::function
                        ${CMAKE_WORKSPACE_NAME}::core
                        ${CMAKE_WORKSPACE_NAME}::thread
                        ${CMAKE_WORKSPACE_NAME}::date_time
                        ${CMAKE_WORKSPACE_NAME}::bind
                        )

#  Boost.Atomic Library test Jamfile
#
#  Copyright (c) 2011 Helge Bahmann
#  Copyright (c) 2012 Tim Blechmann
#
#  Distributed under the Boost Software License, Version 1.0. (See
#  accompanying file LICENSE_1_0.txt or copy at
#  http://www.boost.org/LICENSE_1_0.txt)

cm_test(NAME atomic_test_native_api SOURCES ${CURRENT_TEST_SOURCES_DIR}/native_api.cpp)
cm_test(NAME atomic_test_fallback_api SOURCES ${CURRENT_TEST_SOURCES_DIR}/fallback_api.cpp)
cm_test(NAME atomic_test_atomicity SOURCES ${CURRENT_TEST_SOURCES_DIR}/atomicity.cpp)
cm_test(NAME atomic_test_ordering SOURCES ${CURRENT_TEST_SOURCES_DIR}/ordering.cpp)
cm_test(NAME atomic_test_lockfree SOURCES ${CURRENT_TEST_SOURCES_DIR}/lockfree.cpp)
