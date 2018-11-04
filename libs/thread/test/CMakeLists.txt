include(CMTest)

patch_directory(${CURRENT_TEST_SOURCES_DIR} ${CMAKE_CURRENT_SOURCE_DIR}/files ${CMAKE_CURRENT_BINARY_DIR})

find_package(${CMAKE_WORKSPACE_NAME}_asio)
find_package(${CMAKE_WORKSPACE_NAME}_interprocess)
find_package(${CMAKE_WORKSPACE_NAME}_test)
find_package(${CMAKE_WORKSPACE_NAME}_unordered)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_thread
                        ${CMAKE_WORKSPACE_NAME}::asio
                        ${CMAKE_WORKSPACE_NAME}::interprocess
                        ${CMAKE_WORKSPACE_NAME}::test
                        ${CMAKE_WORKSPACE_NAME}::unordered
                        )

function(thread_run)
    set(options)
    set(multiValueArgs)
    set(oneValueArgs SOURCES SOURCES_PREFIX HEADER_PREFIX)
    cmake_parse_arguments(PARSE "${options}" "${oneValueArgs}"
            "${multiValueArgs}" ${ARGN} )
    set(ADD_ARG "")
    if (PARSE_HEADER_PREFIX)
        set(ADD_ARG SOURCES_PREFIX ${PARSE_HEADER_PREFIX})
    endif()
        
    string(REPLACE ".cpp" "" NAME "${PARSE_SOURCES}")
    string(REPLACE "../" "__" NAME "${NAME}")
    string(REPLACE "./" "" NAME "${NAME}")
    string(REPLACE "/" "_" NAME "${NAME}")
    string(REPLACE "." "_" NAME "${NAME}")
    cm_test(NAME thread_test_${NAME} SOURCES ${CURRENT_TEST_SOURCES_DIR}/winrt_init.cpp ${PARSE_SOURCES_PREFIX}/${PARSE_SOURCES} ${ADD_ARG})
    cm_test(NAME thread_test_${NAME}_lib SOURCES ${CURRENT_TEST_SOURCES_DIR}/../src/tss_null.cpp ${CURRENT_TEST_SOURCES_DIR}/winrt_init.cpp ${PARSE_SOURCES_PREFIX}/${PARSE_SOURCES} ${ADD_ARG})
    target_compile_options(thread_test_${NAME} PRIVATE -std=c++11)
    target_compile_options(thread_test_${NAME}_lib PRIVATE -std=c++11)

endfunction(thread_run)

function(thread_run_h SOURCES)
    set(options)
    set(multiValueArgs)
    set(oneValueArgs SOURCES SOURCES_PREFIX HEADER_PREFIX)
    cmake_parse_arguments(PARSE "${options}" "${oneValueArgs}"
            "${multiValueArgs}" ${ARGN} )
    set(ADD_ARG "")
    if (PARSE_HEADER_PREFIX)
        set(ADD_ARG SOURCES_PREFIX ${PARSE_HEADER_PREFIX})
    endif()
        
    string(REPLACE ".cpp" "" NAME "${PARSE_SOURCES}")
    string(REPLACE "../" "__" NAME "${NAME}")
    string(REPLACE "./" "" NAME "${NAME}")
    string(REPLACE "/" "_" NAME "${NAME}")
    string(REPLACE "." "_" NAME "${NAME}")
    cm_test(NAME thread_test_${NAME}_h SOURCES ${CURRENT_TEST_SOURCES_DIR}/winrt_init.cpp ${PARSE_SOURCES_PREFIX}/${PARSE_SOURCES} ${ADD_ARG})
    target_compile_definitions(thread_test_${NAME}_h PRIVATE -DBOOST_THREAD_DONT_PROVIDE_INTERRUPTIONS -DBOOST_THREAD_VERSION=3)
endfunction(thread_run_h)

#test-suite t_threads
thread_run(SOURCES test_thread.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES test_thread_id.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES test_hardware_concurrency.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES test_physical_concurrency.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES test_thread_move.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES test_thread_return_local.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES test_thread_move_return.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES test_thread_launching.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES test_thread_mf.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES test_thread_exit.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES test_move_function.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME thread_test_no_implicit_move_from_lvalue_thread SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_implicit_move_from_lvalue_thread.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME thread_test_no_implicit_assign_from_lvalue_thread SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_implicit_assign_from_lvalue_thread.cpp COMPILE_ONLY WILL_FAIL)
thread_run(SOURCES test_tss.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES test_xtime.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})

