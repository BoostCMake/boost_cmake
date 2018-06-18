include(BCMTest)

find_package(${CMAKE_WORKSPACE_NAME}_algorithm)
find_package(${CMAKE_WORKSPACE_NAME}_chrono)
find_package(${CMAKE_WORKSPACE_NAME}_exception)
find_package(${CMAKE_WORKSPACE_NAME}_timer)
find_package(${CMAKE_WORKSPACE_NAME}_numeric_ublas)
find_package(${CMAKE_WORKSPACE_NAME}_filesystem)
find_package(${CMAKE_WORKSPACE_NAME}_test)
find_package(${CMAKE_WORKSPACE_NAME}_serialization)
find_package(${CMAKE_WORKSPACE_NAME}_numeric_interval)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_multiprecision
                       ${CMAKE_WORKSPACE_NAME}::algorithm
                       ${CMAKE_WORKSPACE_NAME}::chrono
                       ${CMAKE_WORKSPACE_NAME}::exception
                       ${CMAKE_WORKSPACE_NAME}::timer
                       ${CMAKE_WORKSPACE_NAME}::numeric_ublas
                       ${CMAKE_WORKSPACE_NAME}::filesystem
                       ${CMAKE_WORKSPACE_NAME}::test
                       ${CMAKE_WORKSPACE_NAME}::serialization
                       ${CMAKE_WORKSPACE_NAME}::numeric_interval
                       )

# copyright John Maddock 2011
# Distributed under the Boost Software License, Version 1.0.
# (See accompanying file LICENSE_1_0.txt or copy at
# http://www.boost.org/LICENSE_1_0.txt.

# HACK: Workaround broken includes
file(GLOB TEST_HEADERS RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} *.hpp *.ipp)
foreach(HEADER ${TEST_HEADERS})
    configure_file(${HEADER} ${CMAKE_CURRENT_BINARY_DIR}/include/libs/multiprecision/test/${HEADER} @ONLY)
endforeach()

add_library(multiprecision_test_settings INTERFACE)
target_include_directories(multiprecision_test_settings INTERFACE ${CMAKE_CURRENT_BINARY_DIR}/include)

cm_test_link_libraries(multiprecision_test_settings)

# We set these to make it easier to set up and test GMP and MPFR under Win32:
# Speed up compiles:
# We can't yet enable this - it breaks the STL in some tests...
#<toolset>msvc,<optimization>off:<cxxflags>-RTCc
#<toolset>msvc,<optimization>off:<define>_ALLOW_RTCc_IN_STL

# add_library(no_eh_support STATIC no_eh_test_support.cpp)
# cm_mark_as_test(no_eh_support)
# target_link_libraries(no_eh_support boost_throw_exception)
# cm_target_link_test_libs(no_eh_support)

cm_test(NAME multiprecision_test_test_arithmetic_backend_concept SOURCES test_arithmetic_backend_concept.cpp)

cm_test(NAME multiprecision_test_test_arithmetic_cpp_dec_float_1 SOURCES test_arithmetic_cpp_dec_float_1.cpp)
cm_test(NAME multiprecision_test_test_arithmetic_cpp_dec_float_2 SOURCES test_arithmetic_cpp_dec_float_2.cpp)
cm_test(NAME multiprecision_test_test_arithmetic_cpp_dec_float_3 SOURCES test_arithmetic_cpp_dec_float_3.cpp)

if((NOT CMAKE_CXX_COMPILER_ID MATCHES "GNU") OR (NOT PROJECT_VERSION LESS 1.60.0))
    cm_test(NAME multiprecision_test_test_arithmetic_cpp_bin_float_1 SOURCES test_arithmetic_cpp_bin_float_1.cpp)
    cm_test(NAME multiprecision_test_test_arithmetic_cpp_bin_float_2 SOURCES test_arithmetic_cpp_bin_float_2.cpp)
    cm_test(NAME multiprecision_test_test_arithmetic_cpp_bin_float_3 SOURCES test_arithmetic_cpp_bin_float_3.cpp)
endif()

try_compile(HAS_MPFR ${CMAKE_CURRENT_BINARY_DIR}/../config ${CMAKE_CURRENT_SOURCE_DIR}/../config/has_mpfr.cpp)
if(HAS_MPFR)
    cm_test(NAME multiprecision_test_test_arithmetic_mpfr SOURCES test_arithmetic_mpfr.cpp)
    cm_test(NAME multiprecision_test_test_arithmetic_mpfr_50 SOURCES test_arithmetic_mpfr_50.cpp)
    cm_test(NAME multiprecision_test_test_arithmetic_mpfr_50_static SOURCES test_arithmetic_mpfr_50_static.cpp)
endif()

