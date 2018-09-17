include(CMTest)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_preprocessor)

#~ Copyright Rene Rivera 2008
#~ Distributed under the Boost Software License, Version 1.0.
#~ (See accompanying file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)


# HACK: Workaround broken includes
file(GLOB TEST_HEADERS RELATIVE ${CURRENT_TEST_SOURCES_DIR} ${CURRENT_TEST_SOURCES_DIR}/*.cxx *.h)
foreach(HEADER ${TEST_HEADERS} iteration.cpp)
    configure_file(${CURRENT_TEST_SOURCES_DIR}/${HEADER} ${CMAKE_CURRENT_BINARY_DIR}/include/libs/preprocessor/test/${HEADER} @ONLY)
endforeach()

add_library(preprocessor_test_settings INTERFACE)
target_include_directories(preprocessor_test_settings INTERFACE ${CMAKE_CURRENT_BINARY_DIR}/include)

cm_test_link_libraries(preprocessor_test_settings)

#test-suite preprocessor
cm_test(NAME preprocessor_test_arithmetic SOURCES ${CURRENT_TEST_SOURCES_DIR}/arithmetic.cpp COMPILE_ONLY)
cm_test(NAME preprocessor_test_array SOURCES ${CURRENT_TEST_SOURCES_DIR}/array.cpp COMPILE_ONLY)
cm_test(NAME preprocessor_test_comparison SOURCES ${CURRENT_TEST_SOURCES_DIR}/comparison.cpp COMPILE_ONLY)
cm_test(NAME preprocessor_test_control SOURCES ${CURRENT_TEST_SOURCES_DIR}/control.cpp COMPILE_ONLY)
cm_test(NAME preprocessor_test_debug SOURCES ${CURRENT_TEST_SOURCES_DIR}/debug.cpp COMPILE_ONLY)
cm_test(NAME preprocessor_test_facilities SOURCES ${CURRENT_TEST_SOURCES_DIR}/facilities.cpp COMPILE_ONLY)
cm_test(NAME preprocessor_test_iteration SOURCES ${CURRENT_TEST_SOURCES_DIR}/iteration.cpp COMPILE_ONLY)
cm_test(NAME preprocessor_test_list SOURCES ${CURRENT_TEST_SOURCES_DIR}/list.cpp COMPILE_ONLY)
cm_test(NAME preprocessor_test_logical SOURCES ${CURRENT_TEST_SOURCES_DIR}/logical.cpp COMPILE_ONLY)
cm_test(NAME preprocessor_test_punctuation SOURCES ${CURRENT_TEST_SOURCES_DIR}/punctuation.cpp COMPILE_ONLY)
cm_test(NAME preprocessor_test_repetition SOURCES ${CURRENT_TEST_SOURCES_DIR}/repetition.cpp COMPILE_ONLY)
cm_test(NAME preprocessor_test_selection SOURCES ${CURRENT_TEST_SOURCES_DIR}/selection.cpp COMPILE_ONLY)
cm_test(NAME preprocessor_test_seq SOURCES ${CURRENT_TEST_SOURCES_DIR}/seq.cpp COMPILE_ONLY)
cm_test(NAME preprocessor_test_slot SOURCES ${CURRENT_TEST_SOURCES_DIR}/slot.cpp COMPILE_ONLY)
cm_test(NAME preprocessor_test_tuple SOURCES ${CURRENT_TEST_SOURCES_DIR}/tuple.cpp COMPILE_ONLY)
cm_test(NAME preprocessor_test_variadic SOURCES ${CURRENT_TEST_SOURCES_DIR}/variadic.cpp COMPILE_ONLY)

#test-suite preprocessor_nvm
cm_test(NAME preprocessor_test_arithmetic_nvm SOURCES ${CURRENT_TEST_SOURCES_DIR}/arithmetic.cpp COMPILE_ONLY)
target_compile_definitions(preprocessor_test_arithmetic_nvm PUBLIC BOOST_PP_VARIADICS=0)
cm_test(NAME preprocessor_test_array_nvm SOURCES ${CURRENT_TEST_SOURCES_DIR}/array.cpp COMPILE_ONLY)
target_compile_definitions(preprocessor_test_array_nvm PUBLIC BOOST_PP_VARIADICS=0)
cm_test(NAME preprocessor_test_comparison_nvm SOURCES ${CURRENT_TEST_SOURCES_DIR}/comparison.cpp COMPILE_ONLY)
target_compile_definitions(preprocessor_test_comparison_nvm PUBLIC BOOST_PP_VARIADICS=0)
cm_test(NAME preprocessor_test_control_nvm SOURCES ${CURRENT_TEST_SOURCES_DIR}/control.cpp COMPILE_ONLY)
target_compile_definitions(preprocessor_test_control_nvm PUBLIC BOOST_PP_VARIADICS=0)
cm_test(NAME preprocessor_test_debug_nvm SOURCES ${CURRENT_TEST_SOURCES_DIR}/debug.cpp COMPILE_ONLY)
target_compile_definitions(preprocessor_test_debug_nvm PUBLIC BOOST_PP_VARIADICS=0)
cm_test(NAME preprocessor_test_facilities_nvm SOURCES ${CURRENT_TEST_SOURCES_DIR}/facilities.cpp COMPILE_ONLY)
target_compile_definitions(preprocessor_test_facilities_nvm PUBLIC BOOST_PP_VARIADICS=0)
cm_test(NAME preprocessor_test_iteration_nvm SOURCES ${CURRENT_TEST_SOURCES_DIR}/iteration.cpp COMPILE_ONLY)
target_compile_definitions(preprocessor_test_iteration_nvm PUBLIC BOOST_PP_VARIADICS=0)
cm_test(NAME preprocessor_test_list_nvm SOURCES ${CURRENT_TEST_SOURCES_DIR}/list.cpp COMPILE_ONLY)
target_compile_definitions(preprocessor_test_list_nvm PUBLIC BOOST_PP_VARIADICS=0)
cm_test(NAME preprocessor_test_logical_nvm SOURCES ${CURRENT_TEST_SOURCES_DIR}/logical.cpp COMPILE_ONLY)
target_compile_definitions(preprocessor_test_logical_nvm PUBLIC BOOST_PP_VARIADICS=0)
cm_test(NAME preprocessor_test_repetition_nvm SOURCES ${CURRENT_TEST_SOURCES_DIR}/repetition.cpp COMPILE_ONLY)
target_compile_definitions(preprocessor_test_repetition_nvm PUBLIC BOOST_PP_VARIADICS=0)
cm_test(NAME preprocessor_test_selection_nvm SOURCES ${CURRENT_TEST_SOURCES_DIR}/selection.cpp COMPILE_ONLY)
target_compile_definitions(preprocessor_test_selection_nvm PUBLIC BOOST_PP_VARIADICS=0)
cm_test(NAME preprocessor_test_seq_nvm SOURCES ${CURRENT_TEST_SOURCES_DIR}/seq.cpp COMPILE_ONLY)
target_compile_definitions(preprocessor_test_seq_nvm PUBLIC BOOST_PP_VARIADICS=0)
cm_test(NAME preprocessor_test_slot_nvm SOURCES ${CURRENT_TEST_SOURCES_DIR}/slot.cpp COMPILE_ONLY)
target_compile_definitions(preprocessor_test_slot_nvm PUBLIC BOOST_PP_VARIADICS=0)
cm_test(NAME preprocessor_test_tuple_nvm SOURCES ${CURRENT_TEST_SOURCES_DIR}/tuple.cpp COMPILE_ONLY)
target_compile_definitions(preprocessor_test_tuple_nvm PUBLIC BOOST_PP_VARIADICS=0)

#test-suite preprocessor_c
cm_test(NAME preprocessor_test_arithmetic_c SOURCES ${CURRENT_TEST_SOURCES_DIR}/arithmetic.c COMPILE_ONLY)
cm_test(NAME preprocessor_test_array_c SOURCES ${CURRENT_TEST_SOURCES_DIR}/array.c COMPILE_ONLY)
cm_test(NAME preprocessor_test_comparison_c SOURCES ${CURRENT_TEST_SOURCES_DIR}/comparison.c COMPILE_ONLY)
cm_test(NAME preprocessor_test_control_c SOURCES ${CURRENT_TEST_SOURCES_DIR}/control.c COMPILE_ONLY)
cm_test(NAME preprocessor_test_debug_c SOURCES ${CURRENT_TEST_SOURCES_DIR}/debug.c COMPILE_ONLY)
cm_test(NAME preprocessor_test_facilities_c SOURCES ${CURRENT_TEST_SOURCES_DIR}/facilities.c COMPILE_ONLY)
cm_test(NAME preprocessor_test_list_c SOURCES ${CURRENT_TEST_SOURCES_DIR}/list.c COMPILE_ONLY)
cm_test(NAME preprocessor_test_logical_c SOURCES ${CURRENT_TEST_SOURCES_DIR}/logical.c COMPILE_ONLY)
cm_test(NAME preprocessor_test_punctuation_c SOURCES ${CURRENT_TEST_SOURCES_DIR}/punctuation.c COMPILE_ONLY)
cm_test(NAME preprocessor_test_selection_c SOURCES ${CURRENT_TEST_SOURCES_DIR}/selection.c COMPILE_ONLY)
cm_test(NAME preprocessor_test_seq_c SOURCES ${CURRENT_TEST_SOURCES_DIR}/seq.c COMPILE_ONLY)
cm_test(NAME preprocessor_test_slot_c SOURCES ${CURRENT_TEST_SOURCES_DIR}/slot.c COMPILE_ONLY)
cm_test(NAME preprocessor_test_tuple_c SOURCES ${CURRENT_TEST_SOURCES_DIR}/tuple.c COMPILE_ONLY)
cm_test(NAME preprocessor_test_variadic_c SOURCES ${CURRENT_TEST_SOURCES_DIR}/variadic.c COMPILE_ONLY)

#test-suite preprocessor_c_nvm
cm_test(NAME preprocessor_test_arithmetic_c_nvm SOURCES ${CURRENT_TEST_SOURCES_DIR}/arithmetic.c COMPILE_ONLY)
target_compile_definitions(preprocessor_test_arithmetic_c_nvm PUBLIC BOOST_PP_VARIADICS=0)
cm_test(NAME preprocessor_test_array_c_nvm SOURCES ${CURRENT_TEST_SOURCES_DIR}/array.c COMPILE_ONLY)
target_compile_definitions(preprocessor_test_array_c_nvm PUBLIC BOOST_PP_VARIADICS=0)
cm_test(NAME preprocessor_test_comparison_c_nvm SOURCES ${CURRENT_TEST_SOURCES_DIR}/comparison.c COMPILE_ONLY)
target_compile_definitions(preprocessor_test_comparison_c_nvm PUBLIC BOOST_PP_VARIADICS=0)
cm_test(NAME preprocessor_test_control_c_nvm SOURCES ${CURRENT_TEST_SOURCES_DIR}/control.c COMPILE_ONLY)
target_compile_definitions(preprocessor_test_control_c_nvm PUBLIC BOOST_PP_VARIADICS=0)
cm_test(NAME preprocessor_test_debug_c_nvm SOURCES ${CURRENT_TEST_SOURCES_DIR}/debug.c COMPILE_ONLY)
target_compile_definitions(preprocessor_test_debug_c_nvm PUBLIC BOOST_PP_VARIADICS=0)
cm_test(NAME preprocessor_test_facilities_c_nvm SOURCES ${CURRENT_TEST_SOURCES_DIR}/facilities.c COMPILE_ONLY)
target_compile_definitions(preprocessor_test_facilities_c_nvm PUBLIC BOOST_PP_VARIADICS=0)
cm_test(NAME preprocessor_test_list_c_nvm SOURCES ${CURRENT_TEST_SOURCES_DIR}/list.c COMPILE_ONLY)
target_compile_definitions(preprocessor_test_list_c_nvm PUBLIC BOOST_PP_VARIADICS=0)
cm_test(NAME preprocessor_test_logical_c_nvm SOURCES ${CURRENT_TEST_SOURCES_DIR}/logical.c COMPILE_ONLY)
target_compile_definitions(preprocessor_test_logical_c_nvm PUBLIC BOOST_PP_VARIADICS=0)
cm_test(NAME preprocessor_test_selection_c_nvm SOURCES ${CURRENT_TEST_SOURCES_DIR}/selection.c COMPILE_ONLY)
target_compile_definitions(preprocessor_test_selection_c_nvm PUBLIC BOOST_PP_VARIADICS=0)
cm_test(NAME preprocessor_test_seq_c_nvm SOURCES ${CURRENT_TEST_SOURCES_DIR}/seq.c COMPILE_ONLY)
target_compile_definitions(preprocessor_test_seq_c_nvm PUBLIC BOOST_PP_VARIADICS=0)
cm_test(NAME preprocessor_test_slot_c_nvm SOURCES ${CURRENT_TEST_SOURCES_DIR}/slot.c COMPILE_ONLY)
target_compile_definitions(preprocessor_test_slot_c_nvm PUBLIC BOOST_PP_VARIADICS=0)
cm_test(NAME preprocessor_test_tuple_c_nvm SOURCES ${CURRENT_TEST_SOURCES_DIR}/tuple.c COMPILE_ONLY)
target_compile_definitions(preprocessor_test_tuple_c_nvm PUBLIC BOOST_PP_VARIADICS=0)

#test-suite preprocessor_isempty
cm_test(NAME preprocessor_test_isempty SOURCES ${CURRENT_TEST_SOURCES_DIR}/isempty.cpp COMPILE_ONLY)
cm_test(NAME preprocessor_test_isempty_variadic_standard_failure SOURCES ${CURRENT_TEST_SOURCES_DIR}/isempty_variadic_standard_failure.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME preprocessor_test_isempty_variadic_standard_failure2 SOURCES ${CURRENT_TEST_SOURCES_DIR}/isempty_variadic_standard_failure2.cpp COMPILE_ONLY WILL_FAIL)

#test-suite preprocessor_isempty_nvm
cm_test(NAME preprocessor_test_isempty_nvm SOURCES ${CURRENT_TEST_SOURCES_DIR}/isempty.cpp COMPILE_ONLY)
target_compile_definitions(preprocessor_test_isempty_nvm PUBLIC BOOST_PP_VARIADICS=0)

#test-suite preprocessor_isempty_c
cm_test(NAME preprocessor_test_isempty_c SOURCES ${CURRENT_TEST_SOURCES_DIR}/isempty.c COMPILE_ONLY)
cm_test(NAME preprocessor_test_isempty_variadic_standard_failure_c SOURCES ${CURRENT_TEST_SOURCES_DIR}/isempty_variadic_standard_failure.c COMPILE_ONLY WILL_FAIL)
cm_test(NAME preprocessor_test_isempty_variadic_standard_failure2_c SOURCES ${CURRENT_TEST_SOURCES_DIR}/isempty_variadic_standard_failure2.c COMPILE_ONLY WILL_FAIL)

#test-suite preprocessor_isempty_c_nvm
cm_test(NAME preprocessor_test_isempty_c_nvm SOURCES ${CURRENT_TEST_SOURCES_DIR}/isempty.c COMPILE_ONLY)
target_compile_definitions(preprocessor_test_isempty_c_nvm PUBLIC BOOST_PP_VARIADICS=0)
