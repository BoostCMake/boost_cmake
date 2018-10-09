include(CMTest)

find_package(${CMAKE_WORKSPACE_NAME}_core)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_tti
                        ${CMAKE_WORKSPACE_NAME}::core
                        )


#  (C) Copyright Edward Diener 2011,2012
#  Use, modification and distribution are subject to the Boost Software License,
#  Version 1.0. (See accompanying file LICENSE_1_0.txt or copy at
#  http://www.boost.org/LICENSE_1_0.txt).
#
# Tti testing Jamfile
#


#
# Member functions composite syntax
#
cm_test(NAME ttl_test_test_has_member SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_member.cpp)
cm_test(NAME ttl_test_test_has_member_compile SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_member_compile.cpp COMPILE_ONLY)
cm_test(NAME ttl_test_test_has_member_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_member_fail.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME ttl_test_test_has_member_fail2 SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_member_fail2.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME ttl_test_test_has_member_fail3 SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_member_fail3.cpp COMPILE_ONLY WILL_FAIL)

#
# Member functions composite syntax, cv-qualified
#
cm_test(NAME ttl_test_test_has_member_cv SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_member_cv.cpp)
cm_test(NAME ttl_test_test_has_member_cv_compile SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_member_cv_compile.cpp COMPILE_ONLY)
cm_test(NAME ttl_test_test_has_member_cv_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_member_cv_fail.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME ttl_test_test_has_member_cv_fail2 SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_member_cv_fail2.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME ttl_test_test_has_member_cv_fail3 SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_member_cv_fail3.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME ttl_test_test_has_member_cv_fail4 SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_member_cv_fail4.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME ttl_test_test_has_member_cv_fail5 SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_member_cv_fail5.cpp COMPILE_ONLY WILL_FAIL)

#
# Member data
#
cm_test(NAME ttl_test_test_has_mem_data SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_mem_data.cpp)
cm_test(NAME ttl_test_test_has_mem_data2 SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_mem_data2.cpp)
cm_test(NAME ttl_test_test_has_mem_data_compile SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_mem_data_compile.cpp COMPILE_ONLY)
cm_test(NAME ttl_test_test_has_mem_data_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_mem_data_fail.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME ttl_test_test_has_mem_data_fail2 SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_mem_data_fail2.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME ttl_test_test_has_mem_data_fail3 SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_mem_data_fail3.cpp COMPILE_ONLY WILL_FAIL)

#
# Member functions specific syntax
#
cm_test(NAME ttl_test_test_has_mem_fun SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_mem_fun.cpp)
cm_test(NAME ttl_test_test_has_mem_fun_compile SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_mem_fun_compile.cpp COMPILE_ONLY)
cm_test(NAME ttl_test_test_has_mem_fun_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_mem_fun_fail.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME ttl_test_test_has_mem_fun_fail2 SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_mem_fun_fail2.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME ttl_test_test_has_mem_fun_fail3 SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_mem_fun_fail3.cpp COMPILE_ONLY WILL_FAIL)

#
# Member functions specific syntax, cv-qualified
#
cm_test(NAME ttl_test_test_has_mem_fun_cv SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_mem_fun_cv.cpp)
cm_test(NAME ttl_test_test_has_mem_fun_cv_compile SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_mem_fun_cv_compile.cpp COMPILE_ONLY)
cm_test(NAME ttl_test_test_has_mem_fun_cv_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_mem_fun_cv_fail.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME ttl_test_test_has_mem_fun_cv_fail2 SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_mem_fun_cv_fail2.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME ttl_test_test_has_mem_fun_cv_fail3 SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_mem_fun_cv_fail3.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME ttl_test_test_has_mem_fun_cv_fail4 SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_mem_fun_cv_fail4.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME ttl_test_test_has_mem_fun_cv_fail5 SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_mem_fun_cv_fail5.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME ttl_test_test_has_mem_fun_cv_fail6 SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_mem_fun_cv_fail6.cpp COMPILE_ONLY WILL_FAIL)