#test-suite t_sync
thread_run(SOURCES test_mutex.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES test_condition_notify_one.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES test_condition_timed_wait_times_out.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES test_condition_notify_all.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES test_condition.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES test_once.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES test_barrier.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES test_barrier_void_fct.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES test_barrier_size_fct.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES test_lock_concept.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES test_generic_locks.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES test_latch.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES test_completion_latch.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})

#test-suite t_shared
thread_run(SOURCES test_shared_mutex.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES test_shared_mutex_part_2.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES test_shared_mutex_timed_locks.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES test_shared_mutex_timed_locks_chrono.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
#uncomment the following once these works on windows
#thread_run(SOURCES test_vhh_shared_mutex.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
#thread_run(SOURCES test_vhh_shared_mutex_part_2.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
#thread_run(SOURCES test_vhh_shared_mutex_timed_locks.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})

#test-suite t_futures
thread_run(SOURCES test_futures.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})

#test-suite tickets
thread_run(SOURCES test_2309.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES test_2501.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES test_2741.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES test_3628.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES test_4521.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES test_4648.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES test_4882.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES test_5542_1.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES test_5542_2.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES test_5542_3.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES test_5891.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
#thread_run(SOURCES test_6130.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
#thread_run(SOURCES test_6170.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES test_6174.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
#thread_run(SOURCES test_7160.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES test_7328.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES test_7571.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES test_9319.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
#thread_run(SOURCES test_9711.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR}) This is an invalid use of ::then deferred.
thread_run(SOURCES test_9856.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME thread_test_test_10963 SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_10963.cpp COMPILE_ONLY SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES test_10964.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES test_11053.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES test_11266.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})

#test-suite oth_tickets
thread_run(SOURCES test_5351.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES test_5502.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})

#test-suite ts_conditions
cm_test(NAME thread_test_sync_conditions_condition_variable_assign_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/./sync/conditions/condition_variable/assign_fail.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME thread_test_sync_conditions_condition_variable_copy_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/./sync/conditions/condition_variable/copy_fail.cpp COMPILE_ONLY WILL_FAIL)
thread_run(SOURCES ./sync/conditions/condition_variable/default_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/conditions/condition_variable/dtor_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
if (win32)
    thread_run(SOURCES ./sync/conditions/condition_variable/native_handle_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
endif()
thread_run(SOURCES ./sync/conditions/condition_variable/wait_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/conditions/condition_variable/wait_for_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/conditions/condition_variable/wait_for_pred_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/conditions/condition_variable/wait_until_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/conditions/condition_variable/wait_until_pred_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})

cm_test(NAME thread_test_sync_conditions_condition_variable_any_assign_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/./sync/conditions/condition_variable_any/assign_fail.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME thread_test_sync_conditions_condition_variable_any_copy_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/./sync/conditions/condition_variable_any/copy_fail.cpp COMPILE_ONLY WILL_FAIL)
thread_run(SOURCES ./sync/conditions/condition_variable_any/default_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/conditions/condition_variable_any/dtor_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/conditions/condition_variable_any/wait_for_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/conditions/condition_variable_any/wait_for_pred_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/conditions/condition_variable_any/wait_until_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/conditions/condition_variable_any/wait_until_pred_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/conditions/cv_status/cv_status_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/conditions/notify_all_at_thread_exit_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})

#test-suite ts_async
thread_run(SOURCES ./sync/futures/async/async_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/futures/async/async_executor_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})

#test-suite ts_promise
cm_test(NAME thread_test_sync_futures_promise_copy_assign_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/./sync/futures/promise/copy_assign_fail.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME thread_test_sync_futures_promise_copy_ctor_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/./sync/futures/promise/copy_ctor_fail.cpp COMPILE_ONLY WILL_FAIL)
thread_run(SOURCES ./sync/futures/promise/alloc_ctor_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/futures/promise/default_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/futures/promise/dtor_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/futures/promise/get_future_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/futures/promise/move_ctor_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/futures/promise/move_assign_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/futures/promise/set_exception_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/futures/promise/set_lvalue_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/futures/promise/set_rvalue_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/futures/promise/set_value_const_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/futures/promise/set_value_void_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/futures/promise/emplace_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/futures/promise/use_allocator_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/futures/promise/set_exception_at_thread_exit_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/futures/promise/set_lvalue_at_thread_exit_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/futures/promise/set_rvalue_at_thread_exit_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/futures/promise/set_value_at_thread_exit_const_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/futures/promise/set_value_at_thread_exit_void_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})

