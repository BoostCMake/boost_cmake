include(BCMTest)

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

cm_test(NAME exception_test_is_output_streamable_test SOURCES is_output_streamable_test.cpp)
cm_test(NAME exception_test_has_to_string_test SOURCES has_to_string_test.cpp)
cm_test(NAME exception_test_to_string_test SOURCES to_string_test.cpp)
cm_test(NAME exception_test_to_string_stub_test SOURCES to_string_stub_test.cpp)
cm_test(NAME exception_test_to_string_fail SOURCES to_string_fail.cpp COMPILE_ONLY WILL_FAIL)

#exception

cm_test(NAME exception_test_1-throw_exception_test SOURCES 1-throw_exception_test.cpp)
cm_test(NAME exception_test_2-throw_exception_no_exceptions_test SOURCES 2-throw_exception_no_exceptions_test.cpp)
cm_test(NAME exception_test_3-throw_exception_no_integration_test SOURCES 3-throw_exception_no_integration_test.cpp)
cm_test(NAME exception_test_4-throw_exception_no_both_test SOURCES 4-throw_exception_no_both_test.cpp)
cm_test(NAME exception_test_cloning_test SOURCES cloning_test.cpp)
cm_test(NAME exception_test_copy_exception_test SOURCES copy_exception_test.cpp)
cm_test(NAME exception_test_unknown_exception_test SOURCES unknown_exception_test.cpp)
cm_test(NAME exception_test_exception_test SOURCES exception_test.cpp)
cm_test(NAME exception_test_enable_error_info_test SOURCES enable_error_info_test.cpp helper1.cpp)
cm_test(NAME exception_test_throw_exception_test SOURCES throw_exception_test.cpp helper2.cpp)
cm_test(NAME exception_test_errno_test SOURCES errno_test.cpp)
# cm_test(NAME exception_test_error_info_lv_test SOURCES error_info_lv_test.cpp)
# cm_test(NAME exception_test_error_info_lv_const_test SOURCES error_info_lv_const_test.cpp)
# cm_test(NAME exception_test_error_info_rv_test SOURCES error_info_rv_test.cpp)
# cm_test(NAME exception_test_error_info_rv_const_test SOURCES error_info_rv_const_test.cpp)
cm_test(NAME exception_test_diagnostic_information_test SOURCES diagnostic_information_test.cpp)
cm_test(NAME exception_test_refcount_ptr_test SOURCES refcount_ptr_test.cpp)
cm_test(NAME exception_test_current_exception_cast_test SOURCES current_exception_cast_test.cpp)
cm_test(NAME exception_test_no_exceptions_test SOURCES no_exceptions_test.cpp)
set_target_properties(exception_test_no_exceptions_test PROPERTIES CXX_EXCEPTIONS off)
cm_test(NAME exception_test_errinfos_test SOURCES errinfos_test.cpp)
cm_test(NAME exception_test_non_intrusive_exception_ptr_test SOURCES exception_ptr_test.cpp)
target_compile_definitions(exception_test_non_intrusive_exception_ptr_test PUBLIC BOOST_ENABLE_NON_INTRUSIVE_EXCEPTION_PTR)
cm_test(NAME exception_test_exception_ptr_test SOURCES exception_ptr_test.cpp)
cm_test(NAME exception_test_N3757_test SOURCES N3757_test.cpp)

cm_test(NAME exception_test_exception_fail SOURCES exception_fail.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME exception_test_throw_exception_fail SOURCES throw_exception_fail.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME exception_test_error_info_const_fail SOURCES error_info_const_fail.cpp COMPILE_ONLY WILL_FAIL)

#headers

cm_test(NAME exception_test_exception_ptr_hpp_test SOURCES exception_ptr_hpp_test.cpp COMPILE_ONLY)
cm_test(NAME exception_test_diagnostic_information_hpp_test SOURCES diagnostic_information_hpp_test.cpp COMPILE_ONLY)
cm_test(NAME exception_test_error_info_hpp_test SOURCES error_info_hpp_test.cpp COMPILE_ONLY)
cm_test(NAME exception_test_get_error_info_hpp_test SOURCES get_error_info_hpp_test.cpp COMPILE_ONLY)
cm_test(NAME exception_test_info_hpp_test SOURCES info_hpp_test.cpp COMPILE_ONLY)
cm_test(NAME exception_test_info_tuple_hpp_test SOURCES info_tuple_hpp_test.cpp COMPILE_ONLY)
cm_test(NAME exception_test_to_string_hpp_test SOURCES to_string_hpp_test.cpp COMPILE_ONLY)
cm_test(NAME exception_test_to_string_stub_hpp_test SOURCES to_string_stub_hpp_test.cpp COMPILE_ONLY)
cm_test(NAME exception_test_all_hpp_test SOURCES all_hpp_test.cpp COMPILE_ONLY)
cm_test(NAME exception_test_current_exception_cast_hpp_test SOURCES current_exception_cast_hpp_test.cpp COMPILE_ONLY)
cm_test(NAME exception_test_errinfo_api_function_hpp_test SOURCES errinfo_api_function_hpp_test.cpp COMPILE_ONLY)
cm_test(NAME exception_test_errinfo_at_line_hpp_test SOURCES errinfo_at_line_hpp_test.cpp COMPILE_ONLY)
cm_test(NAME exception_test_errinfo_errno_hpp_test SOURCES errinfo_errno_hpp_test.cpp COMPILE_ONLY)
cm_test(NAME exception_test_errinfo_file_handle_hpp_test SOURCES errinfo_file_handle_hpp_test.cpp COMPILE_ONLY)
cm_test(NAME exception_test_errinfo_file_name_hpp_test SOURCES errinfo_file_name_hpp_test.cpp COMPILE_ONLY)
cm_test(NAME exception_test_errinfo_file_open_mode_hpp_test SOURCES errinfo_file_open_mode_hpp_test.cpp COMPILE_ONLY)
cm_test(NAME exception_test_errinfo_nested_exception_hpp_test SOURCES errinfo_nested_exception_hpp_test.cpp COMPILE_ONLY)
cm_test(NAME exception_test_errinfo_type_info_name_hpp_test SOURCES errinfo_type_info_name_hpp_test.cpp COMPILE_ONLY)

