include(CMTest)

find_package(${CMAKE_WORKSPACE_NAME}_tuple)
find_package(${CMAKE_WORKSPACE_NAME}_bind)
find_package(${CMAKE_WORKSPACE_NAME}_test)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_optional
                        ${CMAKE_WORKSPACE_NAME}::tuple
                        ${CMAKE_WORKSPACE_NAME}::bind
                        ${CMAKE_WORKSPACE_NAME}::test
                        )

# Boost.Optional Library test Jamfile
#
# Copyright (C) 2003, Fernando Luis Cacciola Carballal.
# Copyright (C) 2014 - 2016 Andrzej Krzemienski
#
# Use, modification, and distribution is subject to the Boost Software
# License, Version 1.0. (See accompanying file LICENSE_1_0.txt or copy at
# http://www.boost.org/LICENSE_1_0.txt)
#
# See http://www.boost.org/libs/optional for documentation.
#
# You are welcome to contact the author at:
#  akrzemi1@gmail.com
#

#test-suite optional
cm_test(NAME optional_test_optional_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/optional_test.cpp)
cm_test(NAME optional_test_optional_test_swap SOURCES ${CURRENT_TEST_SOURCES_DIR}/optional_test_swap.cpp)
cm_test(NAME optional_test_optional_test_conversions_from_U SOURCES ${CURRENT_TEST_SOURCES_DIR}/optional_test_conversions_from_U.cpp)
cm_test(NAME optional_test_optional_test_tie SOURCES ${CURRENT_TEST_SOURCES_DIR}/optional_test_tie.cpp)
cm_test(NAME optional_test_optional_test_ref_assign_portable_minimum SOURCES ${CURRENT_TEST_SOURCES_DIR}/optional_test_ref_assign_portable_minimum.cpp)
cm_test(NAME optional_test_optional_test_ref_assign_mutable_int SOURCES ${CURRENT_TEST_SOURCES_DIR}/optional_test_ref_assign_mutable_int.cpp)
cm_test(NAME optional_test_optional_test_ref_assign_const_int SOURCES ${CURRENT_TEST_SOURCES_DIR}/optional_test_ref_assign_const_int.cpp)
cm_test(NAME optional_test_optional_test_ref_converting_ctor SOURCES ${CURRENT_TEST_SOURCES_DIR}/optional_test_ref_converting_ctor.cpp)
cm_test(NAME optional_test_optional_test_ref_convert_assign_non_int SOURCES ${CURRENT_TEST_SOURCES_DIR}/optional_test_ref_convert_assign_non_int.cpp)
cm_test(NAME optional_test_optional_test_ref_convert_assign_mutable_int SOURCES ${CURRENT_TEST_SOURCES_DIR}/optional_test_ref_convert_assign_mutable_int.cpp)
cm_test(NAME optional_test_optional_test_ref_convert_assign_const_int SOURCES ${CURRENT_TEST_SOURCES_DIR}/optional_test_ref_convert_assign_const_int.cpp)
cm_test(NAME optional_test_optional_test_ref_portable_minimum SOURCES ${CURRENT_TEST_SOURCES_DIR}/optional_test_ref_portable_minimum.cpp)
cm_test(NAME optional_test_optional_test_ref_move SOURCES ${CURRENT_TEST_SOURCES_DIR}/optional_test_ref_move.cpp)
cm_test(NAME optional_test_optional_test_inplace_factory SOURCES ${CURRENT_TEST_SOURCES_DIR}/optional_test_inplace_factory.cpp)
cm_test(NAME optional_test_optional_test_io SOURCES ${CURRENT_TEST_SOURCES_DIR}/optional_test_io.cpp)
cm_test(NAME optional_test_optional_test_move SOURCES ${CURRENT_TEST_SOURCES_DIR}/optional_test_move.cpp)
cm_test(NAME optional_test_optional_test_noexcept_move SOURCES ${CURRENT_TEST_SOURCES_DIR}/optional_test_noexcept_move.cpp)
cm_test(NAME optional_test_optional_test_equals_none SOURCES ${CURRENT_TEST_SOURCES_DIR}/optional_test_equals_none.cpp)
cm_test(NAME optional_test_optional_test_value_access SOURCES ${CURRENT_TEST_SOURCES_DIR}/optional_test_value_access.cpp)
cm_test(NAME optional_test_optional_test_emplace SOURCES ${CURRENT_TEST_SOURCES_DIR}/optional_test_emplace.cpp)
cm_test(NAME optional_test_optional_test_minimum_requirements SOURCES ${CURRENT_TEST_SOURCES_DIR}/optional_test_minimum_requirements.cpp)
cm_test(NAME optional_test_optional_test_msvc_bug_workaround SOURCES ${CURRENT_TEST_SOURCES_DIR}/optional_test_msvc_bug_workaround.cpp)
cm_test(NAME optional_test_optional_test_fail1 SOURCES ${CURRENT_TEST_SOURCES_DIR}/optional_test_fail1.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME optional_test_optional_test_fail3a SOURCES ${CURRENT_TEST_SOURCES_DIR}/optional_test_fail3a.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME optional_test_optional_test_fail3b SOURCES ${CURRENT_TEST_SOURCES_DIR}/optional_test_fail3b.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME optional_test_optional_test_ref_fail1 SOURCES ${CURRENT_TEST_SOURCES_DIR}/optional_test_ref_fail1.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME optional_test_optional_test_ref_fail3 SOURCES ${CURRENT_TEST_SOURCES_DIR}/optional_test_ref_fail3.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME optional_test_optional_test_ref_fail4 SOURCES ${CURRENT_TEST_SOURCES_DIR}/optional_test_ref_fail4.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME optional_test_optional_test_inplace_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/optional_test_inplace_fail.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME optional_test_optional_test_inplace_fail2 SOURCES ${CURRENT_TEST_SOURCES_DIR}/optional_test_inplace_fail2.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME optional_test_optional_test_fail_implicit_bool_convert SOURCES ${CURRENT_TEST_SOURCES_DIR}/optional_test_fail_implicit_bool_convert.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME optional_test_optional_test_fail_copying_a_moveable_type SOURCES ${CURRENT_TEST_SOURCES_DIR}/optional_test_fail_copying_a_moveable_type.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME optional_test_optional_test_fail_optional_rvalue_ref SOURCES ${CURRENT_TEST_SOURCES_DIR}/optional_test_fail_optional_rvalue_ref.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME optional_test_optional_test_ref_fail_init_from_Trefref SOURCES ${CURRENT_TEST_SOURCES_DIR}/optional_test_ref_fail_init_from_Trefref.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME optional_test_optional_test_ref_fail_init_from_Urefref SOURCES ${CURRENT_TEST_SOURCES_DIR}/optional_test_ref_fail_init_from_Urefref.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME optional_test_optional_test_ref_fail_assign_from_Trefref SOURCES ${CURRENT_TEST_SOURCES_DIR}/optional_test_ref_fail_assign_from_Trefref.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME optional_test_optional_test_ref_fail_assign_from_Urefref SOURCES ${CURRENT_TEST_SOURCES_DIR}/optional_test_ref_fail_assign_from_Urefref.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME optional_test_optional_test_fail_convert_from_null SOURCES ${CURRENT_TEST_SOURCES_DIR}/optional_test_fail_convert_from_null.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME optional_test_optional_test_fail_explicit_convert_in_value_or SOURCES ${CURRENT_TEST_SOURCES_DIR}/optional_test_fail_explicit_convert_in_value_or.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME optional_test_optional_test_fail_explicit_convert_in_value_or_call SOURCES ${CURRENT_TEST_SOURCES_DIR}/optional_test_fail_explicit_convert_in_value_or_call.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME optional_test_optional_test_fail_io_without_io SOURCES ${CURRENT_TEST_SOURCES_DIR}/optional_test_fail_io_without_io.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME optional_test_optional_test_fail_none_io_without_io SOURCES ${CURRENT_TEST_SOURCES_DIR}/optional_test_fail_none_io_without_io.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME optional_test_optional_test_fail_convert_assign_of_enums SOURCES ${CURRENT_TEST_SOURCES_DIR}/optional_test_fail_convert_assign_of_enums.cpp COMPILE_ONLY WILL_FAIL)
