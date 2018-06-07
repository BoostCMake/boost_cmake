include(BCMTest)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)

find_package(${CMAKE_WORKSPACE_NAME}_test)

bcm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_numeric_interval
boost::test
)

# Boost Interval Library test Jamfile
#
# Copyright 2003 Guillaume Melquiond
#
# Distributed under the Boost Software License, Version 1.0.
# (See accompanying file LICENSE_1_0.txt or
# copy at http://www.boost.org/LICENSE_1_0.txt)

# Enable dynamic rounding on Tru64 (Alpha CPU).

# bring in rules for testing



bcm_test(NAME numeric_interval_test_integer SOURCES ${CMAKE_WORKSPACE_SOURCE}/integer.cpp COMPILE_ONLY)
bcm_test(NAME numeric_interval_test_add SOURCES ${CMAKE_WORKSPACE_SOURCE}/add.cpp)
bcm_test(NAME numeric_interval_test_det SOURCES ${CMAKE_WORKSPACE_SOURCE}/det.cpp)
bcm_test(NAME numeric_interval_test_fmod SOURCES ${CMAKE_WORKSPACE_SOURCE}/fmod.cpp)
bcm_test(NAME numeric_interval_test_msvc_x64_flags SOURCES ${CMAKE_WORKSPACE_SOURCE}/msvc_x64_flags.cpp)
bcm_test(NAME numeric_interval_test_mul SOURCES ${CMAKE_WORKSPACE_SOURCE}/mul.cpp)
bcm_test(NAME numeric_interval_test_overflow SOURCES ${CMAKE_WORKSPACE_SOURCE}/overflow.cpp)
bcm_test(NAME numeric_interval_test_pi SOURCES ${CMAKE_WORKSPACE_SOURCE}/pi.cpp)
bcm_test(NAME numeric_interval_test_pow SOURCES ${CMAKE_WORKSPACE_SOURCE}/pow.cpp)

bcm_test(NAME numeric_interval_test_cmp SOURCES ${CMAKE_WORKSPACE_SOURCE}/cmp.cpp)
target_link_libraries(numeric_interval_test_cmp boost::test_exec_monitor)
bcm_test(NAME numeric_interval_test_cmp_exn SOURCES ${CMAKE_WORKSPACE_SOURCE}/cmp_exn.cpp)
target_link_libraries(numeric_interval_test_cmp_exn boost::test_exec_monitor)
bcm_test(NAME numeric_interval_test_cmp_exp SOURCES ${CMAKE_WORKSPACE_SOURCE}/cmp_exp.cpp)
target_link_libraries(numeric_interval_test_cmp_exp boost::test_exec_monitor)
bcm_test(NAME numeric_interval_test_cmp_lex SOURCES ${CMAKE_WORKSPACE_SOURCE}/cmp_lex.cpp)
target_link_libraries(numeric_interval_test_cmp_lex boost::test_exec_monitor)
bcm_test(NAME numeric_interval_test_cmp_set SOURCES ${CMAKE_WORKSPACE_SOURCE}/cmp_set.cpp)
target_link_libraries(numeric_interval_test_cmp_set boost::test_exec_monitor)
bcm_test(NAME numeric_interval_test_cmp_tribool SOURCES ${CMAKE_WORKSPACE_SOURCE}/cmp_tribool.cpp)
target_link_libraries(numeric_interval_test_cmp_tribool boost::test_exec_monitor)
bcm_test(NAME numeric_interval_test_test_float SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_float.cpp)
target_link_libraries(numeric_interval_test_test_float boost::test_exec_monitor)

