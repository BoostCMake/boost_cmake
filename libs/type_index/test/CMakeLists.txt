include(CMTest)

patch_directory(${CMAKE_WORKSPACE_SOURCES_DIR}/libs/type_index/ ${CMAKE_WORKSPACE_DIR}/libs/type_index/files ${CMAKE_BINARY_DIR}/libs/type_index)

find_package(${CMAKE_WORKSPACE_NAME}_functional)
find_package(${CMAKE_WORKSPACE_NAME}_lexical_cast)
find_package(${CMAKE_WORKSPACE_NAME}_test)
find_package(${CMAKE_WORKSPACE_NAME}_config)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_type_index
                        ${CMAKE_WORKSPACE_NAME}::functional
                        ${CMAKE_WORKSPACE_NAME}::lexical_cast
                        ${CMAKE_WORKSPACE_NAME}::test
                        ${CMAKE_WORKSPACE_NAME}::config
                        )

# Copyright (C) 2012-2014 Antony Polukhin
#
# Distributed under the Boost Software License, Version 1.0. (See accompanying
# file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)
#

# TODO: fix tests.
# Variable that contains all the stuff required for linking together <rtti>on and <rtti>off
set(INCLUDE_DIRECTORIES_FOR_LIBS ${CMAKE_WORKSPACE_SOURCES_DIR}/libs/type_index/include/
        ${CMAKE_WORKSPACE_SOURCES_DIR}/libs/config/include/
        ${CMAKE_WORKSPACE_SOURCES_DIR}/libs/static_assert/include/
        ${CMAKE_WORKSPACE_SOURCES_DIR}/libs/throw_exception/include/
        ${CMAKE_WORKSPACE_SOURCES_DIR}/libs/mpl/include/
        ${CMAKE_WORKSPACE_SOURCES_DIR}/libs/assert/include/
        ${CMAKE_WORKSPACE_SOURCES_DIR}/libs/core/include/
        ${CMAKE_WORKSPACE_SOURCES_DIR}/libs/type_traits/include/
        ${CMAKE_WORKSPACE_SOURCES_DIR}/libs/preprocessor/include/)

add_library(test_lib_nortti SHARED ${CURRENT_TEST_SOURCES_DIR}/test_lib.cpp)
set_target_properties(test_lib_nortti PROPERTIES CXX_RTTI off)
target_include_directories(test_lib_nortti PRIVATE ${INCLUDE_DIRECTORIES_FOR_LIBS})
cm_mark_as_test(test_lib_nortti)

add_library(test_lib_anonymous_nortti SHARED  ${CURRENT_TEST_SOURCES_DIR}/test_lib_anonymous.cpp)
set_target_properties(test_lib_anonymous_nortti PROPERTIES CXX_RTTI off)
target_include_directories(test_lib_anonymous_nortti PRIVATE ${INCLUDE_DIRECTORIES_FOR_LIBS})
cm_mark_as_test(test_lib_anonymous_nortti)

add_library(test_lib_rtti SHARED  ${CURRENT_TEST_SOURCES_DIR}/test_lib.cpp)
target_include_directories(test_lib_rtti PRIVATE ${INCLUDE_DIRECTORIES_FOR_LIBS})
cm_mark_as_test(test_lib_rtti)

add_library(test_lib_anonymous_rtti SHARED  ${CURRENT_TEST_SOURCES_DIR}/test_lib_anonymous.cpp)
target_include_directories(test_lib_anonymous_rtti PRIVATE ${INCLUDE_DIRECTORIES_FOR_LIBS})
cm_mark_as_test(test_lib_anonymous_rtti)

add_library(test_lib_nortti_compat SHARED  ${CURRENT_TEST_SOURCES_DIR}/test_lib.cpp)
set_target_properties(test_lib_nortti_compat PROPERTIES CXX_RTTI off)
target_compile_definitions(test_lib_nortti_compat PRIVATE -DBOOST_TYPE_INDEX_FORCE_NO_RTTI_COMPATIBILITY)
target_include_directories(test_lib_nortti_compat PRIVATE ${INCLUDE_DIRECTORIES_FOR_LIBS})
cm_mark_as_test(test_lib_nortti_compat)

add_library(test_lib_rtti_compat SHARED  ${CURRENT_TEST_SOURCES_DIR}/test_lib.cpp)
target_compile_definitions(test_lib_rtti_compat PRIVATE -DBOOST_TYPE_INDEX_FORCE_NO_RTTI_COMPATIBILITY)
target_include_directories(test_lib_rtti_compat PRIVATE ${INCLUDE_DIRECTORIES_FOR_LIBS})
cm_mark_as_test(test_lib_rtti_compat)

# Mixing RTTI on and off
# MSVC sometimes overrides the /GR-, without `detect_missmatch` this test may link
cm_test(NAME type_index_test_type_index_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/type_index_test.cpp)

