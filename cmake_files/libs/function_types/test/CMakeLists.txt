include(BCMTest)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)


bcm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_function_types
                        )


# (C) Copyright Tobias Schwinger
#
# Use, modification and distribution are subject to the Boost Software License,
# Version 1.0. (See http://www.boost.org/LICENSE_1_0.txt).

#-------------------------------------------------------------------------------

find_package(${CMAKE_WORKSPACE_NAME}_mpl)
find_package(${CMAKE_WORKSPACE_NAME}_timer)
find_package(${CMAKE_WORKSPACE_NAME}_tokenizer)
find_package(${CMAKE_WORKSPACE_NAME}_lexical_cast)
find_package(${CMAKE_WORKSPACE_NAME}_container)

bcm_test_link_libraries(boost::mpl boost::timer boost::tokenizer boost::lexical_cast boost::container)


bcm_test(NAME function_types_test_classification_is_function SOURCES ${CMAKE_WORKSPACE_SOURCE}/classification/is_function.cpp COMPILE_ONLY)
bcm_test(NAME function_types_test_classification_is_function_pointer SOURCES ${CMAKE_WORKSPACE_SOURCE}/classification/is_function_pointer.cpp COMPILE_ONLY)
bcm_test(NAME function_types_test_classification_is_function_reference SOURCES ${CMAKE_WORKSPACE_SOURCE}/classification/is_function_reference.cpp COMPILE_ONLY)
bcm_test(NAME function_types_test_classification_is_member_function_pointer SOURCES ${CMAKE_WORKSPACE_SOURCE}/classification/is_member_function_pointer.cpp COMPILE_ONLY)
bcm_test(NAME function_types_test_classification_is_member_object_pointer SOURCES ${CMAKE_WORKSPACE_SOURCE}/classification/is_member_object_pointer.cpp COMPILE_ONLY)
bcm_test(NAME function_types_test_classification_is_callable_builtin SOURCES ${CMAKE_WORKSPACE_SOURCE}/classification/is_callable_builtin.cpp COMPILE_ONLY)
bcm_test(NAME function_types_test_classification_is_nonmember_callable_builtin SOURCES ${CMAKE_WORKSPACE_SOURCE}/classification/is_nonmember_callable_builtin.cpp COMPILE_ONLY)
bcm_test(NAME function_types_test_classification_is_member_pointer SOURCES ${CMAKE_WORKSPACE_SOURCE}/classification/is_member_pointer.cpp COMPILE_ONLY)

bcm_test(NAME function_types_test_classification_is_cv_mem_func_ptr SOURCES ${CMAKE_WORKSPACE_SOURCE}/classification/is_cv_mem_func_ptr.cpp COMPILE_ONLY)
bcm_test(NAME function_types_test_classification_is_variadic SOURCES ${CMAKE_WORKSPACE_SOURCE}/classification/is_variadic.cpp COMPILE_ONLY)
bcm_test(NAME function_types_test_classification_is_cv_pointer SOURCES ${CMAKE_WORKSPACE_SOURCE}/classification/is_cv_pointer.cpp COMPILE_ONLY)
bcm_test(NAME function_types_test_classification_is_cv_function SOURCES ${CMAKE_WORKSPACE_SOURCE}/classification/is_cv_function.cpp COMPILE_ONLY)


bcm_test(NAME function_types_test_decomposition_components SOURCES ${CMAKE_WORKSPACE_SOURCE}/decomposition/components.cpp COMPILE_ONLY)
bcm_test(NAME function_types_test_decomposition_result_type SOURCES ${CMAKE_WORKSPACE_SOURCE}/decomposition/result_type.cpp COMPILE_ONLY)
bcm_test(NAME function_types_test_decomposition_function_arity SOURCES ${CMAKE_WORKSPACE_SOURCE}/decomposition/function_arity.cpp COMPILE_ONLY)
bcm_test(NAME function_types_test_decomposition_parameter_types SOURCES ${CMAKE_WORKSPACE_SOURCE}/decomposition/parameter_types.cpp COMPILE_ONLY)

bcm_test(NAME function_types_test_decomposition_components_seq SOURCES ${CMAKE_WORKSPACE_SOURCE}/decomposition/components_seq.cpp COMPILE_ONLY)
bcm_test(NAME function_types_test_decomposition_class_type_transform SOURCES ${CMAKE_WORKSPACE_SOURCE}/decomposition/class_type_transform.cpp COMPILE_ONLY)

bcm_test(NAME function_types_test_decomposition_result_type_fail SOURCES ${CMAKE_WORKSPACE_SOURCE}/decomposition/result_type_fail.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME function_types_test_decomposition_parameter_types_fail SOURCES ${CMAKE_WORKSPACE_SOURCE}/decomposition/parameter_types_fail.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME function_types_test_decomposition_function_arity_fail SOURCES ${CMAKE_WORKSPACE_SOURCE}/decomposition/function_arity_fail.cpp COMPILE_ONLY WILL_FAIL)


bcm_test(NAME function_types_test_synthesis_function_type SOURCES ${CMAKE_WORKSPACE_SOURCE}/synthesis/function_type.cpp COMPILE_ONLY)
bcm_test(NAME function_types_test_synthesis_function_pointer SOURCES ${CMAKE_WORKSPACE_SOURCE}/synthesis/function_pointer.cpp COMPILE_ONLY)
bcm_test(NAME function_types_test_synthesis_function_reference SOURCES ${CMAKE_WORKSPACE_SOURCE}/synthesis/function_reference.cpp COMPILE_ONLY)
bcm_test(NAME function_types_test_synthesis_member_function_pointer SOURCES ${CMAKE_WORKSPACE_SOURCE}/synthesis/member_function_pointer.cpp COMPILE_ONLY)
bcm_test(NAME function_types_test_synthesis_member_object_pointer SOURCES ${CMAKE_WORKSPACE_SOURCE}/synthesis/member_object_pointer.cpp COMPILE_ONLY)

