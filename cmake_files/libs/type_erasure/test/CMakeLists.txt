include(BCMTest)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)

find_package(${CMAKE_WORKSPACE_NAME}_tuple)
find_package(${CMAKE_WORKSPACE_NAME}_concept_check)
find_package(${CMAKE_WORKSPACE_NAME}_test)
find_package(${CMAKE_WORKSPACE_NAME}_utility)
find_package(${CMAKE_WORKSPACE_NAME}_align)

bcm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_type_erasure
                        boost::align
                        boost::tuple
                        boost::concept_check
                        boost::test
                        boost::utility
                        )

# Boost.TypeErasure library
#
# Copyright 2011 Steven Watanabe
#
# Distributed under the Boost Software License version 1.0. (See
# accompanying file LICENSE_1_0.txt or copy at
# http://www.boost.org/LICENSE_1_0.txt)


bcm_test(NAME type_erasure_test_test_binding SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_binding.cpp)
bcm_test(NAME type_erasure_test_test_increment SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_increment.cpp)
bcm_test(NAME type_erasure_test_test_add SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_add.cpp)
bcm_test(NAME type_erasure_test_test_add_assign SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_add_assign.cpp)
bcm_test(NAME type_erasure_test_test_callable SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_callable.cpp)
bcm_test(NAME type_erasure_test_test_reference SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_reference.cpp)
bcm_test(NAME type_erasure_test_test_construct SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_construct.cpp)
bcm_test(NAME type_erasure_test_test_relaxed SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_relaxed.cpp)
bcm_test(NAME type_erasure_test_test_assign SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_assign.cpp)
bcm_test(NAME type_erasure_test_test_construct_ref SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_construct_ref.cpp)
bcm_test(NAME type_erasure_test_test_construct_cref SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_construct_cref.cpp)
bcm_test(NAME type_erasure_test_test_any_cast SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_any_cast.cpp)
bcm_test(NAME type_erasure_test_test_binding_of SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_binding_of.cpp)
bcm_test(NAME type_erasure_test_test_typeid_of SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_typeid_of.cpp)
bcm_test(NAME type_erasure_test_test_nested SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_nested.cpp)
bcm_test(NAME type_erasure_test_test_less SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_less.cpp)
bcm_test(NAME type_erasure_test_test_equal SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_equal.cpp)
bcm_test(NAME type_erasure_test_test_negate SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_negate.cpp)
bcm_test(NAME type_erasure_test_test_dereference SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_dereference.cpp)
bcm_test(NAME type_erasure_test_test_subscript SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_subscript.cpp)
bcm_test(NAME type_erasure_test_test_forward_iterator SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_forward_iterator.cpp)
bcm_test(NAME type_erasure_test_test_tuple SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_tuple.cpp)
bcm_test(NAME type_erasure_test_test_stream SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_stream.cpp)
bcm_test(NAME type_erasure_test_test_deduced SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_deduced.cpp)
bcm_test(NAME type_erasure_test_test_same_type SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_same_type.cpp)
bcm_test(NAME type_erasure_test_test_member SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_member.cpp)
bcm_test(NAME type_erasure_test_test_null SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_null.cpp)
bcm_test(NAME type_erasure_test_test_free SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_free.cpp)
bcm_test(NAME type_erasure_test_test_is_empty SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_is_empty.cpp)
# bcm_test(NAME type_erasure_test_test_dynamic_any_cast SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_dynamic_any_cast.cpp)

bcm_test(NAME type_erasure_test_test_param SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_param.cpp COMPILE_ONLY)
bcm_test(NAME type_erasure_test_test_is_subconcept SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_is_subconcept.cpp COMPILE_ONLY)

bcm_test(NAME type_erasure_test_fail_default_construct SOURCES ${CMAKE_WORKSPACE_SOURCE}/fail_default_construct.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME type_erasure_test_fail_construct_mismatch SOURCES ${CMAKE_WORKSPACE_SOURCE}/fail_construct_mismatch.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME type_erasure_test_fail_construct_mismatch_ref SOURCES ${CMAKE_WORKSPACE_SOURCE}/fail_construct_mismatch_ref.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME type_erasure_test_fail_construct_mismatch_cref SOURCES ${CMAKE_WORKSPACE_SOURCE}/fail_construct_mismatch_cref.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME type_erasure_test_fail_binding_convert_no_mapping SOURCES ${CMAKE_WORKSPACE_SOURCE}/fail_binding_convert_no_mapping.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME type_erasure_test_fail_increment_discard_const SOURCES ${CMAKE_WORKSPACE_SOURCE}/fail_increment_discard_const.cpp COMPILE_ONLY WILL_FAIL)

bcm_test(NAME type_erasure_test_fail_ref_assign SOURCES ${CMAKE_WORKSPACE_SOURCE}/fail_ref_assign.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME type_erasure_test_fail_cref_assign SOURCES ${CMAKE_WORKSPACE_SOURCE}/fail_cref_assign.cpp COMPILE_ONLY WILL_FAIL)

bcm_test(NAME type_erasure_test_fail_ref_discard_const SOURCES ${CMAKE_WORKSPACE_SOURCE}/fail_ref_discard_const.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME type_erasure_test_fail_ref_discard_const_convert SOURCES ${CMAKE_WORKSPACE_SOURCE}/fail_ref_discard_const_convert.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME type_erasure_test_fail_ref_discard_const_convert_ref SOURCES ${CMAKE_WORKSPACE_SOURCE}/fail_ref_discard_const_convert_ref.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME type_erasure_test_fail_ref_discard_const_convert_cref SOURCES ${CMAKE_WORKSPACE_SOURCE}/fail_ref_discard_const_convert_cref.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME type_erasure_test_fail_ref_discard_const_init SOURCES ${CMAKE_WORKSPACE_SOURCE}/fail_ref_discard_const_init.cpp COMPILE_ONLY WILL_FAIL)

bcm_test(NAME type_erasure_test_fail_any_cast_discard_const1 SOURCES ${CMAKE_WORKSPACE_SOURCE}/fail_any_cast_discard_const1.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME type_erasure_test_fail_any_cast_discard_const2 SOURCES ${CMAKE_WORKSPACE_SOURCE}/fail_any_cast_discard_const2.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME type_erasure_test_fail_any_cast_discard_const3 SOURCES ${CMAKE_WORKSPACE_SOURCE}/fail_any_cast_discard_const3.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME type_erasure_test_fail_any_cast_discard_const4 SOURCES ${CMAKE_WORKSPACE_SOURCE}/fail_any_cast_discard_const4.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME type_erasure_test_fail_any_cast_discard_const5 SOURCES ${CMAKE_WORKSPACE_SOURCE}/fail_any_cast_discard_const5.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME type_erasure_test_fail_any_cast_discard_const6 SOURCES ${CMAKE_WORKSPACE_SOURCE}/fail_any_cast_discard_const6.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME type_erasure_test_fail_any_cast_pointer_to_ref SOURCES ${CMAKE_WORKSPACE_SOURCE}/fail_any_cast_pointer_to_ref.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME type_erasure_test_fail_any_cast_pointer_to_val SOURCES ${CMAKE_WORKSPACE_SOURCE}/fail_any_cast_pointer_to_val.cpp COMPILE_ONLY WILL_FAIL)