#ts_make_ready_future
thread_run(SOURCES ./sync/futures/make_ready_future_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})

#test-suite ts_make_ready_future
cm_test(NAME thread_test_sync_futures_future_copy_assign_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/./sync/futures/future/copy_assign_fail.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME thread_test_sync_futures_future_copy_ctor_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/./sync/futures/future/copy_ctor_fail.cpp COMPILE_ONLY WILL_FAIL)
thread_run(SOURCES ./sync/futures/future/default_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/futures/future/dtor_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/futures/future/get_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/futures/future/get_or_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/futures/future/move_ctor_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/futures/future/move_assign_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/futures/future/share_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/futures/future/wait_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/futures/future/wait_for_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/futures/future/wait_until_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/futures/future/then_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/futures/future/then_executor_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/futures/future/async_deferred_then_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/futures/future/then_deferred_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})

#test-suite ts_future
thread_run(SOURCES ./sync/futures/shared_future/copy_assign_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/futures/shared_future/copy_ctor_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/futures/shared_future/default_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/futures/shared_future/dtor_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/futures/shared_future/get_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/futures/shared_future/move_ctor_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/futures/shared_future/move_assign_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/futures/shared_future/wait_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/futures/shared_future/wait_for_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/futures/shared_future/wait_until_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/futures/shared_future/then_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/futures/shared_future/then_executor_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})

#test-suite ts_shared_future
thread_run(SOURCES ./sync/futures/packaged_task/alloc_ctor_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME thread_test_sync_futures_packaged_task_copy_assign_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/./sync/futures/packaged_task/copy_assign_fail.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME thread_test_sync_futures_packaged_task_copy_ctor_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/./sync/futures/packaged_task/copy_ctor_fail.cpp COMPILE_ONLY WILL_FAIL)
thread_run(SOURCES ./sync/futures/packaged_task/default_ctor_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/futures/packaged_task/func_ctor_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/futures/packaged_task/dtor_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/futures/packaged_task/get_future_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/futures/packaged_task/move_ctor_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/futures/packaged_task/move_assign_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/futures/packaged_task/operator_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/futures/packaged_task/reset_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/futures/packaged_task/use_allocator_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/futures/packaged_task/types_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/futures/packaged_task/member_swap_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/futures/packaged_task/non_member_swap_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/futures/packaged_task/make_ready_at_thread_exit_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})

#test-suite ts_when_all
thread_run(SOURCES ./sync/futures/when_all/none_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/futures/when_all/one_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/futures/when_all/iterators_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/futures/when_all/variadic_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})

#test-suite ts_when_any
thread_run(SOURCES ./sync/futures/when_any/none_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/futures/when_any/one_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/futures/when_any/iterators_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/futures/when_any/variadic_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})

#test-suite ts_lock_guard
cm_test(NAME thread_test_sync_mutual_exclusion_locks_lock_guard_copy_assign_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/./sync/mutual_exclusion/locks/lock_guard/copy_assign_fail.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME thread_test_sync_mutual_exclusion_locks_lock_guard_copy_ctor_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/./sync/mutual_exclusion/locks/lock_guard/copy_ctor_fail.cpp COMPILE_ONLY WILL_FAIL)
thread_run(SOURCES ./sync/mutual_exclusion/locks/lock_guard/adopt_lock_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/locks/lock_guard/default_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/locks/lock_guard/types_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/locks/lock_guard/make_lock_guard_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/locks/lock_guard/make_lock_guard_adopt_lock_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})

