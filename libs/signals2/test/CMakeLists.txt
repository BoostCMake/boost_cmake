include(CMTest)

find_package(${CMAKE_WORKSPACE_NAME}_thread)
find_package(${CMAKE_WORKSPACE_NAME}_timer)
find_package(${CMAKE_WORKSPACE_NAME}_signals)
find_package(${CMAKE_WORKSPACE_NAME}_test)
find_package(${CMAKE_WORKSPACE_NAME}_array)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_signals2
                        ${CMAKE_WORKSPACE_NAME}::thread
                        ${CMAKE_WORKSPACE_NAME}::timer
                        ${CMAKE_WORKSPACE_NAME}::signals
                        ${CMAKE_WORKSPACE_NAME}::test
                        ${CMAKE_WORKSPACE_NAME}::array
                        )

# Boost.Signals2 Library

# Copyright Douglas Gregor 2001-2003.
# Copyright Frank Mori Hess 2009.
# Use, modification and
# distribution is subject to the Boost Software License, Version
# 1.0. (See accompanying file LICENSE_1_0.txt or copy at
# http://www.boost.org/LICENSE_1_0.txt)

# For more information, see http://www.boost.org


#test-suite signals2
cm_test(NAME signals2_test_connection_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/connection_test.cpp)
cm_test(NAME signals2_test_dead_slot_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/dead_slot_test.cpp)
cm_test(NAME signals2_test_deconstruct_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/deconstruct_test.cpp)
cm_test(NAME signals2_test_deletion_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/deletion_test.cpp)
cm_test(NAME signals2_test_mutex_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/mutex_test.cpp)
target_link_libraries(signals2_test_mutex_test ${CMAKE_WORKSPACE_NAME}::thread)
cm_test(NAME signals2_test_ordering_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/ordering_test.cpp)
cm_test(NAME signals2_test_regression_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/regression_test.cpp)
cm_test(NAME signals2_test_shared_connection_block_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/shared_connection_block_test.cpp)
cm_test(NAME signals2_test_signal_n_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/signal_n_test.cpp)
cm_test(NAME signals2_test_signal_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/signal_test.cpp)
cm_test(NAME signals2_test_signal_type_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/signal_type_test.cpp)
cm_test(NAME signals2_test_slot_compile_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/slot_compile_test.cpp)
cm_test(NAME signals2_test_threading_models_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/threading_models_test.cpp)
target_link_libraries(signals2_test_threading_models_test ${CMAKE_WORKSPACE_NAME}::thread)
cm_test(NAME signals2_test_trackable_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/trackable_test.cpp)
cm_test(NAME signals2_test_track_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/track_test.cpp)