try_compile(HAS_TOMMATH ${CMAKE_CURRENT_BINARY_DIR}/../config ${CMAKE_CURRENT_SOURCE_DIR}/../config/has_tommath.cpp)
if(HAS_TOMMATH)
    cm_test(NAME multiprecision_test_test_arithmetic_tommath SOURCES test_arithmetic_tommath.cpp)
    cm_test(NAME multiprecision_test_test_arithmetic_tommath_br SOURCES test_arithmetic_tommath_br.cpp)

    cm_test(NAME multiprecision_test_test_numeric_limits_tommath SOURCES test_numeric_limits.cpp)
    target_compile_definitions(multiprecision_test_test_numeric_limits_tommath PUBLIC TEST_TOMMATH)
endif()

if((NOT CMAKE_CXX_COMPILER_ID MATCHES "GNU") OR (NOT PROJECT_VERSION LESS 1.60.0))
    cm_test(NAME multiprecision_test_test_arithmetic_cpp_int_1 SOURCES test_arithmetic_cpp_int_1.cpp)
    cm_test(NAME multiprecision_test_test_arithmetic_cpp_int_2 SOURCES test_arithmetic_cpp_int_2.cpp)
    cm_test(NAME multiprecision_test_test_arithmetic_cpp_int_3 SOURCES test_arithmetic_cpp_int_3.cpp)
    cm_test(NAME multiprecision_test_test_arithmetic_cpp_int_4 SOURCES test_arithmetic_cpp_int_4.cpp)
    cm_test(NAME multiprecision_test_test_arithmetic_cpp_int_5 SOURCES test_arithmetic_cpp_int_5.cpp)
    cm_test(NAME multiprecision_test_test_arithmetic_cpp_int_6 SOURCES test_arithmetic_cpp_int_6.cpp)
    cm_test(NAME multiprecision_test_test_arithmetic_cpp_int_7 SOURCES test_arithmetic_cpp_int_7.cpp)
    cm_test(NAME multiprecision_test_test_arithmetic_cpp_int_8 SOURCES test_arithmetic_cpp_int_8.cpp)
    cm_test(NAME multiprecision_test_test_arithmetic_cpp_int_9 SOURCES test_arithmetic_cpp_int_9.cpp)
    cm_test(NAME multiprecision_test_test_arithmetic_cpp_int_10 SOURCES test_arithmetic_cpp_int_10.cpp)
    cm_test(NAME multiprecision_test_test_arithmetic_cpp_int_11 SOURCES test_arithmetic_cpp_int_11.cpp)
    cm_test(NAME multiprecision_test_test_arithmetic_cpp_int_12 SOURCES test_arithmetic_cpp_int_12.cpp)
    cm_test(NAME multiprecision_test_test_arithmetic_cpp_int_13 SOURCES test_arithmetic_cpp_int_13.cpp)
    cm_test(NAME multiprecision_test_test_arithmetic_cpp_int_14 SOURCES test_arithmetic_cpp_int_14.cpp)
    cm_test(NAME multiprecision_test_test_arithmetic_cpp_int_15 SOURCES test_arithmetic_cpp_int_15.cpp)
    cm_test(NAME multiprecision_test_test_arithmetic_cpp_int_16 SOURCES test_arithmetic_cpp_int_16.cpp)
    cm_test(NAME multiprecision_test_test_arithmetic_cpp_int_17 SOURCES test_arithmetic_cpp_int_17.cpp)
    cm_test(NAME multiprecision_test_test_arithmetic_cpp_int_18 SOURCES test_arithmetic_cpp_int_18.cpp)
    cm_test(NAME multiprecision_test_test_arithmetic_cpp_int_br SOURCES test_arithmetic_cpp_int_br.cpp)
endif()
cm_test(NAME multiprecision_test_test_arithmetic_ab_1 SOURCES test_arithmetic_ab_1.cpp)
cm_test(NAME multiprecision_test_test_arithmetic_ab_2 SOURCES test_arithmetic_ab_2.cpp)
cm_test(NAME multiprecision_test_test_arithmetic_ab_3 SOURCES test_arithmetic_ab_3.cpp)

cm_test(NAME multiprecision_test_test_cpp_dec_float_round SOURCES test_cpp_dec_float_round.cpp)

if((NOT CMAKE_CXX_COMPILER_ID MATCHES "GNU") OR (NOT PROJECT_VERSION LESS 1.60.0))
    cm_test(NAME multiprecision_test_test_arithmetic_logged_1 SOURCES test_arithmetic_logged_1.cpp)
    cm_test(NAME multiprecision_test_test_arithmetic_logged_2 SOURCES test_arithmetic_logged_2.cpp)

    cm_test(NAME multiprecision_test_test_arithmetic_dbg_adptr1 SOURCES test_arithmetic_dbg_adptr1.cpp)
    cm_test(NAME multiprecision_test_test_arithmetic_dbg_adptr2 SOURCES test_arithmetic_dbg_adptr2.cpp)
