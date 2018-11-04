include(CMTest)

find_package(${CMAKE_WORKSPACE_NAME}_test)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_numeric_interval
${CMAKE_WORKSPACE_NAME}::test
)

# Boost Interval Library test Jamfile
#
# Copyright 2003 Guillaume Melquiond
#
# Distributed under the Boost Software License, Version 1.0.
# (See accompanying file LICENSE_1_0.txt or
# copy at http://www.boost.org/LICENSE_1_0.txt)

#test-suite numeric/interva
cm_test(NAME numeric_interval_test_integer SOURCES ${CURRENT_TEST_SOURCES_DIR}/integer.cpp COMPILE_ONLY)
cm_test(NAME numeric_interval_test_add SOURCES ${CURRENT_TEST_SOURCES_DIR}/add.cpp)
cm_test(NAME numeric_interval_test_det SOURCES ${CURRENT_TEST_SOURCES_DIR}/det.cpp)
cm_test(NAME numeric_interval_test_fmod SOURCES ${CURRENT_TEST_SOURCES_DIR}/fmod.cpp)
cm_test(NAME numeric_interval_test_msvc_x64_flags SOURCES ${CURRENT_TEST_SOURCES_DIR}/msvc_x64_flags.cpp)
cm_test(NAME numeric_interval_test_mul SOURCES ${CURRENT_TEST_SOURCES_DIR}/mul.cpp)
cm_test(NAME numeric_interval_test_overflow SOURCES ${CURRENT_TEST_SOURCES_DIR}/overflow.cpp)
cm_test(NAME numeric_interval_test_pi SOURCES ${CURRENT_TEST_SOURCES_DIR}/pi.cpp)
cm_test(NAME numeric_interval_test_pow SOURCES ${CURRENT_TEST_SOURCES_DIR}/pow.cpp)

cm_test(NAME numeric_interval_test_cmp SOURCES ${CURRENT_TEST_SOURCES_DIR}/cmp.cpp)
target_link_libraries(numeric_interval_test_cmp ${CMAKE_WORKSPACE_NAME}::test_exec_monitor)
cm_test(NAME numeric_interval_test_cmp_exn SOURCES ${CURRENT_TEST_SOURCES_DIR}/cmp_exn.cpp)
target_link_libraries(numeric_interval_test_cmp_exn ${CMAKE_WORKSPACE_NAME}::test_exec_monitor)
cm_test(NAME numeric_interval_test_cmp_exp SOURCES ${CURRENT_TEST_SOURCES_DIR}/cmp_exp.cpp)
target_link_libraries(numeric_interval_test_cmp_exp ${CMAKE_WORKSPACE_NAME}::test_exec_monitor)
cm_test(NAME numeric_interval_test_cmp_lex SOURCES ${CURRENT_TEST_SOURCES_DIR}/cmp_lex.cpp)
target_link_libraries(numeric_interval_test_cmp_lex ${CMAKE_WORKSPACE_NAME}::test_exec_monitor)
cm_test(NAME numeric_interval_test_cmp_set SOURCES ${CURRENT_TEST_SOURCES_DIR}/cmp_set.cpp)
target_link_libraries(numeric_interval_test_cmp_set ${CMAKE_WORKSPACE_NAME}::test_exec_monitor)
cm_test(NAME numeric_interval_test_cmp_tribool SOURCES ${CURRENT_TEST_SOURCES_DIR}/cmp_tribool.cpp)
target_link_libraries(numeric_interval_test_cmp_tribool ${CMAKE_WORKSPACE_NAME}::test_exec_monitor)
cm_test(NAME numeric_interval_test_test_float SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_float.cpp)
target_link_libraries(numeric_interval_test_test_float ${CMAKE_WORKSPACE_NAME}::test_exec_monitor)
