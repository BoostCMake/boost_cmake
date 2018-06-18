include(BCMTest)

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

# Enable dynamic rounding on Tru64 (Alpha CPU).

# bring in rules for testing


cm_test(NAME numeric_interval_test_integer SOURCES integer.cpp COMPILE_ONLY)
cm_test(NAME numeric_interval_test_add SOURCES add.cpp)
cm_test(NAME numeric_interval_test_det SOURCES det.cpp)
cm_test(NAME numeric_interval_test_fmod SOURCES fmod.cpp)
cm_test(NAME numeric_interval_test_msvc_x64_flags SOURCES msvc_x64_flags.cpp)
cm_test(NAME numeric_interval_test_mul SOURCES mul.cpp)
cm_test(NAME numeric_interval_test_overflow SOURCES overflow.cpp)
cm_test(NAME numeric_interval_test_pi SOURCES pi.cpp)
cm_test(NAME numeric_interval_test_pow SOURCES pow.cpp)

cm_test(NAME numeric_interval_test_cmp SOURCES cmp.cpp)
target_link_libraries(numeric_interval_test_cmp ${CMAKE_WORKSPACE_NAME}::test_exec_monitor)
cm_test(NAME numeric_interval_test_cmp_exn SOURCES cmp_exn.cpp)
target_link_libraries(numeric_interval_test_cmp_exn ${CMAKE_WORKSPACE_NAME}::test_exec_monitor)
cm_test(NAME numeric_interval_test_cmp_exp SOURCES cmp_exp.cpp)
target_link_libraries(numeric_interval_test_cmp_exp ${CMAKE_WORKSPACE_NAME}::test_exec_monitor)
cm_test(NAME numeric_interval_test_cmp_lex SOURCES cmp_lex.cpp)
target_link_libraries(numeric_interval_test_cmp_lex ${CMAKE_WORKSPACE_NAME}::test_exec_monitor)
cm_test(NAME numeric_interval_test_cmp_set SOURCES cmp_set.cpp)
target_link_libraries(numeric_interval_test_cmp_set ${CMAKE_WORKSPACE_NAME}::test_exec_monitor)
cm_test(NAME numeric_interval_test_cmp_tribool SOURCES cmp_tribool.cpp)
target_link_libraries(numeric_interval_test_cmp_tribool ${CMAKE_WORKSPACE_NAME}::test_exec_monitor)
cm_test(NAME numeric_interval_test_test_float SOURCES test_float.cpp)
target_link_libraries(numeric_interval_test_test_float ${CMAKE_WORKSPACE_NAME}::test_exec_monitor)

