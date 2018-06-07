include(BCMTest)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)

find_package(${CMAKE_WORKSPACE_NAME}_filesystem)
find_package(${CMAKE_WORKSPACE_NAME}_test)
find_package(${CMAKE_WORKSPACE_NAME}_lexical_cast)
find_package(${CMAKE_WORKSPACE_NAME}_regex)
find_package(${CMAKE_WORKSPACE_NAME}_unit_test_framework)

bcm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_iostreams
                        boost::filesystem
                        boost::test
                        boost::lexical_cast
                        boost::regex
                        boost::unit_test_framework
                        )

# Boost.Iostreams Library test Jamfile

# (C) Copyright 2008 CodeRage, LLC (turkanis at coderage dot com)
# (C) Copyright 2004-2007 Jonathan Turkanis
# Distributed under the Boost Software License, Version 1.0. (See accompanying
# file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt.)

# See http://www.boost.org/libs/iostreams for documentation.
add_library(test-iostreams-flags INTERFACE)
bcm_mark_as_test(test-iostreams-flags)
bcm_test_link_libraries(test-iostreams-flags)
target_compile_definitions(test-iostreams-flags INTERFACE BOOST_IOSTREAMS_NO_LIB)


bcm_test(NAME iostreams_test_array_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/array_test.cpp NEED_PATCH)
bcm_test(NAME iostreams_test_auto_close_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/auto_close_test.cpp NEED_PATCH)
bcm_test(NAME iostreams_test_bool_trait_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/bool_trait_test.cpp NEED_PATCH)
bcm_test(NAME iostreams_test_buffer_size_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/buffer_size_test.cpp NEED_PATCH)
bcm_test(NAME iostreams_test_close_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/close_test.cpp NEED_PATCH)

if(CMAKE_CXX_COMPILER_ID STREQUAL "Clang")
    if(CMAKE_CXX_COMPILER_VERSION VERSION_LESS "3.5")
        bcm_test(NAME iostreams_test_code_converter_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/code_converter_test.cpp detail/utf8_codecvt_facet.cpp NEED_PATCH)
    endif()
endif()

bcm_test(NAME iostreams_test_combine_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/combine_test.cpp NEED_PATCH)
bcm_test(NAME iostreams_test_compose_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/compose_test.cpp NEED_PATCH)
bcm_test(NAME iostreams_test_component_access_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/component_access_test.cpp NEED_PATCH)
bcm_test(NAME iostreams_test_copy_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/copy_test.cpp NEED_PATCH)
bcm_test(NAME iostreams_test_counter_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/counter_test.cpp NEED_PATCH)
bcm_test(NAME iostreams_test_direct_adapter_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/direct_adapter_test.cpp NEED_PATCH)
#bcm_test(NAME iostreams_test_dual_seekable_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/dual_seekable_test.cpp)
bcm_test(NAME iostreams_test_example_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/example_test.cpp NEED_PATCH)
bcm_test(NAME iostreams_test_execute_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/execute_test.cpp NEED_PATCH)
bcm_test(NAME iostreams_test_file_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/file_test.cpp NEED_PATCH)
#bcm_test(NAME iostreams_test_filter_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/filter_test.cpp NEED_PATCH)
bcm_test(NAME iostreams_test_file_descriptor_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/file_descriptor_test.cpp NEED_PATCH)

