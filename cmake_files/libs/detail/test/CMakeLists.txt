include(BCMTest)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)

find_package(${CMAKE_WORKSPACE_NAME}_array)
find_package(${CMAKE_WORKSPACE_NAME}_functional)

bcm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_detail
                        boost::array
                        boost::functional
                        )

################################################################*# Jam #*#######
#   Copyright (C) 2010 Bryce Lelbach
#
#   Distributed under the Boost Software License, Version 1.0. (See accompanying
#   file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)
################################################################################

# import rules for testing conditional on config file variables
bcm_test(NAME detail_test_container_fwd_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/container_fwd/container_fwd_test.cpp)
bcm_test(NAME detail_test_container_fwd_test_debug SOURCES ${CMAKE_WORKSPACE_SOURCE}/container_fwd/container_fwd_test.cpp)
target_compile_definitions(detail_test_container_fwd_test_debug PUBLIC -D_GLIBCXX_DEBUG)
bcm_test(NAME detail_test_container_no_fwd_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/container_fwd/container_no_fwd_test.cpp)

bcm_test(NAME detail_test_binary_search_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/binary_search_test.cpp)
bcm_test(NAME detail_test_is_sorted_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/is_sorted_test.cpp)
# bcm_test(NAME test_utf8_codecvt SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_utf8_codecvt.cpp)
