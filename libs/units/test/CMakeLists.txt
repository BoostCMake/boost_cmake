include(CMTest)

patch_directory(${CURRENT_TEST_SOURCES_DIR} ${CMAKE_CURRENT_SOURCE_DIR}/files ${CMAKE_CURRENT_BINARY_DIR})

find_package(${CMAKE_WORKSPACE_NAME}_regex)
find_package(${CMAKE_WORKSPACE_NAME}_multiprecision)
find_package(${CMAKE_WORKSPACE_NAME}_function)
find_package(${CMAKE_WORKSPACE_NAME}_test)
find_package(${CMAKE_WORKSPACE_NAME}_filesystem)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_units
                        ${CMAKE_WORKSPACE_NAME}::regex
                        ${CMAKE_WORKSPACE_NAME}::multiprecision
                        ${CMAKE_WORKSPACE_NAME}::function
                        ${CMAKE_WORKSPACE_NAME}::test
                        ${CMAKE_WORKSPACE_NAME}::filesystem
                        )

# Jamfile.v2
#
# Copyright (c) 2007-2009
# Steven Watanabe
#
# Distributed under the Boost Software License, Version 1.0. (See
# accompanying file LICENSE_1_0.txt or copy at
# http://www.boost.org/LICENSE_1_0.txt

# This warning comes from the test library.
# The comes from the exception library

cm_test(NAME units_test_test_predicates SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_predicates.cpp COMPILE_ONLY)
cm_test(NAME units_test_test_negative_denominator SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_negative_denominator.cpp COMPILE_ONLY)
cm_test(NAME units_test_test_dimensionless_ice1 SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_dimensionless_ice1.cpp COMPILE_ONLY)
cm_test(NAME units_test_test_dimensionless_ice2 SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_dimensionless_ice2.cpp COMPILE_ONLY)
cm_test(NAME units_test_test_mixed_value_types SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_mixed_value_types.cpp COMPILE_ONLY)
cm_test(NAME units_test_test_complicated_system SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_complicated_system.cpp COMPILE_ONLY)
cm_test(NAME units_test_test_reduce_unit SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_reduce_unit.cpp COMPILE_ONLY)
cm_test(NAME units_test_test_unscale SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_unscale.cpp COMPILE_ONLY)
cm_test(NAME units_test_test_constants SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_constants.cpp COMPILE_ONLY)

cm_test(NAME units_test_test_dimensionless_quantity SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_dimensionless_quantity.cpp)
cm_test(NAME units_test_test_implicit_conversion SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_implicit_conversion.cpp)
cm_test(NAME units_test_test_quantity SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_quantity.cpp)
cm_test(NAME units_test_test_unit SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_unit.cpp)
cm_test(NAME units_test_test_conversion SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_conversion.cpp)
cm_test(NAME units_test_test_base_dimension SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_base_dimension.cpp)
cm_test(NAME units_test_test_absolute SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_absolute.cpp)
cm_test(NAME units_test_test_default_conversion SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_default_conversion.cpp)
cm_test(NAME units_test_test_cmath SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_cmath.cpp)
cm_test(NAME units_test_test_limits SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_limits.cpp)
cm_test(NAME units_test_test_custom_unit SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_custom_unit.cpp)
cm_test(NAME units_test_test_scaled_conversion SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_scaled_conversion.cpp)

#if(NOT APPLE AND NOT CMAKE_CXX_COMPILER_ID MATCHES "Clang")
#    if(${CMAKE_CXX_COMPILER_ID} STREQUAL "Clang" AND CMAKE_CXX_COMPILER_VERSION VERSION_GREATER 5.0 OR NOT ${CMAKE_CXX_COMPILER_ID} STREQUAL "Clang")
cm_test(NAME units_test_test_lambda SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_lambda.cpp)
#    endif()
#endif()

cm_test(NAME units_test_test_scaled_unit SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_scaled_unit.cpp)
cm_test(NAME units_test_test_output SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_output.cpp)
cm_test(NAME units_test_test_trig SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_trig.cpp)

if (NOT CMAKE_CXX_COMPILER_ID MATCHES "GNU")
        # TODO: fix test. Reason error: [-fpermissive]
        cm_test(NAME units_test_test_information_units SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_information_units.cpp)
endif()

cm_test(NAME units_test_fail_implicit_conversion SOURCES ${CURRENT_TEST_SOURCES_DIR}/fail_implicit_conversion.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME units_test_fail_quantity_construct SOURCES ${CURRENT_TEST_SOURCES_DIR}/fail_quantity_construct.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME units_test_fail_quantity_assign SOURCES ${CURRENT_TEST_SOURCES_DIR}/fail_quantity_assign.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME units_test_fail_quantity_add SOURCES ${CURRENT_TEST_SOURCES_DIR}/fail_quantity_add.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME units_test_fail_quantity_subtract SOURCES ${CURRENT_TEST_SOURCES_DIR}/fail_quantity_subtract.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME units_test_fail_quantity_add_assign SOURCES ${CURRENT_TEST_SOURCES_DIR}/fail_quantity_add_assign.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME units_test_fail_quantity_sub_assign SOURCES ${CURRENT_TEST_SOURCES_DIR}/fail_quantity_sub_assign.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME units_test_fail_quantity_scalar_add SOURCES ${CURRENT_TEST_SOURCES_DIR}/fail_quantity_scalar_add.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME units_test_fail_quantity_scalar_sub SOURCES ${CURRENT_TEST_SOURCES_DIR}/fail_quantity_scalar_sub.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME units_test_fail_quantity_unit_add SOURCES ${CURRENT_TEST_SOURCES_DIR}/fail_quantity_unit_add.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME units_test_fail_quantity_unit_subtract SOURCES ${CURRENT_TEST_SOURCES_DIR}/fail_quantity_unit_subtract.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME units_test_fail_scalar_quantity_add SOURCES ${CURRENT_TEST_SOURCES_DIR}/fail_scalar_quantity_add.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME units_test_fail_scalar_quantity_sub SOURCES ${CURRENT_TEST_SOURCES_DIR}/fail_scalar_quantity_sub.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME units_test_fail_unit_quantity_add SOURCES ${CURRENT_TEST_SOURCES_DIR}/fail_unit_quantity_add.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME units_test_fail_unit_quantity_subtract SOURCES ${CURRENT_TEST_SOURCES_DIR}/fail_unit_quantity_subtract.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME units_test_fail_adl_detail SOURCES ${CURRENT_TEST_SOURCES_DIR}/fail_adl_detail.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME units_test_fail_heterogeneous_unit SOURCES ${CURRENT_TEST_SOURCES_DIR}/fail_heterogeneous_unit.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME units_test_fail_base_dimension SOURCES ${CURRENT_TEST_SOURCES_DIR}/fail_base_dimension.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME units_test_fail_add_temperature SOURCES ${CURRENT_TEST_SOURCES_DIR}/fail_add_temperature.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME units_test_fail_quantity_non_unit SOURCES ${CURRENT_TEST_SOURCES_DIR}/fail_quantity_non_unit.cpp COMPILE_ONLY WILL_FAIL)

