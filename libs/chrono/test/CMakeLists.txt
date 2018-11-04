include(CMTest)

find_package(${CMAKE_WORKSPACE_NAME}_rational)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_chrono
                        ${CMAKE_WORKSPACE_NAME}_system
                        ${CMAKE_WORKSPACE_NAME}::rational
                        )


function(chrono_v1_v2_run_header path test_name)
cm_test(NAME chrono_test_${test_name}_h SOURCES ${CURRENT_TEST_SOURCES_DIR}/${path}.cpp)
target_compile_definitions(chrono_test_${test_name}_h PUBLIC -DBOOST_CHRONO_HEADER_ONLY -DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_CHRONO_VERSION=2)

cm_test(NAME chrono_test_v1_${test_name}_h SOURCES ${CURRENT_TEST_SOURCES_DIR}/${path}.cpp)
target_compile_definitions(chrono_test_v1_${test_name}_h PUBLIC -DBOOST_CHRONO_HEADER_ONLY -DBOOST_ERROR_CODE_HEADER_ONLY)
endfunction(chrono_v1_v2_run_header)

function(chrono_v1_v2_run path test_name)
    cm_test(NAME chrono_test_${test_name}_d SOURCES ${CURRENT_TEST_SOURCES_DIR}/${path}.cpp)
    target_compile_definitions(chrono_test_${test_name}_d PUBLIC -DBOOST_CHRONO_VERSION=2)

    cm_test(NAME chrono_test_v1_${test_name}_s SOURCES ${CURRENT_TEST_SOURCES_DIR}/${path}.cpp)

    cm_test(NAME chrono_test_${test_name}_h SOURCES ${CURRENT_TEST_SOURCES_DIR}/${path}.cpp)
    target_compile_definitions(chrono_test_${test_name}_h PUBLIC -DBOOST_CHRONO_HEADER_ONLY -DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_CHRONO_VERSION=2)

    cm_test(NAME chrono_test_v1_${test_name}_h SOURCES ${CURRENT_TEST_SOURCES_DIR}/${path}.cpp)
    target_compile_definitions(chrono_test_v1_${test_name}_h PUBLIC -DBOOST_CHRONO_HEADER_ONLY -DBOOST_ERROR_CODE_HEADER_ONLY)
endfunction(chrono_v1_v2_run)

function(chrono_run2_mt test_name)
    set(arglist)
    foreach(a IN ITEMS ${ARGN})
        set(arglist ${arglist} ${CURRENT_TEST_SOURCES_DIR}/${a}.cpp)
    endforeach()
    cm_test(NAME chrono_test_${test_name}_d SOURCES${CURRENT_TEST_SOURCES_DIR}/ ${path}.cpp ${arglist})
    target_compile_definitions(chrono_test_${test_name}_d PUBLIC -DBOOST_CHRONO_VERSION=2)

    cm_test(NAME chrono_test_${test_name}_h SOURCES ${CURRENT_TEST_SOURCES_DIR}/${path}.cpp ${arglist})
    target_compile_definitions(chrono_test_${test_name}_h
                               PUBLIC -DBOOST_CHRONO_HEADER_ONLY -DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_CHRONO_VERSION=2)
endfunction(chrono_run2_mt)

function(chrono_compile2 path test_name)
    cm_test(NAME chrono_test_${test_name}_l SOURCES ${CURRENT_TEST_SOURCES_DIR}/${path}.cpp COMPILE_ONLY)
    target_compile_definitions(chrono_test_${test_name}_l PUBLIC -DBOOST_CHRONO_VERSION=2)

    cm_test(NAME chrono_test_${test_name}_h SOURCES ${CURRENT_TEST_SOURCES_DIR}/${path}.cpp COMPILE_ONLY)
    target_compile_definitions(chrono_test_${test_name}_h
                                PUBLIC -DBOOST_CHRONO_HEADER_ONLY -DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_CHRONO_VERSION=2)
endfunction(chrono_compile2)

function(chrono_run_mt path test_name)
    cm_test(NAME chrono_test_${test_name}_d SOURCES ${CURRENT_TEST_SOURCES_DIR}/${path}.cpp)
    target_compile_definitions(chrono_test_${test_name}_d PUBLIC -DBOOST_CHRONO_VERSION=2)

    cm_test(NAME chrono_test_${test_name}_h SOURCES ${CURRENT_TEST_SOURCES_DIR}/${path}.cpp)
    target_compile_definitions(chrono_test_${test_name}_h
                               PUBLIC -DBOOST_CHRONO_HEADER_ONLY -DBOOST_ERROR_CODE_HEADER_ONLY BOOST_CHRONO_VERSION=2)
endfunction(chrono_run_mt)

