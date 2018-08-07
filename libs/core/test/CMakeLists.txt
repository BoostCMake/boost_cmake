include(CMTest)

find_package(${CMAKE_WORKSPACE_NAME}_static_assert)
find_package(${CMAKE_WORKSPACE_NAME}_type_traits)
find_package(${CMAKE_WORKSPACE_NAME}_mpl)
find_package(${CMAKE_WORKSPACE_NAME}_typeof)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_core
                        boost::static_assert
                        boost::type_traits
                        boost::mpl
                        boost::typeof
                        )

include(CMProperties)

find_package(${CMAKE_WORKSPACE_NAME}_static_assert)

cm_test(NAME core_test_addressof_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/addressof_test.cpp)
cm_test(NAME core_test_addressof_test2 SOURCES ${CURRENT_TEST_SOURCES_DIR}/addressof_test2.cpp)
cm_test(NAME core_test_addressof_np_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/addressof_np_test.cpp)
cm_test(NAME core_test_addressof_fn_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/addressof_fn_test.cpp)
# cm_test(NAME core_test_addressof_constexpr_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/addressof_constexpr_test.cpp COMPILE_ONLY)
# cm_test(NAME core_test_addressof_fail_rvalue SOURCES ${CURRENT_TEST_SOURCES_DIR}/addressof_fail_rvalue.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME core_test_checked_delete_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/checked_delete_test.cpp)
cm_test(NAME core_test_checked_delete_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/checked_delete_fail.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME core_test_checked_delete_fail2 SOURCES ${CURRENT_TEST_SOURCES_DIR}/checked_delete_fail2.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME core_test_ref_ct_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/ref_ct_test.cpp COMPILE_ONLY)
cm_test(NAME core_test_ref_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/ref_test.cpp)
cm_test(NAME core_test_ref_ref_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/ref_ref_test.cpp)
cm_test(NAME core_test_ref_fn_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/ref_fn_test.cpp)
cm_test(NAME core_test_ref_rv_fail1 SOURCES ${CURRENT_TEST_SOURCES_DIR}/ref_rv_fail1.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME core_test_ref_rv_fail2 SOURCES ${CURRENT_TEST_SOURCES_DIR}/ref_rv_fail2.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME core_test_ref_rv_fail3 SOURCES ${CURRENT_TEST_SOURCES_DIR}/ref_rv_fail3.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME core_test_ref_rv_fail4 SOURCES ${CURRENT_TEST_SOURCES_DIR}/ref_rv_fail4.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME core_test_ref_rv_fail5 SOURCES ${CURRENT_TEST_SOURCES_DIR}/ref_rv_fail5.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME core_test_ref_implicit_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/ref_implicit_fail.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME core_test_ref_implicit_fail2 SOURCES ${CURRENT_TEST_SOURCES_DIR}/ref_implicit_fail2.cpp COMPILE_ONLY WILL_FAIL)
# cm_test(NAME core_test_ref_cv_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/ref_cv_test.cpp)

cm_test(NAME core_test_eif_constructors SOURCES ${CURRENT_TEST_SOURCES_DIR}/eif_constructors.cpp)
cm_test(NAME core_test_eif_dummy_arg_disambiguation SOURCES ${CURRENT_TEST_SOURCES_DIR}/eif_dummy_arg_disambiguation.cpp)
cm_test(NAME core_test_eif_lazy SOURCES ${CURRENT_TEST_SOURCES_DIR}/eif_lazy.cpp)
cm_test(NAME core_test_eif_lazy_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/eif_lazy_test.cpp)
cm_test(NAME core_test_eif_member_templates SOURCES ${CURRENT_TEST_SOURCES_DIR}/eif_member_templates.cpp)
cm_test(NAME core_test_eif_namespace_disambiguation SOURCES ${CURRENT_TEST_SOURCES_DIR}/eif_namespace_disambiguation.cpp)
cm_test(NAME core_test_eif_no_disambiguation SOURCES ${CURRENT_TEST_SOURCES_DIR}/eif_no_disambiguation.cpp)
cm_test(NAME core_test_eif_partial_specializations SOURCES ${CURRENT_TEST_SOURCES_DIR}/eif_partial_specializations.cpp)

