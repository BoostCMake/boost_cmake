include(BCMTest)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)

find_package(${CMAKE_WORKSPACE_NAME}_thread)
find_package(${CMAKE_WORKSPACE_NAME}_timer)
find_package(${CMAKE_WORKSPACE_NAME}_signals)
find_package(${CMAKE_WORKSPACE_NAME}_test)
find_package(${CMAKE_WORKSPACE_NAME}_array)

bcm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_signals2
                        boost::thread
                        boost::timer
                        boost::signals
                        boost::test
                        boost::array
                        )

# Boost.Signals2 Library

# Copyright Douglas Gregor 2001-2003.
# Copyright Frank Mori Hess 2009.
# Use, modification and
# distribution is subject to the Boost Software License, Version
# 1.0. (See accompanying file LICENSE_1_0.txt or copy at
# http://www.boost.org/LICENSE_1_0.txt)

# For more information, see http://www.boost.org

# bring in rules for testing


bcm_test(NAME signals2_test_connection_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/connection_test.cpp)
bcm_test(NAME signals2_test_dead_slot_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/dead_slot_test.cpp)
bcm_test(NAME signals2_test_deconstruct_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/deconstruct_test.cpp)
bcm_test(NAME signals2_test_deletion_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/deletion_test.cpp)
# TODO: Remove Boost.Thread from directory test and add it explictly for mutex_test
bcm_test(NAME signals2_test_mutex_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/mutex_test.cpp)
bcm_test(NAME signals2_test_ordering_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/ordering_test.cpp)
bcm_test(NAME signals2_test_regression_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/regression_test.cpp)
bcm_test(NAME signals2_test_shared_connection_block_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/shared_connection_block_test.cpp)
bcm_test(NAME signals2_test_signal_n_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/signal_n_test.cpp NEED_PATCH)
bcm_test(NAME signals2_test_signal_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/signal_test.cpp NEED_PATCH)
bcm_test(NAME signals2_test_signal_type_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/signal_type_test.cpp)
bcm_test(NAME signals2_test_slot_compile_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/slot_compile_test.cpp)
# TODO: Remove Boost.Thread from directory test and add it explictly for threading_models_test
bcm_test(NAME signals2_test_threading_models_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/threading_models_test.cpp)
bcm_test(NAME signals2_test_trackable_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/trackable_test.cpp)
bcm_test(NAME signals2_test_track_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/track_test.cpp)