function(chrono_run path test_name)
    cm_test(NAME chrono_test_${test_name}_d SOURCES ${CURRENT_TEST_SOURCES_DIR}/${path}.cpp)
    target_compile_definitions(chrono_test_${test_name}_d PUBLIC -DBOOST_CHRONO_VERSION=2)

    cm_test(NAME chrono_test_${test_name}_h SOURCES ${CURRENT_TEST_SOURCES_DIR}/${path}.cpp)
    target_compile_definitions(chrono_test_${test_name}_h
                               PUBLIC -DBOOST_CHRONO_HEADER_ONLY -DBOOST_ERROR_CODE_HEADER_ONLY
            -DBOOST_CHRONO_DONT_PROVIDE_HYBRID_ERROR_HANDLING -DBOOST_CHRONO_VERSION=2)
endfunction(chrono_run)

function(chrono_run_header2 path test_name)
    cm_test(NAME chrono_test_${test_name}_h SOURCES ${CURRENT_TEST_SOURCES_DIR}/${path}.cpp)
    target_compile_definitions(chrono_test_${test_name}_h
                               PUBLIC -DBOOST_CHRONO_HEADER_ONLY -DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_CHRONO_VERSION=2)
endfunction(chrono_run_header2)

function(chrono_run_header path test_name)
    cm_test(NAME chrono_test_${test_name}_h SOURCES ${CURRENT_TEST_SOURCES_DIR}/${path}.cpp)
    target_compile_definitions(chrono_test_${test_name}_h
            PUBLIC -DBOOST_CHRONO_HEADER_ONLY -DBOOST_ERROR_CODE_HEADER_ONLY
            -DBOOST_CHRONO_DONT_PROVIDE_HYBRID_ERROR_HANDLING -DBOOST_CHRONO_VERSION=2)
endfunction(chrono_run_header)

function(chrono_compile path test_name)
    cm_test(NAME chrono_test_${test_name}_l SOURCES ${CURRENT_TEST_SOURCES_DIR}/${path}.cpp COMPILE_ONLY)
    target_compile_definitions(chrono_test_${test_name}_l PUBLIC -DBOOST_CHRONO_VERSION=2)

    cm_test(NAME chrono_test_${test_name}_h SOURCES ${CURRENT_TEST_SOURCES_DIR}/${path}.cpp COMPILE_ONLY)
    target_compile_definitions(chrono_test_${test_name}_h
                               PUBLIC -DBOOST_CHRONO_HEADER_ONLY -DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_CHRONO_VERSION=2)
endfunction(chrono_compile)

#test-suite "examples"
chrono_run_header(../example/cycle_count cycle_count)
chrono_run_header(../example/runtime_resolution runtime_resolution)
chrono_run_header(../example/xtime xtime)
chrono_run_header(../example/saturating saturating)
chrono_run(../example/min_time_point min_time_point)
chrono_run_header(../example/i_dont_like_the_default_duration_behavior i_dont_like_the_default_duration_behavior)
chrono_run(../example/simulated_thread_interface_demo simulated_thread_interface_demo)
chrono_run_header(../example/timeval_demo timeval_demo)
chrono_run(../example/chrono_unit_test chrono_unit_test)
chrono_run_header(../example/explore_limits  explore_limits)
chrono_run_header(../example/test_duration test_duration)
chrono_run(../example/test_clock test_clock)
chrono_run_header(../example/miscellaneous miscellaneous)
chrono_run_header(../example/test_special_values test_special_values)
chrono_run(../example/manipulate_clock_object manipulate_clock_object)
#[ chrono-run ../example/chrono_accuracy_test.cpp ]
chrono_run_mt(../example/test_thread_clock test_thread_clock)
chrono_run_header(../example/rounding rounding)
#[ chrono-run ../example/await_keystroke.cpp  ]

#test-suite "traits"
chrono_compile2(traits/common_type_duration_pass  traits_common_type_duration_p)
chrono_compile2(traits/common_type_time_point_pass traits_common_type_time_point_p)
chrono_compile2(traits/treat_as_floating_point_pass traits_treat_as_floating_point_p)
chrono_run_header2(traits/duration_values_pass traits_duration_values_p)

