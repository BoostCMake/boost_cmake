include(CMTest)

patch_directory(${CURRENT_TEST_SOURCES_DIR} ${CMAKE_CURRENT_SOURCE_DIR}/files ${CMAKE_CURRENT_BINARY_DIR})

find_package(${CMAKE_WORKSPACE_NAME}_test)
find_package(${CMAKE_WORKSPACE_NAME}_utility)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_numeric_conversion
${CMAKE_WORKSPACE_NAME}::test
${CMAKE_WORKSPACE_NAME}::utility
)

# Boost Numeric Conversion Library test Jamfile
#
# Copyright (C) 2003, Fernando Luis Cacciola Carballal.
#
# Distributed under the Boost Software License, Version 1.0. (See
# accompanying file LICENSE_1_0.txt or copy at
# http://www.boost.org/LICENSE_1_0.txt)
#

#test-suite numeric/conversion
cm_test(NAME numeric_test_conversion_bounds_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/bounds_test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME numeric_test_conversion_traits_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/traits_test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME numeric_test_conversion_converter_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/converter_test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME numeric_test_conversion_udt_support_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/udt_support_test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME numeric_test_conversion_numeric_cast_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/numeric_cast_test.cpp)
cm_test(NAME numeric_test_conversion_udt_example_0 SOURCES ${CMAKE_CURRENT_BINARY_DIR}/udt_example_0.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME numeric_test_conversion_numeric_cast_traits_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/numeric_cast_traits_test.cpp)

#test-suite "compile_fail_test"
cm_test(NAME numeric_test_conversion_built_in_numeric_cast_traits SOURCES ${CURRENT_TEST_SOURCES_DIR}/compile_fail/built_in_numeric_cast_traits.cpp COMPILE_ONLY WILL_FAIL)
