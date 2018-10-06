include(CMTest)

patch_directory(${CURRENT_TEST_SOURCES_DIR} ${CMAKE_CURRENT_SOURCE_DIR}/files ${CMAKE_CURRENT_BINARY_DIR})

find_package(${CMAKE_WORKSPACE_NAME}_tr1)
find_package(${CMAKE_WORKSPACE_NAME}_core)
find_package(${CMAKE_WORKSPACE_NAME}_type_traits)
find_package(${CMAKE_WORKSPACE_NAME}_detail)
find_package(${CMAKE_WORKSPACE_NAME}_test)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_config
                        boost::tr1
                        boost::core
                        boost::type_traits
                        boost::detail
                        boost::test
                        )


include(CMProperties)

find_package(Threads)
add_library(config_threads INTERFACE)
target_link_libraries(config_threads INTERFACE "${CMAKE_THREAD_LIBS_INIT}")
set(LIBS_TO_CHECK atomic rt)
foreach(lib ${LIBS_TO_CHECK})
    find_library(FIND_LIB${lib} ${lib})
    if(FIND_LIB${lib})
        target_link_libraries(config_threads INTERFACE "${FIND_LIB${lib}}")
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

cm_test(NAME config_test_config_test_c SOURCES ${CURRENT_TEST_SOURCES_DIR}/config_test_c.c)

if (CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
    cm_test(NAME config_test_config_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/config_test.cpp)
        
    cm_test(NAME config_test_config_test_no_rtti SOURCES ${CURRENT_TEST_SOURCES_DIR}/config_test.cpp)
    set_target_properties(config_test_config_test_no_rtti PROPERTIES CXX_RTTI Off)
    cm_test(NAME config_test_config_test_no_exceptions SOURCES ${CURRENT_TEST_SOURCES_DIR}/config_test.cpp)
    set_target_properties(config_test_config_test_no_exceptions PROPERTIES CXX_EXCEPTIONS Off)
    foreach(CONFIG_TEST config_test_config_test config_test_config_test_no_rtti config_test_config_test_no_exceptions)
        target_link_libraries(${CONFIG_TEST} config_threads)
    endforeach()
        
    cm_test(NAME config_test_config_info SOURCES ${CURRENT_TEST_SOURCES_DIR}/config_info.cpp)
    cm_test(NAME config_test_config_info_no_rtti SOURCES ${CURRENT_TEST_SOURCES_DIR}/config_test.cpp)
    set_target_properties(config_test_config_info_no_rtti PROPERTIES CXX_RTTI Off)
    
    cm_test(NAME config_test_config_info_no_exceptions SOURCES ${CURRENT_TEST_SOURCES_DIR}/config_test.cpp)
    set_target_properties(config_test_config_info_no_exceptions PROPERTIES CXX_EXCEPTIONS Off)
    target_link_libraries(${CONFIG_TEST} config_threads)

    foreach(CONFIG_TEST config_test_config_info config_test_config_info_no_rtti config_test_config_info_no_exceptions)
        target_link_libraries(${CONFIG_TEST} config_threads)
    endforeach()
    
endif()

cm_test(NAME config_test_math_info SOURCES ${CURRENT_TEST_SOURCES_DIR}/math_info.cpp)
cm_test(NAME config_test_abi_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/abi/abi_test.cpp ${CURRENT_TEST_SOURCES_DIR}/abi/main.cpp)
cm_test(NAME config_test_limits_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/limits_test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
# TODO: fix test. CMakeFiles/config_test_link_test.dir/home/alex/Projects/boost-1.59.0/libs/config/test/link/main.cpp.o: In function `main':  main.cpp:(.text+0xa): undefined reference to `int test_free_proc<int>(int)'
#cm_test(NAME config_test_link_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/link/main.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
#target_compile_definitions(config_test_link_test PRIVATE -DBOOST_CONFIG_NO_LIB=1)

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
