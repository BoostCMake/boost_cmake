include(CMTest)

find_package(${CMAKE_WORKSPACE_NAME}_typeof)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_ratio
                        ${CMAKE_WORKSPACE_NAME}::typeof
                        )

# Boost Ratio Library test Jamfile

# Copyright Beman Dawes 2003, 2006, 2008

# Distributed under the Boost Software License, Version 1.0.
# See accompanying file LICENSE_1_0.txt or http://www.boost.org/LICENSE_1_0.txt

# See library home page at http://www.boost.org/libs/ratio

# uncomment one if the above lines if you build outside the Boost release
#local BOOST_ROOT = /${CMAKE_WORKSPACE_NAME}_1_41_0 ;
#local BOOST_ROOT = c:/cygwin/${CMAKE_WORKSPACE_NAME}_1_41_0 ;


#<os>LINUX:<threading>multi
# uncomment the line above if you build outside the Boost release
#<include>$(BOOST_ROOT)
# uncomment the line above if you build outside the Boost release
#<include>../../..
#<toolset>sun:<define>BOOST_COMMON_TYPE_DONT_USE_TYPEOF
#<toolset>sun:<define>BOOST_TYPEOF_EMULATION
#<toolset>pathscale:<cxxflags>-Wextra
#<toolset>gcc-mingw-4.5.0:<cxxflags>-Wno-missing-field-initializers
#<toolset>gcc-mingw-4.5.0:<cxxflags>-fdiagnostics-show-option
#<toolset>gcc-mingw-4.6.0:<cxxflags>-fdiagnostics-show-option
# Note: Some of the remarks from the Intel compiler are disabled
# remark #1418: external function definition with no prior declaration
# remark #304: access control not specified ("public" by default)

#test-suite "ratio_ratio"
cm_test(NAME ratio_test_typedefs_pass SOURCES ${CURRENT_TEST_SOURCES_DIR}/typedefs_pass.cpp COMPILE_ONLY)
cm_test(NAME ratio_test_ratio_ratio_ratio_pass SOURCES ${CURRENT_TEST_SOURCES_DIR}/ratio_ratio/ratio_pass.cpp COMPILE_ONLY)
cm_test(NAME ratio_test_ratio_ratio_ratio1_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/ratio_ratio/ratio1_fail.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME ratio_test_ratio_ratio_ratio2_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/ratio_ratio/ratio2_fail.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME ratio_test_ratio_ratio_ratio3_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/ratio_ratio/ratio3_fail.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME ratio_test_ratio_ratio_ratio4_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/ratio_ratio/ratio4_fail.cpp COMPILE_ONLY WILL_FAIL)

#test-suite "ratio_io"
cm_test(NAME ratio_test_ratio_io_ratio_io_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/ratio_io/ratio_io_fail.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME ratio_test_ratio_io_ratio_io_pass SOURCES ${CURRENT_TEST_SOURCES_DIR}/ratio_io/ratio_io_pass.cpp)

#test-suite "ratio_arithmetic"
cm_test(NAME ratio_test_ratio_arithmetic_ratio_add_pass SOURCES ${CURRENT_TEST_SOURCES_DIR}/ratio_arithmetic/ratio_add_pass.cpp COMPILE_ONLY)
cm_test(NAME ratio_test_ratio_arithmetic_ratio_subtract_pass SOURCES ${CURRENT_TEST_SOURCES_DIR}/ratio_arithmetic/ratio_subtract_pass.cpp COMPILE_ONLY)
cm_test(NAME ratio_test_ratio_arithmetic_ratio_multiply_pass SOURCES ${CURRENT_TEST_SOURCES_DIR}/ratio_arithmetic/ratio_multiply_pass.cpp COMPILE_ONLY)
cm_test(NAME ratio_test_ratio_arithmetic_ratio_divide_pass SOURCES ${CURRENT_TEST_SOURCES_DIR}/ratio_arithmetic/ratio_divide_pass.cpp COMPILE_ONLY)
cm_test(NAME ratio_test_ratio_arithmetic_ratio_add_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/ratio_arithmetic/ratio_add_fail.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME ratio_test_ratio_arithmetic_ratio_add_2_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/ratio_arithmetic/ratio_add_2_fail.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME ratio_test_ratio_arithmetic_ratio_add_3_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/ratio_arithmetic/ratio_add_3_fail.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME ratio_test_ratio_arithmetic_ratio_subtract_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/ratio_arithmetic/ratio_subtract_fail.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME ratio_test_ratio_arithmetic_ratio_multiply_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/ratio_arithmetic/ratio_multiply_fail.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME ratio_test_ratio_arithmetic_ratio_divide_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/ratio_arithmetic/ratio_divide_fail.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME ratio_test_ratio_arithmetic_ratio_negate_pass SOURCES ${CURRENT_TEST_SOURCES_DIR}/ratio_arithmetic/ratio_negate_pass.cpp COMPILE_ONLY)
cm_test(NAME ratio_test_ratio_arithmetic_ratio_sign_pass SOURCES ${CURRENT_TEST_SOURCES_DIR}/ratio_arithmetic/ratio_sign_pass.cpp COMPILE_ONLY)
cm_test(NAME ratio_test_ratio_arithmetic_ratio_abs_pass SOURCES ${CURRENT_TEST_SOURCES_DIR}/ratio_arithmetic/ratio_abs_pass.cpp COMPILE_ONLY)
cm_test(NAME ratio_test_ratio_arithmetic_ratio_power_pass SOURCES ${CURRENT_TEST_SOURCES_DIR}/ratio_arithmetic/ratio_power_pass.cpp COMPILE_ONLY)