endif()

try_compile(HAS_MPFI ${CMAKE_CURRENT_BINARY_DIR}/../config ${CMAKE_CURRENT_SOURCE_DIR}/../config/has_mpfi.cpp)
if(HAS_MPFI)
    cm_test(NAME multiprecision_test_test_arithmetic_mpfi_50 SOURCES test_arithmetic_mpfi_50.cpp)

    cm_test(NAME multiprecision_test_test_numeric_limits_mpfi_50 SOURCES test_numeric_limits.cpp)
    target_compile_definitions(multiprecision_test_test_numeric_limits_mpfi_50 PUBLIC TEST_MPFI_50)
endif()

try_compile(HAS_FLOAT128 ${CMAKE_CURRENT_BINARY_DIR}/../config ${CMAKE_CURRENT_SOURCE_DIR}/../config/has_float128.cpp)
if(HAS_FLOAT128)
    cm_test(NAME multiprecision_test_test_arithmetic_float_128 SOURCES test_arithmetic_float_128.cpp)
endif()

cm_test(NAME multiprecision_test_test_numeric_limits_backend_concept SOURCES test_numeric_limits.cpp)
target_compile_definitions(multiprecision_test_test_numeric_limits_backend_concept PUBLIC TEST_BACKEND)

try_compile(HAS_GMP ${CMAKE_CURRENT_BINARY_DIR}/../config ${CMAKE_CURRENT_SOURCE_DIR}/../config/has_float128.cpp)
if(HAS_GMP)
    cm_test(NAME multiprecision_test_test_arithmetic_mpf_50 SOURCES test_arithmetic_mpf_50.cpp)
    cm_test(NAME multiprecision_test_test_arithmetic_mpf SOURCES test_arithmetic_mpf.cpp)
    cm_test(NAME multiprecision_test_test_arithmetic_mpz SOURCES test_arithmetic_mpz.cpp)
    cm_test(NAME multiprecision_test_test_arithmetic_mpz_rat SOURCES test_arithmetic_mpz_rat.cpp)
    cm_test(NAME multiprecision_test_test_arithmetic_mpz_br SOURCES test_arithmetic_mpz_br.cpp)
    cm_test(NAME multiprecision_test_test_arithmetic_mpq SOURCES test_arithmetic_mpq.cpp)

    cm_test(NAME multiprecision_test_test_numeric_limits_mpf50 SOURCES test_numeric_limits.cpp)
    target_compile_definitions(multiprecision_test_test_numeric_limits_mpf50 PUBLIC TEST_MPF_50)

    cm_test(NAME multiprecision_test_test_numeric_limits_mpf SOURCES test_numeric_limits.cpp)
    target_compile_definitions(multiprecision_test_test_numeric_limits_mpf PUBLIC TEST_MPF)

    cm_test(NAME multiprecision_test_test_numeric_limits_mpz SOURCES test_numeric_limits.cpp)
    target_compile_definitions(multiprecision_test_test_numeric_limits_mpz PUBLIC TEST_MPZ)

    cm_test(NAME multiprecision_test_test_numeric_limits_mpq SOURCES test_numeric_limits.cpp)
    target_compile_definitions(multiprecision_test_test_numeric_limits_mpq PUBLIC TEST_MPQ)

    cm_test(NAME multiprecision_test_test_numeric_limits_mpfr SOURCES test_numeric_limits.cpp)
    target_compile_definitions(multiprecision_test_test_numeric_limits_mpfr PUBLIC TEST_MPFR)

    cm_test(NAME multiprecision_test_test_numeric_limits_mpfr_50 SOURCES test_numeric_limits.cpp)
    target_compile_definitions(multiprecision_test_test_numeric_limits_mpfr_50 PUBLIC TEST_MPFR_50)

    cm_test(NAME multiprecision_test_test_numeric_limits_cpp_dec_float SOURCES test_numeric_limits.cpp)
    target_compile_definitions(multiprecision_test_test_numeric_limits_cpp_dec_float PUBLIC TEST_CPP_DEC_FLOAT)

    cm_test(NAME multiprecision_test_test_numeric_limits_cpp_bin_float SOURCES test_numeric_limits.cpp)
    target_compile_definitions(multiprecision_test_test_numeric_limits_cpp_bin_float PUBLIC TEST_CPP_BIN_FLOAT)

    cm_test(NAME multiprecision_test_test_numeric_limits_cpp_int SOURCES test_numeric_limits.cpp)
    target_compile_definitions(multiprecision_test_test_numeric_limits_cpp_int PUBLIC TEST_CPP_INT)
endif()

