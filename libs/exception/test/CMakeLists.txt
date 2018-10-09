include(CMTest)

find_package(${CMAKE_WORKSPACE_NAME}_function)
find_package(${CMAKE_WORKSPACE_NAME}_thread)
find_package(${CMAKE_WORKSPACE_NAME}_bind)
find_package(${CMAKE_WORKSPACE_NAME}_align)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_exception
                        ${CMAKE_WORKSPACE_NAME}::align
                        ${CMAKE_WORKSPACE_NAME}::function
                        ${CMAKE_WORKSPACE_NAME}::thread
                        ${CMAKE_WORKSPACE_NAME}::bind
                        )

# Boost Exception Library test Jamfile
#
# Copyright (c) 2006-2013 Emil Dotchevski and Reverge Studios, Inc.
#
# Distributed under the Boost Software License, Version 1.0. (See accompanying
# file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)


#to_string
cm_test(NAME exception_test_is_output_streamable_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/is_output_streamable_test.cpp)
cm_test(NAME exception_test_has_to_string_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_to_string_test.cpp)
cm_test(NAME exception_test_to_string_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/to_string_test.cpp)
cm_test(NAME exception_test_to_string_stub_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/to_string_stub_test.cpp)
cm_test(NAME exception_test_to_string_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/to_string_fail.cpp COMPILE_ONLY WILL_FAIL)

#exception
cm_test(NAME exception_test_1-throw_exception_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/1-throw_exception_test.cpp)
cm_test(NAME exception_test_2-throw_exception_no_exceptions_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/2-throw_exception_no_exceptions_test.cpp)
cm_test(NAME exception_test_3-throw_exception_no_integration_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/3-throw_exception_no_integration_test.cpp)
cm_test(NAME exception_test_4-throw_exception_no_both_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/4-throw_exception_no_both_test.cpp)
cm_test(NAME exception_test_cloning_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/cloning_test.cpp)
cm_test(NAME exception_test_copy_exception_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/copy_exception_test.cpp)
cm_test(NAME exception_test_unknown_exception_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/unknown_exception_test.cpp)
cm_test(NAME exception_test_exception_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/exception_test.cpp)
cm_test(NAME exception_test_enable_error_info_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/enable_error_info_test.cpp ${CURRENT_TEST_SOURCES_DIR}/helper1.cpp)
cm_test(NAME exception_test_throw_exception_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/throw_exception_test.cpp ${CURRENT_TEST_SOURCES_DIR}/helper2.cpp)
cm_test(NAME exception_test_errno_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/errno_test.cpp)
cm_test(NAME exception_test_error_info_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/error_info_test.cpp)
cm_test(NAME exception_test_diagnostic_information_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/diagnostic_information_test.cpp)
cm_test(NAME exception_test_refcount_ptr_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/refcount_ptr_test.cpp)
cm_test(NAME exception_test_current_exception_cast_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/current_exception_cast_test.cpp)
cm_test(NAME exception_test_no_exceptions_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_exceptions_test.cpp)
set_target_properties(exception_test_no_exceptions_test PROPERTIES CXX_EXCEPTIONS off)
cm_test(NAME exception_test_errinfos_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/errinfos_test.cpp)
cm_test(NAME exception_test_non_intrusive_exception_ptr_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/exception_ptr_test.cpp)
target_compile_definitions(exception_test_non_intrusive_exception_ptr_test PUBLIC BOOST_ENABLE_NON_INTRUSIVE_EXCEPTION_PTR)
cm_test(NAME exception_test_exception_ptr_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/exception_ptr_test.cpp)
cm_test(NAME exception_test_N3757_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/N3757_test.cpp)

cm_test(NAME exception_test_exception_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/exception_fail.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME exception_test_throw_exception_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/throw_exception_fail.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME exception_test_error_info_const_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/error_info_const_fail.cpp COMPILE_ONLY WILL_FAIL)

#headers
cm_test(NAME exception_test_exception_ptr_hpp_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/exception_ptr_hpp_test.cpp COMPILE_ONLY)
cm_test(NAME exception_test_diagnostic_information_hpp_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/diagnostic_information_hpp_test.cpp COMPILE_ONLY)
cm_test(NAME exception_test_error_info_hpp_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/error_info_hpp_test.cpp COMPILE_ONLY)
cm_test(NAME exception_test_get_error_info_hpp_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/get_error_info_hpp_test.cpp COMPILE_ONLY)
cm_test(NAME exception_test_info_hpp_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/info_hpp_test.cpp COMPILE_ONLY)
cm_test(NAME exception_test_info_tuple_hpp_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/info_tuple_hpp_test.cpp COMPILE_ONLY)
cm_test(NAME exception_test_to_string_hpp_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/to_string_hpp_test.cpp COMPILE_ONLY)
cm_test(NAME exception_test_to_string_stub_hpp_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/to_string_stub_hpp_test.cpp COMPILE_ONLY)
cm_test(NAME exception_test_all_hpp_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/all_hpp_test.cpp COMPILE_ONLY)
cm_test(NAME exception_test_current_exception_cast_hpp_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/current_exception_cast_hpp_test.cpp COMPILE_ONLY)
cm_test(NAME exception_test_errinfo_api_function_hpp_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/errinfo_api_function_hpp_test.cpp COMPILE_ONLY)
cm_test(NAME exception_test_errinfo_at_line_hpp_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/errinfo_at_line_hpp_test.cpp COMPILE_ONLY)
cm_test(NAME exception_test_errinfo_errno_hpp_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/errinfo_errno_hpp_test.cpp COMPILE_ONLY)
cm_test(NAME exception_test_errinfo_file_handle_hpp_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/errinfo_file_handle_hpp_test.cpp COMPILE_ONLY)
cm_test(NAME exception_test_errinfo_file_name_hpp_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/errinfo_file_name_hpp_test.cpp COMPILE_ONLY)
cm_test(NAME exception_test_errinfo_file_open_mode_hpp_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/errinfo_file_open_mode_hpp_test.cpp COMPILE_ONLY)
cm_test(NAME exception_test_errinfo_nested_exception_hpp_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/errinfo_nested_exception_hpp_test.cpp COMPILE_ONLY)
cm_test(NAME exception_test_errinfo_type_info_name_hpp_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/errinfo_type_info_name_hpp_test.cpp COMPILE_ONLY)