bcm_test(NAME function_types_test_synthesis_transformation SOURCES ${CMAKE_WORKSPACE_SOURCE}/synthesis/transformation.cpp COMPILE_ONLY)
bcm_test(NAME function_types_test_synthesis_mem_func_ptr_cv1 SOURCES ${CMAKE_WORKSPACE_SOURCE}/synthesis/mem_func_ptr_cv1.cpp COMPILE_ONLY)
bcm_test(NAME function_types_test_synthesis_mem_func_ptr_cv2 SOURCES ${CMAKE_WORKSPACE_SOURCE}/synthesis/mem_func_ptr_cv2.cpp COMPILE_ONLY)
bcm_test(NAME function_types_test_synthesis_mem_func_ptr_cv_ptr_to_this SOURCES ${CMAKE_WORKSPACE_SOURCE}/synthesis/mem_func_ptr_cv_ptr_to_this.cpp COMPILE_ONLY)
bcm_test(NAME function_types_test_synthesis_variadic_function_synthesis SOURCES ${CMAKE_WORKSPACE_SOURCE}/synthesis/variadic_function_synthesis.cpp COMPILE_ONLY)
# bcm_test(NAME function_types_test_synthesis_cv_function_synthesis SOURCES ${CMAKE_WORKSPACE_SOURCE}/synthesis/cv_function_synthesis.cpp COMPILE_ONLY)


bcm_test(NAME function_types_test_reconfiguration_preprocessing_mode SOURCES ${CMAKE_WORKSPACE_SOURCE}/reconfiguration/preprocessing_mode.cpp COMPILE_ONLY)
bcm_test(NAME function_types_test_reconfiguration_partial_arity_preprocessing SOURCES ${CMAKE_WORKSPACE_SOURCE}/reconfiguration/partial_arity_preprocessing.cpp COMPILE_ONLY)
bcm_test(NAME function_types_test_reconfiguration_cc_preprocessing SOURCES ${CMAKE_WORKSPACE_SOURCE}/reconfiguration/cc_preprocessing.cpp COMPILE_ONLY)

if(WIN32)
    bcm_test(NAME function_types_test_custom_ccs_nonmember_ccs SOURCES ${CMAKE_WORKSPACE_SOURCE}/custom_ccs/nonmember_ccs.cpp COMPILE_ONLY)
    bcm_test(NAME function_types_test_custom_ccs_nonmember_ccs_exact SOURCES ${CMAKE_WORKSPACE_SOURCE}/custom_ccs/nonmember_ccs_exact.cpp COMPILE_ONLY)
    bcm_test(NAME function_types_test_custom_ccs_member_ccs SOURCES ${CMAKE_WORKSPACE_SOURCE}/custom_ccs/member_ccs.cpp COMPILE_ONLY)
    bcm_test(NAME function_types_test_custom_ccs_member_ccs_exact SOURCES ${CMAKE_WORKSPACE_SOURCE}/custom_ccs/member_ccs_exact.cpp COMPILE_ONLY)
endif()

bcm_test(NAME function_types_test_custom_ccs_nonmember_ccs SOURCES ${CMAKE_WORKSPACE_SOURCE}/custom_ccs/nonmember_ccs.cpp COMPILE_ONLY)
bcm_test(NAME function_types_test_custom_ccs_nonmember_ccs_exact SOURCES ${CMAKE_WORKSPACE_SOURCE}/custom_ccs/nonmember_ccs_exact.cpp COMPILE_ONLY)
bcm_test(NAME function_types_test_custom_ccs_member_ccs SOURCES ${CMAKE_WORKSPACE_SOURCE}/custom_ccs/member_ccs.cpp COMPILE_ONLY)
bcm_test(NAME function_types_test_custom_ccs_member_ccs_exact SOURCES ${CMAKE_WORKSPACE_SOURCE}/custom_ccs/member_ccs_exact.cpp COMPILE_ONLY)

bcm_test(NAME function_types_test_example_interpreter_example SOURCES ${CMAKE_WORKSPACE_SOURCE}/../example/interpreter_example.cpp COMPILE_ONLY)
bcm_test(NAME function_types_test_example_result_of_example SOURCES ${CMAKE_WORKSPACE_SOURCE}/../example/result_of_example.cpp COMPILE_ONLY)
bcm_test(NAME function_types_test_example_interface_example SOURCES ${CMAKE_WORKSPACE_SOURCE}/../example/interface_example.cpp COMPILE_ONLY)
bcm_test(NAME function_types_test_example_fast_mem_fn_example SOURCES ${CMAKE_WORKSPACE_SOURCE}/../example/fast_mem_fn_example.cpp COMPILE_ONLY)
# needed for Boost.PP file iteration with some compilers
target_include_directories(function_types_test_example_fast_mem_fn_example PUBLIC ../example)
bcm_test(NAME function_types_test_example_macro_type_args_example SOURCES ${CMAKE_WORKSPACE_SOURCE}/../example/macro_type_args_example.cpp COMPILE_ONLY)