# cm_test(NAME test_numeric_limits_float128 SOURCES test_numeric_limits.cpp)
# target_compile_definitions(test_numeric_limits_float128 PUBLIC TEST_FLOAT128)
# cm_test(NAME test_numeric_limits_intel_quad SOURCES test_numeric_limits.cpp)
# target_compile_definitions(test_numeric_limits_intel_quad PUBLIC TEST_FLOAT128)

# cm_test(NAME $(source:B)_mpf50 SOURCES $(source))
# target_compile_definitions($(source:B)_mpf50 PUBLIC TEST_MPF_50)
# cm_test(NAME $(source:B)_mpfr50 SOURCES $(source))
# target_compile_definitions($(source:B)_mpfr50 PUBLIC TEST_MPFR_50)
# cm_test(NAME $(source:B)_mpfi50 SOURCES $(source))
# target_compile_definitions($(source:B)_mpfi50 PUBLIC TEST_MPFI_50)
# cm_test(NAME $(source:B)_cpp_dec_float SOURCES $(source))
# target_compile_definitions($(source:B)_cpp_dec_float PUBLIC TEST_CPP_DEC_FLOAT)
# cm_test(NAME $(source:B)_cpp_bin_float SOURCES $(source))
# target_compile_definitions($(source:B)_cpp_bin_float PUBLIC TEST_CPP_BIN_FLOAT)
# cm_test(NAME $(source:B)_float128 SOURCES $(source))
# target_compile_definitions($(source:B)_float128 PUBLIC TEST_FLOAT128)
# cm_test(NAME $(source:B)_intel_quad SOURCES $(source))
# target_compile_definitions($(source:B)_intel_quad PUBLIC TEST_FLOAT128)

# cm_test(NAME test_gmp_conversions SOURCES test_gmp_conversions.cpp)

# cm_test(NAME test_mpfr_conversions SOURCES test_mpfr_conversions.cpp)

# cm_test(NAME test_constants_mpf50 SOURCES test_constants.cpp)
# target_compile_definitions(test_constants_mpf50 PUBLIC TEST_MPF_50)

# cm_test(NAME test_constants_mpfr_50 SOURCES test_constants.cpp)
# target_compile_definitions(test_constants_mpfr_50 PUBLIC TEST_MPFR_50)

cm_test(NAME multiprecision_test_test_constants_cpp_dec_float SOURCES test_constants.cpp)
target_compile_definitions(multiprecision_test_test_constants_cpp_dec_float PUBLIC TEST_CPP_DEC_FLOAT)


# TODO: Check for gmp or mpft
# cm_test(NAME test_move_mpfr SOURCES test_move.cpp)
# target_compile_definitions(test_move_mpfr PUBLIC TEST_MPFR)

# cm_test(NAME test_move_gmp SOURCES test_move.cpp)
# target_compile_definitions(test_move_gmp PUBLIC TEST_GMP)

# cm_test(NAME test_move_tommath SOURCES test_move.cpp)
# target_compile_definitions(test_move_tommath PUBLIC TEST_TOMMATH)

cm_test(NAME multiprecision_test_test_test SOURCES test_test.cpp)
if((NOT CMAKE_CXX_COMPILER_ID MATCHES "GNU") OR (NOT PROJECT_VERSION LESS 1.60.0))
    cm_test(NAME multiprecision_test_test_move_cpp_int SOURCES test_move.cpp)
    target_compile_definitions(multiprecision_test_test_move_cpp_int PUBLIC TEST_CPP_INT)

    cm_test(NAME multiprecision_test_test_cpp_int_lit SOURCES test_cpp_int_lit.cpp)
endif()
cm_test(NAME multiprecision_test_test_constexpr SOURCES test_constexpr.cpp COMPILE_ONLY)

cm_test(NAME multiprecision_test_test_nothrow_cpp_int SOURCES test_nothrow_cpp_int.cpp COMPILE_ONLY)
cm_test(NAME multiprecision_test_test_nothrow_cpp_rational SOURCES test_nothrow_cpp_rational.cpp COMPILE_ONLY)
if((NOT CMAKE_CXX_COMPILER_ID MATCHES "GNU") OR (NOT PROJECT_VERSION LESS 1.60.0))
    cm_test(NAME multiprecision_test_test_nothrow_cpp_bin_float SOURCES test_nothrow_cpp_bin_float.cpp COMPILE_ONLY)
    cm_test(NAME multiprecision_test_test_nothrow_cpp_dec_float SOURCES test_nothrow_cpp_dec_float.cpp COMPILE_ONLY)
endif()
# cm_test(NAME test_nothrow_float128 SOURCES test_nothrow_float128.cpp COMPILE_ONLY)
# cm_test(NAME test_nothrow_gmp SOURCES test_nothrow_gmp.cpp COMPILE_ONLY)
# cm_test(NAME test_nothrow_mpfr SOURCES test_nothrow_mpfr.cpp COMPILE_ONLY)

