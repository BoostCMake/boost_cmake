include(BCMTest)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)

find_package(${CMAKE_WORKSPACE_NAME}_test)

bcm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_foreach
                        boost::test
                        )

# (C) Copyright 2004: Eric Niebler
# Distributed under the Boost Software License, Version 1.0.
# (See accompanying file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

# bring in rules for testing


bcm_test(NAME foreach_test_stl_byval SOURCES ${CMAKE_WORKSPACE_SOURCE}/stl_byval.cpp)
bcm_test(NAME foreach_test_stl_byref SOURCES ${CMAKE_WORKSPACE_SOURCE}/stl_byref.cpp)
bcm_test(NAME foreach_test_stl_byval_r SOURCES ${CMAKE_WORKSPACE_SOURCE}/stl_byval_r.cpp)
bcm_test(NAME foreach_test_stl_byref_r SOURCES ${CMAKE_WORKSPACE_SOURCE}/stl_byref_r.cpp)
bcm_test(NAME foreach_test_array_byval SOURCES ${CMAKE_WORKSPACE_SOURCE}/array_byval.cpp)
bcm_test(NAME foreach_test_array_byref SOURCES ${CMAKE_WORKSPACE_SOURCE}/array_byref.cpp)
bcm_test(NAME foreach_test_array_byval_r SOURCES ${CMAKE_WORKSPACE_SOURCE}/array_byval_r.cpp)
bcm_test(NAME foreach_test_array_byref_r SOURCES ${CMAKE_WORKSPACE_SOURCE}/array_byref_r.cpp)
bcm_test(NAME foreach_test_cstr_byval SOURCES ${CMAKE_WORKSPACE_SOURCE}/cstr_byval.cpp)
bcm_test(NAME foreach_test_cstr_byref SOURCES ${CMAKE_WORKSPACE_SOURCE}/cstr_byref.cpp)
bcm_test(NAME foreach_test_cstr_byval_r SOURCES ${CMAKE_WORKSPACE_SOURCE}/cstr_byval_r.cpp)
bcm_test(NAME foreach_test_cstr_byref_r SOURCES ${CMAKE_WORKSPACE_SOURCE}/cstr_byref_r.cpp)
bcm_test(NAME foreach_test_pair_byval SOURCES ${CMAKE_WORKSPACE_SOURCE}/pair_byval.cpp)
bcm_test(NAME foreach_test_pair_byref SOURCES ${CMAKE_WORKSPACE_SOURCE}/pair_byref.cpp)
bcm_test(NAME foreach_test_pair_byval_r SOURCES ${CMAKE_WORKSPACE_SOURCE}/pair_byval_r.cpp)
bcm_test(NAME foreach_test_pair_byref_r SOURCES ${CMAKE_WORKSPACE_SOURCE}/pair_byref_r.cpp)
bcm_test(NAME foreach_test_user_defined SOURCES ${CMAKE_WORKSPACE_SOURCE}/user_defined.cpp)
bcm_test(NAME foreach_test_call_once SOURCES ${CMAKE_WORKSPACE_SOURCE}/call_once.cpp)
bcm_test(NAME foreach_test_rvalue_const SOURCES ${CMAKE_WORKSPACE_SOURCE}/rvalue_const.cpp)
bcm_test(NAME foreach_test_rvalue_nonconst SOURCES ${CMAKE_WORKSPACE_SOURCE}/rvalue_nonconst.cpp)
bcm_test(NAME foreach_test_rvalue_const_r SOURCES ${CMAKE_WORKSPACE_SOURCE}/rvalue_const_r.cpp)
bcm_test(NAME foreach_test_rvalue_nonconst_r SOURCES ${CMAKE_WORKSPACE_SOURCE}/rvalue_nonconst_r.cpp)
bcm_test(NAME foreach_test_dependent_type SOURCES ${CMAKE_WORKSPACE_SOURCE}/dependent_type.cpp)
bcm_test(NAME foreach_test_misc SOURCES ${CMAKE_WORKSPACE_SOURCE}/misc.cpp)
bcm_test(NAME foreach_test_noncopyable SOURCES ${CMAKE_WORKSPACE_SOURCE}/noncopyable.cpp COMPILE_ONLY)