#test-suite ts_unique_lock
cm_test(NAME thread_test_sync_mutual_exclusion_locks_unique_lock_cons_copy_assign_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/./sync/mutual_exclusion/locks/unique_lock/cons/copy_assign_fail.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME thread_test_sync_mutual_exclusion_locks_unique_lock_cons_copy_ctor_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/./sync/mutual_exclusion/locks/unique_lock/cons/copy_ctor_fail.cpp COMPILE_ONLY WILL_FAIL)
thread_run(SOURCES ./sync/mutual_exclusion/locks/unique_lock/cons/adopt_lock_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/locks/unique_lock/cons/default_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/locks/unique_lock/cons/defer_lock_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/locks/unique_lock/cons/duration_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/locks/unique_lock/cons/move_assign_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/locks/unique_lock/cons/move_ctor_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/locks/unique_lock/cons/move_ctor_upgrade_lock_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/locks/unique_lock/cons/move_ctor_upgrade_lock_try_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/locks/unique_lock/cons/move_ctor_upgrade_lock_for_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/locks/unique_lock/cons/move_ctor_upgrade_lock_until_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/locks/unique_lock/cons/mutex_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/locks/unique_lock/cons/time_point_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/locks/unique_lock/cons/try_to_lock_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/locks/unique_lock/locking/lock_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/locks/unique_lock/locking/try_lock_for_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/locks/unique_lock/locking/try_lock_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/locks/unique_lock/locking/try_lock_until_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/locks/unique_lock/locking/unlock_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/locks/unique_lock/mod/member_swap_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/locks/unique_lock/mod/non_member_swap_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/locks/unique_lock/mod/release_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/locks/unique_lock/obs/mutex_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/locks/unique_lock/obs/op_bool_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
#cm_test(NAME SOURCES ${CURRENT_TEST_SOURCES_DIR}/./sync/mutual_exclusion/locks/unique_lock/obs/op_int_fail.cpp COMPILE_ONLY WILL_FAIL SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/locks/unique_lock/obs/owns_lock_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/locks/unique_lock/types_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})

#test-suite ts_make_unique_lock
thread_run(SOURCES ./sync/mutual_exclusion/locks/unique_lock/cons/make_unique_lock_mutex_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/locks/unique_lock/cons/make_unique_lock_adopt_lock_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/locks/unique_lock/cons/make_unique_lock_defer_lock_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/locks/unique_lock/cons/make_unique_lock_try_to_lock_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})

thread_run(SOURCES ./sync/mutual_exclusion/locks/unique_lock/cons/make_unique_locks_mutex_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})

#test-suite ts_shared_lock
cm_test(NAME thread_test_sync_mutual_exclusion_locks_shared_lock_cons_copy_assign_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/./sync/mutual_exclusion/locks/shared_lock/cons/copy_assign_fail.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME thread_test_sync_mutual_exclusion_locks_shared_lock_cons_copy_ctor_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/./sync/mutual_exclusion/locks/shared_lock/cons/copy_ctor_fail.cpp COMPILE_ONLY WILL_FAIL)
thread_run(SOURCES ./sync/mutual_exclusion/locks/shared_lock/cons/adopt_lock_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/locks/shared_lock/cons/default_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/locks/shared_lock/cons/defer_lock_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/locks/shared_lock/cons/duration_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/locks/shared_lock/cons/move_assign_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/locks/shared_lock/cons/move_ctor_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/locks/shared_lock/cons/move_ctor_unique_lock_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/locks/shared_lock/cons/move_ctor_upgrade_lock_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/locks/shared_lock/cons/mutex_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/locks/shared_lock/cons/time_point_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/locks/shared_lock/cons/try_to_lock_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/locks/shared_lock/locking/lock_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/locks/shared_lock/locking/try_lock_for_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/locks/shared_lock/locking/try_lock_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/locks/shared_lock/locking/try_lock_until_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/locks/shared_lock/locking/unlock_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/locks/shared_lock/mod/member_swap_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/locks/shared_lock/mod/non_member_swap_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/locks/shared_lock/mod/release_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/locks/shared_lock/obs/mutex_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/locks/shared_lock/obs/op_bool_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/locks/shared_lock/obs/owns_lock_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/locks/shared_lock/types_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})

#[ thread-run2-h ./sync/mutual_exclusion/locks/shared_lock/cons/default_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
#[ thread-run2-h ./sync/mutual_exclusion/locks/shared_lock/cons/defer_lock_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})