#
# Interconversion tests:
#r
# cm_test(NAME test_convert_from_cpp_int SOURCES test_convert_from_cpp_int.cpp)
# cm_test(NAME test_convert_from_mpz_int SOURCES test_convert_from_mpz_int.cpp)
# cm_test(NAME test_convert_from_tom_int SOURCES test_convert_from_tom_int.cpp)
# cm_test(NAME test_convert_from_cpp_rational SOURCES test_convert_from_cpp_rational.cpp)
# cm_test(NAME test_convert_from_gmp_rational SOURCES test_convert_from_gmp_rational.cpp)
# cm_test(NAME test_convert_from_tom_rational SOURCES test_convert_from_tom_rational.cpp)
# cm_test(NAME test_convert_from_cpp_bin_float SOURCES test_convert_from_cpp_bin_float.cpp)
# cm_test(NAME test_convert_from_cpp_dec_float SOURCES test_convert_from_cpp_dec_float.cpp)
# cm_test(NAME test_convert_from_mpf_float SOURCES test_convert_from_mpf_float.cpp)
# cm_test(NAME test_convert_from_mpfr_float SOURCES test_convert_from_mpfr_float.cpp)
# cm_test(NAME test_convert_from_mpfi_float SOURCES test_convert_from_mpfi_float.cpp)
# cm_test(NAME test_convert_from_float128 SOURCES test_convert_from_float128.cpp)

#
# This take too long to run as a regular part of the tests:
#
# cm_test(NAME test_cpp_bin_float_round SOURCES test_cpp_bin_float_round.cpp)

# cm_test(NAME test_cpp_bin_float_conv SOURCES test_cpp_bin_float_conv.cpp)

if((NOT CMAKE_CXX_COMPILER_ID MATCHES "GNU") OR (PROJECT_VERSION GREATER 1.59))
    cm_test(NAME multiprecision_test_test_cpp_bin_float_io_1 SOURCES test_cpp_bin_float_io.cpp)
    target_compile_definitions(multiprecision_test_test_cpp_bin_float_io_1 PUBLIC TEST1release)

    cm_test(NAME multiprecision_test_test_cpp_bin_float_io_2 SOURCES test_cpp_bin_float_io.cpp)
    target_compile_definitions(multiprecision_test_test_cpp_bin_float_io_2 PUBLIC TEST2release)

    cm_test(NAME multiprecision_test_test_cpp_bin_float SOURCES test_cpp_bin_float.cpp)
    target_compile_definitions(multiprecision_test_test_cpp_bin_float PUBLIC TEST_MPFRrelease)

    cm_test(NAME multiprecision_test_test_checked_cpp_int SOURCES test_checked_cpp_int.cpp)
endif()
# cm_test(NAME test_float_io_cpp_dec_float SOURCES test_float_io.cpp)
# target_compile_definitions(test_float_io_cpp_dec_float PUBLIC TEST_CPP_DEC_FLOATrelease)

# cm_test(NAME test_float_io_mpf SOURCES test_float_io.cpp)
# target_compile_definitions(test_float_io_mpf PUBLIC TEST_MPF_50release)

# cm_test(NAME test_float_io_mpfr SOURCES test_float_io.cpp)
# target_compile_definitions(test_float_io_mpfr PUBLIC TEST_MPFR_50release)

# cm_test(NAME test_float_io_mpfi SOURCES test_float_io.cpp)
# target_compile_definitions(test_float_io_mpfi PUBLIC TEST_MPFI_50release)

# cm_test(NAME test_float_io_float128 SOURCES test_float_io.cpp)
# target_compile_definitions(test_float_io_float128 PUBLIC TEST_FLOAT128release)
# cm_test(NAME test_float_io_intel_quad SOURCES test_float_io.cpp)
# target_compile_definitions(test_float_io_intel_quad PUBLIC TEST_FLOAT128release)

# cm_test(NAME test_int_io_tommath SOURCES test_int_io.cpp)
# target_compile_definitions(test_int_io_tommath PUBLIC TEST_TOMMATHrelease)

# cm_test(NAME test_int_io_mpz SOURCES test_int_io.cpp)
# target_compile_definitions(test_int_io_mpz PUBLIC TEST_MPZrelease)

# cm_test(NAME test_int_io_cpp_int SOURCES test_int_io.cpp)
# target_compile_definitions(test_int_io_cpp_int PUBLIC TEST_CPP_INTrelease)

# cm_test(NAME test_cpp_int_left_shift SOURCES test_cpp_int_left_shift.cpp)

# cm_test(NAME test_cpp_int_1 SOURCES test_cpp_int.cpp)
# target_compile_definitions(test_cpp_int_1 PUBLIC TEST1)

# cm_test(NAME test_cpp_int_2 SOURCES test_cpp_int.cpp)
# target_compile_definitions(test_cpp_int_2 PUBLIC TEST2)

