include(CMTest)

patch_directory(${CURRENT_TEST_SOURCES_DIR} ${CMAKE_CURRENT_SOURCE_DIR}/files ${CMAKE_CURRENT_BINARY_DIR})

find_package(${CMAKE_WORKSPACE_NAME}_filesystem)
find_package(${CMAKE_WORKSPACE_NAME}_test)
find_package(${CMAKE_WORKSPACE_NAME}_lexical_cast)
find_package(${CMAKE_WORKSPACE_NAME}_regex)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_iostreams
                        ${CMAKE_WORKSPACE_NAME}::filesystem
                        ${CMAKE_WORKSPACE_NAME}::test
                        ${CMAKE_WORKSPACE_NAME}::lexical_cast
                        ${CMAKE_WORKSPACE_NAME}::regex
                        )

# Boost.Iostreams Library test Jamfile

# (C) Copyright 2008 CodeRage, LLC (turkanis at coderage dot com)
# (C) Copyright 2004-2007 Jonathan Turkanis
# Distributed under the Boost Software License, Version 1.0. (See accompanying
# file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt.)

# See http://www.boost.org/libs/iostreams for documentation.
add_library(test-iostreams-flags INTERFACE)
cm_mark_as_test(test-iostreams-flags)
cm_test_link_libraries(test-iostreams-flags)
target_compile_definitions(test-iostreams-flags INTERFACE BOOST_IOSTREAMS_NO_LIB)

cm_test(NAME iostreams_test_array_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/array_test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME iostreams_test_auto_close_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/auto_close_test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME iostreams_test_buffer_size_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/buffer_size_test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME iostreams_test_close_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/close_test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})

if(NOT APPLE)
    cm_test(NAME iostreams_test_code_converter_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/code_converter_test.cpp ${CURRENT_TEST_SOURCES_DIR}/detail/utf8_codecvt_facet.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
endif()

cm_test(NAME iostreams_test_combine_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/combine_test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME iostreams_test_compose_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/compose_test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME iostreams_test_component_access_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/component_access_test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME iostreams_test_copy_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/copy_test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
if (NOT APPLE)
    cm_test(NAME iostreams_test_counter_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/counter_test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
endif()
cm_test(NAME iostreams_test_direct_adapter_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/direct_adapter_test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME iostreams_test_example_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/example_test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME iostreams_test_execute_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/execute_test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME iostreams_test_file_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/file_test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME iostreams_test_file_descriptor_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/file_descriptor_test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME iostreams_test_deprecated_file_descriptor_test_fail SOURCES ${CMAKE_CURRENT_BINARY_DIR}/deprecated_file_descriptor_test.cpp COMPILE_ONLY WILL_FAIL SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME iostreams_test_filtering_stream_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/filtering_stream_test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME iostreams_test_finite_state_filter_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/finite_state_filter_test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME iostreams_test_flush_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/flush_test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME iostreams_test_invert_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/invert_test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME iostreams_test_line_filter_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/line_filter_test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME iostreams_test_mapped_file_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/mapped_file_test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME iostreams_test_iostreams-path_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/path_test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME iostreams_test_newline_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/newline_test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME iostreams_test_null_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/null_test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME iostreams_test_operation_sequence_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/operation_sequence_test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME iostreams_test_pipeline_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/pipeline_test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME iostreams_test_regex_filter_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/regex_filter_test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME iostreams_test_restrict_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/restrict_test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME iostreams_test_seekable_file_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/seekable_file_test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME iostreams_test_seekable_filter_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/seekable_filter_test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME iostreams_test_sequence_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/sequence_test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME iostreams_test_slice_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/slice_test.cpp SOURCES_PREFIX ${CMAKE_CURRENT_BINARY_DIR})
cm_test(NAME iostreams_test_stdio_filter_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/stdio_filter_test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME iostreams_test_stream_offset_32bit_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/stream_offset_32bit_test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME iostreams_test_stream_offset_64bit_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/stream_offset_64bit_test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
#cm_test(NAME iostreams_test_stream_state_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/stream_state_test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME iostreams_test_symmetric_filter_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/symmetric_filter_test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME iostreams_test_tee_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/tee_test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME iostreams_test_wide_stream_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/wide_stream_test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
if(WIN32)
    cm_test(NAME iostreams_test_windows_pipe_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/windows_pipe_test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
endif()

if(BOOST_IOSTREAMS_LARGE_FILE_KEEP)
    cm_test(NAME iostreams_test_large_file_keep_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/large_file_test.cpp ../src/file_descriptor.cpp ../src/mapped_file.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
    target_compile_definitions(iostreams_test_large_file_test PUBLIC LARGE_FILE_KEEP=${BOOST_IOSTREAMS_LARGE_FILE_KEEP})
endif()

if(BOOST_IOSTREAMS_LARGE_FILE_TEMP)
    cm_test(NAME iostreams_test_large_file_temp_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/large_file_test.cpp ../src/file_descriptor.cpp ../src/mapped_file.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
    target_compile_definitions(iostreams_test_large_file_test PUBLIC LARGE_FILE_TEMP=${BOOST_IOSTREAMS_LARGE_FILE_TEMP})
endif()

if(ZLIB_FOUND)
    # TODO: fix test. Reason error: # pragma message("NOTE: Use of this header (template_arity_spec.hpp) is deprecated")
    #cm_test(NAME iostreams_test_gzip_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/gzip_test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})

    cm_test(NAME iostreams_test_zlib_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/zlib_test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
endif()

if(BZip2_FOUND)
    cm_test(NAME iostreams_test_bzip2_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/bzip2_test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
endif()

include_directories(${CURRENT_TEST_SOURCES_DIR})