#test-suite ts_upgrade_lock
cm_test(NAME thread_test_sync_mutual_exclusion_locks_upgrade_lock_cons_copy_assign_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/./sync/mutual_exclusion/locks/upgrade_lock/cons/copy_assign_fail.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME thread_test_sync_mutual_exclusion_locks_upgrade_lock_cons_copy_ctor_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/./sync/mutual_exclusion/locks/upgrade_lock/cons/copy_ctor_fail.cpp COMPILE_ONLY WILL_FAIL)
thread_run(SOURCES ./sync/mutual_exclusion/locks/upgrade_lock/cons/adopt_lock_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/locks/upgrade_lock/cons/default_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/locks/upgrade_lock/cons/defer_lock_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/locks/upgrade_lock/cons/duration_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/locks/upgrade_lock/cons/move_assign_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/locks/upgrade_lock/cons/move_ctor_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/locks/upgrade_lock/cons/move_ctor_unique_lock_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/locks/upgrade_lock/cons/mutex_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/locks/upgrade_lock/cons/time_point_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/locks/upgrade_lock/cons/try_to_lock_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/locks/upgrade_lock/locking/lock_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/locks/upgrade_lock/locking/try_lock_for_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/locks/upgrade_lock/locking/try_lock_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/locks/upgrade_lock/locking/try_lock_until_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/locks/upgrade_lock/locking/unlock_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/locks/upgrade_lock/mod/member_swap_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/locks/upgrade_lock/mod/non_member_swap_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/locks/upgrade_lock/mod/release_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/locks/upgrade_lock/obs/mutex_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/locks/upgrade_lock/obs/op_bool_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/locks/upgrade_lock/obs/owns_lock_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/locks/upgrade_lock/types_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})

#test-suite  ts_strict_lock
cm_test(NAME thread_test_sync_mutual_exclusion_locks_strict_lock_copy_assign_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/./sync/mutual_exclusion/locks/strict_lock/copy_assign_fail.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME thread_test_sync_mutual_exclusion_locks_strict_lock_copy_ctor_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/./sync/mutual_exclusion/locks/strict_lock/copy_ctor_fail.cpp COMPILE_ONLY WILL_FAIL)
thread_run(SOURCES ./sync/mutual_exclusion/locks/strict_lock/default_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/locks/strict_lock/owns_lock_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/locks/strict_lock/types_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/locks/strict_lock/make_strict_lock_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})

#test-suite  ts_nested_strict_lock
cm_test(NAME thread_test_sync_mutual_exclusion_locks_nested_strict_lock_copy_assign_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/./sync/mutual_exclusion/locks/nested_strict_lock/copy_assign_fail.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME thread_test_sync_mutual_exclusion_locks_nested_strict_lock_copy_ctor_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/./sync/mutual_exclusion/locks/nested_strict_lock/copy_ctor_fail.cpp COMPILE_ONLY WILL_FAIL)
thread_run(SOURCES ./sync/mutual_exclusion/locks/nested_strict_lock/default_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/locks/nested_strict_lock/owns_lock_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/locks/nested_strict_lock/types_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/locks/nested_strict_lock/make_nested_strict_lock_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})


#test-suite ts_once
#cm_test(NAME SOURCES ${CURRENT_TEST_SOURCES_DIR}/./sync/mutual_exclusion/once/once_flag/assign_fail.cpp COMPILE_ONLY WILL_FAIL)
#cm_test(NAME SOURCES ${CURRENT_TEST_SOURCES_DIR}/./sync/mutual_exclusion/once/once_flag/copy_fail.cpp COMPILE_ONLY WILL_FAIL)
#thread_run(SOURCES ./sync/mutual_exclusion/once/once_flag/default_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/once/call_once/call_once_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})

