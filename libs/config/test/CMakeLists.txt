include(CMTest)

find_package(${CMAKE_WORKSPACE_NAME}_tr1)
find_package(${CMAKE_WORKSPACE_NAME}_core)
find_package(${CMAKE_WORKSPACE_NAME}_type_traits)
find_package(${CMAKE_WORKSPACE_NAME}_detail)
find_package(${CMAKE_WORKSPACE_NAME}_test)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_config
                        ${CMAKE_WORKSPACE_NAME}::tr1
                        ${CMAKE_WORKSPACE_NAME}::core
                        ${CMAKE_WORKSPACE_NAME}::type_traits
                        ${CMAKE_WORKSPACE_NAME}::detail
                        ${CMAKE_WORKSPACE_NAME}::test
                        )


include(CMProperties)

find_package(Threads REQUIRED)
add_library(config_threads INTERFACE)
target_link_libraries(config_threads INTERFACE "${CMAKE_THREAD_LIBS_INIT}")
set(LIBS_TO_CHECK atomic rt)
foreach(lib ${LIBS_TO_CHECK})
    find_library(FIND_LIB${lib} ${lib})
    string(TOUPPER ${lib} FIND_LIB)
    set(HAS_${FIND_LIB}_LIB 0)
    if(FIND_LIB${lib})
        target_link_libraries(config_threads INTERFACE "${FIND_LIB${lib}}")
        set(HAS_${FIND_LIB}_LIB 1)
    endif()
endforeach()
include_directories(${CURRENT_TEST_SOURCES_DIR})

include(TestGen.cmake)

set(SKIP_TESTS
    ${CMAKE_WORKSPACE_NAME}_has_clock_gettime.ipp
    ${CMAKE_WORKSPACE_NAME}_has_macro_use_facet.ipp
    ${CMAKE_WORKSPACE_NAME}_has_nl_types_h.ipp
    ${CMAKE_WORKSPACE_NAME}_no_char16_t.ipp
    ${CMAKE_WORKSPACE_NAME}_no_char32_t.ipp
    ${CMAKE_WORKSPACE_NAME}_no_com_value_init.ipp
    ${CMAKE_WORKSPACE_NAME}_no_cxx11_addressof.ipp
    ${CMAKE_WORKSPACE_NAME}_no_cxx11_hdr_atomic.ipp
    ${CMAKE_WORKSPACE_NAME}_no_cxx11_hdr_chrono.ipp
    ${CMAKE_WORKSPACE_NAME}_no_cxx11_hdr_codecvt.ipp
    ${CMAKE_WORKSPACE_NAME}_no_cxx11_hdr_condition_variable.ipp
    ${CMAKE_WORKSPACE_NAME}_no_cxx11_hdr_mutex.ipp
    ${CMAKE_WORKSPACE_NAME}_no_cxx11_hdr_random.ipp
    ${CMAKE_WORKSPACE_NAME}_no_cxx11_hdr_ratio.ipp
    ${CMAKE_WORKSPACE_NAME}_no_cxx11_hdr_regex.ipp
    ${CMAKE_WORKSPACE_NAME}_no_cxx11_hdr_system_error.ipp
    ${CMAKE_WORKSPACE_NAME}_no_cxx11_hdr_thread.ipp
    ${CMAKE_WORKSPACE_NAME}_no_cxx11_hdr_tuple.ipp
    ${CMAKE_WORKSPACE_NAME}_no_cxx11_hdr_typeindex.ipp
    ${CMAKE_WORKSPACE_NAME}_no_cxx11_hdr_unordered_map.ipp
    ${CMAKE_WORKSPACE_NAME}_no_cxx11_hdr_unordered_set.ipp
    ${CMAKE_WORKSPACE_NAME}_no_cxx11_inline_namespaces.ipp
    ${CMAKE_WORKSPACE_NAME}_no_cxx11_numeric_limits.ipp
    ${CMAKE_WORKSPACE_NAME}_no_cxx11_smart_ptr.ipp
    ${CMAKE_WORKSPACE_NAME}_no_cxx11_std_align.ipp
    ${CMAKE_WORKSPACE_NAME}_no_cxx11_trailing_result_types.ipp
    ${CMAKE_WORKSPACE_NAME}_no_cxx14_binary_literals.ipp
    ${CMAKE_WORKSPACE_NAME}_no_cxx14_digit_separator.ipp
    ${CMAKE_WORKSPACE_NAME}_no_decltype.ipp
    ${CMAKE_WORKSPACE_NAME}_no_decltype_n3276.ipp
    ${CMAKE_WORKSPACE_NAME}_no_ded_typename.ipp
    ${CMAKE_WORKSPACE_NAME}_no_nullptr.ipp
    ${CMAKE_WORKSPACE_NAME}_no_sfinae_expr.ipp
    ${CMAKE_WORKSPACE_NAME}_no_two_phase_lookup.ipp
    )