#
# Static member functions composite syntax
#
cm_test(NAME ttl_test_test_has_static_member SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_static_member.cpp)
cm_test(NAME ttl_test_test_has_static_member_compile SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_static_member_compile.cpp COMPILE_ONLY)
cm_test(NAME ttl_test_test_has_static_member_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_static_member_fail.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME ttl_test_test_has_static_member_fail2 SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_static_member_fail2.cpp COMPILE_ONLY WILL_FAIL)

#
# Static member data
#
cm_test(NAME ttl_test_test_has_static_mem_data SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_static_mem_data.cpp)
cm_test(NAME ttl_test_test_has_static_mem_data_compile SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_static_mem_data_compile.cpp COMPILE_ONLY)
cm_test(NAME ttl_test_test_has_static_mem_data_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_static_mem_data_fail.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME ttl_test_test_has_static_mem_data_fail2 SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_static_mem_data_fail2.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME ttl_test_test_has_static_mem_data_fail3 SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_static_mem_data_fail3.cpp COMPILE_ONLY WILL_FAIL)

#
# Static member functions
#
cm_test(NAME ttl_test_test_has_static_mem_fun SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_static_mem_fun.cpp)
cm_test(NAME ttl_test_test_has_static_mem_fun_compile SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_static_mem_fun_compile.cpp COMPILE_ONLY)
cm_test(NAME ttl_test_test_has_static_mem_fun_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_static_mem_fun_fail.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME ttl_test_test_has_static_mem_fun_fail2 SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_static_mem_fun_fail2.cpp COMPILE_ONLY WILL_FAIL)

#
# Member or static member data
#
cm_test(NAME ttl_test_test_has_data SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_data.cpp)
cm_test(NAME ttl_test_test_has_data_compile SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_data_compile.cpp COMPILE_ONLY)
cm_test(NAME ttl_test_test_has_data_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_data_fail.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME ttl_test_test_has_data_fail2 SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_data_fail2.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME ttl_test_test_has_data_fail3 SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_data_fail3.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME ttl_test_test_has_data_fail4 SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_data_fail4.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME ttl_test_test_has_data_fail5 SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_data_fail5.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME ttl_test_test_has_data_fail6 SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_data_fail6.cpp COMPILE_ONLY WILL_FAIL)

#
# Member or static member function
#
cm_test(NAME ttl_test_test_has_fun SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_fun.cpp)
cm_test(NAME ttl_test_test_has_fun_compile SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_fun_compile.cpp COMPILE_ONLY)
cm_test(NAME ttl_test_test_has_fun_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_fun_fail.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME ttl_test_test_has_fun_fail2 SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_fun_fail2.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME ttl_test_test_has_fun_fail3 SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_fun_fail3.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME ttl_test_test_has_fun_fail4 SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_fun_fail4.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME ttl_test_test_has_fun_fail5 SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_fun_fail5.cpp COMPILE_ONLY WILL_FAIL)

#
# Templates
#
cm_test(NAME ttl_test_test_has_template SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_template.cpp)
target_compile_definitions(ttl_test_test_has_template PUBLIC BOOST_PP_VARIADICS=0)
cm_test(NAME ttl_test_test_has_template_compile SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_template_compile.cpp COMPILE_ONLY)
target_compile_definitions(ttl_test_test_has_template_compile PUBLIC BOOST_PP_VARIADICS=0)
cm_test(NAME ttl_test_test_has_template_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_template_fail.cpp COMPILE_ONLY WILL_FAIL)
target_compile_definitions(ttl_test_test_has_template_fail PUBLIC BOOST_PP_VARIADICS=0)
cm_test(NAME ttl_test_test_has_template_fail2 SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_template_fail2.cpp COMPILE_ONLY WILL_FAIL)
target_compile_definitions(ttl_test_test_has_template_fail2 PUBLIC BOOST_PP_VARIADICS=0)
cm_test(NAME ttl_test_test_has_template_fail3 SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_template_fail3.cpp COMPILE_ONLY WILL_FAIL)
target_compile_definitions(ttl_test_test_has_template_fail3 PUBLIC BOOST_PP_VARIADICS=0)
cm_test(NAME ttl_test_test_has_template_fail4 SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_template_fail4.cpp COMPILE_ONLY WILL_FAIL)
target_compile_definitions(ttl_test_test_has_template_fail4 PUBLIC BOOST_PP_VARIADICS=0)

