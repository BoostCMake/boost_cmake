include(CMTest)

find_package(${CMAKE_WORKSPACE_NAME}_array)
find_package(${CMAKE_WORKSPACE_NAME}_functional)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_detail
                        ${CMAKE_WORKSPACE_NAME}::array
                        ${CMAKE_WORKSPACE_NAME}::functional
                        )

################################################################*# Jam #*#######
#   Copyright (C) 2010 Bryce Lelbach
#
#   Distributed under the Boost Software License, Version 1.0. (See accompanying
#   file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)
################################################################################

cm_test(NAME detail_test_container_fwd_container_no_fwd_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/container_fwd/container_no_fwd_test.cpp)
cm_test(NAME detail_test_container_fwd_container_fwd_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/container_fwd/container_fwd_test.cpp)
cm_test(NAME detail_test_container_fwd_container_fwd_test_debug SOURCES ${CURRENT_TEST_SOURCES_DIR}/container_fwd/container_fwd_test.cpp)
target_compile_definitions(detail_test_container_fwd_container_fwd_test_debug PUBLIC -D_GLIBCXX_DEBUG)
cm_test(NAME detail_test_container_fwd_correctly_disable_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/container_fwd/correctly_disable_fail.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME detail_test_container_fwd_correctly_disable_fail_debug SOURCES ${CURRENT_TEST_SOURCES_DIR}/container_fwd/correctly_disable_fail.cpp COMPILE_ONLY WILL_FAIL)
target_compile_definitions(detail_test_container_fwd_correctly_disable_fail_debug PUBLIC -DSTLP_DEBUG -D_GLIBCXX_DEBUG)

file(GLOB TEST_FILE ${CURRENT_TEST_SOURCES_DIR}/*.cpp)
foreach(FILEB ${TEST_FILE})
    get_filename_component(NAME ${FILEB} NAME_WE)
    cm_test(NAME detail_test_${NAME} SOURCES ${FILEB})
endforeach()
