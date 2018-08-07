include(CMTest)

find_package(${CMAKE_WORKSPACE_NAME}_functional)
find_package(${CMAKE_WORKSPACE_NAME}_lexical_cast)
find_package(${CMAKE_WORKSPACE_NAME}_test)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_type_index
                        boost::functional
                        boost::lexical_cast
                        boost::test
                        )

# Copyright (C) 2012-2014 Antony Polukhin
#
# Distributed under the Boost Software License, Version 1.0. (See accompanying
# file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)
#


# Variable that contains all the stuff required for linking together <rtti>on and <rtti>off

# Making own `nortti` that is link compatible.
# We explicitly define BOOST_NO_RTTI because it sometimes can not be detected by build system.


# Making libraries that CANNOT work between rtti-on/rtti-off modules
# add_library(test_lib_nortti STATIC test_lib_nortti-obj)
# cm_mark_as_test(test_lib_nortti)
# add_library(test_lib_anonymous_nortti STATIC test_lib_anonymous_nortti-obj)
# cm_mark_as_test(test_lib_anonymous_nortti)

# add_library(test_lib_rtti STATIC test_lib_rtti-obj)
# cm_mark_as_test(test_lib_rtti)
# add_library(test_lib_anonymous_rtti STATIC test_lib_anonymous_rtti-obj)
# cm_mark_as_test(test_lib_anonymous_rtti)

# Making libraries that can work between rtti-on/rtti-off modules
# add_library(test_lib_nortti_compat STATIC test_lib_nortti_compat-obj)
# cm_mark_as_test(test_lib_nortti_compat)
# add_library(test_lib_rtti_compat STATIC test_lib_rtti_compat-obj)
# cm_mark_as_test(test_lib_rtti_compat)


# Mixing RTTI on and off
# MSVC sometimes overrides the /GR-, without `detect_missmatch` this test may link
cm_test(NAME type_index_test_type_index_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/type_index_test.cpp)
#cm_test(NAME type_index_runtime_cast_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/type_index_runtime_cast_test.cpp)
#cm_test(NAME type_index_constexpr_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/type_index_constexpr_test.cpp)
cm_test(NAME type_index_test_type_index_test_no_rtti SOURCES ${CURRENT_TEST_SOURCES_DIR}/type_index_test.cpp)
set_target_properties(type_index_test_type_index_test_no_rtti PROPERTIES CXX_RTTI off$(norttidefines))
cm_test(NAME type_index_test_ctti_print_name SOURCES ${CURRENT_TEST_SOURCES_DIR}/ctti_print_name.cpp)
#cm_test(NAME testing_crossmodule SOURCES ${CURRENT_TEST_SOURCES_DIR}/testing_crossmodule.cpp)

cm_test(NAME type_index_test_testing_crossmodule_no_rtti SOURCES ${CURRENT_TEST_SOURCES_DIR}/testing_crossmodule.cpp
        ${CURRENT_TEST_SOURCES_DIR}/test_lib.cpp)
set_target_properties(type_index_test_testing_crossmodule_no_rtti PROPERTIES CXX_RTTI off)

cm_test(NAME type_index_test_testing_crossmodule_anonymous SOURCES ${CURRENT_TEST_SOURCES_DIR}/testing_crossmodule_anonymous.cpp
        ${CURRENT_TEST_SOURCES_DIR}/test_lib_anonymous.cpp)
#cm_test(NAME compare_ctti_stl SOURCES ${CURRENT_TEST_SOURCES_DIR}/compare_ctti_stl.cpp)
cm_test(NAME type_index_test_type_index_test_ctti_copy_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/type_index_test_ctti_copy_fail.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME type_index_test_type_index_test_ctti_construct_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/type_index_test_ctti_construct_fail.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME type_index_test_type_index_test_ctti_alignment SOURCES ${CURRENT_TEST_SOURCES_DIR}/type_index_test_ctti_alignment.cpp COMPILE_ONLY)
cm_test(NAME type_index_test_link_fail_nortti_rtti SOURCES ${CURRENT_TEST_SOURCES_DIR}/testing_crossmodule.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME type_index_test_link_fail_rtti_nortti SOURCES ${CURRENT_TEST_SOURCES_DIR}/testing_crossmodule.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME type_index_test_testing_crossmodule_nortti_rtti_compat SOURCES ${CURRENT_TEST_SOURCES_DIR}/testing_crossmodule.cpp ${CURRENT_TEST_SOURCES_DIR}/test_lib.cpp)
# Assuring that examples compile and run. Adding sources from `examples` directory to the `type_index` test suite.
# RTTI on
# cm_test(NAME $(p) SOURCES $(p))

# RTTI off
# cm_test(NAME $(target_name) SOURCES $(p))
# set_target_properties($(target_name) PROPERTIES CXX_RTTI off$(norttidefines))