cm_test(NAME core_test_noncopyable_compile_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/noncopyable_compile_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME core_test_explicit_operator_bool SOURCES ${CURRENT_TEST_SOURCES_DIR}/explicit_operator_bool.cpp)
cm_test(NAME core_test_explicit_operator_bool_noexcept SOURCES ${CURRENT_TEST_SOURCES_DIR}/explicit_operator_bool_noexcept.cpp)
cm_test(NAME core_test_explicit_operator_bool_compile_fail_conv_int SOURCES ${CURRENT_TEST_SOURCES_DIR}/explicit_operator_bool_compile_fail_conv_int.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME core_test_explicit_operator_bool_compile_fail_conv_pvoid SOURCES ${CURRENT_TEST_SOURCES_DIR}/explicit_operator_bool_compile_fail_conv_pvoid.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME core_test_explicit_operator_bool_compile_fail_delete SOURCES ${CURRENT_TEST_SOURCES_DIR}/explicit_operator_bool_compile_fail_delete.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME core_test_explicit_operator_bool_compile_fail_shift SOURCES ${CURRENT_TEST_SOURCES_DIR}/explicit_operator_bool_compile_fail_shift.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME core_test_ignore_unused_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/ignore_unused_test.cpp COMPILE_ONLY)
if(MSVC)
    target_compile_options(core_test_ignore_unused_test PUBLIC /we4100 /we4101)
