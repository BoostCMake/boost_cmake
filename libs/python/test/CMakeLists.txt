include(BCMTest)

find_package(${CMAKE_WORKSPACE_NAME}_assert)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_python
                       ${CMAKE_WORKSPACE_NAME}::assert
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


cm_test(NAME python_test_exec SOURCES exec.cpp ARGS exec.py)
cm_test(NAME python_test_import_ SOURCES import_.cpp ARGS import_.py)
cm_test(NAME python_test_indirect_traits_test SOURCES indirect_traits_test.cpp COMPILE_ONLY)
cm_test(NAME python_test_destroy_test SOURCES destroy_test.cpp)
cm_test(NAME python_test_if_else SOURCES if_else.cpp)
cm_test(NAME python_test_result SOURCES result.cpp)
cm_test(NAME python_test_string_literal SOURCES string_literal.cpp COMPILE_ONLY)
cm_test(NAME python_test_select_from_python_test SOURCES select_from_python_test.cpp)
target_compile_definitions(python_test_select_from_python_test PUBLIC BOOST_PYTHON_STATIC_LIB)
