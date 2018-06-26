include(CMTest)

patch_directory(${CURRENT_TEST_SOURCES_DIR} ${CMAKE_CURRENT_SOURCE_DIR}/files ${CMAKE_CURRENT_BINARY_DIR})

find_package(${CMAKE_WORKSPACE_NAME}_property_map)
find_package(${CMAKE_WORKSPACE_NAME}_bind)
find_package(${CMAKE_WORKSPACE_NAME}_random)
find_package(${CMAKE_WORKSPACE_NAME}_graph)
find_package(${CMAKE_WORKSPACE_NAME}_test)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_signals
                        boost::property_map
                        boost::bind
                        boost::random
                        boost::graph
                        boost::test
                        )

# Boost.Signals Library

# Copyright Douglas Gregor 2001-2003. Use, modification and
# distribution is subject to the Boost Software License, Version
# 1.0. (See accompanying file LICENSE_1_0.txt or copy at
# http://www.boost.org/LICENSE_1_0.txt)

# For more information, see http://www.boost.org

# bring in rules for testing


cm_test(NAME signals_test_dead_slot_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/dead_slot_test.cpp)
cm_test(NAME signals_test_deletion_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/deletion_test.cpp)
cm_test(NAME signals_test_ordering_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/ordering_test.cpp)
cm_test(NAME signals_test_signal_n_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/signal_n_test.cpp)
cm_test(NAME signals_test_signal_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/signal_test.cpp)
cm_test(NAME signals_test_trackable_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/trackable_test.cpp)
cm_test(NAME signals_test_swap_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/swap_test.cpp)
