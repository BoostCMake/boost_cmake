include(CMTest)

patch_directory(${CURRENT_TEST_SOURCES_DIR} ${CMAKE_CURRENT_SOURCE_DIR}/files ${CMAKE_CURRENT_BINARY_DIR})

find_package(${CMAKE_WORKSPACE_NAME}_date_time)
find_package(${CMAKE_WORKSPACE_NAME}_filesystem)
find_package(${CMAKE_WORKSPACE_NAME}_test)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_lexical_cast
                        ${CMAKE_WORKSPACE_NAME}::numeric_conversion
                        ${CMAKE_WORKSPACE_NAME}::date_time
                        ${CMAKE_WORKSPACE_NAME}::filesystem
                        ${CMAKE_WORKSPACE_NAME}::test
                        )

# Copyright (C) 2001-2003 Douglas Gregor
# Copyright (C) 2011-2017 Antony Polukhin
#
# Distributed under the Boost Software License, Version 1.0. (See accompanying
# file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)
#

#test-suite conversion
include(CheckCXXCompilerFlag)

add_library(test_lexical_cast_flags INTERFACE)
cm_test_link_libraries(test_lexical_cast_flags)

check_cxx_compiler_flag("-ftrapv" COMPILER_HAS_CXX_FLAG_ftrapv)
if(COMPILER_HAS_CXX_FLAG_ftrapv)
    target_compile_options(test_lexical_cast_flags INTERFACE -ftrapv)
endif()

# default to all warnings on:
set_directory_properties(PROPERTIES CXX_WARNINGS ON)
# Not a lexical_cast related warning: boost/preprocessor/variadic/elem.hpp:29:46: warning: variadic macros are a C99 feature
# Not a lexical_cast related warning: boost/mpl/aux_/preprocessed/gcc/greater_equal.hpp:78:1: warning: empty macro arguments are a C99 feature [-Wc99-extensions]
#                                     boost/mpl/iter_fold.hpp:45:1: warning: empty macro arguments are a C99 feature [-Wc99-extensions]
if(NOT MSVC)
    target_compile_options(test_lexical_cast_flags INTERFACE -Wextra -Wno-variadic-macros -Wno-c99-extensions)
endif()

cm_test(NAME lexical_cast_test_lexical_cast_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/lexical_cast_test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME lexical_cast_test_lexical_cast_loopback_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/lexical_cast_loopback_test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME lexical_cast_test_lexical_cast_abstract_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/lexical_cast_abstract_test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME lexical_cast_test_lexical_cast_noncopyable_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/lexical_cast_noncopyable_test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME lexical_cast_test_lexical_cast_vc8_bug_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/lexical_cast_vc8_bug_test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME lexical_cast_test_lexical_cast_wchars_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/lexical_cast_wchars_test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME lexical_cast_test_lexical_cast_float_types_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/lexical_cast_float_types_test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME lexical_cast_test_lexical_cast_inf_nan_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/lexical_cast_inf_nan_test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME lexical_cast_test_lexical_cast_containers_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/lexical_cast_containers_test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME lexical_cast_test_lexical_cast_empty_input_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/lexical_cast_empty_input_test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME lexical_cast_test_lexical_cast_pointers_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/lexical_cast_pointers_test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME lexical_cast_test_lexical_cast_typedefed_wchar_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/lexical_cast_typedefed_wchar_test.cpp COMPILE_ONLY)
cm_test(NAME lexical_cast_test_lexical_cast_typedefed_wchar_test_runtime SOURCES ${CMAKE_CURRENT_BINARY_DIR}/lexical_cast_typedefed_wchar_test_runtime.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME lexical_cast_test_lexical_cast_no_locale_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/lexical_cast_no_locale_test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
target_compile_definitions(lexical_cast_test_lexical_cast_no_locale_test PUBLIC BOOST_NO_STD_LOCALE BOOST_LEXICAL_CAST_ASSUME_C_LOCALE)
cm_test(NAME lexical_cast_test_lexical_cast_no_exceptions_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/lexical_cast_no_exceptions_test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
target_compile_definitions(lexical_cast_test_lexical_cast_no_exceptions_test PUBLIC BOOST_NO_EXCEPTIONS)
set_target_properties(lexical_cast_test_lexical_cast_no_exceptions_test PROPERTIES CXX_EXCEPTIONS Off)
cm_test(NAME lexical_cast_test_lexical_cast_iterator_range_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/lexical_cast_iterator_range_test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME lexical_cast_test_lexical_cast_arrays_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/lexical_cast_arrays_test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
if(MSVC)
    target_compile_definitions(lexical_cast_test_lexical_cast_arrays_test PUBLIC /wd4512) # assignment operator could not be generated
endif()

if(NOT CMAKE_CXX_COMPILER_ID MATCHES "Clang")
    # https://bugs.llvm.org/show_bug.cgi?id=26156
    cm_test(NAME lexical_cast_test_lexical_cast_integral_types_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/lexical_cast_integral_types_test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
endif()

cm_test(NAME lexical_cast_test_lexical_cast_stream_detection_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/lexical_cast_stream_detection_test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME lexical_cast_test_lexical_cast_stream_traits_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/lexical_cast_stream_traits_test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME lexical_cast_test_lexical_cast_to_pointer_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/lexical_cast_to_pointer_test.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME lexical_cast_test_lexical_cast_filesystem_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/lexical_cast_filesystem_test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME lexical_cast_test_lexical_cast_try_lexical_convert SOURCES ${CMAKE_CURRENT_BINARY_DIR}/lexical_cast_try_lexical_convert.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})

# Assuring that examples compile and run. Adding sources from `example` directory to the `conversion` test suite.
file(GLOB BOOST_LEXICAL_CAST_EXAMPLES ${CURRENT_TEST_SOURCES_DIR}/../example/*.cpp)
foreach(EXAMPLE ${BOOST_LEXICAL_CAST_EXAMPLES})
    get_filename_component(NAME ${EXAMPLE} NAME_WE)
    cm_test(NAME lexical_cast_test_intrusive-${NAME} SOURCES ${EXAMPLE} SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
endforeach()
