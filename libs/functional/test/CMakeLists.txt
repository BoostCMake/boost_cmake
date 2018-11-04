include(CMTest)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_functional
                        )

#~ Copyright Rene Rivera 2008
#~ Distributed under the Boost Software License, Version 1.0.
#~ (See accompanying file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

#test-suite functional/factory
cm_test(NAME functional_test___factory_test_value_factory SOURCES ${CURRENT_TEST_SOURCES_DIR}/../factory/test/value_factory.cpp)
cm_test(NAME functional_test___factory_test_factory SOURCES ${CURRENT_TEST_SOURCES_DIR}/../factory/test/factory.cpp)
cm_test(NAME functional_test___factory_test_factory_with_allocator SOURCES ${CURRENT_TEST_SOURCES_DIR}/../factory/test/factory_with_allocator.cpp)
cm_test(NAME functional_test___factory_test_factory_with_none_t SOURCES ${CURRENT_TEST_SOURCES_DIR}/../factory/test/factory_with_none_t.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME functional_test___factory_test_none_t_factory SOURCES ${CURRENT_TEST_SOURCES_DIR}/../factory/test/factory.cpp)
target_compile_definitions(functional_test___factory_test_none_t_factory PRIVATE -DBOOST_FUNCTIONAL_FACTORY_SUPPORT_NONE_T)
cm_test(NAME functional_test___factory_test_none_t_factory_with_allocator SOURCES ${CURRENT_TEST_SOURCES_DIR}/../factory/test/factory_with_allocator.cpp)
target_compile_definitions(functional_test___factory_test_none_t_factory_with_allocator PRIVATE -DBOOST_FUNCTIONAL_FACTORY_SUPPORT_NONE_T)
cm_test(NAME functional_test___factory_test_none_t_factory_with_none_t SOURCES ${CURRENT_TEST_SOURCES_DIR}/../factory/test/factory_with_none_t.cpp)
target_compile_definitions(functional_test___factory_test_none_t_factory_with_none_t PRIVATE -DBOOST_FUNCTIONAL_FACTORY_SUPPORT_NONE_T)

#test-suite functional/forward

cm_test(NAME functional_test___forward_test_forward_adapter SOURCES ${CURRENT_TEST_SOURCES_DIR}/../forward/test/forward_adapter.cpp)
target_compile_options(functional_test___forward_test_forward_adapter PRIVATE -std=c++98)

cm_test(NAME functional_test___forward_test_lightweight_forward_adapter SOURCES ${CURRENT_TEST_SOURCES_DIR}/../forward/test/lightweight_forward_adapter.cpp)
target_compile_options(functional_test___forward_test_lightweight_forward_adapter PRIVATE -std=c++98)

#test-suite functional/hash/config
cm_test(NAME functional_test___hash_test_extra_check_float_funcs SOURCES ${CURRENT_TEST_SOURCES_DIR}/../hash/test/extra/check_float_funcs.cpp)

#test-suite functional/hash
cm_test(NAME functional_test___hash_test_hash_fwd_test_1 SOURCES ${CURRENT_TEST_SOURCES_DIR}/../hash/test/hash_fwd_test_1.cpp)
cm_test(NAME functional_test___hash_test_hash_fwd_test_2 SOURCES ${CURRENT_TEST_SOURCES_DIR}/../hash/test/hash_fwd_test_2.cpp)
cm_test(NAME functional_test___hash_test_hash_number_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/../hash/test/hash_number_test.cpp)
cm_test(NAME functional_test___hash_test_hash_enum_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/../hash/test/hash_enum_test.cpp)
cm_test(NAME functional_test___hash_test_hash_pointer_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/../hash/test/hash_pointer_test.cpp)
cm_test(NAME functional_test___hash_test_hash_function_pointer_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/../hash/test/hash_function_pointer_test.cpp)
cm_test(NAME functional_test___hash_test_hash_float_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/../hash/test/hash_float_test.cpp)
cm_test(NAME functional_test___hash_test_hash_long_double_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/../hash/test/hash_long_double_test.cpp)
cm_test(NAME functional_test___hash_test_hash_string_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/../hash/test/hash_string_test.cpp)
cm_test(NAME functional_test___hash_test_hash_range_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/../hash/test/hash_range_test.cpp)
cm_test(NAME functional_test___hash_test_hash_custom_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/../hash/test/hash_custom_test.cpp)
cm_test(NAME functional_test___hash_test_hash_global_namespace_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/../hash/test/hash_global_namespace_test.cpp)
cm_test(NAME functional_test___hash_test_hash_friend_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/../hash/test/hash_friend_test.cpp)
cm_test(NAME functional_test___hash_test_hash_built_in_array_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/../hash/test/hash_built_in_array_test.cpp)
cm_test(NAME functional_test___hash_test_hash_value_array_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/../hash/test/hash_value_array_test.cpp)
cm_test(NAME functional_test___hash_test_hash_vector_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/../hash/test/hash_vector_test.cpp)
cm_test(NAME functional_test___hash_test_hash_list_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/../hash/test/hash_list_test.cpp)
cm_test(NAME functional_test___hash_test_hash_deque_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/../hash/test/hash_deque_test.cpp)
cm_test(NAME functional_test___hash_test_hash_set_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/../hash/test/hash_set_test.cpp)
cm_test(NAME functional_test___hash_test_hash_map_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/../hash/test/hash_map_test.cpp)
cm_test(NAME functional_test___hash_test_hash_complex_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/../hash/test/hash_complex_test.cpp)
cm_test(NAME functional_test___hash_test_hash_type_index_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/../hash/test/hash_type_index_test.cpp)
cm_test(NAME functional_test___hash_test_hash_std_array_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/../hash/test/hash_std_array_test.cpp)
cm_test(NAME functional_test___hash_test_hash_std_tuple_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/../hash/test/hash_std_tuple_test.cpp)
cm_test(NAME functional_test___hash_test_hash_std_smart_ptr_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/../hash/test/hash_std_smart_ptr_test.cpp)
cm_test(NAME functional_test___hash_test_link_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/../hash/test/link_test.cpp ${CURRENT_TEST_SOURCES_DIR}/../hash/test/link_test_2.cpp)
cm_test(NAME functional_test___hash_test_link_ext_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/../hash/test/link_ext_test.cpp ${CURRENT_TEST_SOURCES_DIR}/../hash/test/link_no_ext_test.cpp)
cm_test(NAME functional_test___hash_test_extensions_hpp_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/../hash/test/extensions_hpp_test.cpp)
cm_test(NAME functional_test___hash_test_hash_no_ext_fail_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/../hash/test/hash_no_ext_fail_test.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME functional_test___hash_test_namespace_fail_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/../hash/test/namespace_fail_test.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME functional_test___hash_test_implicit_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/../hash/test/implicit_test.cpp)
cm_test(NAME functional_test___hash_test_hash_no_ext_macro_1 SOURCES ${CURRENT_TEST_SOURCES_DIR}/../hash/test/hash_no_ext_macro_1.cpp)
cm_test(NAME functional_test___hash_test_hash_no_ext_macro_2 SOURCES ${CURRENT_TEST_SOURCES_DIR}/../hash/test/hash_no_ext_macro_2.cpp)