# cm_test(NAME test_cpp_int_3 SOURCES test_cpp_int.cpp)
# target_compile_definitions(test_cpp_int_3 PUBLIC TEST3)

# cm_test(NAME test_cpp_int_4 SOURCES test_cpp_int.cpp)
# target_compile_definitions(test_cpp_int_4 PUBLIC TEST4)

# cm_test(NAME test_cpp_int_5 SOURCES test_cpp_int.cpp)
# target_compile_definitions(test_cpp_int_5 PUBLIC TEST5)

# cm_test(NAME test_miller_rabin SOURCES test_miller_rabin.cpp)

# cm_test(NAME test_rational_io_tommath SOURCES test_rational_io.cpp)
# target_compile_definitions(test_rational_io_tommath PUBLIC TEST_TOMMATHrelease)

# cm_test(NAME test_rational_io_mpz SOURCES test_rational_io.cpp)
# target_compile_definitions(test_rational_io_mpz PUBLIC TEST_MPQrelease)

# cm_test(NAME test_rational_io_cpp_int SOURCES test_rational_io.cpp)
# target_compile_definitions(test_rational_io_cpp_int PUBLIC TEST_CPP_INTrelease)

# cm_test(NAME test_generic_conv SOURCES test_generic_conv.cpp)

# cm_test(NAME test_rat_float_interconv_1 SOURCES test_rat_float_interconv.cpp)
# target_compile_definitions(test_rat_float_interconv_1 PUBLIC TEST1release)

# cm_test(NAME test_rat_float_interconv_2 SOURCES test_rat_float_interconv.cpp)
# target_compile_definitions(test_rat_float_interconv_2 PUBLIC TEST2release)

# cm_test(NAME test_rat_float_interconv_3 SOURCES test_rat_float_interconv.cpp)
# target_compile_definitions(test_rat_float_interconv_3 PUBLIC TEST3release)

# cm_test(NAME test_rat_float_interconv_4 SOURCES test_rat_float_interconv.cpp)
# target_compile_definitions(test_rat_float_interconv_4 PUBLIC TEST4release)

# cm_test(NAME test_rat_float_interconv_5 SOURCES test_rat_float_interconv.cpp)
# target_compile_definitions(test_rat_float_interconv_5 PUBLIC TEST5release)

# cm_test(NAME test_rat_float_interconv_6 SOURCES test_rat_float_interconv.cpp)
# target_compile_definitions(test_rat_float_interconv_6 PUBLIC TEST6release)

# cm_test(NAME test_rat_float_interconv_7 SOURCES test_rat_float_interconv.cpp)
# target_compile_definitions(test_rat_float_interconv_7 PUBLIC TEST7release)

# cm_test(NAME test_rat_float_interconv_8 SOURCES test_rat_float_interconv.cpp)
# target_compile_definitions(test_rat_float_interconv_8 PUBLIC TEST8release)

# cm_test(NAME test_cpp_int_import_export SOURCES test_cpp_int_import_export.cpp)
if((NOT CMAKE_CXX_COMPILER_ID MATCHES "GNU") OR (NOT PROJECT_VERSION LESS 1.60.0))
    cm_test(NAME multiprecision_test_test_cpp_int_conv SOURCES test_cpp_int_conv.cpp)

    cm_test(NAME multiprecision_test_test_native_integer SOURCES test_native_integer.cpp)

    cm_test(NAME multiprecision_test_test_mixed_cpp_int SOURCES test_mixed_cpp_int.cpp)
endif()
cm_test(NAME multiprecision_test_test_mixed_float SOURCES test_mixed_float.cpp)


# cm_test(NAME include_test_mpfr_include_test SOURCES include_test/mpfr_include_test.cpp COMPILE_ONLY)
# cm_test(NAME include_test_gmp_include_test SOURCES include_test/gmp_include_test.cpp COMPILE_ONLY)
# cm_test(NAME include_test_tommath_include_test SOURCES include_test/tommath_include_test.cpp COMPILE_ONLY)
# cm_test(NAME include_test_cpp_int_include_test SOURCES include_test/cpp_int_include_test.cpp COMPILE_ONLY)
# cm_test(NAME include_test_cpp_dec_float_include_test SOURCES include_test/cpp_dec_float_include_test.cpp COMPILE_ONLY)
# cm_test(NAME include_test_cpp_bin_float_include_test SOURCES include_test/cpp_bin_float_include_test.cpp COMPILE_ONLY)

# cm_test(NAME ublas_interop_test1 SOURCES ublas_interop/test1.cpp)
# cm_test(NAME ublas_interop_test2 SOURCES ublas_interop/test2.cpp)
#run ublas_interop/test3.cpp ublas_interop/test31.cpp ublas_interop/test32.cpp ublas_interop/test33.cpp ;
# cm_test(NAME ublas_interop_test4 SOURCES ublas_interop/test4.cpp)
# cm_test(NAME ublas_interop_test5 SOURCES ublas_interop/test5.cpp)
# cm_test(NAME ublas_interop_test6 SOURCES ublas_interop/test6.cpp)
#run ublas_interop/test7.cpp ublas_interop/test71.cpp ublas_interop/test72.cpp ublas_interop/test73.cpp ;

