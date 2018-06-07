include(BCMTest)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)

find_package(${CMAKE_WORKSPACE_NAME}_regex)
find_package(${CMAKE_WORKSPACE_NAME}_multiprecision)
find_package(${CMAKE_WORKSPACE_NAME}_function)
find_package(${CMAKE_WORKSPACE_NAME}_test)
find_package(${CMAKE_WORKSPACE_NAME}_filesystem)

bcm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_units
                        boost::regex
                        boost::multiprecision
                        boost::function
                        boost::test
                        boost::filesystem
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

bcm_test(NAME units_test_test_predicates SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_predicates.cpp COMPILE_ONLY)
bcm_test(NAME units_test_test_negative_denominator SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_negative_denominator.cpp COMPILE_ONLY)
bcm_test(NAME units_test_test_dimensionless_ice1 SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_dimensionless_ice1.cpp COMPILE_ONLY)
bcm_test(NAME units_test_test_dimensionless_ice2 SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_dimensionless_ice2.cpp COMPILE_ONLY)
bcm_test(NAME units_test_test_mixed_value_types SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_mixed_value_types.cpp COMPILE_ONLY)
bcm_test(NAME units_test_test_complicated_system SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_complicated_system.cpp COMPILE_ONLY)
bcm_test(NAME units_test_test_reduce_unit SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_reduce_unit.cpp COMPILE_ONLY)
bcm_test(NAME units_test_test_unscale SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_unscale.cpp COMPILE_ONLY)
bcm_test(NAME units_test_test_constants SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_constants.cpp COMPILE_ONLY)

bcm_test(NAME units_test_test_dimensionless_quantity SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_dimensionless_quantity.cpp)
bcm_test(NAME units_test_test_implicit_conversion SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_implicit_conversion.cpp)
bcm_test(NAME units_test_test_quantity SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_quantity.cpp)
bcm_test(NAME units_test_test_unit SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_unit.cpp)
bcm_test(NAME units_test_test_conversion SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_conversion.cpp)
bcm_test(NAME units_test_test_base_dimension SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_base_dimension.cpp)
bcm_test(NAME units_test_test_absolute SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_absolute.cpp)
bcm_test(NAME units_test_test_default_conversion SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_default_conversion.cpp)
bcm_test(NAME units_test_test_cmath SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_cmath.cpp)
bcm_test(NAME units_test_test_limits SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_limits.cpp)
bcm_test(NAME units_test_test_custom_unit SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_custom_unit.cpp)
bcm_test(NAME units_test_test_scaled_conversion SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_scaled_conversion.cpp)

if(NOT APPLE AND NOT CMAKE_CXX_COMPILER_ID MATCHES "Clang")
    if(${CMAKE_CXX_COMPILER_ID} STREQUAL "Clang" AND CMAKE_CXX_COMPILER_VERSION VERSION_GREATER 5.0 OR NOT ${CMAKE_CXX_COMPILER_ID} STREQUAL "Clang")
        bcm_test(NAME units_test_test_lambda SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_lambda.cpp)
    endif()
endif()

bcm_test(NAME units_test_test_scaled_unit SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_scaled_unit.cpp)
bcm_test(NAME units_test_test_output SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_output.cpp)
bcm_test(NAME units_test_test_trig SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_trig.cpp)

if ((NOT CMAKE_CXX_COMPILER_ID MATCHES "GNU") OR (PROJECT_VERSION GREATER 1.60.0))
    bcm_test(NAME units_test_test_information_units SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_information_units.cpp NEED_PATCH)
endif()

bcm_test(NAME units_test_fail_implicit_conversion SOURCES ${CMAKE_WORKSPACE_SOURCE}/fail_implicit_conversion.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME units_test_fail_quantity_construct SOURCES ${CMAKE_WORKSPACE_SOURCE}/fail_quantity_construct.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME units_test_fail_quantity_assign SOURCES ${CMAKE_WORKSPACE_SOURCE}/fail_quantity_assign.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME units_test_fail_quantity_add SOURCES ${CMAKE_WORKSPACE_SOURCE}/fail_quantity_add.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME units_test_fail_quantity_subtract SOURCES ${CMAKE_WORKSPACE_SOURCE}/fail_quantity_subtract.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME units_test_fail_quantity_add_assign SOURCES ${CMAKE_WORKSPACE_SOURCE}/fail_quantity_add_assign.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME units_test_fail_quantity_sub_assign SOURCES ${CMAKE_WORKSPACE_SOURCE}/fail_quantity_sub_assign.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME units_test_fail_quantity_scalar_add SOURCES ${CMAKE_WORKSPACE_SOURCE}/fail_quantity_scalar_add.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME units_test_fail_quantity_scalar_sub SOURCES ${CMAKE_WORKSPACE_SOURCE}/fail_quantity_scalar_sub.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME units_test_fail_quantity_unit_add SOURCES ${CMAKE_WORKSPACE_SOURCE}/fail_quantity_unit_add.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME units_test_fail_quantity_unit_subtract SOURCES ${CMAKE_WORKSPACE_SOURCE}/fail_quantity_unit_subtract.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME units_test_fail_scalar_quantity_add SOURCES ${CMAKE_WORKSPACE_SOURCE}/fail_scalar_quantity_add.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME units_test_fail_scalar_quantity_sub SOURCES ${CMAKE_WORKSPACE_SOURCE}/fail_scalar_quantity_sub.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME units_test_fail_unit_quantity_add SOURCES ${CMAKE_WORKSPACE_SOURCE}/fail_unit_quantity_add.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME units_test_fail_unit_quantity_subtract SOURCES ${CMAKE_WORKSPACE_SOURCE}/fail_unit_quantity_subtract.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME units_test_fail_adl_detail SOURCES ${CMAKE_WORKSPACE_SOURCE}/fail_adl_detail.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME units_test_fail_heterogeneous_unit SOURCES ${CMAKE_WORKSPACE_SOURCE}/fail_heterogeneous_unit.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME units_test_fail_base_dimension SOURCES ${CMAKE_WORKSPACE_SOURCE}/fail_base_dimension.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME units_test_fail_add_temperature SOURCES ${CMAKE_WORKSPACE_SOURCE}/fail_add_temperature.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME units_test_fail_quantity_non_unit SOURCES ${CMAKE_WORKSPACE_SOURCE}/fail_quantity_non_unit.cpp COMPILE_ONLY WILL_FAIL)

