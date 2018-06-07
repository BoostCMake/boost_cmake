include(BCMTest)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)

find_package(${CMAKE_WORKSPACE_NAME}_assert)

bcm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_python
                        boost::assert
                        )

# Copyright David Abrahams 2006. Distributed under the Boost
# Software License, Version 1.0. (See accompanying
# file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)


# TODO


# A bug in the Win32 intel compilers causes compilation of one of our
# tests to take forever when debug symbols are enabled. This rule
# turns them off when added to the requirements section


# Turn off this test on HP CXX, as the test hangs when executing.
# Whenever the cause for the failure of the polymorphism test is found
# and fixed, this should be retested.


# if $(TEST_BIENSTMAN_NON_BUGS)
# {
#     bpl-test bienstman4 ;
#     bpl-test bienstman5 ;
# }


# --- unit tests of library components ---


bcm_test(NAME python_test_exec SOURCES ${CMAKE_WORKSPACE_SOURCE}/exec.cpp ARGS exec.py)
bcm_test(NAME python_test_import_ SOURCES ${CMAKE_WORKSPACE_SOURCE}/import_.cpp ARGS import_.py)
bcm_test(NAME python_test_indirect_traits_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/indirect_traits_test.cpp COMPILE_ONLY)
bcm_test(NAME python_test_destroy_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/destroy_test.cpp)
bcm_test(NAME python_test_if_else SOURCES ${CMAKE_WORKSPACE_SOURCE}/if_else.cpp)
bcm_test(NAME python_test_result SOURCES ${CMAKE_WORKSPACE_SOURCE}/result.cpp)
bcm_test(NAME python_test_string_literal SOURCES ${CMAKE_WORKSPACE_SOURCE}/string_literal.cpp COMPILE_ONLY)
bcm_test(NAME python_test_select_from_python_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/select_from_python_test.cpp)
target_compile_definitions(python_test_select_from_python_test PUBLIC BOOST_PYTHON_STATIC_LIB)