if (NOT (CMAKE_CXX_COMPILER_ID MATCHES "Clang"))
    cm_test(NAME type_index_test_type_index_test_no_rtti SOURCES ${CURRENT_TEST_SOURCES_DIR}/type_index_test.cpp)
    set_target_properties(type_index_test_type_index_test_no_rtti PROPERTIES CXX_RTTI off)
    target_compile_definitions(type_index_test_type_index_test_no_rtti PRIVATE -DBOOST_NO_RTTI -DBOOST_NO_TYPEID)
endif()

cm_test(NAME type_index_test_ctti_print_name SOURCES ${CURRENT_TEST_SOURCES_DIR}/ctti_print_name.cpp)

cm_test(NAME type_index_test_testing_crossmodule_rtti SOURCES ${CURRENT_TEST_SOURCES_DIR}/testing_crossmodule.cpp)
target_link_libraries(type_index_test_testing_crossmodule_rtti test_lib_rtti)

# TODO: fix test.
#cm_test(NAME type_index_test_testing_crossmodule_no_rtti SOURCES ${CURRENT_TEST_SOURCES_DIR}/testing_crossmodule.cpp)
#set_target_properties(type_index_test_testing_crossmodule_no_rtti PROPERTIES CXX_RTTI off )
#target_compile_definitions(type_index_test_testing_crossmodule_no_rtti PRIVATE -DBOOST_NO_RTTI -DBOOST_NO_TYPEID)

# TODO: fix test.
#cm_test(NAME type_index_test_testing_crossmodule_anonymous SOURCES ${CURRENT_TEST_SOURCES_DIR}/testing_crossmodule_anonymous.cpp)
#target_link_libraries(type_index_test_testing_crossmodule_anonymous test_lib_anonymous_rtti)

cm_test(NAME type_index_test_type_index_test_ctti_copy_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/type_index_test_ctti_copy_fail.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME type_index_test_type_index_test_ctti_construct_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/type_index_test_ctti_construct_fail.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME type_index_test_type_index_test_ctti_alignment SOURCES ${CURRENT_TEST_SOURCES_DIR}/type_index_test_ctti_alignment.cpp COMPILE_ONLY)

# TODO: fix test.
#cm_test(NAME type_index_test_testing_crossmodule_anonymous_nortti_rtti SOURCES ${CURRENT_TEST_SOURCES_DIR}/testing_crossmodule.cpp COMPILE_ONLY WILL_FAIL)
#set_target_properties(type_index_test_testing_crossmodule_anonymous_nortti_rtti PROPERTIES CXX_RTTI off )
#target_link_libraries(type_index_test_testing_crossmodule_anonymous_nortti_rtti test_lib_rtti)
# TODO: fix test.
#cm_test(NAME type_index_test_testing_crossmodule_anonymous_rtti_nortti SOURCES ${CURRENT_TEST_SOURCES_DIR}/testing_crossmodule.cpp COMPILE_ONLY WILL_FAIL)
#target_link_libraries(type_index_test_testing_crossmodule_anonymous_rtti_nortti test_lib_nortti)
# TODO: fix test.
#cm_test(NAME type_index_test_testing_crossmodule_rtti_compat SOURCES ${CURRENT_TEST_SOURCES_DIR}/testing_crossmodule.cpp)
#target_compile_definitions(type_index_test_testing_crossmodule_rtti_compat PRIVATE -DBOOST_TYPE_INDEX_FORCE_NO_RTTI_COMPATIBILITY)

# TODO: fix test.
#cm_test(NAME type_index_test_testing_crossmodule_no_rtti_compat SOURCES ${CURRENT_TEST_SOURCES_DIR}/testing_crossmodule.cpp)
#set_target_properties(type_index_test_testing_crossmodule_no_rtti_compat PROPERTIES CXX_RTTI off)
#target_compile_definitions(type_index_test_testing_crossmodule_no_rtti PRIVATE -DBOOST_TYPE_INDEX_FORCE_NO_RTTI_COMPATIBILITY)

file(GLOB TEST_FILES ${CURRENT_TEST_SOURCES_DIR}/../examples/*.cpp)
foreach(FILEB ${TEST_FILES})
    get_filename_component(NAME ${FILEB} NAME_WE)
    if (${NAME} STREQUAL user_defined_typeinfo)
        set(FILEB ${CMAKE_CURRENT_BINARY_DIR}/../examples/${NAME}.cpp)
    endif()
            
    cm_test(NAME type_index_test___examples_${NAME} SOURCES ${FILEB})

    if ((NOT (${NAME} STREQUAL table_of_names)) AND  # #if defined(BOOST_NO_RTTI) && !defined(BOOST_MSVC)   
        (NOT ((${NAME} STREQUAL inheritance) AND (CMAKE_CXX_COMPILER_ID MATCHES "Clang"))))
        cm_test(NAME type_index_test___examples_${NAME}_no_rtti SOURCES ${FILEB})
        set_target_properties(type_index_test___examples_${NAME}_no_rtti PROPERTIES CXX_RTTI off )
        target_compile_definitions(type_index_test___examples_${NAME}_no_rtti PRIVATE -DBOOST_NO_RTTI -DBOOST_NO_TYPEID)
    endif()
endforeach()
