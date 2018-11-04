include(CMTest)

find_package(${CMAKE_WORKSPACE_NAME}_test)
find_package(${CMAKE_WORKSPACE_NAME}_functional)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_array
                        ${CMAKE_WORKSPACE_NAME}::test
                        ${CMAKE_WORKSPACE_NAME}::functional
                        )

#~ Copyright Rene Rivera 2008
#~ Distributed under the Boost Software License, Version 1.0.
#~ (See accompanying file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

cm_test(NAME array_test_array0 SOURCES ${CURRENT_TEST_SOURCES_DIR}/array0.cpp)
cm_test(NAME array_test_array1 SOURCES ${CURRENT_TEST_SOURCES_DIR}/array1.cpp)
cm_test(NAME array_test_array2 SOURCES ${CURRENT_TEST_SOURCES_DIR}/array2.cpp)
cm_test(NAME array_test_array3 SOURCES ${CURRENT_TEST_SOURCES_DIR}/array3.cpp)
cm_test(NAME array_test_array4 SOURCES ${CURRENT_TEST_SOURCES_DIR}/array4.cpp)
cm_test(NAME array_test_array5 SOURCES ${CURRENT_TEST_SOURCES_DIR}/array5.cpp)
cm_test(NAME array_test_array6 SOURCES ${CURRENT_TEST_SOURCES_DIR}/array6.cpp)
cm_test(NAME array_test_array_hash SOURCES ${CURRENT_TEST_SOURCES_DIR}/array_hash.cpp)
