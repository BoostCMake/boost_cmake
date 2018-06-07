include(BCMTest)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)

find_package(${CMAKE_WORKSPACE_NAME}_function)
find_package(${CMAKE_WORKSPACE_NAME}_core)
find_package(${CMAKE_WORKSPACE_NAME}_thread)
find_package(${CMAKE_WORKSPACE_NAME}_date_time)
find_package(${CMAKE_WORKSPACE_NAME}_bind)
find_package(${CMAKE_WORKSPACE_NAME}_align)

bcm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_atomic
                        boost::align
                        boost::function
                        boost::core
                        boost::thread
                        boost::date_time
                        boost::bind
                        )

#  Boost.Atomic Library test Jamfile
#
#  Copyright (c) 2011 Helge Bahmann
#  Copyright (c) 2012 Tim Blechmann
#
#  Distributed under the Boost Software License, Version 1.0. (See
#  accompanying file LICENSE_1_0.txt or copy at
#  http://www.boost.org/LICENSE_1_0.txt)


bcm_test(NAME atomic_test_native_api SOURCES ${CMAKE_WORKSPACE_SOURCE}/native_api.cpp)
bcm_test(NAME atomic_test_fallback_api SOURCES ${CMAKE_WORKSPACE_SOURCE}/fallback_api.cpp)
bcm_test(NAME atomic_test_atomicity SOURCES ${CMAKE_WORKSPACE_SOURCE}/atomicity.cpp)
bcm_test(NAME atomic_test_ordering SOURCES ${CMAKE_WORKSPACE_SOURCE}/ordering.cpp)
bcm_test(NAME atomic_test_lockfree SOURCES ${CMAKE_WORKSPACE_SOURCE}/lockfree.cpp)