# bcm_test(NAME iostreams_test_deprecated_file_descriptor_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/deprecated_file_descriptor_test.cpp NEED_PATCH)
# target_compile_definitions(iostreams_test_deprecated_file_descriptor_test PUBLIC BOOST_IOSTREAMS_USE_DEPRECATED)
bcm_test(NAME iostreams_test_deprecated_file_descriptor_test_fail SOURCES ${CMAKE_WORKSPACE_SOURCE}/deprecated_file_descriptor_test.cpp COMPILE_ONLY WILL_FAIL NEED_PATCH)
bcm_test(NAME iostreams_test_filtering_stream_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/filtering_stream_test.cpp NEED_PATCH)
bcm_test(NAME iostreams_test_finite_state_filter_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/finite_state_filter_test.cpp NEED_PATCH)
bcm_test(NAME iostreams_test_flush_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/flush_test.cpp NEED_PATCH)
bcm_test(NAME iostreams_test_grep_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/grep_test.cpp NEED_PATCH)
bcm_test(NAME iostreams_test_invert_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/invert_test.cpp NEED_PATCH)
bcm_test(NAME iostreams_test_line_filter_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/line_filter_test.cpp NEED_PATCH)
bcm_test(NAME iostreams_test_mapped_file_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/mapped_file_test.cpp NEED_PATCH)
bcm_test(NAME iostreams_test_iostreams-path_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/path_test.cpp NEED_PATCH)
bcm_test(NAME iostreams_test_newline_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/newline_test.cpp NEED_PATCH)
bcm_test(NAME iostreams_test_null_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/null_test.cpp NEED_PATCH)
bcm_test(NAME iostreams_test_operation_sequence_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/operation_sequence_test.cpp NEED_PATCH)
bcm_test(NAME iostreams_test_pipeline_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/pipeline_test.cpp NEED_PATCH)
bcm_test(NAME iostreams_test_regex_filter_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/regex_filter_test.cpp NEED_PATCH)
bcm_test(NAME iostreams_test_restrict_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/restrict_test.cpp NEED_PATCH)
bcm_test(NAME iostreams_test_seekable_file_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/seekable_file_test.cpp NEED_PATCH)
bcm_test(NAME iostreams_test_seekable_filter_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/seekable_filter_test.cpp NEED_PATCH)
bcm_test(NAME iostreams_test_sequence_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/sequence_test.cpp NEED_PATCH)
bcm_test(NAME iostreams_test_slice_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/slice_test.cpp NEED_PATCH)
bcm_test(NAME iostreams_test_stdio_filter_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/stdio_filter_test.cpp NEED_PATCH)
bcm_test(NAME iostreams_test_stream_offset_32bit_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/stream_offset_32bit_test.cpp NEED_PATCH)
bcm_test(NAME iostreams_test_stream_offset_64bit_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/stream_offset_64bit_test.cpp NEED_PATCH)
# bcm_test(NAME iostreams_test_stream_state_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/stream_state_test.cpp NEED_PATCH)
bcm_test(NAME iostreams_test_symmetric_filter_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/symmetric_filter_test.cpp NEED_PATCH)
bcm_test(NAME iostreams_test_tee_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/tee_test.cpp NEED_PATCH)
bcm_test(NAME iostreams_test_wide_stream_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/wide_stream_test.cpp NEED_PATCH)
if(WIN32)
    bcm_test(NAME iostreams_test_windows_pipe_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/windows_pipe_test.cpp NEED_PATCH)
endif()

if(BOOST_IOSTREAMS_LARGE_FILE_KEEP)
    bcm_test(NAME iostreams_test_large_file_keep_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/large_file_test.cpp ../src/file_descriptor.cpp ../src/mapped_file.cpp NEED_PATCH)
    target_compile_definitions(iostreams_test_large_file_test PUBLIC LARGE_FILE_KEEP=${BOOST_IOSTREAMS_LARGE_FILE_KEEP})
endif()

if(BOOST_IOSTREAMS_LARGE_FILE_TEMP)
    bcm_test(NAME iostreams_test_large_file_temp_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/large_file_test.cpp ../src/file_descriptor.cpp ../src/mapped_file.cpp NEED_PATCH)
    target_compile_definitions(iostreams_test_large_file_test PUBLIC LARGE_FILE_TEMP=${BOOST_IOSTREAMS_LARGE_FILE_TEMP})
endif()

if(ZLIB_FOUND)
    #bcm_test(NAME iostreams_test_gzip_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/gzip_test.cpp NEED_PATCH)
    bcm_test(NAME iostreams_test_zlib_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/zlib_test.cpp NEED_PATCH)
endif()

if(BZip2_FOUND)
    bcm_test(NAME iostreams_test_bzip2_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/bzip2_test.cpp NEED_PATCH)
endif()

include_directories(${CMAKE_WORKSPACE_SOURCE})