#test-suite "ratio_comparison"
cm_test(NAME ratio_test_ratio_comparison_ratio_equal_pass SOURCES ${CURRENT_TEST_SOURCES_DIR}/ratio_comparison/ratio_equal_pass.cpp COMPILE_ONLY)
cm_test(NAME ratio_test_ratio_comparison_ratio_not_equal_pass SOURCES ${CURRENT_TEST_SOURCES_DIR}/ratio_comparison/ratio_not_equal_pass.cpp COMPILE_ONLY)
cm_test(NAME ratio_test_ratio_comparison_ratio_less_pass SOURCES ${CURRENT_TEST_SOURCES_DIR}/ratio_comparison/ratio_less_pass.cpp COMPILE_ONLY)
cm_test(NAME ratio_test_ratio_comparison_ratio_less_equal_pass SOURCES ${CURRENT_TEST_SOURCES_DIR}/ratio_comparison/ratio_less_equal_pass.cpp COMPILE_ONLY)
cm_test(NAME ratio_test_ratio_comparison_ratio_greater_pass SOURCES ${CURRENT_TEST_SOURCES_DIR}/ratio_comparison/ratio_greater_pass.cpp COMPILE_ONLY)
cm_test(NAME ratio_test_ratio_comparison_ratio_greater_equal_pass SOURCES ${CURRENT_TEST_SOURCES_DIR}/ratio_comparison/ratio_greater_equal_pass.cpp COMPILE_ONLY)

#test-suite "examples"
cm_test(NAME ratio_test___example_si_physics SOURCES ${CURRENT_TEST_SOURCES_DIR}/../example/si_physics.cpp)
cm_test(NAME ratio_test___example_display_ex SOURCES ${CURRENT_TEST_SOURCES_DIR}/../example/display_ex.cpp)

#test-suite "ratio_ext"
cm_test(NAME ratio_test_ratio_extensions_ratio_ext_pass SOURCES ${CURRENT_TEST_SOURCES_DIR}/ratio_extensions/ratio_ext_pass.cpp)
cm_test(NAME ratio_test_ratio_extensions_mpl_plus_pass SOURCES ${CURRENT_TEST_SOURCES_DIR}/ratio_extensions/mpl_plus_pass.cpp COMPILE_ONLY)
cm_test(NAME ratio_test_ratio_extensions_mpl_minus_pass SOURCES ${CURRENT_TEST_SOURCES_DIR}/ratio_extensions/mpl_minus_pass.cpp COMPILE_ONLY)
cm_test(NAME ratio_test_ratio_extensions_mpl_times_pass SOURCES ${CURRENT_TEST_SOURCES_DIR}/ratio_extensions/mpl_times_pass.cpp COMPILE_ONLY)
cm_test(NAME ratio_test_ratio_extensions_mpl_divides_pass SOURCES ${CURRENT_TEST_SOURCES_DIR}/ratio_extensions/mpl_divides_pass.cpp COMPILE_ONLY)
cm_test(NAME ratio_test_ratio_extensions_mpl_negate_pass SOURCES ${CURRENT_TEST_SOURCES_DIR}/ratio_extensions/mpl_negate_pass.cpp COMPILE_ONLY)
cm_test(NAME ratio_test_ratio_extensions_mpl_sign_pass SOURCES ${CURRENT_TEST_SOURCES_DIR}/ratio_extensions/mpl_sign_pass.cpp COMPILE_ONLY)
cm_test(NAME ratio_test_ratio_extensions_mpl_abs_pass SOURCES ${CURRENT_TEST_SOURCES_DIR}/ratio_extensions/mpl_abs_pass.cpp COMPILE_ONLY)
cm_test(NAME ratio_test_ratio_extensions_mpl_equal_to_pass SOURCES ${CURRENT_TEST_SOURCES_DIR}/ratio_extensions/mpl_equal_to_pass.cpp COMPILE_ONLY)
cm_test(NAME ratio_test_ratio_extensions_mpl_not_equal_to_pass SOURCES ${CURRENT_TEST_SOURCES_DIR}/ratio_extensions/mpl_not_equal_to_pass.cpp COMPILE_ONLY)
cm_test(NAME ratio_test_ratio_extensions_mpl_less_pass SOURCES ${CURRENT_TEST_SOURCES_DIR}/ratio_extensions/mpl_less_pass.cpp COMPILE_ONLY)
cm_test(NAME ratio_test_ratio_extensions_mpl_less_equal_pass SOURCES ${CURRENT_TEST_SOURCES_DIR}/ratio_extensions/mpl_less_equal_pass.cpp COMPILE_ONLY)
cm_test(NAME ratio_test_ratio_extensions_mpl_greater_pass SOURCES ${CURRENT_TEST_SOURCES_DIR}/ratio_extensions/mpl_greater_pass.cpp COMPILE_ONLY)
cm_test(NAME ratio_test_ratio_extensions_mpl_greater_equal_pass SOURCES ${CURRENT_TEST_SOURCES_DIR}/ratio_extensions/mpl_greater_equal_pass.cpp COMPILE_ONLY)
cm_test(NAME ratio_test_ratio_extensions_mpl_arithmetic_pass SOURCES ${CURRENT_TEST_SOURCES_DIR}/ratio_extensions/mpl_arithmetic_pass.cpp COMPILE_ONLY)
cm_test(NAME ratio_test_ratio_extensions_mpl_comparison_pass SOURCES ${CURRENT_TEST_SOURCES_DIR}/ratio_extensions/mpl_comparison_pass.cpp COMPILE_ONLY)
cm_test(NAME ratio_test_ratio_extensions_mpl_rational_constant_pass SOURCES ${CURRENT_TEST_SOURCES_DIR}/ratio_extensions/mpl_rational_constant_pass.cpp COMPILE_ONLY)

#test-suite "tickets"
#    :
#    [ run test_6498_pass.cpp  ]
#    ;