file(GLOB TESTS ${CURRENT_TEST_SOURCES_DIR}/*.ipp)
foreach(TEST ${TESTS})
    get_filename_component(TEST_NAME ${TEST} NAME)
    if(NOT ${TEST_NAME} IN_LIST SKIP_TESTS)
        parse_test(${TEST} config_test)
    endif()
endforeach()


cm_test(NAME config_test_config_test_c SOURCES ${CURRENT_TEST_SOURCES_DIR}/config_test_c.c COMPILE_ONLY)

if (NOT (CMAKE_CXX_COMPILER_ID MATCHES "Clang")) # TODO: fix test. Reason error: boost_has_nl_types_h.ipp:20:11: error: ordered comparison between pointer and zero ('nl_catd' (aka 'void *') and 'int') 
    if ((HAS_RT_LIB) AND (HAS_PTHREAD_LIB) AND (HAS_ATOMIC_LIB))    
        cm_test(NAME config_test_config_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/config_test.cpp)
            
        cm_test(NAME config_test_config_test_no_rtti SOURCES ${CURRENT_TEST_SOURCES_DIR}/config_test.cpp)
        set_target_properties(config_test_config_test_no_rtti PROPERTIES CXX_RTTI Off)
        
        cm_test(NAME config_test_config_test_no_exceptions SOURCES ${CURRENT_TEST_SOURCES_DIR}/config_test.cpp)
        set_target_properties(config_test_config_test_no_exceptions PROPERTIES CXX_EXCEPTIONS Off)
        
        foreach(CONFIG_TEST config_test_config_test config_test_config_test_no_rtti config_test_config_test_no_exceptions)
            target_link_libraries(${CONFIG_TEST} config_threads)
        endforeach()
    
    endif()
endif()

cm_test(NAME config_test_config_info SOURCES ${CURRENT_TEST_SOURCES_DIR}/config_info.cpp)

if (NOT (CMAKE_CXX_COMPILER_ID MATCHES "Clang")) # TODO: fix test. Reason error: boost_has_nl_types_h.ipp:20:11: error: ordered comparison between pointer and zero ('nl_catd' (aka 'void *') and 'int') 
    cm_test(NAME config_test_config_info_no_rtti SOURCES ${CURRENT_TEST_SOURCES_DIR}/config_test.cpp)
    set_target_properties(config_test_config_info_no_rtti PROPERTIES CXX_RTTI Off)
    
    cm_test(NAME config_test_config_info_no_exceptions SOURCES ${CURRENT_TEST_SOURCES_DIR}/config_test.cpp)
    set_target_properties(config_test_config_info_no_exceptions PROPERTIES CXX_EXCEPTIONS Off)
    target_link_libraries(${CONFIG_TEST} config_threads)

    foreach(CONFIG_TEST config_test_config_info config_test_config_info_no_rtti config_test_config_info_no_exceptions)
        target_link_libraries(${CONFIG_TEST} config_threads)
    endforeach()
else()
    target_link_libraries(config_test_config_info config_threads)
endif()



cm_test(NAME config_test_math_info SOURCES ${CURRENT_TEST_SOURCES_DIR}/math_info.cpp)

add_library(config_test_link_test_lib SHARED ${CURRENT_TEST_SOURCES_DIR}/link/link_test.cpp)
target_compile_definitions(config_test_link_test_lib PRIVATE -DBOOST_DYN_LINK=1)
target_include_directories(config_test_link_test_lib PRIVATE ${CURRENT_TEST_SOURCES_DIR}/../include)

cm_test(NAME config_test_link_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/link/main.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
target_compile_definitions(config_test_link_test PRIVATE -DBOOST_CONFIG_NO_LIB=1)
target_link_libraries(config_test_link_test config_test_link_test_lib)

cm_test(NAME config_test_test_thread_fail1 SOURCES ${CURRENT_TEST_SOURCES_DIR}/threads/test_thread_fail1.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME config_test_test_thread_fail2 SOURCES ${CURRENT_TEST_SOURCES_DIR}/threads/test_thread_fail2.cpp COMPILE_ONLY WILL_FAIL)

include(CheckCXXCompilerFlag)
set(IMPLICIT_FALLTHROUGH_FLAG -std=c++11 -Wimplicit-fallthrough -Wall -Werror)
check_cxx_compiler_flag("${IMPLICIT_FALLTHROUGH_FLAG}" HAS_IMPLICIT_FALLTHROUGH)
cm_test(NAME config_test_boost_fallthrough_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/boost_fallthrough_test.cpp COMPILE_ONLY)
if(HAS_IMPLICIT_FALLTHROUGH)
    target_compile_options(config_test_boost_fallthrough_test PUBLIC ${IMPLICIT_FALLTHROUGH_FLAG})
endif(HAS_IMPLICIT_FALLTHROUGH)

cm_test(NAME config_test_helper_macro_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/helper_macro_test.cpp COMPILE_ONLY)

cm_test(NAME config_test_cstdint_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/cstdint_test.cpp COMPILE_ONLY)
cm_test(NAME config_test_cstdint_test2 SOURCES ${CURRENT_TEST_SOURCES_DIR}/cstdint_test2.cpp COMPILE_ONLY)

cm_test(NAME config_test_cstdint_include_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/cstdint_include_test.cpp COMPILE_ONLY)
cm_test(NAME config_test_config_build_check SOURCES ${CURRENT_TEST_SOURCES_DIR}/config_build_check.cpp COMPILE_ONLY)

# all

cm_test(NAME config_test_limits_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/limits_test.cpp )
cm_test(NAME config_test_abi_abi_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/abi/abi_test.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/abi/main.cpp)

cm_test(NAME config_test_has_2arg_use_facet_pass SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_2arg_use_facet_pass.cpp )
cm_test(NAME config_test_has_2arg_use_facet_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_2arg_use_facet_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_has_bethreads_pass SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_bethreads_pass.cpp )
cm_test(NAME config_test_has_bethreads_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_bethreads_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_has_clock_gettime_pass SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_clock_gettime_pass.cpp )
cm_test(NAME config_test_has_clock_gettime_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_clock_gettime_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_has_dirent_h_pass SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_dirent_h_pass.cpp )
cm_test(NAME config_test_has_dirent_h_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_dirent_h_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_has_expm1_pass SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_expm1_pass.cpp )
cm_test(NAME config_test_has_expm1_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_expm1_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_has_float128_pass SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_float128_pass.cpp )
cm_test(NAME config_test_has_float128_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_float128_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_has_ftime_pass SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_ftime_pass.cpp )
cm_test(NAME config_test_has_ftime_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_ftime_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_has_getsystemtimeasfiletime_pass SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_getsystemtimeasfiletime_pass.cpp )
cm_test(NAME config_test_has_getsystemtimeasfiletime_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_getsystemtimeasfiletime_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_has_gettimeofday_pass SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_gettimeofday_pass.cpp )
cm_test(NAME config_test_has_gettimeofday_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_gettimeofday_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_has_hash_pass SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_hash_pass.cpp )
cm_test(NAME config_test_has_hash_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_hash_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_has_int128_pass SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_int128_pass.cpp )
cm_test(NAME config_test_has_int128_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_int128_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_has_log1p_pass SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_log1p_pass.cpp )
cm_test(NAME config_test_has_log1p_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_log1p_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_has_long_long_pass SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_long_long_pass.cpp )
cm_test(NAME config_test_has_long_long_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_long_long_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_has_macro_use_facet_pass SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_macro_use_facet_pass.cpp )
cm_test(NAME config_test_has_macro_use_facet_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_macro_use_facet_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_has_ms_int64_pass SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_ms_int64_pass.cpp )
cm_test(NAME config_test_has_ms_int64_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_ms_int64_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_has_nanosleep_pass SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_nanosleep_pass.cpp )
cm_test(NAME config_test_has_nanosleep_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_nanosleep_fail.cpp COMPILE_ONLY WILL_FAIL)

if (NOT (CMAKE_CXX_COMPILER_ID MATCHES "Clang")) # TODO: fix test. Reason error: boost_has_nl_types_h.ipp:20:11: error: ordered comparison between pointer and zero ('nl_catd' (aka 'void *') and 'int') 
    cm_test(NAME config_test_has_nl_types_h_pass SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_nl_types_h_pass.cpp )
endif()
cm_test(NAME config_test_has_nl_types_h_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_nl_types_h_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_has_nrvo_pass SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_nrvo_pass.cpp )
cm_test(NAME config_test_has_nrvo_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_nrvo_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_has_part_alloc_pass SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_part_alloc_pass.cpp )
cm_test(NAME config_test_has_part_alloc_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_part_alloc_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_has_pthread_delay_np_pass SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_pthread_delay_np_pass.cpp )
cm_test(NAME config_test_has_pthread_delay_np_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_pthread_delay_np_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_has_pthread_ma_st_pass SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_pthread_ma_st_pass.cpp )
target_link_libraries(config_test_has_pthread_ma_st_pass Threads::Threads)

cm_test(NAME config_test_has_pthread_ma_st_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_pthread_ma_st_fail COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_has_pthread_yield_pass SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_pthread_yield_pass.cpp )
target_link_libraries(config_test_has_pthread_yield_pass Threads::Threads)

cm_test(NAME config_test_has_pthread_yield_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_pthread_yield_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_has_pthreads_pass SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_pthreads_pass.cpp )
target_link_libraries(config_test_has_pthreads_pass Threads::Threads)

cm_test(NAME config_test_has_pthreads_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_pthreads_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_has_rvalue_refs_pass SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_rvalue_refs_pass.cpp )
cm_test(NAME config_test_has_rvalue_refs_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_rvalue_refs_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_has_sched_yield_pass SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_sched_yield_pass.cpp )
cm_test(NAME config_test_has_sched_yield_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_sched_yield_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_has_sgi_type_traits_pass SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_sgi_type_traits_pass.cpp )
cm_test(NAME config_test_has_sgi_type_traits_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_sgi_type_traits_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_has_sigaction_pass SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_sigaction_pass.cpp )
cm_test(NAME config_test_has_sigaction_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_sigaction_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_has_slist_pass SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_slist_pass.cpp )
cm_test(NAME config_test_has_slist_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_slist_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_has_static_assert_pass SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_static_assert_pass.cpp )
cm_test(NAME config_test_has_static_assert_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_static_assert_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_has_stdint_h_pass SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_stdint_h_pass.cpp )
cm_test(NAME config_test_has_stdint_h_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_stdint_h_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_has_stlp_use_facet_pass SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_stlp_use_facet_pass.cpp )
cm_test(NAME config_test_has_stlp_use_facet_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_stlp_use_facet_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_has_tr1_array_pass SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_tr1_array_pass.cpp )
cm_test(NAME config_test_has_tr1_array_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_tr1_array_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_has_tr1_bind_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_tr1_bind_pass.cpp)
cm_test(NAME config_test_has_tr1_bind_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_tr1_bind_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_has_tr1_complex_over_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_tr1_complex_over_pass.cpp)
cm_test(NAME config_test_has_tr1_complex_over_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_tr1_complex_over_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_has_tr1_complex_trig_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_tr1_complex_trig_pass.cpp)
cm_test(NAME config_test_has_tr1_complex_trig_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_tr1_complex_trig_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_has_tr1_function_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_tr1_function_pass.cpp)
cm_test(NAME config_test_has_tr1_function_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_tr1_function_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_has_tr1_hash_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_tr1_hash_pass.cpp)
cm_test(NAME config_test_has_tr1_hash_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_tr1_hash_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_has_tr1_mem_fn_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_tr1_mem_fn_pass.cpp)
cm_test(NAME config_test_has_tr1_mem_fn_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_tr1_mem_fn_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_has_tr1_random_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_tr1_random_pass.cpp)
cm_test(NAME config_test_has_tr1_random_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_tr1_random_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_has_tr1_ref_wrap_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_tr1_ref_wrap_pass.cpp)
cm_test(NAME config_test_has_tr1_ref_wrap_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_tr1_ref_wrap_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_has_tr1_regex_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_tr1_regex_pass.cpp)
cm_test(NAME config_test_has_tr1_regex_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_tr1_regex_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_has_tr1_result_of_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_tr1_result_of_pass.cpp)
cm_test(NAME config_test_has_tr1_result_of_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_tr1_result_of_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_has_tr1_shared_ptr_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_tr1_shared_ptr_pass.cpp)
cm_test(NAME config_test_has_tr1_shared_ptr_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_tr1_shared_ptr_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_has_tr1_tuple_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_tr1_tuple_pass.cpp)
cm_test(NAME config_test_has_tr1_tuple_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_tr1_tuple_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_has_tr1_type_traits_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_tr1_type_traits_pass.cpp)
cm_test(NAME config_test_has_tr1_type_traits_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_tr1_type_traits_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_has_tr1_unordered_map_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_tr1_unordered_map_pass.cpp)
cm_test(NAME config_test_has_tr1_unordered_map_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_tr1_unordered_map_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_has_tr1_unordered_set_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_tr1_unordered_set_pass.cpp)
cm_test(NAME config_test_has_tr1_unordered_set_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_tr1_unordered_set_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_has_tr1_utility_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_tr1_utility_pass.cpp)
cm_test(NAME config_test_has_tr1_utility_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_tr1_utility_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_has_unistd_h_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_unistd_h_pass.cpp)
cm_test(NAME config_test_has_unistd_h_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_unistd_h_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_has_variadic_tmpl_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_variadic_tmpl_pass.cpp)
cm_test(NAME config_test_has_variadic_tmpl_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_variadic_tmpl_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_has_vc6_mem_templ_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_vc6_mem_templ_pass.cpp)
cm_test(NAME config_test_has_vc6_mem_templ_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_vc6_mem_templ_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_has_vc_iterator_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_vc_iterator_pass.cpp)
cm_test(NAME config_test_has_vc_iterator_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_vc_iterator_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_has_winthreads_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_winthreads_pass.cpp)
cm_test(NAME config_test_has_winthreads_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_winthreads_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_adl_barrier_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_adl_barrier_pass.cpp)
cm_test(NAME config_test_no_adl_barrier_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_adl_barrier_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_arg_dep_lookup_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_arg_dep_lookup_pass.cpp)
cm_test(NAME config_test_no_arg_dep_lookup_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_arg_dep_lookup_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_array_type_spec_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_array_type_spec_pass.cpp)
cm_test(NAME config_test_no_array_type_spec_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_array_type_spec_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_auto_declarations_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_auto_declarations_pass.cpp)
cm_test(NAME config_test_no_auto_declarations_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_auto_declarations_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_auto_multidecl_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_auto_multidecl_pass.cpp)
cm_test(NAME config_test_no_auto_multidecl_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_auto_multidecl_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_auto_ptr_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_auto_ptr_pass.cpp)
cm_test(NAME config_test_no_auto_ptr_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_auto_ptr_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_bcb_partial_spec_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_bcb_partial_spec_pass.cpp)
cm_test(NAME config_test_no_bcb_partial_spec_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_bcb_partial_spec_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_char16_t_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_char16_t_pass.cpp)
cm_test(NAME config_test_no_char16_t_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_char16_t_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_char32_t_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_char32_t_pass.cpp)
cm_test(NAME config_test_no_char32_t_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_char32_t_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_com_value_init_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_com_value_init_pass.cpp)
cm_test(NAME config_test_no_com_value_init_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_com_value_init_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_constexpr_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_constexpr_pass.cpp)
cm_test(NAME config_test_no_constexpr_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_constexpr_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_ctype_functions_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_ctype_functions_pass.cpp)
cm_test(NAME config_test_no_ctype_functions_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_ctype_functions_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_cv_spec_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cv_spec_pass.cpp)
cm_test(NAME config_test_no_cv_spec_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cv_spec_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_cv_void_spec_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cv_void_spec_pass.cpp)
cm_test(NAME config_test_no_cv_void_spec_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cv_void_spec_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_cwchar_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cwchar_pass.cpp)
cm_test(NAME config_test_no_cwchar_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cwchar_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_cwctype_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cwctype_pass.cpp)
cm_test(NAME config_test_no_cwctype_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cwctype_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_cxx11_addressof_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cxx11_addressof_pass.cpp)
cm_test(NAME config_test_no_cxx11_addressof_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cxx11_addressof_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_cxx11_alignas_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cxx11_alignas_pass.cpp)
cm_test(NAME config_test_no_cxx11_alignas_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cxx11_alignas_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_cxx11_allocator_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cxx11_allocator_pass.cpp)
cm_test(NAME config_test_no_cxx11_allocator_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cxx11_allocator_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_cxx11_atomic_sp_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cxx11_atomic_sp_pass.cpp)
cm_test(NAME config_test_no_cxx11_atomic_sp_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cxx11_atomic_sp_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_cxx11_final_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cxx11_final_pass.cpp)
cm_test(NAME config_test_no_cxx11_final_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cxx11_final_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_cxx11_hdr_array_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cxx11_hdr_array_pass.cpp)
cm_test(NAME config_test_no_cxx11_hdr_array_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cxx11_hdr_array_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_cxx11_hdr_atomic_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cxx11_hdr_atomic_pass.cpp)
cm_test(NAME config_test_no_cxx11_hdr_atomic_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cxx11_hdr_atomic_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_cxx11_hdr_chrono_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cxx11_hdr_chrono_pass.cpp)
cm_test(NAME config_test_no_cxx11_hdr_chrono_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cxx11_hdr_chrono_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_cxx11_hdr_codecvt_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cxx11_hdr_codecvt_pass.cpp)
cm_test(NAME config_test_no_cxx11_hdr_codecvt_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cxx11_hdr_codecvt_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_cxx11_hdr_condition_variable_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cxx11_hdr_condition_variable_pass.cpp)
cm_test(NAME config_test_no_cxx11_hdr_condition_variable_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cxx11_hdr_condition_variable_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_cxx11_hdr_forward_list_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cxx11_hdr_forward_list_pass.cpp)
cm_test(NAME config_test_no_cxx11_hdr_forward_list_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cxx11_hdr_forward_list_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_cxx11_hdr_future_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cxx11_hdr_future_pass.cpp)
cm_test(NAME config_test_no_cxx11_hdr_future_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cxx11_hdr_future_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_cxx11_hdr_initializer_list_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cxx11_hdr_initializer_list_pass.cpp)
cm_test(NAME config_test_no_cxx11_hdr_initializer_list_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cxx11_hdr_initializer_list_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_cxx11_hdr_mutex_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cxx11_hdr_mutex_pass.cpp)
cm_test(NAME config_test_no_cxx11_hdr_mutex_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cxx11_hdr_mutex_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_cxx11_hdr_random_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cxx11_hdr_random_pass.cpp)
cm_test(NAME config_test_no_cxx11_hdr_random_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cxx11_hdr_random_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_cxx11_hdr_ratio_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cxx11_hdr_ratio_pass.cpp)
cm_test(NAME config_test_no_cxx11_hdr_ratio_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cxx11_hdr_ratio_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_cxx11_hdr_regex_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cxx11_hdr_regex_pass.cpp)
cm_test(NAME config_test_no_cxx11_hdr_regex_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cxx11_hdr_regex_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_cxx11_hdr_system_error_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cxx11_hdr_system_error_pass.cpp)
cm_test(NAME config_test_no_cxx11_hdr_system_error_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cxx11_hdr_system_error_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_cxx11_hdr_thread_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cxx11_hdr_thread_pass.cpp)
cm_test(NAME config_test_no_cxx11_hdr_thread_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cxx11_hdr_thread_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_cxx11_hdr_tuple_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cxx11_hdr_tuple_pass.cpp)
cm_test(NAME config_test_no_cxx11_hdr_tuple_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cxx11_hdr_tuple_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_cxx11_hdr_type_traits_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cxx11_hdr_type_traits_pass.cpp)
cm_test(NAME config_test_no_cxx11_hdr_type_traits_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cxx11_hdr_type_traits_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_cxx11_hdr_typeindex_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cxx11_hdr_typeindex_pass.cpp)
cm_test(NAME config_test_no_cxx11_hdr_typeindex_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cxx11_hdr_typeindex_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_cxx11_hdr_unordered_map_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cxx11_hdr_unordered_map_pass.cpp)
cm_test(NAME config_test_no_cxx11_hdr_unordered_map_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cxx11_hdr_unordered_map_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_cxx11_hdr_unordered_set_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cxx11_hdr_unordered_set_pass.cpp)
cm_test(NAME config_test_no_cxx11_hdr_unordered_set_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cxx11_hdr_unordered_set_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_cxx11_inline_namespaces_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cxx11_inline_namespaces_pass.cpp)
cm_test(NAME config_test_no_cxx11_inline_namespaces_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cxx11_inline_namespaces_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_cxx11_non_pub_def_fun_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cxx11_non_pub_def_fun_pass.cpp)
cm_test(NAME config_test_no_cxx11_non_pub_def_fun_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cxx11_non_pub_def_fun_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_cxx11_numeric_limits_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cxx11_numeric_limits_pass.cpp)
cm_test(NAME config_test_no_cxx11_numeric_limits_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cxx11_numeric_limits_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_cxx11_ref_qualifiers_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cxx11_ref_qualifiers_pass.cpp)
cm_test(NAME config_test_no_cxx11_ref_qualifiers_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cxx11_ref_qualifiers_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_cxx11_smart_ptr_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cxx11_smart_ptr_pass.cpp)
cm_test(NAME config_test_no_cxx11_smart_ptr_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cxx11_smart_ptr_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_cxx11_std_align_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cxx11_std_align_pass.cpp)
cm_test(NAME config_test_no_cxx11_std_align_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cxx11_std_align_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_cxx11_trailing_result_types_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cxx11_trailing_result_types_pass.cpp)
cm_test(NAME config_test_no_cxx11_trailing_result_types_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cxx11_trailing_result_types_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_cxx11_user_lit_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cxx11_user_lit_pass.cpp)
cm_test(NAME config_test_no_cxx11_user_lit_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cxx11_user_lit_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_cxx14_binary_literals_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cxx14_binary_literals_pass.cpp)
cm_test(NAME config_test_no_cxx14_binary_literals_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cxx14_binary_literals_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_cxx14_constexpr_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cxx14_constexpr_pass.cpp)
cm_test(NAME config_test_no_cxx14_constexpr_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cxx14_constexpr_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_cxx14_decltype_auto_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cxx14_decltype_auto_pass.cpp)
cm_test(NAME config_test_no_cxx14_decltype_auto_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cxx14_decltype_auto_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_cxx14_digit_separator_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cxx14_digit_separator_pass.cpp)
cm_test(NAME config_test_no_cxx14_digit_separator_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cxx14_digit_separator_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_cxx14_generic_lambda_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cxx14_generic_lambda_pass.cpp)
cm_test(NAME config_test_no_cxx14_generic_lambda_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cxx14_generic_lambda_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_cxx14_hdr_shared_mutex_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cxx14_hdr_shared_mutex_pass.cpp)
cm_test(NAME config_test_no_cxx14_hdr_shared_mutex_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cxx14_hdr_shared_mutex_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_cxx14_lambda_capture_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cxx14_lambda_capture_pass.cpp)
cm_test(NAME config_test_no_cxx14_lambda_capture_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cxx14_lambda_capture_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_cxx14_member_init_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cxx14_member_init_pass.cpp)
cm_test(NAME config_test_no_cxx14_member_init_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cxx14_member_init_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_cxx14_return_type_ded_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cxx14_return_type_ded_pass.cpp)
cm_test(NAME config_test_no_cxx14_return_type_ded_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cxx14_return_type_ded_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_cxx14_var_templ_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cxx14_var_templ_pass.cpp)
cm_test(NAME config_test_no_cxx14_var_templ_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cxx14_var_templ_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_cxx_hdr_functional_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cxx_hdr_functional_pass.cpp)
cm_test(NAME config_test_no_cxx_hdr_functional_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_cxx_hdr_functional_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_decltype_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_decltype_pass.cpp)
cm_test(NAME config_test_no_decltype_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_decltype_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_decltype_n3276_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_decltype_n3276_pass.cpp)
cm_test(NAME config_test_no_decltype_n3276_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_decltype_n3276_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_ded_typename_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_ded_typename_pass.cpp)
cm_test(NAME config_test_no_ded_typename_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_ded_typename_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_defaulted_functions_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_defaulted_functions_pass.cpp)
cm_test(NAME config_test_no_defaulted_functions_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_defaulted_functions_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_deleted_functions_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_deleted_functions_pass.cpp)
cm_test(NAME config_test_no_deleted_functions_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_deleted_functions_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_dep_nested_class_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_dep_nested_class_pass.cpp)
cm_test(NAME config_test_no_dep_nested_class_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_dep_nested_class_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_dep_val_param_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_dep_val_param_pass.cpp)
cm_test(NAME config_test_no_dep_val_param_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_dep_val_param_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_excep_std_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_excep_std_pass.cpp)
cm_test(NAME config_test_no_excep_std_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_excep_std_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_exceptions_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_exceptions_pass.cpp)
cm_test(NAME config_test_no_exceptions_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_exceptions_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_exp_func_tem_arg_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_exp_func_tem_arg_pass.cpp)
cm_test(NAME config_test_no_exp_func_tem_arg_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_exp_func_tem_arg_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_explicit_cvt_ops_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_explicit_cvt_ops_pass.cpp)
cm_test(NAME config_test_no_explicit_cvt_ops_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_explicit_cvt_ops_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_extern_template_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_extern_template_pass.cpp)
cm_test(NAME config_test_no_extern_template_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_extern_template_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_fenv_h_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_fenv_h_pass.cpp)
cm_test(NAME config_test_no_fenv_h_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_fenv_h_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_fixed_len_variadic_templates_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_fixed_len_variadic_templates_pass.cpp)
cm_test(NAME config_test_no_fixed_len_variadic_templates_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_fixed_len_variadic_templates_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_func_tmp_order_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_func_tmp_order_pass.cpp)
cm_test(NAME config_test_no_func_tmp_order_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_func_tmp_order_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_function_template_default_args_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_function_template_default_args_pass.cpp)
cm_test(NAME config_test_no_function_template_default_args_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_function_template_default_args_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_function_type_spec_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_function_type_spec_pass.cpp)
cm_test(NAME config_test_no_function_type_spec_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_function_type_spec_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_i64_limits_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_i64_limits_pass.cpp)
cm_test(NAME config_test_no_i64_limits_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_i64_limits_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_inline_memb_init_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_inline_memb_init_pass.cpp)
cm_test(NAME config_test_no_inline_memb_init_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_inline_memb_init_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_integral_int64_t_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_integral_int64_t_pass.cpp)
cm_test(NAME config_test_no_integral_int64_t_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_integral_int64_t_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_iosfwd_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_iosfwd_pass.cpp)
cm_test(NAME config_test_no_iosfwd_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_iosfwd_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_iostream_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_iostream_pass.cpp)
cm_test(NAME config_test_no_iostream_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_iostream_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_is_abstract_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_is_abstract_pass.cpp)
cm_test(NAME config_test_no_is_abstract_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_is_abstract_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_iter_construct_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_iter_construct_pass.cpp)
cm_test(NAME config_test_no_iter_construct_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_iter_construct_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_lambdas_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_lambdas_pass.cpp)
cm_test(NAME config_test_no_lambdas_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_lambdas_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_limits_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_limits_pass.cpp)
cm_test(NAME config_test_no_limits_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_limits_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_limits_const_exp_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_limits_const_exp_pass.cpp)
cm_test(NAME config_test_no_limits_const_exp_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_limits_const_exp_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_ll_limits_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_ll_limits_pass.cpp)
cm_test(NAME config_test_no_ll_limits_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_ll_limits_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_long_long_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_long_long_pass.cpp)
cm_test(NAME config_test_no_long_long_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_long_long_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_mem_func_spec_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_mem_func_spec_pass.cpp)
cm_test(NAME config_test_no_mem_func_spec_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_mem_func_spec_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_mem_tem_keyword_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_mem_tem_keyword_pass.cpp)
cm_test(NAME config_test_no_mem_tem_keyword_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_mem_tem_keyword_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_mem_tem_pnts_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_mem_tem_pnts_pass.cpp)
cm_test(NAME config_test_no_mem_tem_pnts_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_mem_tem_pnts_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_mem_templ_frnds_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_mem_templ_frnds_pass.cpp)
cm_test(NAME config_test_no_mem_templ_frnds_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_mem_templ_frnds_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_mem_templates_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_mem_templates_pass.cpp)
cm_test(NAME config_test_no_mem_templates_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_mem_templates_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_nested_friendship_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_nested_friendship_pass.cpp)
cm_test(NAME config_test_no_nested_friendship_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_nested_friendship_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_noexcept_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_noexcept_pass.cpp)
cm_test(NAME config_test_no_noexcept_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_noexcept_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_nullptr_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_nullptr_pass.cpp)
cm_test(NAME config_test_no_nullptr_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_nullptr_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_ops_in_namespace_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_ops_in_namespace_pass.cpp)
cm_test(NAME config_test_no_ops_in_namespace_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_ops_in_namespace_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_part_spec_def_args_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_part_spec_def_args_pass.cpp)
cm_test(NAME config_test_no_part_spec_def_args_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_part_spec_def_args_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_partial_spec_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_partial_spec_pass.cpp)
cm_test(NAME config_test_no_partial_spec_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_partial_spec_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_priv_aggregate_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_priv_aggregate_pass.cpp)
cm_test(NAME config_test_no_priv_aggregate_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_priv_aggregate_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_ptr_mem_const_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_ptr_mem_const_pass.cpp)
cm_test(NAME config_test_no_ptr_mem_const_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_ptr_mem_const_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_range_based_for_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_range_based_for_pass.cpp)
cm_test(NAME config_test_no_range_based_for_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_range_based_for_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_raw_literals_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_raw_literals_pass.cpp)
cm_test(NAME config_test_no_raw_literals_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_raw_literals_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_ret_det_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_ret_det_pass.cpp)
cm_test(NAME config_test_no_ret_det_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_ret_det_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_rtti_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_rtti_pass.cpp)
cm_test(NAME config_test_no_rtti_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_rtti_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_rvalue_references_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_rvalue_references_pass.cpp)
cm_test(NAME config_test_no_rvalue_references_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_rvalue_references_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_scoped_enums_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_scoped_enums_pass.cpp)
cm_test(NAME config_test_no_scoped_enums_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_scoped_enums_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_sfinae_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_sfinae_pass.cpp)
cm_test(NAME config_test_no_sfinae_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_sfinae_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_sfinae_expr_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_sfinae_expr_pass.cpp)
cm_test(NAME config_test_no_sfinae_expr_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_sfinae_expr_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_sstream_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_sstream_pass.cpp)
cm_test(NAME config_test_no_sstream_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_sstream_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_static_assert_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_static_assert_pass.cpp)
cm_test(NAME config_test_no_static_assert_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_static_assert_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_std_allocator_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_std_allocator_pass.cpp)
cm_test(NAME config_test_no_std_allocator_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_std_allocator_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_std_distance_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_std_distance_pass.cpp)
cm_test(NAME config_test_no_std_distance_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_std_distance_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_std_iter_traits_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_std_iter_traits_pass.cpp)
cm_test(NAME config_test_no_std_iter_traits_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_std_iter_traits_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_std_iterator_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_std_iterator_pass.cpp)
cm_test(NAME config_test_no_std_iterator_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_std_iterator_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_std_locale_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_std_locale_pass.cpp)
cm_test(NAME config_test_no_std_locale_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_std_locale_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_std_messages_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_std_messages_pass.cpp)
cm_test(NAME config_test_no_std_messages_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_std_messages_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_std_min_max_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_std_min_max_pass.cpp)
cm_test(NAME config_test_no_std_min_max_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_std_min_max_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_std_oi_assign_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_std_oi_assign_pass.cpp)
cm_test(NAME config_test_no_std_oi_assign_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_std_oi_assign_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_std_typeinfo_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_std_typeinfo_pass.cpp)
cm_test(NAME config_test_no_std_typeinfo_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_std_typeinfo_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_std_use_facet_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_std_use_facet_pass.cpp)
cm_test(NAME config_test_no_std_use_facet_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_std_use_facet_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_std_wstreambuf_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_std_wstreambuf_pass.cpp)
cm_test(NAME config_test_no_std_wstreambuf_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_std_wstreambuf_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_std_wstring_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_std_wstring_pass.cpp)
cm_test(NAME config_test_no_std_wstring_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_std_wstring_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_stdc_namespace_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_stdc_namespace_pass.cpp)
cm_test(NAME config_test_no_stdc_namespace_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_stdc_namespace_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_swprintf_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_swprintf_pass.cpp)
cm_test(NAME config_test_no_swprintf_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_swprintf_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_tem_local_classes_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_tem_local_classes_pass.cpp)
cm_test(NAME config_test_no_tem_local_classes_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_tem_local_classes_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_template_aliases_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_template_aliases_pass.cpp)
cm_test(NAME config_test_no_template_aliases_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_template_aliases_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_template_streams_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_template_streams_pass.cpp)
cm_test(NAME config_test_no_template_streams_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_template_streams_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_template_template_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_template_template_pass.cpp)
cm_test(NAME config_test_no_template_template_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_template_template_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_two_phase_lookup_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_two_phase_lookup_pass.cpp)
cm_test(NAME config_test_no_two_phase_lookup_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_two_phase_lookup_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_typeid_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_typeid_pass.cpp)
cm_test(NAME config_test_no_typeid_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_typeid_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_typename_with_ctor_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_typename_with_ctor_pass.cpp)
cm_test(NAME config_test_no_typename_with_ctor_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_typename_with_ctor_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_unicode_literals_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_unicode_literals_pass.cpp)
cm_test(NAME config_test_no_unicode_literals_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_unicode_literals_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_unified_init_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_unified_init_pass.cpp)
cm_test(NAME config_test_no_unified_init_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_unified_init_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_using_breaks_adl_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_using_breaks_adl_pass.cpp)
cm_test(NAME config_test_no_using_breaks_adl_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_using_breaks_adl_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_using_decl_overld_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_using_decl_overld_pass.cpp)
cm_test(NAME config_test_no_using_decl_overld_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_using_decl_overld_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_using_template_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_using_template_pass.cpp)
cm_test(NAME config_test_no_using_template_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_using_template_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_variadic_macros_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_variadic_macros_pass.cpp)
cm_test(NAME config_test_no_variadic_macros_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_variadic_macros_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_variadic_templates_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_variadic_templates_pass.cpp)
cm_test(NAME config_test_no_variadic_templates_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_variadic_templates_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_void_returns_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_void_returns_pass.cpp)
cm_test(NAME config_test_no_void_returns_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_void_returns_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME config_test_no_wchar_t_pass.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_wchar_t_pass.cpp)
cm_test(NAME config_test_no_wchar_t_fail.cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_wchar_t_fail.cpp COMPILE_ONLY WILL_FAIL)