#test-suite functional/hash_no_ext
cm_test(NAME functional_test___hash_test_no_ext_hash_number_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/../hash/test/hash_number_test.cpp)
target_compile_definitions(functional_test___hash_test_no_ext_hash_number_test PRIVATE -DBOOST_HASH_NO_EXTENSIONS)
cm_test(NAME functional_test___hash_test_no_ext_hash_pointer_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/../hash/test/hash_pointer_test.cpp)
target_compile_definitions(functional_test___hash_test_no_ext_hash_pointer_test PRIVATE -DBOOST_HASH_NO_EXTENSIONS)
cm_test(NAME functional_test___hash_test_no_ext_hash_function_pointer_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/../hash/test/hash_function_pointer_test.cpp)
target_compile_definitions(functional_test___hash_test_no_ext_hash_function_pointer_test PRIVATE -DBOOST_HASH_NO_EXTENSIONS)
cm_test(NAME functional_test___hash_test_no_ext_hash_float_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/../hash/test/hash_float_test.cpp)
target_compile_definitions(functional_test___hash_test_no_ext_hash_float_test PRIVATE -DBOOST_HASH_NO_EXTENSIONS)
cm_test(NAME functional_test___hash_test_no_ext_hash_long_double_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/../hash/test/hash_long_double_test.cpp)
target_compile_definitions(functional_test___hash_test_no_ext_hash_long_double_test PRIVATE -DBOOST_HASH_NO_EXTENSIONS)
cm_test(NAME functional_test___hash_test_no_ext_hash_string_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/../hash/test/hash_string_test.cpp)
target_compile_definitions(functional_test___hash_test_no_ext_hash_string_test PRIVATE -DBOOST_HASH_NO_EXTENSIONS)
cm_test(NAME functional_test___hash_test_no_ext_link_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/../hash/test/link_test.cpp ${CURRENT_TEST_SOURCES_DIR}/../hash/test/link_test_2.cpp)
target_compile_definitions(functional_test___hash_test_no_ext_link_test PRIVATE -DBOOST_HASH_NO_EXTENSIONS)

#test-suite functional/hash_no_generic_float
cm_test(NAME functional_test___hash_test_hash_float_test_no_generic SOURCES ${CURRENT_TEST_SOURCES_DIR}/../hash/test/hash_float_test.cpp)
target_compile_definitions(functional_test___hash_test_hash_float_test_no_generic PRIVATE -DBOOST_HASH_DETAIL_TEST_WITHOUT_GENERIC)
cm_test(NAME functional_test___hash_test_hash_long_double_test_no_generic SOURCES ${CURRENT_TEST_SOURCES_DIR}/../hash/test/hash_long_double_test.cpp)
target_compile_definitions(functional_test___hash_test_hash_long_double_test_no_generic PRIVATE -DBOOST_HASH_DETAIL_TEST_WITHOUT_GENERIC)

#test-suite functional/overloaded_function
cm_test(NAME functional_test___overloaded_function_test_functor SOURCES ${CURRENT_TEST_SOURCES_DIR}/../overloaded_function/test/functor.cpp)
cm_test(NAME functional_test___overloaded_function_test_make_decl SOURCES ${CURRENT_TEST_SOURCES_DIR}/../overloaded_function/test/make_decl.cpp)
cm_test(NAME functional_test___overloaded_function_test_make_call SOURCES ${CURRENT_TEST_SOURCES_DIR}/../overloaded_function/test/make_call.cpp)

#test-suite functional
cm_test(NAME functional_test_function_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/function_test.cpp)
