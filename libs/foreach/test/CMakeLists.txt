include(BCMTest)

find_package(${CMAKE_WORKSPACE_NAME}_test)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_foreach
                       ${CMAKE_WORKSPACE_NAME}::test
                       )

# (C) Copyright 2004: Eric Niebler
# Distributed under the Boost Software License, Version 1.0.
# (See accompanying file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

# bring in rules for testing


cm_test(NAME foreach_test_stl_byval SOURCES stl_byval.cpp)
cm_test(NAME foreach_test_stl_byref SOURCES stl_byref.cpp)
cm_test(NAME foreach_test_stl_byval_r SOURCES stl_byval_r.cpp)
cm_test(NAME foreach_test_stl_byref_r SOURCES stl_byref_r.cpp)
cm_test(NAME foreach_test_array_byval SOURCES array_byval.cpp)
cm_test(NAME foreach_test_array_byref SOURCES array_byref.cpp)
cm_test(NAME foreach_test_array_byval_r SOURCES array_byval_r.cpp)
cm_test(NAME foreach_test_array_byref_r SOURCES array_byref_r.cpp)
cm_test(NAME foreach_test_cstr_byval SOURCES cstr_byval.cpp)
cm_test(NAME foreach_test_cstr_byref SOURCES cstr_byref.cpp)
cm_test(NAME foreach_test_cstr_byval_r SOURCES cstr_byval_r.cpp)
cm_test(NAME foreach_test_cstr_byref_r SOURCES cstr_byref_r.cpp)
cm_test(NAME foreach_test_pair_byval SOURCES pair_byval.cpp)
cm_test(NAME foreach_test_pair_byref SOURCES pair_byref.cpp)
cm_test(NAME foreach_test_pair_byval_r SOURCES pair_byval_r.cpp)
cm_test(NAME foreach_test_pair_byref_r SOURCES pair_byref_r.cpp)
cm_test(NAME foreach_test_user_defined SOURCES user_defined.cpp)
cm_test(NAME foreach_test_call_once SOURCES call_once.cpp)
cm_test(NAME foreach_test_rvalue_const SOURCES rvalue_const.cpp)
cm_test(NAME foreach_test_rvalue_nonconst SOURCES rvalue_nonconst.cpp)
cm_test(NAME foreach_test_rvalue_const_r SOURCES rvalue_const_r.cpp)
cm_test(NAME foreach_test_rvalue_nonconst_r SOURCES rvalue_nonconst_r.cpp)
cm_test(NAME foreach_test_dependent_type SOURCES dependent_type.cpp)
cm_test(NAME foreach_test_misc SOURCES misc.cpp)
cm_test(NAME foreach_test_noncopyable SOURCES noncopyable.cpp COMPILE_ONLY)