elseif(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
    target_compile_options(core_test_ignore_unused_test PUBLIC -Wunused-variable -Werror)
    if(CMAKE_CXX_COMPILER_VERSION VERSION_EQUAL "4.8")
        target_compile_options(core_test_ignore_unused_test PUBLIC -Wunused-local-typedefs)
    endif()
endif()
cm_test(NAME core_test_sp_typeinfo_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/sp_typeinfo_test.cpp)
cm_test(NAME core_test_sp_typeinfo_test_no_rtti SOURCES ${CURRENT_TEST_SOURCES_DIR}/sp_typeinfo_test.cpp)
set_target_properties(core_test_sp_typeinfo_test_no_rtti PROPERTIES CXX_RTTI Off)

cm_test(NAME core_test_visit_each_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/visit_each_test.cpp)

cm_test(NAME core_test_get_pointer_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/get_pointer_test.cpp)

cm_test(NAME core_test_lightweight_test_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/lightweight_test_test.cpp)
cm_test(NAME core_test_lightweight_test_test_no_except SOURCES ${CURRENT_TEST_SOURCES_DIR}/lightweight_test_test.cpp)
set_target_properties(core_test_lightweight_test_test_no_except PROPERTIES CXX_EXCEPTIONS Off)

cm_test(NAME core_test_lightweight_test_test2 SOURCES ${CURRENT_TEST_SOURCES_DIR}/lightweight_test_test2.cpp)
# cm_test(NAME core_test_lightweight_test_all_eq_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/lightweight_test_all_eq_test.cpp)
# cm_test(NAME core_test_lightweight_test_all_with_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/lightweight_test_all_with_test.cpp)
# cm_test(NAME core_test_lightweight_test_all_with_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/lightweight_test_all_with_fail.cpp)
# cm_test(NAME core_test_lightweight_test_lt_le_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/lightweight_test_lt_le_test.cpp)

# cm_test(NAME core_test_lightweight_test_eq_nullptr SOURCES ${CURRENT_TEST_SOURCES_DIR}/lightweight_test_eq_nullptr.cpp)

cm_test(NAME core_test_lightweight_test_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/lightweight_test_fail.cpp WILL_FAIL)
cm_test(NAME core_test_lightweight_test_fail2 SOURCES ${CURRENT_TEST_SOURCES_DIR}/lightweight_test_fail2.cpp WILL_FAIL)
cm_test(NAME core_test_lightweight_test_fail3 SOURCES ${CURRENT_TEST_SOURCES_DIR}/lightweight_test_fail3.cpp WILL_FAIL)
cm_test(NAME core_test_lightweight_test_fail4 SOURCES ${CURRENT_TEST_SOURCES_DIR}/lightweight_test_fail4.cpp WILL_FAIL)
cm_test(NAME core_test_lightweight_test_fail5 SOURCES ${CURRENT_TEST_SOURCES_DIR}/lightweight_test_fail5.cpp WILL_FAIL)
cm_test(NAME core_test_lightweight_test_fail6 SOURCES ${CURRENT_TEST_SOURCES_DIR}/lightweight_test_fail6.cpp WILL_FAIL)
set_target_properties(core_test_lightweight_test_fail6 PROPERTIES CXX_EXCEPTIONS On)
cm_test(NAME core_test_lightweight_test_fail7 SOURCES ${CURRENT_TEST_SOURCES_DIR}/lightweight_test_fail7.cpp WILL_FAIL)
cm_test(NAME core_test_lightweight_test_fail7_no_rtti SOURCES ${CURRENT_TEST_SOURCES_DIR}/lightweight_test_fail7.cpp WILL_FAIL)
set_target_properties(core_test_lightweight_test_fail7_no_rtti PROPERTIES CXX_RTTI Off)
set_target_properties(core_test_lightweight_test_fail7_no_rtti PROPERTIES CXX_EXCEPTIONS On)

cm_test(NAME core_test_lightweight_test_fail8 SOURCES ${CURRENT_TEST_SOURCES_DIR}/lightweight_test_fail8.cpp WILL_FAIL)
cm_test(NAME core_test_lightweight_test_fail8_no_rtti SOURCES ${CURRENT_TEST_SOURCES_DIR}/lightweight_test_fail8.cpp WILL_FAIL)
set_target_properties(core_test_lightweight_test_fail8_no_rtti PROPERTIES CXX_RTTI Off)

# cm_test(NAME core_test_lightweight_test_fail9 SOURCES ${CURRENT_TEST_SOURCES_DIR}/lightweight_test_fail9.cpp WILL_FAIL)
# cm_test(NAME core_test_lightweight_test_fail10 SOURCES ${CURRENT_TEST_SOURCES_DIR}/lightweight_test_fail10.cpp WILL_FAIL)
# cm_test(NAME core_test_lightweight_test_lt_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/lightweight_test_lt_fail.cpp WILL_FAIL)
# cm_test(NAME core_test_lightweight_test_le_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/lightweight_test_le_fail.cpp WILL_FAIL)

cm_test(NAME core_test_is_same_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/is_same_test.cpp)

cm_test(NAME core_test_typeinfo_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/typeinfo_test.cpp)
cm_test(NAME core_test_typeinfo_test_no_rtti SOURCES ${CURRENT_TEST_SOURCES_DIR}/typeinfo_test.cpp)
set_target_properties(core_test_typeinfo_test_no_rtti PROPERTIES CXX_RTTI Off)

cm_test(NAME core_test_iterator_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/iterator_test.cpp)
cm_test(NAME core_test_detail_iterator_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/detail_iterator_test.cpp)

cm_test(NAME core_test_demangle_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/demangle_test.cpp)
set_target_properties(core_test_demangle_test PROPERTIES CXX_RTTI On)

cm_test(NAME core_test_demangled_name_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/demangled_name_test.cpp)
cm_test(NAME core_test_demangled_name_test_no_rtti SOURCES ${CURRENT_TEST_SOURCES_DIR}/demangled_name_test.cpp)
set_target_properties(core_test_demangled_name_test_no_rtti PROPERTIES CXX_RTTI Off)
target_compile_definitions(core_test_demangled_name_test_no_rtti PUBLIC BOOST_NO_RTTI BOOST_NO_TYPEID)

cm_test(NAME core_test_scoped_enum SOURCES ${CURRENT_TEST_SOURCES_DIR}/scoped_enum.cpp)
cm_test(NAME core_test_scoped_enum_compile_fail_conv_from_int SOURCES ${CURRENT_TEST_SOURCES_DIR}/scoped_enum_compile_fail_conv_from_int.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME core_test_scoped_enum_compile_fail_conv_to_int SOURCES ${CURRENT_TEST_SOURCES_DIR}/scoped_enum_compile_fail_conv_to_int.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME core_test_underlying_type SOURCES ${CURRENT_TEST_SOURCES_DIR}/underlying_type.cpp)

# cm_test(NAME core_test_pointer_traits_to_address_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/pointer_traits_to_address_test.cpp)
# cm_test(NAME core_test_pointer_traits_pointer_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/pointer_traits_pointer_test.cpp)
# cm_test(NAME core_test_pointer_traits_element_type_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/pointer_traits_element_type_test.cpp)
# cm_test(NAME core_test_pointer_traits_difference_type_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/pointer_traits_difference_type_test.cpp)
# cm_test(NAME core_test_pointer_traits_rebind_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/pointer_traits_rebind_test.cpp)
# cm_test(NAME core_test_pointer_traits_pointer_to_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/pointer_traits_pointer_to_test.cpp)

