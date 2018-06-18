include(BCMTest)

find_package(${CMAKE_WORKSPACE_NAME}_filesystem)
find_package(${CMAKE_WORKSPACE_NAME}_test)
find_package(${CMAKE_WORKSPACE_NAME}_lexical_cast)
find_package(${CMAKE_WORKSPACE_NAME}_regex)
find_package(${CMAKE_WORKSPACE_NAME}_unit_test_framework)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_iostreams
                       ${CMAKE_WORKSPACE_NAME}::filesystem
                       ${CMAKE_WORKSPACE_NAME}::test
                       ${CMAKE_WORKSPACE_NAME}::lexical_cast
                       ${CMAKE_WORKSPACE_NAME}::regex
                       ${CMAKE_WORKSPACE_NAME}::unit_test_framework
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


cm_test(NAME iostreams_test_array_test SOURCES array_test.cpp)
cm_test(NAME iostreams_test_auto_close_test SOURCES auto_close_test.cpp)
cm_test(NAME iostreams_test_bool_trait_test SOURCES bool_trait_test.cpp)
cm_test(NAME iostreams_test_buffer_size_test SOURCES buffer_size_test.cpp)
cm_test(NAME iostreams_test_close_test SOURCES close_test.cpp)

if(CMAKE_CXX_COMPILER_ID STREQUAL "Clang")
    if(CMAKE_CXX_COMPILER_VERSION VERSION_LESS "3.5")
        cm_test(NAME iostreams_test_code_converter_test SOURCES code_converter_test.cpp detail/utf8_codecvt_facet.cpp)
    endif()
endif()

cm_test(NAME iostreams_test_combine_test SOURCES combine_test.cpp)
cm_test(NAME iostreams_test_compose_test SOURCES compose_test.cpp)
cm_test(NAME iostreams_test_component_access_test SOURCES component_access_test.cpp)
cm_test(NAME iostreams_test_copy_test SOURCES copy_test.cpp)
cm_test(NAME iostreams_test_counter_test SOURCES counter_test.cpp)
cm_test(NAME iostreams_test_direct_adapter_test SOURCES direct_adapter_test.cpp)
#cm_test(NAME iostreams_test_dual_seekable_test SOURCES dual_seekable_test.cpp)
cm_test(NAME iostreams_test_example_test SOURCES example_test.cpp)
cm_test(NAME iostreams_test_execute_test SOURCES execute_test.cpp)
cm_test(NAME iostreams_test_file_test SOURCES file_test.cpp)
#cm_test(NAME iostreams_test_filter_test SOURCES filter_test.cpp)
cm_test(NAME iostreams_test_file_descriptor_test SOURCES file_descriptor_test.cpp)

# cm_test(NAME iostreams_test_deprecated_file_descriptor_test SOURCES deprecated_file_descriptor_test.cpp)
# target_compile_definitions(iostreams_test_deprecated_file_descriptor_test PUBLIC BOOST_IOSTREAMS_USE_DEPRECATED)
cm_test(NAME iostreams_test_deprecated_file_descriptor_test_fail SOURCES deprecated_file_descriptor_test.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME iostreams_test_filtering_stream_test SOURCES filtering_stream_test.cpp)
cm_test(NAME iostreams_test_finite_state_filter_test SOURCES finite_state_filter_test.cpp)
cm_test(NAME iostreams_test_flush_test SOURCES flush_test.cpp)
cm_test(NAME iostreams_test_grep_test SOURCES grep_test.cpp)
cm_test(NAME iostreams_test_invert_test SOURCES invert_test.cpp)
cm_test(NAME iostreams_test_line_filter_test SOURCES line_filter_test.cpp)
cm_test(NAME iostreams_test_mapped_file_test SOURCES mapped_file_test.cpp)
cm_test(NAME iostreams_test_iostreams-path_test SOURCES path_test.cpp)
cm_test(NAME iostreams_test_newline_test SOURCES newline_test.cpp)
cm_test(NAME iostreams_test_null_test SOURCES null_test.cpp)
cm_test(NAME iostreams_test_operation_sequence_test SOURCES operation_sequence_test.cpp)
cm_test(NAME iostreams_test_pipeline_test SOURCES pipeline_test.cpp)
cm_test(NAME iostreams_test_regex_filter_test SOURCES regex_filter_test.cpp)
cm_test(NAME iostreams_test_restrict_test SOURCES restrict_test.cpp)
cm_test(NAME iostreams_test_seekable_file_test SOURCES seekable_file_test.cpp)
cm_test(NAME iostreams_test_seekable_filter_test SOURCES seekable_filter_test.cpp)
cm_test(NAME iostreams_test_sequence_test SOURCES sequence_test.cpp)
cm_test(NAME iostreams_test_slice_test SOURCES slice_test.cpp)
cm_test(NAME iostreams_test_stdio_filter_test SOURCES stdio_filter_test.cpp)
cm_test(NAME iostreams_test_stream_offset_32bit_test SOURCES stream_offset_32bit_test.cpp)
cm_test(NAME iostreams_test_stream_offset_64bit_test SOURCES stream_offset_64bit_test.cpp)
# cm_test(NAME iostreams_test_stream_state_test SOURCES stream_state_test.cpp)
cm_test(NAME iostreams_test_symmetric_filter_test SOURCES symmetric_filter_test.cpp)
cm_test(NAME iostreams_test_tee_test SOURCES tee_test.cpp)
cm_test(NAME iostreams_test_wide_stream_test SOURCES wide_stream_test.cpp)
if(WIN32)
    cm_test(NAME iostreams_test_windows_pipe_test SOURCES windows_pipe_test.cpp)
endif()

if(BOOST_IOSTREAMS_LARGE_FILE_KEEP)
    cm_test(NAME iostreams_test_large_file_keep_test SOURCES large_file_test.cpp ../src/file_descriptor.cpp ../src/mapped_file.cpp)
    target_compile_definitions(iostreams_test_large_file_test PUBLIC LARGE_FILE_KEEP=${BOOST_IOSTREAMS_LARGE_FILE_KEEP})
endif()

if(BOOST_IOSTREAMS_LARGE_FILE_TEMP)
    cm_test(NAME iostreams_test_large_file_temp_test SOURCES large_file_test.cpp ../src/file_descriptor.cpp ../src/mapped_file.cpp)
    target_compile_definitions(iostreams_test_large_file_test PUBLIC LARGE_FILE_TEMP=${BOOST_IOSTREAMS_LARGE_FILE_TEMP})
endif()

if(ZLIB_FOUND)
    #cm_test(NAME iostreams_test_gzip_test SOURCES gzip_test.cpp)
    cm_test(NAME iostreams_test_zlib_test SOURCES zlib_test.cpp)
endif()

if(BZip2_FOUND)
    cm_test(NAME iostreams_test_bzip2_test SOURCES bzip2_test.cpp)
endif()