#
# Templates, check params
#
cm_test(NAME ttl_test_test_has_template_cp SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_template_cp.cpp)
target_compile_definitions(ttl_test_test_has_template_cp PUBLIC BOOST_PP_VARIADICS=0)
cm_test(NAME ttl_test_test_has_template_cp_compile SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_template_cp_compile.cpp COMPILE_ONLY)
target_compile_definitions(ttl_test_test_has_template_cp_compile PUBLIC BOOST_PP_VARIADICS=0)
cm_test(NAME ttl_test_test_has_template_cp_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_template_cp_fail.cpp COMPILE_ONLY WILL_FAIL)
target_compile_definitions(ttl_test_test_has_template_cp_fail PUBLIC BOOST_PP_VARIADICS=0)
cm_test(NAME ttl_test_test_has_template_cp_fail2 SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_template_cp_fail2.cpp COMPILE_ONLY WILL_FAIL)
target_compile_definitions(ttl_test_test_has_template_cp_fail2 PUBLIC BOOST_PP_VARIADICS=0)
cm_test(NAME ttl_test_test_has_template_cp_fail3 SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_template_cp_fail3.cpp COMPILE_ONLY WILL_FAIL)
target_compile_definitions(ttl_test_test_has_template_cp_fail3 PUBLIC BOOST_PP_VARIADICS=0)
cm_test(NAME ttl_test_test_has_template_cp_fail4 SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_template_cp_fail4.cpp COMPILE_ONLY WILL_FAIL)
target_compile_definitions(ttl_test_test_has_template_cp_fail4 PUBLIC BOOST_PP_VARIADICS=0)

#
# Type
#
cm_test(NAME ttl_test_test_has_type SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_type.cpp)
cm_test(NAME ttl_test_test_has_type_compile SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_type_compile.cpp COMPILE_ONLY)
cm_test(NAME ttl_test_test_has_type_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_type_fail.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME ttl_test_test_has_type_fail2 SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_type_fail2.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME ttl_test_test_has_type_fail3 SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_type_fail3.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME ttl_test_test_has_type_ct SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_type_ct.cpp)
cm_test(NAME ttl_test_test_has_type_ct_compile SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_type_ct_compile.cpp COMPILE_ONLY)
cm_test(NAME ttl_test_test_has_type_ct_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_type_ct_fail.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME ttl_test_test_has_type_ct_fail2 SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_type_ct_fail2.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME ttl_test_test_has_type_ct_fail3 SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_type_ct_fail3.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME ttl_test_test_has_type_ct_fail4 SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_type_ct_fail4.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME ttl_test_test_has_type_ct_fail5 SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_type_ct_fail5.cpp COMPILE_ONLY WILL_FAIL)

#
# Nested type
#
cm_test(NAME ttl_test_test_mem_type SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_mem_type.cpp)
cm_test(NAME ttl_test_test_mem_type_compile SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_mem_type_compile.cpp COMPILE_ONLY)
#
# All of tti, non-variadic macros
#


#
# Templates, variadic macro
#
cm_test(NAME ttl_test_test_has_template_v SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_template.cpp)
target_compile_definitions(ttl_test_test_has_template_v PUBLIC BOOST_PP_VARIADICS=1)
cm_test(NAME ttl_test_test_has_template_compile_v SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_template_compile.cpp COMPILE_ONLY)
target_compile_definitions(ttl_test_test_has_template_compile_v PUBLIC BOOST_PP_VARIADICS=1)
cm_test(NAME ttl_test_test_has_template_fail_v SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_template_fail.cpp COMPILE_ONLY WILL_FAIL)
target_compile_definitions(ttl_test_test_has_template_fail_v PUBLIC BOOST_PP_VARIADICS=1)
cm_test(NAME ttl_test_test_has_template_fail2_v SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_template_fail2.cpp COMPILE_ONLY WILL_FAIL)
target_compile_definitions(ttl_test_test_has_template_fail2_v PUBLIC BOOST_PP_VARIADICS=1)
cm_test(NAME ttl_test_test_has_template_fail3_v SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_template_fail3.cpp COMPILE_ONLY WILL_FAIL)
target_compile_definitions(ttl_test_test_has_template_fail3_v PUBLIC BOOST_PP_VARIADICS=1)
cm_test(NAME ttl_test_test_has_template_fail4_v SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_template_fail4.cpp COMPILE_ONLY WILL_FAIL)
target_compile_definitions(ttl_test_test_has_template_fail4_v PUBLIC BOOST_PP_VARIADICS=1)


