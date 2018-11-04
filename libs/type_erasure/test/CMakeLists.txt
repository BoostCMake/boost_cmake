include(CMTest)

find_package(${CMAKE_WORKSPACE_NAME}_tuple)
find_package(${CMAKE_WORKSPACE_NAME}_concept_check)
find_package(${CMAKE_WORKSPACE_NAME}_test)
find_package(${CMAKE_WORKSPACE_NAME}_utility)
find_package(${CMAKE_WORKSPACE_NAME}_align)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_type_erasure
                        ${CMAKE_WORKSPACE_NAME}::align
                        ${CMAKE_WORKSPACE_NAME}::tuple
                        ${CMAKE_WORKSPACE_NAME}::concept_check
                        ${CMAKE_WORKSPACE_NAME}::test
                        ${CMAKE_WORKSPACE_NAME}::utility
                        )

# Boost.TypeErasure library
#
# Copyright 2011 Steven Watanabe
#
# Distributed under the Boost Software License version 1.0. (See
# accompanying file LICENSE_1_0.txt or copy at
# http://www.boost.org/LICENSE_1_0.txt)

cm_test(NAME type_erasure_test_test_binding SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_binding.cpp)
cm_test(NAME type_erasure_test_test_increment SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_increment.cpp)
cm_test(NAME type_erasure_test_test_add SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_add.cpp)
cm_test(NAME type_erasure_test_test_add_assign SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_add_assign.cpp)
cm_test(NAME type_erasure_test_test_callable SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_callable.cpp)
cm_test(NAME type_erasure_test_test_reference SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_reference.cpp)
cm_test(NAME type_erasure_test_test_construct SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_construct.cpp)
cm_test(NAME type_erasure_test_test_relaxed SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_relaxed.cpp)
cm_test(NAME type_erasure_test_test_assign SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_assign.cpp)
cm_test(NAME type_erasure_test_test_construct_ref SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_construct_ref.cpp)
cm_test(NAME type_erasure_test_test_construct_cref SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_construct_cref.cpp)
cm_test(NAME type_erasure_test_test_any_cast SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_any_cast.cpp)
cm_test(NAME type_erasure_test_test_binding_of SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_binding_of.cpp)
cm_test(NAME type_erasure_test_test_typeid_of SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_typeid_of.cpp)
cm_test(NAME type_erasure_test_test_nested SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_nested.cpp)
cm_test(NAME type_erasure_test_test_less SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_less.cpp)
cm_test(NAME type_erasure_test_test_equal SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_equal.cpp)
cm_test(NAME type_erasure_test_test_negate SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_negate.cpp)
cm_test(NAME type_erasure_test_test_dereference SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_dereference.cpp)
cm_test(NAME type_erasure_test_test_subscript SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_subscript.cpp)
cm_test(NAME type_erasure_test_test_forward_iterator SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_forward_iterator.cpp)
cm_test(NAME type_erasure_test_test_tuple SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_tuple.cpp)
cm_test(NAME type_erasure_test_test_stream SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_stream.cpp)
cm_test(NAME type_erasure_test_test_deduced SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_deduced.cpp)
cm_test(NAME type_erasure_test_test_same_type SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_same_type.cpp)
cm_test(NAME type_erasure_test_test_member SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_member.cpp)
cm_test(NAME type_erasure_test_test_null SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_null.cpp)
cm_test(NAME type_erasure_test_test_free SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_free.cpp)
cm_test(NAME type_erasure_test_test_is_empty SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_is_empty.cpp)

# TODO: fix test.
#cm_test(NAME type_erasure_test_test_dynamic_any_cast SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_dynamic_any_cast.cpp)

cm_test(NAME type_erasure_test_test_param SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_param.cpp COMPILE_ONLY)
cm_test(NAME type_erasure_test_test_is_subconcept SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_is_subconcept.cpp COMPILE_ONLY)

cm_test(NAME type_erasure_test_fail_default_construct SOURCES ${CURRENT_TEST_SOURCES_DIR}/fail_default_construct.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME type_erasure_test_fail_construct_mismatch SOURCES ${CURRENT_TEST_SOURCES_DIR}/fail_construct_mismatch.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME type_erasure_test_fail_construct_mismatch_ref SOURCES ${CURRENT_TEST_SOURCES_DIR}/fail_construct_mismatch_ref.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME type_erasure_test_fail_construct_mismatch_cref SOURCES ${CURRENT_TEST_SOURCES_DIR}/fail_construct_mismatch_cref.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME type_erasure_test_fail_binding_convert_no_mapping SOURCES ${CURRENT_TEST_SOURCES_DIR}/fail_binding_convert_no_mapping.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME type_erasure_test_fail_increment_discard_const SOURCES ${CURRENT_TEST_SOURCES_DIR}/fail_increment_discard_const.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME type_erasure_test_fail_ref_assign SOURCES ${CURRENT_TEST_SOURCES_DIR}/fail_ref_assign.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME type_erasure_test_fail_cref_assign SOURCES ${CURRENT_TEST_SOURCES_DIR}/fail_cref_assign.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME type_erasure_test_fail_ref_discard_const SOURCES ${CURRENT_TEST_SOURCES_DIR}/fail_ref_discard_const.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME type_erasure_test_fail_ref_discard_const_convert SOURCES ${CURRENT_TEST_SOURCES_DIR}/fail_ref_discard_const_convert.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME type_erasure_test_fail_ref_discard_const_convert_ref SOURCES ${CURRENT_TEST_SOURCES_DIR}/fail_ref_discard_const_convert_ref.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME type_erasure_test_fail_ref_discard_const_convert_cref SOURCES ${CURRENT_TEST_SOURCES_DIR}/fail_ref_discard_const_convert_cref.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME type_erasure_test_fail_ref_discard_const_init SOURCES ${CURRENT_TEST_SOURCES_DIR}/fail_ref_discard_const_init.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME type_erasure_test_fail_any_cast_discard_const1 SOURCES ${CURRENT_TEST_SOURCES_DIR}/fail_any_cast_discard_const1.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME type_erasure_test_fail_any_cast_discard_const2 SOURCES ${CURRENT_TEST_SOURCES_DIR}/fail_any_cast_discard_const2.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME type_erasure_test_fail_any_cast_discard_const3 SOURCES ${CURRENT_TEST_SOURCES_DIR}/fail_any_cast_discard_const3.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME type_erasure_test_fail_any_cast_discard_const4 SOURCES ${CURRENT_TEST_SOURCES_DIR}/fail_any_cast_discard_const4.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME type_erasure_test_fail_any_cast_discard_const5 SOURCES ${CURRENT_TEST_SOURCES_DIR}/fail_any_cast_discard_const5.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME type_erasure_test_fail_any_cast_discard_const6 SOURCES ${CURRENT_TEST_SOURCES_DIR}/fail_any_cast_discard_const6.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME type_erasure_test_fail_any_cast_pointer_to_ref SOURCES ${CURRENT_TEST_SOURCES_DIR}/fail_any_cast_pointer_to_ref.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME type_erasure_test_fail_any_cast_pointer_to_val SOURCES ${CURRENT_TEST_SOURCES_DIR}/fail_any_cast_pointer_to_val.cpp COMPILE_ONLY WILL_FAIL)
