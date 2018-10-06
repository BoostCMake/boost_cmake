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
#add_library(test_lib_nortti STATIC test_lib_nortti-obj)
#cm_mark_as_test(test_lib_nortti)
#add_library(test_lib_anonymous_nortti STATIC test_lib_anonymous_nortti-obj)
#cm_mark_as_test(test_lib_anonymous_nortti)

#add_library(test_lib_rtti STATIC test_lib_rtti-obj)
#cm_mark_as_test(test_lib_rtti)
#add_library(test_lib_anonymous_rtti STATIC test_lib_anonymous_rtti-obj)
#cm_mark_as_test(test_lib_anonymous_rtti)

# Making libraries that can work between rtti-on/rtti-off modules
#add_library(test_lib_nortti_compat STATIC test_lib_nortti_compat-obj)
#cm_mark_as_test(test_lib_nortti_compat)
#add_library(test_lib_rtti_compat STATIC test_lib_rtti_compat-obj)
#cm_mark_as_test(test_lib_rtti_compat)


# Mixing RTTI on and off
# MSVC sometimes overrides the /GR-, without `detect_missmatch` this test may link
cm_test(NAME type_index_test_type_index_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/type_index_test.cpp)

cm_test(NAME type_index_test_type_index_test_no_rtti SOURCES ${CURRENT_TEST_SOURCES_DIR}/type_index_test.cpp)
set_target_properties(type_index_test_type_index_test_no_rtti PROPERTIES CXX_RTTI off)
#target_compile_definitions(type_index_test_type_index_test_no_rtti PRIVATE -DBOOST_NO_RTTI -DBOOST_NO_TYPEID)

#cm_test(NAME type_index_test_ctti_print_name SOURCES ${CURRENT_TEST_SOURCES_DIR}/ctti_print_name.cpp)

#cm_test(NAME type_index_test_testing_crossmodule_rtti SOURCES ${CURRENT_TEST_SOURCES_DIR}/testing_crossmodule.cpp)
#add_library(type_index_test_testing_crossmodule_rtti PRIVATE test_lib_rtti)

#cm_test(NAME type_index_test_testing_crossmodule_no_rtti SOURCES ${CURRENT_TEST_SOURCES_DIR}/testing_crossmodule.cpp)
#set_target_properties(type_index_test_testing_crossmodule_no_rtti PROPERTIES CXX_RTTI off )
#target_compile_definitions(type_index_test_testing_crossmodule_no_rtti PRIVATE -DBOOST_NO_RTTI -DBOOST_NO_TYPEID)

#cm_test(NAME type_index_test_testing_crossmodule_anonymous SOURCES ${CURRENT_TEST_SOURCES_DIR}/testing_crossmodule_anonymous.cpp)
#add_library(type_index_test_testing_crossmodule_anonymous PRIVATE test_lib_anonymous_rtti)

cm_test(NAME type_index_test_type_index_test_ctti_copy_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/type_index_test_ctti_copy_fail.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME type_index_test_type_index_test_ctti_construct_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/type_index_test_ctti_construct_fail.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME type_index_test_type_index_test_ctti_alignment SOURCES ${CURRENT_TEST_SOURCES_DIR}/type_index_test_ctti_alignment.cpp COMPILE_ONLY)

cm_test(NAME type_index_test_testing_crossmodule_anonymous_nortti_rtti SOURCES ${CURRENT_TEST_SOURCES_DIR}/testing_crossmodule.cpp COMPILE_ONLY WILL_FAIL)
#set_target_properties(type_index_test_testing_crossmodule_anonymous_nortti_rtti PROPERTIES CXX_RTTI off )
#add_library(type_index_test_testing_crossmodule_anonymous_nortti_rtti PRIVATE test_lib_rtti)

#cm_test(NAME type_index_test_testing_crossmodule_anonymous_rtti_nortti SOURCES ${CURRENT_TEST_SOURCES_DIR}/testing_crossmodule.cpp COMPILE_ONLY WILL_FAIL)
#add_library(type_index_test_testing_crossmodule_anonymous_rtti_nortti PRIVATE test_lib_nortti)

#cm_test(NAME type_index_test_testing_crossmodule_rtti_compat SOURCES ${CURRENT_TEST_SOURCES_DIR}/testing_crossmodule.cpp)
#target_compile_definitions(type_index_test_testing_crossmodule_rtti_compat PRIVATE -DBOOST_TYPE_INDEX_FORCE_NO_RTTI_COMPATIBILITY)

#cm_test(NAME type_index_test_testing_crossmodule_no_rtti_compat SOURCES ${CURRENT_TEST_SOURCES_DIR}/testing_crossmodule.cpp)
#set_target_properties(type_index_test_testing_crossmodule_no_rtti_compat PROPERTIES CXX_RTTI off)
#target_compile_definitions(type_index_test_testing_crossmodule_no_rtti PRIVATE -DBOOST_TYPE_INDEX_FORCE_NO_RTTI_COMPATIBILITY)

#reason:  #   include BOOST_TYPE_INDEX_USER_TYPEINDEX
#file(GLOB TEST_FILES ${CURRENT_TEST_SOURCES_DIR}/../examples/*.cpp)
#foreach(FILEB ${TEST_FILES})
    #get_filename_component(NAME ${FILEB} NAME_WE)
    #cm_test(NAME type_index_test_${NAME} SOURCES ${FILEB})

    #cm_test(NAME type_index_test_${NAME}_no_rtti SOURCES ${FILEB})
    #set_target_properties(type_index_test_${NAME}_no_rtti PROPERTIES CXX_RTTI off )
    #target_compile_definitions(type_index_test_${NAME}_no_rtti PRIVATE -DBOOST_NO_RTTI -DBOOST_NO_TYPEID)
#endforeach()