#test-suite "duration"
cm_test(NAME chrono_test_duration_duration_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/duration/duration_duration_fail.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME chrono_test_duration_ratio_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/duration/ratio_fail.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME chrono_test_duration_positive_num_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/duration/positive_num_fail.cpp COMPILE_ONLY WILL_FAIL)
chrono_compile(duration/default_ratio_pass duration_default_ratio_pass)
chrono_compile(duration/types_pass duration_types_pass)
chrono_compile(duration/ratio_alias_pass duration_ratio_alias_pass)
chrono_compile(duration/typedefs_pass duration_typedefs_pass)
chrono_run_header(duration/arithmetic_pass duration_arithmetic_pass)
chrono_run_header(duration/duration_cast_pass duration_duration_cast_pass)
cm_test(NAME chrono_test_duration_cast_int_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/duration/duration_cast_int_fail.cpp COMPILE_ONLY WILL_FAIL)
chrono_run_header(duration/comparisons_pass duration_comparisons_pass)
chrono_run_header(duration/constructor_pass duration_constructor_pass)
cm_test(NAME chrono_test_duration_convert_float_to_int_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/duration/cons/convert_float_to_int_fail.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME chrono_test_duration_convert_inexact_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/duration/cons/convert_inexact_fail.cpp COMPILE_ONLY WILL_FAIL)
#cm_test(NAME chrono_test_duration_implicit_constructot_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/duration/implicit_constructot_fail.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME chrono_test_duration_non_implicit_convertible_rep_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/duration/cons/non_implicit_convertible_rep_fail.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME chrono_test_duration_cons_treat_as_floating_point_Rep2_true_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/duration/cons/treat_as_floating_point_Rep2_true_fail.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME chrono_test_duration_nonmember_divide_rep2_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/duration/nonmember/divide_rep2_fail.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME chrono_test_duration_nonmember_modulus_rep2_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/duration/nonmember/modulus_rep2_fail.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME chrono_test_duration_nonmember_times_rep2_lhs_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/duration/nonmember/times_rep2_lhs_fail.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME chrono_test_duration_nonmember_times_rep2_rhs_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/duration/nonmember/times_rep2_rhs_fail.cpp COMPILE_ONLY WILL_FAIL)
chrono_run_header(duration/duration_values_pass duration_duration_values_pass)
chrono_run_header(duration/rounding_pass duration_rounding_pass)

#test-suite "time_point"
chrono_compile2(time_point/default_duration_pass time_point_default_duration_p)
cm_test(NAME chrono_test_time_point_not_duration_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/time_point/not_duration_fail.cpp COMPILE_ONLY WILL_FAIL)
chrono_run_header2(time_point/arithmetic_pass time_point_arithmetic_p)
chrono_run_header2(time_point/arithmetic_ext_pass time_point_arithmetic_ext_p)
chrono_run_header2(time_point/time_point_cast_pass time_point_time_point_cast_p)
cm_test(NAME chrono_test_time_point_time_point_cast_int_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/time_point/time_point_cast_int_fail.cpp COMPILE_ONLY WILL_FAIL)
chrono_run_header2(time_point/comparisons_pass time_point_comparisons_p)
cm_test(NAME chrono_test_time_point_comparisons_equal_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/time_point/comparisons/equal_fail.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME chrono_test_time_point_comparisons_less_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/time_point/comparisons/less_fail.cpp COMPILE_ONLY WILL_FAIL)
chrono_run_header2(time_point/constructor_pass time_point_constructor_p)
cm_test(NAME chrono_test_time_point_cons_implicit_faill SOURCES ${CURRENT_TEST_SOURCES_DIR}/time_point/cons/implicit_fail.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME chrono_test_time_point_non_implicit_convertible_duration_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/time_point/cons/non_implicit_convertible_duration_fail.cpp COMPILE_ONLY WILL_FAIL)
chrono_run_header2(time_point/min_max_pass time_point_min_max_p)

#test-suite "clock"
cm_test(NAME clock_test_clock_clock_p SOURCES ${CURRENT_TEST_SOURCES_DIR}/clock/clock_pass.cpp)
cm_test(NAME clock_test_two_obj_p SOURCES ${CURRENT_TEST_SOURCES_DIR}/another_obj.cpp ${CURRENT_TEST_SOURCES_DIR}/one_obj.cpp)

#test-suite "io_ex"
chrono_v1_v2_run(../example/io_ex1 example_io_ex1)
chrono_v1_v2_run_header(../example/io_ex2 example_io_ex2)
chrono_v1_v2_run(../example/io_ex3 example_io_ex3)
chrono_v1_v2_run(../example/io_ex4 example_io_ex4)
chrono_v1_v2_run(../example/io_ex5 example_io_ex5)
chrono_v1_v2_run(../example/french example_french)

#test-suite "io"
chrono_v1_v2_run_header(io/duration_input io_duration_input)
chrono_v1_v2_run_header(io/duration_output io_duration_output)
chrono_v1_v2_run_header(io/time_point_input io_time_point_input)
chrono_v1_v2_run_header(io/time_point_output io_time_point_output)
chrono_run(test_7868 test_7868)
chrono_run(test_11006 test_11006)
chrono_run(test_11012 test_11012)

#test-suite "win32"
chrono_run(win32_test win32_test)

#explicit ts_ ;
#test-suite ts_
#[ chrono-run test_7868.cpp  ]
#[ chrono-run test_9337.cpp  ]
#[ chrono-run test_10778.cpp  ]
chrono_run(test_10631 test_10631)