#
# Templates, variadic macro, check params, non-variadic syntax
#
cm_test(NAME ttl_test_test_has_template_cp_v SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_template_cp.cpp)
target_compile_definitions(ttl_test_test_has_template_cp_v PUBLIC BOOST_PP_VARIADICS=1)
cm_test(NAME ttl_test_test_has_template_cp_compile_v SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_template_cp_compile.cpp COMPILE_ONLY)
target_compile_definitions(ttl_test_test_has_template_cp_compile_v PUBLIC BOOST_PP_VARIADICS=1)
cm_test(NAME ttl_test_test_has_template_cp_fail_v SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_template_cp_fail.cpp COMPILE_ONLY WILL_FAIL)
target_compile_definitions(ttl_test_test_has_template_cp_fail_v PUBLIC BOOST_PP_VARIADICS=1)
cm_test(NAME ttl_test_test_has_template_cp_fail2_v SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_template_cp_fail2.cpp COMPILE_ONLY WILL_FAIL)
target_compile_definitions(ttl_test_test_has_template_cp_fail2_v PUBLIC BOOST_PP_VARIADICS=1)
cm_test(NAME ttl_test_test_has_template_cp_fail3_v SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_template_cp_fail3.cpp COMPILE_ONLY WILL_FAIL)
target_compile_definitions(ttl_test_test_has_template_cp_fail3_v PUBLIC BOOST_PP_VARIADICS=1)
cm_test(NAME ttl_test_test_has_template_cp_fail4_v SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_has_template_cp_fail4.cpp COMPILE_ONLY WILL_FAIL)
target_compile_definitions(ttl_test_test_has_template_cp_fail4_v PUBLIC BOOST_PP_VARIADICS=1)


#
# Templates, variadic macro, check params, variadic syntax
#
cm_test(NAME ttl_test_test_vm_has_template_cp SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_vm_has_template_cp.cpp)
target_compile_definitions(ttl_test_test_vm_has_template_cp PUBLIC BOOST_PP_VARIADICS=1)
cm_test(NAME ttl_test_test_vm_has_template_cp_compile SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_vm_has_template_cp_compile.cpp COMPILE_ONLY)
target_compile_definitions(ttl_test_test_vm_has_template_cp_compile PUBLIC BOOST_PP_VARIADICS=1)
cm_test(NAME ttl_test_test_vm_has_template_cp_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_vm_has_template_cp_fail.cpp COMPILE_ONLY WILL_FAIL)
target_compile_definitions(ttl_test_test_vm_has_template_cp_fail PUBLIC BOOST_PP_VARIADICS=1)
cm_test(NAME ttl_test_test_vm_has_template_cp_fail2 SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_vm_has_template_cp_fail2.cpp COMPILE_ONLY WILL_FAIL)
target_compile_definitions(ttl_test_test_vm_has_template_cp_fail2 PUBLIC BOOST_PP_VARIADICS=1)
cm_test(NAME ttl_test_test_vm_has_template_cp_fail3 SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_vm_has_template_cp_fail3.cpp COMPILE_ONLY WILL_FAIL)
target_compile_definitions(ttl_test_test_vm_has_template_cp_fail3 PUBLIC BOOST_PP_VARIADICS=1)
cm_test(NAME ttl_test_test_vm_has_template_cp_fail4 SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_vm_has_template_cp_fail4.cpp COMPILE_ONLY WILL_FAIL)
target_compile_definitions(ttl_test_test_vm_has_template_cp_fail4 PUBLIC BOOST_PP_VARIADICS=1)

#
# Templates, non-variadic macro
#

#
# Templates, variadic macro
#

#
# All templates
#

#
# All tests
#