# cm_test(NAME ublas1_et SOURCES ublas_interop/test1.cpp)
# target_compile_definitions(ublas1_et PUBLIC TEST_ET=1)
# cm_test(NAME ublas2_et SOURCES ublas_interop/test2.cpp)
# target_compile_definitions(ublas2_et PUBLIC TEST_ET=1)
#run ublas_interop/test3.cpp ublas_interop/test31.cpp ublas_interop/test32.cpp ublas_interop/test33.cpp : : : <define>TEST_ET=1 : ublas3_et ;
# cm_test(NAME ublas3_et SOURCES ublas_interop/test4.cpp)
# target_compile_definitions(ublas3_et PUBLIC TEST_ET=1)
# cm_test(NAME ublas4_et SOURCES ublas_interop/test5.cpp)
# target_compile_definitions(ublas4_et PUBLIC TEST_ET=1)
# cm_test(NAME ublas5_et SOURCES ublas_interop/test6.cpp)
# target_compile_definitions(ublas5_et PUBLIC TEST_ET=1)
#run ublas_interop/test7.cpp ublas_interop/test71.cpp ublas_interop/test72.cpp ublas_interop/test73.cpp : : : <define>TEST_ET=1 : ublas6_et ;

#
# Serialization tests, run in release mode so we cycle through more values:
#
if((NOT CMAKE_CXX_COMPILER_ID MATCHES "GNU") OR (NOT PROJECT_VERSION LESS 1.60.0))
    cm_test(NAME multiprecision_test_test_cpp_int_deserial SOURCES test_cpp_int_deserial.cpp)
    cm_test(NAME multiprecision_test_test_cpp_rat_serial SOURCES test_cpp_rat_serial.cpp)
    cm_test(NAME multiprecision_test_test_adapt_serial SOURCES test_adapt_serial.cpp)
    cm_test(NAME multiprecision_test_test_cpp_dec_float_serial_1 SOURCES test_cpp_dec_float_serial.cpp)
    target_compile_definitions(multiprecision_test_test_cpp_dec_float_serial_1 PUBLIC TEST1)
    cm_test(NAME multiprecision_test_test_cpp_dec_float_serial_2 SOURCES test_cpp_dec_float_serial.cpp)
    target_compile_definitions(multiprecision_test_test_cpp_dec_float_serial_2 PUBLIC TEST2)
    # cm_test(NAME test_float128_serial SOURCES test_float128_serial.cpp)
    cm_test(NAME multiprecision_test_test_cpp_int_serial_1 SOURCES test_cpp_int_serial.cpp)
    target_compile_definitions(multiprecision_test_test_cpp_int_serial_1 PUBLIC TEST1)
    cm_test(NAME multiprecision_test_test_cpp_int_serial_2 SOURCES test_cpp_int_serial.cpp)
    target_compile_definitions(multiprecision_test_test_cpp_int_serial_2 PUBLIC TEST2)
    cm_test(NAME multiprecision_test_test_cpp_int_serial_3 SOURCES test_cpp_int_serial.cpp)
    target_compile_definitions(multiprecision_test_test_cpp_int_serial_3 PUBLIC TEST3)
    cm_test(NAME multiprecision_test_test_cpp_int_serial_4 SOURCES test_cpp_int_serial.cpp)
    target_compile_definitions(multiprecision_test_test_cpp_int_serial_4 PUBLIC TEST4)

    cm_test(NAME multiprecision_test_test_bin_dec_float_serial_1 SOURCES test_cpp_bin_float_serial.cpp)
    target_compile_definitions(multiprecision_test_test_bin_dec_float_serial_1 PUBLIC TEST1)

    cm_test(NAME multiprecision_test_test_bin_dec_float_serial_2 SOURCES test_cpp_bin_float_serial.cpp)
    target_compile_definitions(multiprecision_test_test_bin_dec_float_serial_2 PUBLIC TEST2)