#test-suite ts_mutex
cm_test(NAME thread_test_sync_mutual_exclusion_mutex_assign_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/./sync/mutual_exclusion/mutex/assign_fail.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME thread_test_sync_mutual_exclusion_mutex_copy_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/./sync/mutual_exclusion/mutex/copy_fail.cpp COMPILE_ONLY WILL_FAIL)
thread_run(SOURCES ./sync/mutual_exclusion/mutex/default_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/mutex/lock_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
if (win32)
    thread_run(SOURCES  ./sync/mutual_exclusion/mutex/native_handle_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
endif()
thread_run(SOURCES ./sync/mutual_exclusion/mutex/try_lock_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})

#test-suite ts_recursive_mutex
cm_test(NAME thread_test_sync_mutual_exclusion_recursive_mutex_assign_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/./sync/mutual_exclusion/recursive_mutex/assign_fail.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME thread_test_sync_mutual_exclusion_recursive_mutex_copy_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/./sync/mutual_exclusion/recursive_mutex/copy_fail.cpp COMPILE_ONLY WILL_FAIL)
thread_run(SOURCES ./sync/mutual_exclusion/recursive_mutex/default_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/recursive_mutex/lock_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
if (win32)
    thread_run(SOURCES  ./sync/mutual_exclusion/recursive_mutex/native_handle_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
endif()
thread_run(SOURCES ./sync/mutual_exclusion/recursive_mutex/try_lock_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})

#test-suite ts_recursive_timed_mutex
cm_test(NAME thread_test_sync_mutual_exclusion_recursive_timed_mutex_assign_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/./sync/mutual_exclusion/recursive_timed_mutex/assign_fail.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME thread_test_sync_mutual_exclusion_recursive_timed_mutex_copy_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/./sync/mutual_exclusion/recursive_timed_mutex/copy_fail.cpp COMPILE_ONLY WILL_FAIL  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/recursive_timed_mutex/default_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/recursive_timed_mutex/lock_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
if (win32)
    thread_run(SOURCES  ./sync/mutual_exclusion/recursive_timed_mutex/native_handle_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
endif()
thread_run(SOURCES ./sync/mutual_exclusion/recursive_timed_mutex/try_lock_for_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/recursive_timed_mutex/try_lock_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/recursive_timed_mutex/try_lock_until_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})

#test-suite ts_timed_mutex
cm_test(NAME thread_test_sync_mutual_exclusion_timed_mutex_assign_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/./sync/mutual_exclusion/timed_mutex/assign_fail.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME thread_test_sync_mutual_exclusion_timed_mutex_copy_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/./sync/mutual_exclusion/timed_mutex/copy_fail.cpp COMPILE_ONLY WILL_FAIL)
thread_run(SOURCES ./sync/mutual_exclusion/timed_mutex/default_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/timed_mutex/lock_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
if (win32)
    thread_run(SOURCES  ./sync/mutual_exclusion/timed_mutex/native_handle_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
endif()
thread_run(SOURCES ./sync/mutual_exclusion/timed_mutex/try_lock_for_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/timed_mutex/try_lock_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/timed_mutex/try_lock_until_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})

#test-suite ts_shared_mutex
cm_test(NAME thread_test_sync_mutual_exclusion_shared_mutex_assign_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/./sync/mutual_exclusion/shared_mutex/assign_fail.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME thread_test_sync_mutual_exclusion_shared_mutex_copy_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/./sync/mutual_exclusion/shared_mutex/copy_fail.cpp COMPILE_ONLY WILL_FAIL)
thread_run(SOURCES ./sync/mutual_exclusion/shared_mutex/default_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/shared_mutex/lock_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/shared_mutex/try_lock_for_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/shared_mutex/try_lock_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/shared_mutex/try_lock_until_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})

#[ thread-run2-h ./sync/mutual_exclusion/shared_mutex/default_pass.cpp)

#test-suite ts_null_mutex
cm_test(NAME thread_test_sync_mutual_exclusion_null_mutex_assign_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/./sync/mutual_exclusion/null_mutex/assign_fail.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME thread_test_sync_mutual_exclusion_null_mutex_copy_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/./sync/mutual_exclusion/null_mutex/copy_fail.cpp COMPILE_ONLY WILL_FAIL)
thread_run(SOURCES ./sync/mutual_exclusion/null_mutex/default_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/null_mutex/lock_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/null_mutex/try_lock_for_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/null_mutex/try_lock_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/null_mutex/try_lock_until_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})

#test-suite ts_sync_queue
thread_run(SOURCES ./sync/mutual_exclusion/sync_queue/single_thread_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/sync_queue/multi_thread_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})

#test-suite ts_sync_deque
thread_run(SOURCES ./sync/mutual_exclusion/sync_deque/single_thread_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/sync_deque/multi_thread_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})

#test-suite ts_sync_bounded_queue
thread_run(SOURCES ./sync/mutual_exclusion/sync_bounded_queue/single_thread_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/sync_bounded_queue/multi_thread_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})

#test-suite ts_sync_pq
thread_run(SOURCES ./sync/mutual_exclusion/sync_pq/pq_single_thread_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/sync_pq/pq_multi_thread_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})

