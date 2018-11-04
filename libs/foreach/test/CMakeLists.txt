include(CMTest)

find_package(${CMAKE_WORKSPACE_NAME}_test)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_foreach
                        ${CMAKE_WORKSPACE_NAME}::test
                        )

# (C) Copyright 2004: Eric Niebler
# Distributed under the Boost Software License, Version 1.0.
# (See accompanying file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

#test-suite "foreach"
cm_test(NAME foreach_test_stl_byval SOURCES ${CURRENT_TEST_SOURCES_DIR}/stl_byval.cpp)
cm_test(NAME foreach_test_stl_byref SOURCES ${CURRENT_TEST_SOURCES_DIR}/stl_byref.cpp)
cm_test(NAME foreach_test_stl_byval_r SOURCES ${CURRENT_TEST_SOURCES_DIR}/stl_byval_r.cpp)
cm_test(NAME foreach_test_stl_byref_r SOURCES ${CURRENT_TEST_SOURCES_DIR}/stl_byref_r.cpp)
cm_test(NAME foreach_test_array_byval SOURCES ${CURRENT_TEST_SOURCES_DIR}/array_byval.cpp)
cm_test(NAME foreach_test_array_byref SOURCES ${CURRENT_TEST_SOURCES_DIR}/array_byref.cpp)
cm_test(NAME foreach_test_array_byval_r SOURCES ${CURRENT_TEST_SOURCES_DIR}/array_byval_r.cpp)
cm_test(NAME foreach_test_array_byref_r SOURCES ${CURRENT_TEST_SOURCES_DIR}/array_byref_r.cpp)
cm_test(NAME foreach_test_cstr_byval SOURCES ${CURRENT_TEST_SOURCES_DIR}/cstr_byval.cpp)
cm_test(NAME foreach_test_cstr_byref SOURCES ${CURRENT_TEST_SOURCES_DIR}/cstr_byref.cpp)
cm_test(NAME foreach_test_cstr_byval_r SOURCES ${CURRENT_TEST_SOURCES_DIR}/cstr_byval_r.cpp)
cm_test(NAME foreach_test_cstr_byref_r SOURCES ${CURRENT_TEST_SOURCES_DIR}/cstr_byref_r.cpp)
cm_test(NAME foreach_test_pair_byval SOURCES ${CURRENT_TEST_SOURCES_DIR}/pair_byval.cpp)
cm_test(NAME foreach_test_pair_byref SOURCES ${CURRENT_TEST_SOURCES_DIR}/pair_byref.cpp)
cm_test(NAME foreach_test_pair_byval_r SOURCES ${CURRENT_TEST_SOURCES_DIR}/pair_byval_r.cpp)
cm_test(NAME foreach_test_pair_byref_r SOURCES ${CURRENT_TEST_SOURCES_DIR}/pair_byref_r.cpp)
cm_test(NAME foreach_test_user_defined SOURCES ${CURRENT_TEST_SOURCES_DIR}/user_defined.cpp)
cm_test(NAME foreach_test_call_once SOURCES ${CURRENT_TEST_SOURCES_DIR}/call_once.cpp)
cm_test(NAME foreach_test_rvalue_const SOURCES ${CURRENT_TEST_SOURCES_DIR}/rvalue_const.cpp)
cm_test(NAME foreach_test_rvalue_nonconst SOURCES ${CURRENT_TEST_SOURCES_DIR}/rvalue_nonconst.cpp)
cm_test(NAME foreach_test_rvalue_const_r SOURCES ${CURRENT_TEST_SOURCES_DIR}/rvalue_const_r.cpp)
cm_test(NAME foreach_test_rvalue_nonconst_r SOURCES ${CURRENT_TEST_SOURCES_DIR}/rvalue_nonconst_r.cpp)
cm_test(NAME foreach_test_dependent_type SOURCES ${CURRENT_TEST_SOURCES_DIR}/dependent_type.cpp)
cm_test(NAME foreach_test_misc SOURCES ${CURRENT_TEST_SOURCES_DIR}/misc.cpp)
cm_test(NAME foreach_test_noncopyable SOURCES ${CURRENT_TEST_SOURCES_DIR}/noncopyable.cpp COMPILE_ONLY)
