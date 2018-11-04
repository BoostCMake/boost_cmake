include(CMTest)

find_package(${CMAKE_WORKSPACE_NAME}_property_map)
find_package(${CMAKE_WORKSPACE_NAME}_bind)
find_package(${CMAKE_WORKSPACE_NAME}_random)
find_package(${CMAKE_WORKSPACE_NAME}_graph)
find_package(${CMAKE_WORKSPACE_NAME}_test)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_signals
                        ${CMAKE_WORKSPACE_NAME}::property_map
                        ${CMAKE_WORKSPACE_NAME}::bind
                        ${CMAKE_WORKSPACE_NAME}::random
                        ${CMAKE_WORKSPACE_NAME}::graph
                        ${CMAKE_WORKSPACE_NAME}::test
                        )

# Boost.Signals Library

# Copyright Douglas Gregor 2001-2003. Use, modification and
# distribution is subject to the Boost Software License, Version
# 1.0. (See accompanying file LICENSE_1_0.txt or copy at
# http://www.boost.org/LICENSE_1_0.txt)

# For more information, see http://www.boost.org

#test-suite signals
cm_test(NAME signals_test_dead_slot_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/dead_slot_test.cpp)
cm_test(NAME signals_test_deletion_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/deletion_test.cpp)
cm_test(NAME signals_test_ordering_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/ordering_test.cpp)
cm_test(NAME signals_test_signal_n_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/signal_n_test.cpp)
cm_test(NAME signals_test_signal_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/signal_test.cpp)
cm_test(NAME signals_test_trackable_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/trackable_test.cpp)
cm_test(NAME signals_test_swap_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/swap_test.cpp)