#test-suite ts_sync_tq
thread_run(SOURCES ./sync/mutual_exclusion/sync_pq/tq_single_thread_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
#thread_run(SOURCES ./sync/mutual_exclusion/sync_pq/tq_multi_thread_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})

#test-suite ts_scheduler
thread_run(SOURCES ./test_scheduled_tp.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./test_scheduling_adaptor.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./test_scheduler.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})

#test-suite ts_queue_views
thread_run(SOURCES ./sync/mutual_exclusion/queue_views/single_thread_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
#thread_run(SOURCES ./sync/mutual_exclusion/queue_views/multi_thread_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})

#test-suite ts_deque_views
thread_run(SOURCES ./sync/mutual_exclusion/deque_views/single_thread_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
#thread_run(SOURCES ./sync/mutual_exclusion/deque_views/multi_thread_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})

#test-suite ts_this_thread
thread_run(SOURCES ./threads/this_thread/get_id/get_id_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./threads/this_thread/sleep_for/sleep_for_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./threads/this_thread/sleep_until/sleep_until_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})

#test-suite ts_thread
cm_test(NAME thread_test_threads_thread_assign_copy_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/./threads/thread/assign/copy_fail.cpp COMPILE_ONLY WILL_FAIL)
thread_run(SOURCES ./threads/thread/assign/move_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME thread_test_threads_thread_constr_copy_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/./threads/thread/constr/copy_fail.cpp COMPILE_ONLY WILL_FAIL)
thread_run(SOURCES ./threads/thread/constr/default_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./threads/thread/constr/lambda_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./threads/thread/constr/F_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./threads/thread/constr/FArgs_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./threads/thread/constr/Frvalue_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./threads/thread/constr/FrvalueArgs_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./threads/thread/constr/move_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./threads/thread/destr/dtor_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./threads/thread/id/hash_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./threads/thread/members/detach_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./threads/thread/members/get_id_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./threads/thread/members/join_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./threads/thread/members/try_join_until_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./threads/thread/members/try_join_for_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./threads/thread/members/joinable_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./threads/thread/members/native_handle_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./threads/thread/members/swap_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./threads/thread/non_members/swap_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./threads/thread/static/hardware_concurrency_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})

#test-suite ts_container
thread_run(SOURCES ./threads/container/thread_vector_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./threads/container/thread_ptr_list_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})

#test-suite ts_examples
thread_run(SOURCES ../example/monitor.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME thread_test___example_starvephil SOURCES ${CURRENT_TEST_SOURCES_DIR}/../example/starvephil.cpp COMPILE_ONLY SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ../example/tennis.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME thread_test___example_condition SOURCES ${CURRENT_TEST_SOURCES_DIR}/../example/condition.cpp COMPILE_ONLY SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ../example/mutex.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ../example/once.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ../example/recursive_mutex.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ../example/thread.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ../example/thread_group.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ../example/tss.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ../example/xtime.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ../example/shared_monitor.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ../example/shared_mutex.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
#thread_run(SOURCES ../example/vhh_shared_monitor.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
#thread_run(SOURCES ../example/vhh_shared_mutex.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ../example/make_future.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ../example/future_then.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ../example/future_fallback_to.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ../example/future_unwrap.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ../example/synchronized_value.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ../example/synchronized_person.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ../example/thread_guard.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ../example/scoped_thread.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ../example/strict_lock.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ../example/ba_externallly_locked.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ../example/producer_consumer_bounded.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ../example/producer_consumer.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ../example/producer_consumer2.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ../example/not_interleaved.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ../example/lambda_future.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ../example/not_interleaved2.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ../example/thread_pool.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ../example/user_scheduler.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ../example/executor.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ../example/generic_executor_ref.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ../example/serial_executor.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ../example/serial_executor_cont.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ../example/future_when_all.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ../example/parallel_accumulate.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ../example/parallel_quick_sort.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ../example/with_lock_guard.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ../example/fib_task_region.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})

#test-suite ts_shared_upwards
thread_run(SOURCES ./sync/mutual_exclusion/locks/unique_lock/cons/move_ctor_shared_lock_try_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/locks/unique_lock/cons/move_ctor_shared_lock_for_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/locks/unique_lock/cons/move_ctor_shared_lock_until_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})

