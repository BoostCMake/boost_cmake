include(BCMTest)

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

cm_test(NAME units_test_test_predicates SOURCES test_predicates.cpp COMPILE_ONLY)
cm_test(NAME units_test_test_negative_denominator SOURCES test_negative_denominator.cpp COMPILE_ONLY)
cm_test(NAME units_test_test_dimensionless_ice1 SOURCES test_dimensionless_ice1.cpp COMPILE_ONLY)
cm_test(NAME units_test_test_dimensionless_ice2 SOURCES test_dimensionless_ice2.cpp COMPILE_ONLY)
cm_test(NAME units_test_test_mixed_value_types SOURCES test_mixed_value_types.cpp COMPILE_ONLY)
cm_test(NAME units_test_test_complicated_system SOURCES test_complicated_system.cpp COMPILE_ONLY)
cm_test(NAME units_test_test_reduce_unit SOURCES test_reduce_unit.cpp COMPILE_ONLY)
cm_test(NAME units_test_test_unscale SOURCES test_unscale.cpp COMPILE_ONLY)
cm_test(NAME units_test_test_constants SOURCES test_constants.cpp COMPILE_ONLY)

cm_test(NAME units_test_test_dimensionless_quantity SOURCES test_dimensionless_quantity.cpp)
cm_test(NAME units_test_test_implicit_conversion SOURCES test_implicit_conversion.cpp)
cm_test(NAME units_test_test_quantity SOURCES test_quantity.cpp)
cm_test(NAME units_test_test_unit SOURCES test_unit.cpp)
cm_test(NAME units_test_test_conversion SOURCES test_conversion.cpp)
cm_test(NAME units_test_test_base_dimension SOURCES test_base_dimension.cpp)
cm_test(NAME units_test_test_absolute SOURCES test_absolute.cpp)
cm_test(NAME units_test_test_default_conversion SOURCES test_default_conversion.cpp)
cm_test(NAME units_test_test_cmath SOURCES test_cmath.cpp)
cm_test(NAME units_test_test_limits SOURCES test_limits.cpp)
cm_test(NAME units_test_test_custom_unit SOURCES test_custom_unit.cpp)
cm_test(NAME units_test_test_scaled_conversion SOURCES test_scaled_conversion.cpp)

if(NOT APPLE AND NOT CMAKE_CXX_COMPILER_ID MATCHES "Clang")
    if(${CMAKE_CXX_COMPILER_ID} STREQUAL "Clang" AND CMAKE_CXX_COMPILER_VERSION VERSION_GREATER 5.0 OR NOT ${CMAKE_CXX_COMPILER_ID} STREQUAL "Clang")
        cm_test(NAME units_test_test_lambda SOURCES test_lambda.cpp)
    endif()
endif()

cm_test(NAME units_test_test_scaled_unit SOURCES test_scaled_unit.cpp)
cm_test(NAME units_test_test_output SOURCES test_output.cpp)
cm_test(NAME units_test_test_trig SOURCES test_trig.cpp)

if((NOT CMAKE_CXX_COMPILER_ID MATCHES "GNU") OR (PROJECT_VERSION GREATER 1.60.0))
    cm_test(NAME units_test_test_information_units SOURCES test_information_units.cpp)
endif()

cm_test(NAME units_test_fail_implicit_conversion SOURCES fail_implicit_conversion.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME units_test_fail_quantity_construct SOURCES fail_quantity_construct.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME units_test_fail_quantity_assign SOURCES fail_quantity_assign.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME units_test_fail_quantity_add SOURCES fail_quantity_add.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME units_test_fail_quantity_subtract SOURCES fail_quantity_subtract.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME units_test_fail_quantity_add_assign SOURCES fail_quantity_add_assign.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME units_test_fail_quantity_sub_assign SOURCES fail_quantity_sub_assign.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME units_test_fail_quantity_scalar_add SOURCES fail_quantity_scalar_add.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME units_test_fail_quantity_scalar_sub SOURCES fail_quantity_scalar_sub.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME units_test_fail_quantity_unit_add SOURCES fail_quantity_unit_add.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME units_test_fail_quantity_unit_subtract SOURCES fail_quantity_unit_subtract.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME units_test_fail_scalar_quantity_add SOURCES fail_scalar_quantity_add.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME units_test_fail_scalar_quantity_sub SOURCES fail_scalar_quantity_sub.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME units_test_fail_unit_quantity_add SOURCES fail_unit_quantity_add.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME units_test_fail_unit_quantity_subtract SOURCES fail_unit_quantity_subtract.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME units_test_fail_adl_detail SOURCES fail_adl_detail.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME units_test_fail_heterogeneous_unit SOURCES fail_heterogeneous_unit.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME units_test_fail_base_dimension SOURCES fail_base_dimension.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME units_test_fail_add_temperature SOURCES fail_add_temperature.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME units_test_fail_quantity_non_unit SOURCES fail_quantity_non_unit.cpp COMPILE_ONLY WILL_FAIL)

