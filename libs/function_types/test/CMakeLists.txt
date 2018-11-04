include(CMTest)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_function_types
                        )

# (C) Copyright Tobias Schwinger
#
# Use, modification and distribution are subject to the Boost Software License,
# Version 1.0. (See http://www.boost.org/LICENSE_1_0.txt).

#-------------------------------------------------------------------------------

#find_package(${CMAKE_WORKSPACE_NAME}_mpl)
#find_package(${CMAKE_WORKSPACE_NAME}_timer)
#find_package(${CMAKE_WORKSPACE_NAME}_tokenizer)
#find_package(${CMAKE_WORKSPACE_NAME}_lexical_cast)
#find_package(${CMAKE_WORKSPACE_NAME}_container)

#cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}::mpl ${CMAKE_WORKSPACE_NAME}::timer ${CMAKE_WORKSPACE_NAME}::tokenizer ${CMAKE_WORKSPACE_NAME}::lexical_cast ${CMAKE_WORKSPACE_NAME}::container)

#test-suite function_types : 
# Classification
cm_test(NAME function_types_test_classification_is_function SOURCES ${CURRENT_TEST_SOURCES_DIR}/classification/is_function.cpp COMPILE_ONLY)
cm_test(NAME function_types_test_classification_is_function_pointer SOURCES ${CURRENT_TEST_SOURCES_DIR}/classification/is_function_pointer.cpp COMPILE_ONLY)
cm_test(NAME function_types_test_classification_is_function_reference SOURCES ${CURRENT_TEST_SOURCES_DIR}/classification/is_function_reference.cpp COMPILE_ONLY)
cm_test(NAME function_types_test_classification_is_member_function_pointer SOURCES ${CURRENT_TEST_SOURCES_DIR}/classification/is_member_function_pointer.cpp COMPILE_ONLY)
cm_test(NAME function_types_test_classification_is_member_object_pointer SOURCES ${CURRENT_TEST_SOURCES_DIR}/classification/is_member_object_pointer.cpp COMPILE_ONLY)
cm_test(NAME function_types_test_classification_is_callable_builtin SOURCES ${CURRENT_TEST_SOURCES_DIR}/classification/is_callable_builtin.cpp COMPILE_ONLY)
cm_test(NAME function_types_test_classification_is_nonmember_callable_builtin SOURCES ${CURRENT_TEST_SOURCES_DIR}/classification/is_nonmember_callable_builtin.cpp COMPILE_ONLY)
cm_test(NAME function_types_test_classification_is_member_pointer SOURCES ${CURRENT_TEST_SOURCES_DIR}/classification/is_member_pointer.cpp COMPILE_ONLY)

cm_test(NAME function_types_test_classification_is_cv_mem_func_ptr SOURCES ${CURRENT_TEST_SOURCES_DIR}/classification/is_cv_mem_func_ptr.cpp COMPILE_ONLY)
cm_test(NAME function_types_test_classification_is_variadic SOURCES ${CURRENT_TEST_SOURCES_DIR}/classification/is_variadic.cpp COMPILE_ONLY)
cm_test(NAME function_types_test_classification_is_cv_pointer SOURCES ${CURRENT_TEST_SOURCES_DIR}/classification/is_cv_pointer.cpp COMPILE_ONLY)
#cm_test(NAME function_types_test_classification_is_cv_function SOURCES ${CURRENT_TEST_SOURCES_DIR}/classification/is_cv_function.cpp COMPILE_ONLY)

# Decomposition

cm_test(NAME function_types_test_decomposition_components SOURCES ${CURRENT_TEST_SOURCES_DIR}/decomposition/components.cpp COMPILE_ONLY)
cm_test(NAME function_types_test_decomposition_result_type SOURCES ${CURRENT_TEST_SOURCES_DIR}/decomposition/result_type.cpp COMPILE_ONLY)
cm_test(NAME function_types_test_decomposition_function_arity SOURCES ${CURRENT_TEST_SOURCES_DIR}/decomposition/function_arity.cpp COMPILE_ONLY)
cm_test(NAME function_types_test_decomposition_parameter_types SOURCES ${CURRENT_TEST_SOURCES_DIR}/decomposition/parameter_types.cpp COMPILE_ONLY)

cm_test(NAME function_types_test_decomposition_components_seq SOURCES ${CURRENT_TEST_SOURCES_DIR}/decomposition/components_seq.cpp COMPILE_ONLY)
cm_test(NAME function_types_test_decomposition_class_type_transform SOURCES ${CURRENT_TEST_SOURCES_DIR}/decomposition/class_type_transform.cpp COMPILE_ONLY)

cm_test(NAME function_types_test_decomposition_result_type_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/decomposition/result_type_fail.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME function_types_test_decomposition_parameter_types_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/decomposition/parameter_types_fail.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME function_types_test_decomposition_function_arity_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/decomposition/function_arity_fail.cpp COMPILE_ONLY WILL_FAIL)