thread_run(SOURCES ./sync/mutual_exclusion/locks/upgrade_lock/cons/move_ctor_shared_lock_try_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/locks/upgrade_lock/cons/move_ctor_shared_lock_for_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/locks/upgrade_lock/cons/move_ctor_shared_lock_until_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})

#test-suite ts_shared_lock_guard
cm_test(NAME thread_test_sync_mutual_exclusion_locks_shared_lock_guard_copy_assign_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/./sync/mutual_exclusion/locks/shared_lock_guard/copy_assign_fail.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME thread_test_sync_mutual_exclusion_locks_shared_lock_guard_copy_ctor_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/./sync/mutual_exclusion/locks/shared_lock_guard/copy_ctor_fail.cpp COMPILE_ONLY WILL_FAIL)
thread_run(SOURCES ./sync/mutual_exclusion/locks/shared_lock_guard/adopt_lock_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/locks/shared_lock_guard/default_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/locks/shared_lock_guard/types_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})

#test-suite ts_reverse_lock
cm_test(NAME thread_test_sync_mutual_exclusion_locks_reverse_lock_copy_assign_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/./sync/mutual_exclusion/locks/reverse_lock/copy_assign_fail.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME thread_test_sync_mutual_exclusion_locks_reverse_lock_copy_ctor_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/./sync/mutual_exclusion/locks/reverse_lock/copy_ctor_fail.cpp COMPILE_ONLY WILL_FAIL)
thread_run(SOURCES ./sync/mutual_exclusion/locks/reverse_lock/unique_lock_ctor_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/locks/reverse_lock/types_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})


#test-suite ts_synchronized_value
thread_run(SOURCES ./sync/mutual_exclusion/synchronized_value/copy_assign_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/synchronized_value/copy_ctor_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/synchronized_value/copy_T_assign_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/synchronized_value/copy_T_ctor_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/synchronized_value/default_ctor_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/synchronized_value/indirect_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/synchronized_value/move_assign_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/synchronized_value/move_ctor_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/synchronized_value/move_T_assign_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/synchronized_value/move_T_ctor_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/synchronized_value/swap_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/synchronized_value/swap_T_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/synchronized_value/synchronize_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/synchronized_value/call_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})

#test-suite ts_with_lock_guard
thread_run(SOURCES ./sync/mutual_exclusion/with_lock_guard/with_lock_guard_simple.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/with_lock_guard/with_lock_guard_bind.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/with_lock_guard/with_lock_guard_move.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./sync/mutual_exclusion/with_lock_guard/with_lock_guard_lambda.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})

#test-suite ts_invoke
thread_run(SOURCES ./functional/invoke/invoke_int_0_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./functional/invoke/invoke_lvalue_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./functional/invoke/invoke_rvalue_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})

#test-suite ts_invoker
thread_run(SOURCES ./functional/invoker/invoker_int_0_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
#thread_run(SOURCES ./functional/invoker/invoker_lvalue_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ./functional/invoker/invoker_rvalue_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})

#test-suite ts_more
thread_run(SOURCES test_7666.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES test_7720.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES test_7755.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES test_8455.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES test_8508.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
#thread_run(SOURCES test_8557.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES test_8586.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES test_8943.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES test_8960.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES test_9079_a.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES test_9079_b.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES test_9192.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
#thread_run(SOURCES test_9303.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
#thread_run(SOURCES test_9720.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
#thread_run(SOURCES test_10125.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
#thread_run(SOURCES test_10128.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
#thread_run(SOURCES test_10340.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})

#test-suite ts_more_cpp11
thread_run(SOURCES test_8596.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES test_8600.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})

#test-suite perf
#thread_run(SOURCES ../example/perf_condition_variable.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
#thread_run(SOURCES ../example/perf_shared_mutex.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})

#test-suite ts_exception_list
thread_run(SOURCES ./experimental/parallel/v1/exception_list_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})

#test-suite ts_task_region
thread_run(SOURCES ./experimental/parallel/v2/task_region_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})

#test-suite ts_other
thread_run(SOURCES ../example/this_executor.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
thread_run(SOURCES ../example/default_executor.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})

#test-suite ts_
#[ thread-run test_11256.cpp ] 
#[ thread-run test_11256.cpp ]
#[ thread-run test_11499.cpp ]
#[ thread-run test_11611.cpp ]
#[ thread-run test_11818.cpp ]
thread_run(SOURCES test_11796 SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})