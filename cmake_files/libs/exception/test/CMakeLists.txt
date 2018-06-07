include(BCMTest)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)

find_package(${CMAKE_WORKSPACE_NAME}_function)
find_package(${CMAKE_WORKSPACE_NAME}_thread)
find_package(${CMAKE_WORKSPACE_NAME}_bind)
find_package(${CMAKE_WORKSPACE_NAME}_align)

bcm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_exception
                        boost::align
                        boost::function
                        boost::thread
                        boost::bind
                        )

# Boost Exception Library test Jamfile
#
# Copyright (c) 2006-2013 Emil Dotchevski and Reverge Studios, Inc.
#
# Distributed under the Boost Software License, Version 1.0. (See accompanying
# file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)


#to_string

bcm_test(NAME exception_test_is_output_streamable_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/is_output_streamable_test.cpp)
bcm_test(NAME exception_test_has_to_string_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/has_to_string_test.cpp)
bcm_test(NAME exception_test_to_string_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/to_string_test.cpp)
bcm_test(NAME exception_test_to_string_stub_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/to_string_stub_test.cpp)
bcm_test(NAME exception_test_to_string_fail SOURCES ${CMAKE_WORKSPACE_SOURCE}/to_string_fail.cpp COMPILE_ONLY WILL_FAIL)

#exception

bcm_test(NAME exception_test_1-throw_exception_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/1-throw_exception_test.cpp)
bcm_test(NAME exception_test_2-throw_exception_no_exceptions_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/2-throw_exception_no_exceptions_test.cpp)
bcm_test(NAME exception_test_3-throw_exception_no_integration_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/3-throw_exception_no_integration_test.cpp)
bcm_test(NAME exception_test_4-throw_exception_no_both_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/4-throw_exception_no_both_test.cpp)
bcm_test(NAME exception_test_cloning_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/cloning_test.cpp)
bcm_test(NAME exception_test_copy_exception_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/copy_exception_test.cpp)
bcm_test(NAME exception_test_unknown_exception_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/unknown_exception_test.cpp)
bcm_test(NAME exception_test_exception_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/exception_test.cpp)
bcm_test(NAME exception_test_enable_error_info_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/enable_error_info_test.cpp ${CMAKE_WORKSPACE_SOURCE}/helper1.cpp)
bcm_test(NAME exception_test_throw_exception_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/throw_exception_test.cpp ${CMAKE_WORKSPACE_SOURCE}/helper2.cpp)
bcm_test(NAME exception_test_errno_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/errno_test.cpp)
# bcm_test(NAME exception_test_error_info_lv_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/error_info_lv_test.cpp)
# bcm_test(NAME exception_test_error_info_lv_const_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/error_info_lv_const_test.cpp)
# bcm_test(NAME exception_test_error_info_rv_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/error_info_rv_test.cpp)
# bcm_test(NAME exception_test_error_info_rv_const_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/error_info_rv_const_test.cpp)
bcm_test(NAME exception_test_diagnostic_information_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/diagnostic_information_test.cpp)
bcm_test(NAME exception_test_refcount_ptr_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/refcount_ptr_test.cpp)
bcm_test(NAME exception_test_current_exception_cast_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/current_exception_cast_test.cpp)
bcm_test(NAME exception_test_no_exceptions_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/no_exceptions_test.cpp)
set_target_properties(exception_test_no_exceptions_test PROPERTIES CXX_EXCEPTIONS off)
bcm_test(NAME exception_test_errinfos_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/errinfos_test.cpp)
bcm_test(NAME exception_test_non_intrusive_exception_ptr_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/exception_ptr_test.cpp)
target_compile_definitions(exception_test_non_intrusive_exception_ptr_test PUBLIC BOOST_ENABLE_NON_INTRUSIVE_EXCEPTION_PTR)
bcm_test(NAME exception_test_exception_ptr_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/exception_ptr_test.cpp)
bcm_test(NAME exception_test_N3757_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/N3757_test.cpp)

bcm_test(NAME exception_test_exception_fail SOURCES ${CMAKE_WORKSPACE_SOURCE}/exception_fail.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME exception_test_throw_exception_fail SOURCES ${CMAKE_WORKSPACE_SOURCE}/throw_exception_fail.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME exception_test_error_info_const_fail SOURCES ${CMAKE_WORKSPACE_SOURCE}/error_info_const_fail.cpp COMPILE_ONLY WILL_FAIL)

#headers

bcm_test(NAME exception_test_exception_ptr_hpp_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/exception_ptr_hpp_test.cpp COMPILE_ONLY)
bcm_test(NAME exception_test_diagnostic_information_hpp_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/diagnostic_information_hpp_test.cpp COMPILE_ONLY)
bcm_test(NAME exception_test_error_info_hpp_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/error_info_hpp_test.cpp COMPILE_ONLY)
bcm_test(NAME exception_test_get_error_info_hpp_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/get_error_info_hpp_test.cpp COMPILE_ONLY)
bcm_test(NAME exception_test_info_hpp_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/info_hpp_test.cpp COMPILE_ONLY)
bcm_test(NAME exception_test_info_tuple_hpp_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/info_tuple_hpp_test.cpp COMPILE_ONLY)
bcm_test(NAME exception_test_to_string_hpp_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/to_string_hpp_test.cpp COMPILE_ONLY)
bcm_test(NAME exception_test_to_string_stub_hpp_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/to_string_stub_hpp_test.cpp COMPILE_ONLY)
bcm_test(NAME exception_test_all_hpp_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/all_hpp_test.cpp COMPILE_ONLY)
bcm_test(NAME exception_test_current_exception_cast_hpp_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/current_exception_cast_hpp_test.cpp COMPILE_ONLY)
bcm_test(NAME exception_test_errinfo_api_function_hpp_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/errinfo_api_function_hpp_test.cpp COMPILE_ONLY)
bcm_test(NAME exception_test_errinfo_at_line_hpp_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/errinfo_at_line_hpp_test.cpp COMPILE_ONLY)
bcm_test(NAME exception_test_errinfo_errno_hpp_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/errinfo_errno_hpp_test.cpp COMPILE_ONLY)
bcm_test(NAME exception_test_errinfo_file_handle_hpp_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/errinfo_file_handle_hpp_test.cpp COMPILE_ONLY)
bcm_test(NAME exception_test_errinfo_file_name_hpp_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/errinfo_file_name_hpp_test.cpp COMPILE_ONLY)
bcm_test(NAME exception_test_errinfo_file_open_mode_hpp_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/errinfo_file_open_mode_hpp_test.cpp COMPILE_ONLY)
bcm_test(NAME exception_test_errinfo_nested_exception_hpp_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/errinfo_nested_exception_hpp_test.cpp COMPILE_ONLY)
bcm_test(NAME exception_test_errinfo_type_info_name_hpp_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/errinfo_type_info_name_hpp_test.cpp COMPILE_ONLY)