# Synthesis
cm_test(NAME function_types_test_synthesis_function_type SOURCES ${CURRENT_TEST_SOURCES_DIR}/synthesis/function_type.cpp COMPILE_ONLY)
cm_test(NAME function_types_test_synthesis_function_pointer SOURCES ${CURRENT_TEST_SOURCES_DIR}/synthesis/function_pointer.cpp COMPILE_ONLY)
cm_test(NAME function_types_test_synthesis_function_reference SOURCES ${CURRENT_TEST_SOURCES_DIR}/synthesis/function_reference.cpp COMPILE_ONLY)
cm_test(NAME function_types_test_synthesis_member_function_pointer SOURCES ${CURRENT_TEST_SOURCES_DIR}/synthesis/member_function_pointer.cpp COMPILE_ONLY)
cm_test(NAME function_types_test_synthesis_member_object_pointer SOURCES ${CURRENT_TEST_SOURCES_DIR}/synthesis/member_object_pointer.cpp COMPILE_ONLY)

cm_test(NAME function_types_test_synthesis_transformation SOURCES ${CURRENT_TEST_SOURCES_DIR}/synthesis/transformation.cpp COMPILE_ONLY)
cm_test(NAME function_types_test_synthesis_mem_func_ptr_cv1 SOURCES ${CURRENT_TEST_SOURCES_DIR}/synthesis/mem_func_ptr_cv1.cpp COMPILE_ONLY)
cm_test(NAME function_types_test_synthesis_mem_func_ptr_cv2 SOURCES ${CURRENT_TEST_SOURCES_DIR}/synthesis/mem_func_ptr_cv2.cpp COMPILE_ONLY)
cm_test(NAME function_types_test_synthesis_mem_func_ptr_cv_ptr_to_this SOURCES ${CURRENT_TEST_SOURCES_DIR}/synthesis/mem_func_ptr_cv_ptr_to_this.cpp COMPILE_ONLY)
cm_test(NAME function_types_test_synthesis_variadic_function_synthesis SOURCES ${CURRENT_TEST_SOURCES_DIR}/synthesis/variadic_function_synthesis.cpp COMPILE_ONLY)
# cm_test(NAME function_types_test_synthesis_cv_function_synthesis SOURCES ${CURRENT_TEST_SOURCES_DIR}/synthesis/cv_function_synthesis.cpp COMPILE_ONLY)

# Reconfiguration
cm_test(NAME function_types_test_reconfiguration_preprocessing_mode SOURCES ${CURRENT_TEST_SOURCES_DIR}/reconfiguration/preprocessing_mode.cpp COMPILE_ONLY)
cm_test(NAME function_types_test_reconfiguration_partial_arity_preprocessing SOURCES ${CURRENT_TEST_SOURCES_DIR}/reconfiguration/partial_arity_preprocessing.cpp COMPILE_ONLY)
cm_test(NAME function_types_test_reconfiguration_cc_preprocessing SOURCES ${CURRENT_TEST_SOURCES_DIR}/reconfiguration/cc_preprocessing.cpp COMPILE_ONLY)

# Custom calling conventions
cm_test(NAME function_types_test_custom_ccs_nonmember_ccs SOURCES ${CURRENT_TEST_SOURCES_DIR}/custom_ccs/nonmember_ccs.cpp COMPILE_ONLY)
cm_test(NAME function_types_test_custom_ccs_nonmember_ccs_exact SOURCES ${CURRENT_TEST_SOURCES_DIR}/custom_ccs/nonmember_ccs_exact.cpp COMPILE_ONLY)
cm_test(NAME function_types_test_custom_ccs_member_ccs SOURCES ${CURRENT_TEST_SOURCES_DIR}/custom_ccs/member_ccs.cpp COMPILE_ONLY)
cm_test(NAME function_types_test_custom_ccs_member_ccs_exact SOURCES ${CURRENT_TEST_SOURCES_DIR}/custom_ccs/member_ccs_exact.cpp COMPILE_ONLY)

# Code from the examples
cm_test(NAME function_types_test_example_interpreter_example SOURCES ${CURRENT_TEST_SOURCES_DIR}/../example/interpreter_example.cpp COMPILE_ONLY)
cm_test(NAME function_types_test_example_result_of_example SOURCES ${CURRENT_TEST_SOURCES_DIR}/../example/result_of_example.cpp COMPILE_ONLY)
cm_test(NAME function_types_test_example_interface_example SOURCES ${CURRENT_TEST_SOURCES_DIR}/../example/interface_example.cpp COMPILE_ONLY)
cm_test(NAME function_types_test_example_fast_mem_fn_example SOURCES ${CURRENT_TEST_SOURCES_DIR}/../example/fast_mem_fn_example.cpp COMPILE_ONLY)
# needed for Boost.PP file iteration with some compilers
target_include_directories(function_types_test_example_fast_mem_fn_example PUBLIC ../example)
cm_test(NAME function_types_test_example_macro_type_args_example SOURCES ${CURRENT_TEST_SOURCES_DIR}/../example/macro_type_args_example.cpp COMPILE_ONLY)