endif()
#
# Mixed mode comparison tests, see: https://svn.boost.org/trac/boost/ticket/11328
#
# cm_test(NAME test_checked_mixed_cpp_int SOURCES test_checked_mixed_cpp_int.cpp)
# cm_test(NAME test_mixed_cpp_bin_float SOURCES test_mixed_cpp_bin_float.cpp)
# cm_test(NAME test_mixed_cpp_dec_float SOURCES test_mixed_cpp_dec_float.cpp)
# cm_test(NAME test_mixed_mpf_float SOURCES test_mixed_mpf_float.cpp)
# cm_test(NAME test_mixed_mpfr_float SOURCES test_mixed_mpfr_float.cpp)
#
# Check for narrowing conversions:
#
# cm_test(NAME test_float_conversions SOURCES test_float_conversions.cpp)
#
# specific bug cases:
#
# cm_test(NAME bug11922 SOURCES bug11922.cpp COMPILE_ONLY)
# cm_test(NAME bug12039 SOURCES bug12039.cpp)
# cm_test(NAME test_hash SOURCES test_hash.cpp)


# cm_test(NAME $(source:B)_mpfr SOURCES $(source))
# target_compile_definitions($(source:B)_mpfr PUBLIC BOOST_OPTIONAL_USE_OLD_DEFINITION_OF_NONE)
# cm_test(NAME $(source:B)_mpf SOURCES $(source))
# target_compile_definitions($(source:B)_mpf PUBLIC BOOST_OPTIONAL_USE_OLD_DEFINITION_OF_NONE)
# cm_test(NAME $(source:B)_cpp_dec_float SOURCES $(source))
# target_compile_definitions($(source:B)_cpp_dec_float PUBLIC BOOST_OPTIONAL_USE_OLD_DEFINITION_OF_NONE)
# cm_test(NAME $(source:B)_cpp_bin_float SOURCES $(source))
# target_compile_definitions($(source:B)_cpp_bin_float PUBLIC BOOST_OPTIONAL_USE_OLD_DEFINITION_OF_NONE)
# cm_test(NAME $(source:B)_float128 SOURCES $(source))
# target_compile_definitions($(source:B)_float128 PUBLIC BOOST_OPTIONAL_USE_OLD_DEFINITION_OF_NONE)
# cm_test(NAME $(source:B)_intel_quad SOURCES $(source))
# target_compile_definitions($(source:B)_intel_quad PUBLIC BOOST_OPTIONAL_USE_OLD_DEFINITION_OF_NONE)
#
# High precision tests are rather different, as they test only one
# multiprecision type and are more a test of Boost.Math:
#
# cm_test(NAME $(source) SOURCES $(source))
# target_compile_definitions($(source) PUBLIC BOOST_OPTIONAL_USE_OLD_DEFINITION_OF_NONE)

# cm_test(NAME $(source) SOURCES $(source) COMPILE_ONLY WILL_FAIL)

# cm_test(NAME $(source:B)_mpfr_50 SOURCES $(source) COMPILE_ONLY)
# target_compile_definitions($(source:B)_mpfr_50 PUBLIC TEST_MPFR_50)

# cm_test(NAME $(source:B)_mpfr_6 SOURCES $(source) COMPILE_ONLY)
# target_compile_definitions($(source:B)_mpfr_6 PUBLIC TEST_MPFR_6)

# cm_test(NAME $(source:B)_mpfr_15 SOURCES $(source) COMPILE_ONLY)
# target_compile_definitions($(source:B)_mpfr_15 PUBLIC TEST_MPFR_15)

# cm_test(NAME $(source:B)_mpfr_17 SOURCES $(source) COMPILE_ONLY)
# target_compile_definitions($(source:B)_mpfr_17 PUBLIC TEST_MPFR_17)

# cm_test(NAME $(source:B)_mpfr_30 SOURCES $(source) COMPILE_ONLY)
# target_compile_definitions($(source:B)_mpfr_30 PUBLIC TEST_MPFR_30)

# cm_test(NAME $(source:B)_mpf50 SOURCES $(source) COMPILE_ONLY)
# target_compile_definitions($(source:B)_mpf50 PUBLIC TEST_MPF_50)

# cm_test(NAME $(source:B)_cpp_dec_float SOURCES $(source) COMPILE_ONLY)
# target_compile_definitions($(source:B)_cpp_dec_float PUBLIC TEST_CPP_DEC_FLOAT)

# cm_test(NAME $(source:B)_cpp_bin_float SOURCES $(source) COMPILE_ONLY)
# target_compile_definitions($(source:B)_cpp_bin_float PUBLIC TEST_CPP_BIN_FLOAT)

# cm_test(NAME $(source:B)_cpp_dec_float_no_et SOURCES $(source) COMPILE_ONLY)
# target_compile_definitions($(source:B)_cpp_dec_float_no_et PUBLIC TEST_CPP_DEC_FLOAT_NO_ET)

# cm_test(NAME $(source:B)_backend_concept SOURCES $(source) COMPILE_ONLY)
# target_compile_definitions($(source:B)_backend_concept PUBLIC TEST_BACKEND)

# cm_test(NAME $(source:B)_logged_adaptor SOURCES $(source) COMPILE_ONLY)
# target_compile_definitions($(source:B)_logged_adaptor PUBLIC TEST_LOGGED_ADAPTER)







