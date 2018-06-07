include(BCMTest)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)

find_package(${CMAKE_WORKSPACE_NAME}_asio)
find_package(${CMAKE_WORKSPACE_NAME}_interprocess)
find_package(${CMAKE_WORKSPACE_NAME}_test)
find_package(${CMAKE_WORKSPACE_NAME}_unordered)

bcm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_thread
                        boost::asio
                        boost::interprocess
                        boost::test
                        boost::unordered
                        )

function(thread_run SOURCES)
    string(REPLACE ".cpp" "" NAME "${SOURCES}")
    string(REPLACE "../" "__" NAME "${NAME}")
    string(REPLACE "./" "" NAME "${NAME}")
    string(REPLACE "/" "_" NAME "${NAME}")
    string(REPLACE "." "_" NAME "${NAME}")
    bcm_test(NAME thread_test_${NAME} SOURCES ${CMAKE_WORKSPACE_SOURCE}/winrt_init.cpp ${CMAKE_WORKSPACE_SOURCE}/${SOURCES})
    bcm_test(NAME thread_test_${NAME}_lib SOURCES ${CMAKE_WORKSPACE_SOURCE}/../src/tss_null.cpp ${CMAKE_WORKSPACE_SOURCE}/winrt_init.cpp ${CMAKE_WORKSPACE_SOURCE}/${SOURCES})
endfunction(thread_run)

function(thread_run_h SOURCES)
    string(REPLACE ".cpp" "" NAME "${SOURCES}")
    string(REPLACE "../" "__" NAME "${NAME}")
    string(REPLACE "./" "" NAME "${NAME}")
    string(REPLACE "/" "_" NAME "${NAME}")
    string(REPLACE "." "_" NAME "${NAME}")
    bcm_test(NAME thread_test_${NAME}_h SOURCES ${CMAKE_WORKSPACE_SOURCE}/winrt_init.cpp ${CMAKE_WORKSPACE_SOURCE}/${SOURCES})
    target_compile_definitions(thread_test_${NAME}_h PRIVATE -DBOOST_THREAD_DONT_PROVIDE_INTERRUPTIONS -DBOOST_THREAD_VERSION=3)
endfunction(thread_run_h)

#t_threads
thread_run(test_thread.cpp )
thread_run(test_thread_id.cpp )
thread_run(test_hardware_concurrency.cpp )
thread_run(test_physical_concurrency.cpp )
thread_run(test_thread_move.cpp )
thread_run(test_thread_return_local.cpp )
thread_run(test_thread_move_return.cpp )
thread_run(test_thread_launching.cpp )
thread_run(test_thread_mf.cpp )
thread_run(test_thread_exit.cpp )
thread_run(test_move_function.cpp )
bcm_test(NAME thread_test_no_implicit_move_from_lvalue_thread SOURCES ${CMAKE_WORKSPACE_SOURCE}/no_implicit_move_from_lvalue_thread.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME thread_test_no_implicit_assign_from_lvalue_thread SOURCES ${CMAKE_WORKSPACE_SOURCE}/no_implicit_assign_from_lvalue_thread.cpp COMPILE_ONLY WILL_FAIL)
thread_run(test_tss.cpp )
thread_run(test_xtime.cpp )


#t_sync
thread_run(test_mutex.cpp )
thread_run(test_condition_notify_one.cpp )
thread_run(test_condition_timed_wait_times_out.cpp )
thread_run(test_condition_notify_all.cpp )
thread_run(test_condition.cpp )
thread_run(test_once.cpp )
thread_run(test_barrier.cpp )
thread_run(test_barrier_void_fct.cpp )
thread_run(test_barrier_size_fct.cpp )
thread_run(test_lock_concept.cpp )
thread_run(test_generic_locks.cpp )
thread_run( test_latch.cpp )
thread_run( test_completion_latch.cpp )


#t_shared
thread_run(test_shared_mutex.cpp )
thread_run(test_shared_mutex_part_2.cpp )
thread_run(test_shared_mutex_timed_locks.cpp )
thread_run(test_shared_mutex_timed_locks_chrono.cpp )
#uncomment the following once these works on windows
#thread_run(test_vhh_shared_mutex.cpp )
#thread_run(test_vhh_shared_mutex_part_2.cpp )
#thread_run(test_vhh_shared_mutex_timed_locks.cpp )


#t_futures
thread_run(test_futures.cpp )

#tickets
thread_run(test_2309.cpp )
thread_run(test_2501.cpp )
thread_run(test_2741.cpp )
thread_run(test_3628.cpp )
thread_run(test_4521.cpp )
thread_run(test_4648.cpp )
thread_run(test_4882.cpp )
thread_run(test_5542_1.cpp )
thread_run(test_5542_2.cpp )
thread_run(test_5542_3.cpp )
thread_run(test_5891.cpp )
#thread_run(test_6130.cpp )
#thread_run(test_6170.cpp )
thread_run(test_6174.cpp )
#thread_run(test_7160.cpp )
thread_run(test_7328.cpp )
thread_run(test_7571.cpp )
thread_run(test_9319.cpp )
#thread_run(test_9711.cpp ) This is an invalid use of ::then deferred.
thread_run(test_9856.cpp )
bcm_test(NAME thread_test_test_10963 SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_10963.cpp COMPILE_ONLY)
thread_run(test_10964.cpp )
thread_run(test_11053.cpp )

#oth_tickets
thread_run(test_5351.cpp )
thread_run(test_5502.cpp )

#ts_conditions
bcm_test(NAME thread_test_sync_conditions_condition_variable_assign_fail SOURCES ${CMAKE_WORKSPACE_SOURCE}/./sync/conditions/condition_variable/assign_fail.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME thread_test_sync_conditions_condition_variable_copy_fail SOURCES ${CMAKE_WORKSPACE_SOURCE}/./sync/conditions/condition_variable/copy_fail.cpp COMPILE_ONLY WILL_FAIL)
thread_run(./sync/conditions/condition_variable/default_pass.cpp)
thread_run(./sync/conditions/condition_variable/dtor_pass.cpp)
if (win32)
    thread_run(./sync/conditions/condition_variable/native_handle_pass.cpp)
endif()
thread_run(./sync/conditions/condition_variable/wait_pass.cpp)
thread_run(./sync/conditions/condition_variable/wait_for_pass.cpp)
thread_run(./sync/conditions/condition_variable/wait_for_pred_pass.cpp)
thread_run(./sync/conditions/condition_variable/wait_until_pass.cpp)
thread_run(./sync/conditions/condition_variable/wait_until_pred_pass.cpp)

bcm_test(NAME thread_test_sync_conditions_condition_variable_any_assign_fail SOURCES ${CMAKE_WORKSPACE_SOURCE}/./sync/conditions/condition_variable_any/assign_fail.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME thread_test_sync_conditions_condition_variable_any_copy_fail SOURCES ${CMAKE_WORKSPACE_SOURCE}/./sync/conditions/condition_variable_any/copy_fail.cpp COMPILE_ONLY WILL_FAIL)
thread_run(./sync/conditions/condition_variable_any/default_pass.cpp)
thread_run(./sync/conditions/condition_variable_any/dtor_pass.cpp)
thread_run(./sync/conditions/condition_variable_any/wait_for_pass.cpp)
thread_run(./sync/conditions/condition_variable_any/wait_for_pred_pass.cpp)
thread_run(./sync/conditions/condition_variable_any/wait_until_pass.cpp)
thread_run(./sync/conditions/condition_variable_any/wait_until_pred_pass.cpp)
thread_run(./sync/conditions/cv_status/cv_status_pass.cpp)
thread_run(./sync/conditions/notify_all_at_thread_exit_pass.cpp)

#ts_async
thread_run(./sync/futures/async/async_pass.cpp)
thread_run(./sync/futures/async/async_executor_pass.cpp)

#ts_promise
bcm_test(NAME thread_test_sync_futures_promise_copy_assign_fail SOURCES ${CMAKE_WORKSPACE_SOURCE}/./sync/futures/promise/copy_assign_fail.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME thread_test_sync_futures_promise_copy_ctor_fail SOURCES ${CMAKE_WORKSPACE_SOURCE}/./sync/futures/promise/copy_ctor_fail.cpp COMPILE_ONLY WILL_FAIL)
thread_run(./sync/futures/promise/alloc_ctor_pass.cpp)
thread_run(./sync/futures/promise/default_pass.cpp)
thread_run(./sync/futures/promise/dtor_pass.cpp)
thread_run(./sync/futures/promise/get_future_pass.cpp)
thread_run(./sync/futures/promise/move_ctor_pass.cpp)
thread_run(./sync/futures/promise/move_assign_pass.cpp)
thread_run(./sync/futures/promise/set_exception_pass.cpp)
thread_run(./sync/futures/promise/set_lvalue_pass.cpp)
thread_run(./sync/futures/promise/set_rvalue_pass.cpp)
thread_run(./sync/futures/promise/set_value_const_pass.cpp)
thread_run(./sync/futures/promise/set_value_void_pass.cpp)
thread_run(./sync/futures/promise/emplace_pass.cpp)
thread_run(./sync/futures/promise/use_allocator_pass.cpp)
thread_run(./sync/futures/promise/set_exception_at_thread_exit_pass.cpp)
thread_run(./sync/futures/promise/set_lvalue_at_thread_exit_pass.cpp)
thread_run(./sync/futures/promise/set_rvalue_at_thread_exit_pass.cpp)
thread_run(./sync/futures/promise/set_value_at_thread_exit_const_pass.cpp)
thread_run(./sync/futures/promise/set_value_at_thread_exit_void_pass.cpp)

#ts_make_ready_future
thread_run(./sync/futures/make_ready_future_pass.cpp)

#ts_future
bcm_test(NAME thread_test_sync_futures_future_copy_assign_fail SOURCES ${CMAKE_WORKSPACE_SOURCE}/./sync/futures/future/copy_assign_fail.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME thread_test_sync_futures_future_copy_ctor_fail SOURCES ${CMAKE_WORKSPACE_SOURCE}/./sync/futures/future/copy_ctor_fail.cpp COMPILE_ONLY WILL_FAIL)
thread_run(./sync/futures/future/default_pass.cpp)
thread_run(./sync/futures/future/dtor_pass.cpp)
thread_run(./sync/futures/future/get_pass.cpp)
thread_run(./sync/futures/future/get_or_pass.cpp)
thread_run(./sync/futures/future/move_ctor_pass.cpp)
thread_run(./sync/futures/future/move_assign_pass.cpp)
thread_run(./sync/futures/future/share_pass.cpp)
thread_run(./sync/futures/future/wait_pass.cpp)
thread_run(./sync/futures/future/wait_for_pass.cpp)
thread_run(./sync/futures/future/wait_until_pass.cpp)
thread_run(./sync/futures/future/then_pass.cpp)
thread_run(./sync/futures/future/then_executor_pass.cpp)
thread_run(./sync/futures/future/async_deferred_then_pass.cpp)
thread_run(./sync/futures/future/then_deferred_pass.cpp)

#ts_shared_future
thread_run(./sync/futures/shared_future/copy_assign_pass.cpp)
thread_run(./sync/futures/shared_future/copy_ctor_pass.cpp)
thread_run(./sync/futures/shared_future/default_pass.cpp)
thread_run(./sync/futures/shared_future/dtor_pass.cpp)
thread_run(./sync/futures/shared_future/get_pass.cpp)
thread_run(./sync/futures/shared_future/move_ctor_pass.cpp)
thread_run(./sync/futures/shared_future/move_assign_pass.cpp)
thread_run(./sync/futures/shared_future/wait_pass.cpp)
thread_run(./sync/futures/shared_future/wait_for_pass.cpp)
thread_run(./sync/futures/shared_future/wait_until_pass.cpp)
thread_run(./sync/futures/shared_future/then_pass.cpp)
thread_run(./sync/futures/shared_future/then_executor_pass.cpp)

#ts_packaged_task
thread_run(./sync/futures/packaged_task/alloc_ctor_pass.cpp)
bcm_test(NAME thread_test_sync_futures_packaged_task_copy_assign_fail SOURCES ${CMAKE_WORKSPACE_SOURCE}/./sync/futures/packaged_task/copy_assign_fail.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME thread_test_sync_futures_packaged_task_copy_ctor_fail SOURCES ${CMAKE_WORKSPACE_SOURCE}/./sync/futures/packaged_task/copy_ctor_fail.cpp COMPILE_ONLY WILL_FAIL)
thread_run(./sync/futures/packaged_task/default_ctor_pass.cpp)
thread_run(./sync/futures/packaged_task/func_ctor_pass.cpp)
thread_run(./sync/futures/packaged_task/dtor_pass.cpp)
thread_run(./sync/futures/packaged_task/get_future_pass.cpp)
thread_run(./sync/futures/packaged_task/move_ctor_pass.cpp)
thread_run(./sync/futures/packaged_task/move_assign_pass.cpp)
thread_run(./sync/futures/packaged_task/operator_pass.cpp)
thread_run(./sync/futures/packaged_task/reset_pass.cpp)
thread_run(./sync/futures/packaged_task/use_allocator_pass.cpp)
thread_run(./sync/futures/packaged_task/types_pass.cpp)
thread_run(./sync/futures/packaged_task/member_swap_pass.cpp)
thread_run(./sync/futures/packaged_task/non_member_swap_pass.cpp)
thread_run(./sync/futures/packaged_task/make_ready_at_thread_exit_pass.cpp)

#ts_when_all
thread_run(./sync/futures/when_all/none_pass.cpp)
thread_run(./sync/futures/when_all/one_pass.cpp)
thread_run(./sync/futures/when_all/iterators_pass.cpp)
thread_run(./sync/futures/when_all/variadic_pass.cpp)

#ts_when_any
thread_run(./sync/futures/when_any/none_pass.cpp)
thread_run(./sync/futures/when_any/one_pass.cpp)
thread_run(./sync/futures/when_any/iterators_pass.cpp)
thread_run(./sync/futures/when_any/variadic_pass.cpp)

#ts_lock_guard
bcm_test(NAME thread_test_sync_mutual_exclusion_locks_lock_guard_copy_assign_fail SOURCES ${CMAKE_WORKSPACE_SOURCE}/./sync/mutual_exclusion/locks/lock_guard/copy_assign_fail.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME thread_test_sync_mutual_exclusion_locks_lock_guard_copy_ctor_fail SOURCES ${CMAKE_WORKSPACE_SOURCE}/./sync/mutual_exclusion/locks/lock_guard/copy_ctor_fail.cpp COMPILE_ONLY WILL_FAIL)
thread_run(./sync/mutual_exclusion/locks/lock_guard/adopt_lock_pass.cpp)
thread_run(./sync/mutual_exclusion/locks/lock_guard/default_pass.cpp)
thread_run(./sync/mutual_exclusion/locks/lock_guard/types_pass.cpp)
thread_run(./sync/mutual_exclusion/locks/lock_guard/make_lock_guard_pass.cpp)
thread_run(./sync/mutual_exclusion/locks/lock_guard/make_lock_guard_adopt_lock_pass.cpp)

#ts_unique_lock
bcm_test(NAME thread_test_sync_mutual_exclusion_locks_unique_lock_cons_copy_assign_fail SOURCES ${CMAKE_WORKSPACE_SOURCE}/./sync/mutual_exclusion/locks/unique_lock/cons/copy_assign_fail.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME thread_test_sync_mutual_exclusion_locks_unique_lock_cons_copy_ctor_fail SOURCES ${CMAKE_WORKSPACE_SOURCE}/./sync/mutual_exclusion/locks/unique_lock/cons/copy_ctor_fail.cpp COMPILE_ONLY WILL_FAIL)
thread_run(./sync/mutual_exclusion/locks/unique_lock/cons/adopt_lock_pass.cpp)
thread_run(./sync/mutual_exclusion/locks/unique_lock/cons/default_pass.cpp)
thread_run(./sync/mutual_exclusion/locks/unique_lock/cons/defer_lock_pass.cpp)
thread_run(./sync/mutual_exclusion/locks/unique_lock/cons/duration_pass.cpp)
thread_run(./sync/mutual_exclusion/locks/unique_lock/cons/move_assign_pass.cpp)
thread_run(./sync/mutual_exclusion/locks/unique_lock/cons/move_ctor_pass.cpp)
thread_run(./sync/mutual_exclusion/locks/unique_lock/cons/move_ctor_upgrade_lock_pass.cpp)
thread_run(./sync/mutual_exclusion/locks/unique_lock/cons/move_ctor_upgrade_lock_try_pass.cpp)
thread_run(./sync/mutual_exclusion/locks/unique_lock/cons/move_ctor_upgrade_lock_for_pass.cpp)
thread_run(./sync/mutual_exclusion/locks/unique_lock/cons/move_ctor_upgrade_lock_until_pass.cpp)
thread_run(./sync/mutual_exclusion/locks/unique_lock/cons/mutex_pass.cpp)
thread_run(./sync/mutual_exclusion/locks/unique_lock/cons/time_point_pass.cpp)
thread_run(./sync/mutual_exclusion/locks/unique_lock/cons/try_to_lock_pass.cpp)
thread_run(./sync/mutual_exclusion/locks/unique_lock/locking/lock_pass.cpp)
thread_run(./sync/mutual_exclusion/locks/unique_lock/locking/try_lock_for_pass.cpp)
thread_run(./sync/mutual_exclusion/locks/unique_lock/locking/try_lock_pass.cpp)
thread_run(./sync/mutual_exclusion/locks/unique_lock/locking/try_lock_until_pass.cpp)
thread_run(./sync/mutual_exclusion/locks/unique_lock/locking/unlock_pass.cpp)
thread_run(./sync/mutual_exclusion/locks/unique_lock/mod/member_swap_pass.cpp)
thread_run(./sync/mutual_exclusion/locks/unique_lock/mod/non_member_swap_pass.cpp)
thread_run(./sync/mutual_exclusion/locks/unique_lock/mod/release_pass.cpp)
thread_run(./sync/mutual_exclusion/locks/unique_lock/obs/mutex_pass.cpp)
thread_run(./sync/mutual_exclusion/locks/unique_lock/obs/op_bool_pass.cpp)
#bcm_test(NAME SOURCES ${CMAKE_WORKSPACE_SOURCE}/./sync/mutual_exclusion/locks/unique_lock/obs/op_int_fail.cpp COMPILE_ONLY WILL_FAIL)
thread_run(./sync/mutual_exclusion/locks/unique_lock/obs/owns_lock_pass.cpp)
thread_run(./sync/mutual_exclusion/locks/unique_lock/types_pass.cpp)

#ts_make_unique_lock
thread_run(./sync/mutual_exclusion/locks/unique_lock/cons/make_unique_lock_mutex_pass.cpp)
thread_run(./sync/mutual_exclusion/locks/unique_lock/cons/make_unique_lock_adopt_lock_pass.cpp)
thread_run(./sync/mutual_exclusion/locks/unique_lock/cons/make_unique_lock_defer_lock_pass.cpp)
thread_run(./sync/mutual_exclusion/locks/unique_lock/cons/make_unique_lock_try_to_lock_pass.cpp)

thread_run(./sync/mutual_exclusion/locks/unique_lock/cons/make_unique_locks_mutex_pass.cpp)

#ts_shared_lock
bcm_test(NAME thread_test_sync_mutual_exclusion_locks_shared_lock_cons_copy_assign_fail SOURCES ${CMAKE_WORKSPACE_SOURCE}/./sync/mutual_exclusion/locks/shared_lock/cons/copy_assign_fail.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME thread_test_sync_mutual_exclusion_locks_shared_lock_cons_copy_ctor_fail SOURCES ${CMAKE_WORKSPACE_SOURCE}/./sync/mutual_exclusion/locks/shared_lock/cons/copy_ctor_fail.cpp COMPILE_ONLY WILL_FAIL)
thread_run(./sync/mutual_exclusion/locks/shared_lock/cons/adopt_lock_pass.cpp)
thread_run(./sync/mutual_exclusion/locks/shared_lock/cons/default_pass.cpp)
thread_run(./sync/mutual_exclusion/locks/shared_lock/cons/defer_lock_pass.cpp)
thread_run(./sync/mutual_exclusion/locks/shared_lock/cons/duration_pass.cpp)
thread_run(./sync/mutual_exclusion/locks/shared_lock/cons/move_assign_pass.cpp)
thread_run(./sync/mutual_exclusion/locks/shared_lock/cons/move_ctor_pass.cpp)
thread_run(./sync/mutual_exclusion/locks/shared_lock/cons/move_ctor_unique_lock_pass.cpp)
thread_run(./sync/mutual_exclusion/locks/shared_lock/cons/move_ctor_upgrade_lock_pass.cpp)
thread_run(./sync/mutual_exclusion/locks/shared_lock/cons/mutex_pass.cpp)
thread_run(./sync/mutual_exclusion/locks/shared_lock/cons/time_point_pass.cpp)
thread_run(./sync/mutual_exclusion/locks/shared_lock/cons/try_to_lock_pass.cpp)
thread_run(./sync/mutual_exclusion/locks/shared_lock/locking/lock_pass.cpp)
thread_run(./sync/mutual_exclusion/locks/shared_lock/locking/try_lock_for_pass.cpp)
thread_run(./sync/mutual_exclusion/locks/shared_lock/locking/try_lock_pass.cpp)
thread_run(./sync/mutual_exclusion/locks/shared_lock/locking/try_lock_until_pass.cpp)
thread_run(./sync/mutual_exclusion/locks/shared_lock/locking/unlock_pass.cpp)
thread_run(./sync/mutual_exclusion/locks/shared_lock/mod/member_swap_pass.cpp)
thread_run(./sync/mutual_exclusion/locks/shared_lock/mod/non_member_swap_pass.cpp)
thread_run(./sync/mutual_exclusion/locks/shared_lock/mod/release_pass.cpp)
thread_run(./sync/mutual_exclusion/locks/shared_lock/obs/mutex_pass.cpp)
thread_run(./sync/mutual_exclusion/locks/shared_lock/obs/op_bool_pass.cpp)
thread_run(./sync/mutual_exclusion/locks/shared_lock/obs/owns_lock_pass.cpp)
thread_run(./sync/mutual_exclusion/locks/shared_lock/types_pass.cpp)

#[ thread-run2-h ./sync/mutual_exclusion/locks/shared_lock/cons/default_pass.cpp)
#[ thread-run2-h ./sync/mutual_exclusion/locks/shared_lock/cons/defer_lock_pass.cpp)


#ts_upgrade_lock
bcm_test(NAME thread_test_sync_mutual_exclusion_locks_upgrade_lock_cons_copy_assign_fail SOURCES ${CMAKE_WORKSPACE_SOURCE}/./sync/mutual_exclusion/locks/upgrade_lock/cons/copy_assign_fail.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME thread_test_sync_mutual_exclusion_locks_upgrade_lock_cons_copy_ctor_fail SOURCES ${CMAKE_WORKSPACE_SOURCE}/./sync/mutual_exclusion/locks/upgrade_lock/cons/copy_ctor_fail.cpp COMPILE_ONLY WILL_FAIL)
thread_run(./sync/mutual_exclusion/locks/upgrade_lock/cons/adopt_lock_pass.cpp)
thread_run(./sync/mutual_exclusion/locks/upgrade_lock/cons/default_pass.cpp)
thread_run(./sync/mutual_exclusion/locks/upgrade_lock/cons/defer_lock_pass.cpp)
thread_run(./sync/mutual_exclusion/locks/upgrade_lock/cons/duration_pass.cpp)
thread_run(./sync/mutual_exclusion/locks/upgrade_lock/cons/move_assign_pass.cpp)
thread_run(./sync/mutual_exclusion/locks/upgrade_lock/cons/move_ctor_pass.cpp)
thread_run(./sync/mutual_exclusion/locks/upgrade_lock/cons/move_ctor_unique_lock_pass.cpp)
thread_run(./sync/mutual_exclusion/locks/upgrade_lock/cons/mutex_pass.cpp)
thread_run(./sync/mutual_exclusion/locks/upgrade_lock/cons/time_point_pass.cpp)
thread_run(./sync/mutual_exclusion/locks/upgrade_lock/cons/try_to_lock_pass.cpp)
thread_run(./sync/mutual_exclusion/locks/upgrade_lock/locking/lock_pass.cpp)
thread_run(./sync/mutual_exclusion/locks/upgrade_lock/locking/try_lock_for_pass.cpp)
thread_run(./sync/mutual_exclusion/locks/upgrade_lock/locking/try_lock_pass.cpp)
thread_run(./sync/mutual_exclusion/locks/upgrade_lock/locking/try_lock_until_pass.cpp)
thread_run(./sync/mutual_exclusion/locks/upgrade_lock/locking/unlock_pass.cpp)
thread_run(./sync/mutual_exclusion/locks/upgrade_lock/mod/member_swap_pass.cpp)
thread_run(./sync/mutual_exclusion/locks/upgrade_lock/mod/non_member_swap_pass.cpp)
thread_run(./sync/mutual_exclusion/locks/upgrade_lock/mod/release_pass.cpp)
thread_run(./sync/mutual_exclusion/locks/upgrade_lock/obs/mutex_pass.cpp)
thread_run(./sync/mutual_exclusion/locks/upgrade_lock/obs/op_bool_pass.cpp)
thread_run(./sync/mutual_exclusion/locks/upgrade_lock/obs/owns_lock_pass.cpp)
thread_run(./sync/mutual_exclusion/locks/upgrade_lock/types_pass.cpp)

#ts_strict_lock
bcm_test(NAME thread_test_sync_mutual_exclusion_locks_strict_lock_copy_assign_fail SOURCES ${CMAKE_WORKSPACE_SOURCE}/./sync/mutual_exclusion/locks/strict_lock/copy_assign_fail.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME thread_test_sync_mutual_exclusion_locks_strict_lock_copy_ctor_fail SOURCES ${CMAKE_WORKSPACE_SOURCE}/./sync/mutual_exclusion/locks/strict_lock/copy_ctor_fail.cpp COMPILE_ONLY WILL_FAIL)
thread_run(./sync/mutual_exclusion/locks/strict_lock/default_pass.cpp)
thread_run(./sync/mutual_exclusion/locks/strict_lock/owns_lock_pass.cpp)
thread_run(./sync/mutual_exclusion/locks/strict_lock/types_pass.cpp)
thread_run(./sync/mutual_exclusion/locks/strict_lock/make_strict_lock_pass.cpp)

#ts_nested_strict_lock
bcm_test(NAME thread_test_sync_mutual_exclusion_locks_nested_strict_lock_copy_assign_fail SOURCES ${CMAKE_WORKSPACE_SOURCE}/./sync/mutual_exclusion/locks/nested_strict_lock/copy_assign_fail.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME thread_test_sync_mutual_exclusion_locks_nested_strict_lock_copy_ctor_fail SOURCES ${CMAKE_WORKSPACE_SOURCE}/./sync/mutual_exclusion/locks/nested_strict_lock/copy_ctor_fail.cpp COMPILE_ONLY WILL_FAIL)
thread_run(./sync/mutual_exclusion/locks/nested_strict_lock/default_pass.cpp)
thread_run(./sync/mutual_exclusion/locks/nested_strict_lock/owns_lock_pass.cpp)
thread_run(./sync/mutual_exclusion/locks/nested_strict_lock/types_pass.cpp)
thread_run(./sync/mutual_exclusion/locks/nested_strict_lock/make_nested_strict_lock_pass.cpp)


#ts_once
#bcm_test(NAME SOURCES ${CMAKE_WORKSPACE_SOURCE}/./sync/mutual_exclusion/once/once_flag/assign_fail.cpp COMPILE_ONLY WILL_FAIL)
#bcm_test(NAME SOURCES ${CMAKE_WORKSPACE_SOURCE}/./sync/mutual_exclusion/once/once_flag/copy_fail.cpp COMPILE_ONLY WILL_FAIL)
#thread_run(./sync/mutual_exclusion/once/once_flag/default_pass.cpp)
thread_run(./sync/mutual_exclusion/once/call_once/call_once_pass.cpp)

#ts_mutex
bcm_test(NAME thread_test_sync_mutual_exclusion_mutex_assign_fail SOURCES ${CMAKE_WORKSPACE_SOURCE}/./sync/mutual_exclusion/mutex/assign_fail.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME thread_test_sync_mutual_exclusion_mutex_copy_fail SOURCES ${CMAKE_WORKSPACE_SOURCE}/./sync/mutual_exclusion/mutex/copy_fail.cpp COMPILE_ONLY WILL_FAIL)
thread_run(./sync/mutual_exclusion/mutex/default_pass.cpp)
thread_run(./sync/mutual_exclusion/mutex/lock_pass.cpp)
if (win32)
    thread_run( ./sync/mutual_exclusion/mutex/native_handle_pass.cpp)
endif()
thread_run(./sync/mutual_exclusion/mutex/try_lock_pass.cpp)

#ts_recursive_mutex
bcm_test(NAME thread_test_sync_mutual_exclusion_recursive_mutex_assign_fail SOURCES ${CMAKE_WORKSPACE_SOURCE}/./sync/mutual_exclusion/recursive_mutex/assign_fail.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME thread_test_sync_mutual_exclusion_recursive_mutex_copy_fail SOURCES ${CMAKE_WORKSPACE_SOURCE}/./sync/mutual_exclusion/recursive_mutex/copy_fail.cpp COMPILE_ONLY WILL_FAIL)
thread_run(./sync/mutual_exclusion/recursive_mutex/default_pass.cpp)
thread_run(./sync/mutual_exclusion/recursive_mutex/lock_pass.cpp)
if (win32)
    thread_run( ./sync/mutual_exclusion/recursive_mutex/native_handle_pass.cpp)
endif()
thread_run(./sync/mutual_exclusion/recursive_mutex/try_lock_pass.cpp)

#ts_recursive_timed_mutex
bcm_test(NAME thread_test_sync_mutual_exclusion_recursive_timed_mutex_assign_fail SOURCES ${CMAKE_WORKSPACE_SOURCE}/./sync/mutual_exclusion/recursive_timed_mutex/assign_fail.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME thread_test_sync_mutual_exclusion_recursive_timed_mutex_copy_fail SOURCES ${CMAKE_WORKSPACE_SOURCE}/./sync/mutual_exclusion/recursive_timed_mutex/copy_fail.cpp COMPILE_ONLY WILL_FAIL )
thread_run(./sync/mutual_exclusion/recursive_timed_mutex/default_pass.cpp)
thread_run(./sync/mutual_exclusion/recursive_timed_mutex/lock_pass.cpp)
if (win32)
    thread_run( ./sync/mutual_exclusion/recursive_timed_mutex/native_handle_pass.cpp)
endif()
thread_run(./sync/mutual_exclusion/recursive_timed_mutex/try_lock_for_pass.cpp)
thread_run(./sync/mutual_exclusion/recursive_timed_mutex/try_lock_pass.cpp)
thread_run(./sync/mutual_exclusion/recursive_timed_mutex/try_lock_until_pass.cpp)

#ts_timed_mutex
bcm_test(NAME thread_test_sync_mutual_exclusion_timed_mutex_assign_fail SOURCES ${CMAKE_WORKSPACE_SOURCE}/./sync/mutual_exclusion/timed_mutex/assign_fail.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME thread_test_sync_mutual_exclusion_timed_mutex_copy_fail SOURCES ${CMAKE_WORKSPACE_SOURCE}/./sync/mutual_exclusion/timed_mutex/copy_fail.cpp COMPILE_ONLY WILL_FAIL)
thread_run(./sync/mutual_exclusion/timed_mutex/default_pass.cpp)
thread_run(./sync/mutual_exclusion/timed_mutex/lock_pass.cpp)
if (win32)
    thread_run( ./sync/mutual_exclusion/timed_mutex/native_handle_pass.cpp)
endif()
thread_run(./sync/mutual_exclusion/timed_mutex/try_lock_for_pass.cpp)
thread_run(./sync/mutual_exclusion/timed_mutex/try_lock_pass.cpp)
thread_run(./sync/mutual_exclusion/timed_mutex/try_lock_until_pass.cpp)

#ts_shared_mutex
bcm_test(NAME thread_test_sync_mutual_exclusion_shared_mutex_assign_fail SOURCES ${CMAKE_WORKSPACE_SOURCE}/./sync/mutual_exclusion/shared_mutex/assign_fail.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME thread_test_sync_mutual_exclusion_shared_mutex_copy_fail SOURCES ${CMAKE_WORKSPACE_SOURCE}/./sync/mutual_exclusion/shared_mutex/copy_fail.cpp COMPILE_ONLY WILL_FAIL)
thread_run(./sync/mutual_exclusion/shared_mutex/default_pass.cpp)
thread_run(./sync/mutual_exclusion/shared_mutex/lock_pass.cpp)
thread_run(./sync/mutual_exclusion/shared_mutex/try_lock_for_pass.cpp)
thread_run(./sync/mutual_exclusion/shared_mutex/try_lock_pass.cpp)
thread_run(./sync/mutual_exclusion/shared_mutex/try_lock_until_pass.cpp)

#[ thread-run2-h ./sync/mutual_exclusion/shared_mutex/default_pass.cpp)

#ts_null_mutex
bcm_test(NAME thread_test_sync_mutual_exclusion_null_mutex_assign_fail SOURCES ${CMAKE_WORKSPACE_SOURCE}/./sync/mutual_exclusion/null_mutex/assign_fail.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME thread_test_sync_mutual_exclusion_null_mutex_copy_fail SOURCES ${CMAKE_WORKSPACE_SOURCE}/./sync/mutual_exclusion/null_mutex/copy_fail.cpp COMPILE_ONLY WILL_FAIL)
thread_run(./sync/mutual_exclusion/null_mutex/default_pass.cpp)
thread_run(./sync/mutual_exclusion/null_mutex/lock_pass.cpp)
thread_run(./sync/mutual_exclusion/null_mutex/try_lock_for_pass.cpp)
thread_run(./sync/mutual_exclusion/null_mutex/try_lock_pass.cpp)
thread_run(./sync/mutual_exclusion/null_mutex/try_lock_until_pass.cpp)

#ts_sync_queue
thread_run(./sync/mutual_exclusion/sync_queue/single_thread_pass.cpp)
thread_run(./sync/mutual_exclusion/sync_queue/multi_thread_pass.cpp)

#ts_sync_deque
thread_run(./sync/mutual_exclusion/sync_deque/single_thread_pass.cpp)
thread_run(./sync/mutual_exclusion/sync_deque/multi_thread_pass.cpp)

#ts_sync_bounded_queue
thread_run(./sync/mutual_exclusion/sync_bounded_queue/single_thread_pass.cpp)
thread_run(./sync/mutual_exclusion/sync_bounded_queue/multi_thread_pass.cpp)

#ts_sync_pq
thread_run(./sync/mutual_exclusion/sync_pq/pq_single_thread_pass.cpp)
thread_run(./sync/mutual_exclusion/sync_pq/pq_multi_thread_pass.cpp)

#ts_sync_tq
thread_run(./sync/mutual_exclusion/sync_pq/tq_single_thread_pass.cpp)
#thread_run(./sync/mutual_exclusion/sync_pq/tq_multi_thread_pass.cpp)

#ts_scheduler
thread_run(./test_scheduled_tp.cpp)
thread_run(./test_scheduling_adaptor.cpp)
thread_run(./test_scheduler.cpp)

#ts_queue_views
thread_run(./sync/mutual_exclusion/queue_views/single_thread_pass.cpp)
#thread_run(./sync/mutual_exclusion/queue_views/multi_thread_pass.cpp)

#ts_deque_views
thread_run(./sync/mutual_exclusion/deque_views/single_thread_pass.cpp)
#thread_run(./sync/mutual_exclusion/deque_views/multi_thread_pass.cpp)

#ts_this_thread
thread_run(./threads/this_thread/get_id/get_id_pass.cpp)
thread_run(./threads/this_thread/sleep_for/sleep_for_pass.cpp)
thread_run(./threads/this_thread/sleep_until/sleep_until_pass.cpp)

#ts_thread
bcm_test(NAME thread_test_threads_thread_assign_copy_fail SOURCES ${CMAKE_WORKSPACE_SOURCE}/./threads/thread/assign/copy_fail.cpp COMPILE_ONLY WILL_FAIL)
thread_run(./threads/thread/assign/move_pass.cpp)
bcm_test(NAME thread_test_threads_thread_constr_copy_fail SOURCES ${CMAKE_WORKSPACE_SOURCE}/./threads/thread/constr/copy_fail.cpp COMPILE_ONLY WILL_FAIL)
thread_run(./threads/thread/constr/default_pass.cpp)
thread_run(./threads/thread/constr/lambda_pass.cpp)
thread_run(./threads/thread/constr/F_pass.cpp)
thread_run(./threads/thread/constr/FArgs_pass.cpp)
thread_run(./threads/thread/constr/Frvalue_pass.cpp)
thread_run(./threads/thread/constr/FrvalueArgs_pass.cpp)
thread_run(./threads/thread/constr/move_pass.cpp)
thread_run(./threads/thread/destr/dtor_pass.cpp)
thread_run(./threads/thread/id/hash_pass.cpp)
thread_run(./threads/thread/members/detach_pass.cpp)
thread_run(./threads/thread/members/get_id_pass.cpp)
thread_run(./threads/thread/members/join_pass.cpp)
thread_run(./threads/thread/members/try_join_until_pass.cpp)
thread_run(./threads/thread/members/try_join_for_pass.cpp)
thread_run(./threads/thread/members/joinable_pass.cpp)
thread_run(./threads/thread/members/native_handle_pass.cpp)
thread_run(./threads/thread/members/swap_pass.cpp)
thread_run(./threads/thread/non_members/swap_pass.cpp)
thread_run(./threads/thread/static/hardware_concurrency_pass.cpp)

#ts_container
thread_run(./threads/container/thread_vector_pass.cpp)
thread_run(./threads/container/thread_ptr_list_pass.cpp)

#ts_examples
thread_run(../example/monitor.cpp)
bcm_test(NAME thread_test___example_starvephil SOURCES ${CMAKE_WORKSPACE_SOURCE}/../example/starvephil.cpp COMPILE_ONLY)
thread_run(../example/tennis.cpp)
bcm_test(NAME thread_test___example_condition SOURCES ${CMAKE_WORKSPACE_SOURCE}/../example/condition.cpp COMPILE_ONLY)
thread_run(../example/mutex.cpp)
thread_run(../example/once.cpp)
thread_run(../example/recursive_mutex.cpp)
thread_run(../example/thread.cpp)
thread_run(../example/thread_group.cpp)
thread_run(../example/tss.cpp)
thread_run(../example/xtime.cpp)
thread_run(../example/shared_monitor.cpp)
thread_run(../example/shared_mutex.cpp)
#thread_run(../example/vhh_shared_monitor.cpp )
#thread_run(../example/vhh_shared_mutex.cpp )
thread_run(../example/make_future.cpp)
thread_run(../example/future_then.cpp)
thread_run(../example/future_fallback_to.cpp)
thread_run(../example/future_unwrap.cpp)
thread_run(../example/synchronized_value.cpp)
thread_run(../example/synchronized_person.cpp)
thread_run(../example/thread_guard.cpp)
thread_run(../example/scoped_thread.cpp)
thread_run(../example/strict_lock.cpp)
thread_run(../example/ba_externallly_locked.cpp)
thread_run(../example/producer_consumer_bounded.cpp)
thread_run(../example/producer_consumer.cpp)
thread_run(../example/producer_consumer2.cpp)
thread_run(../example/not_interleaved.cpp)
thread_run(../example/lambda_future.cpp)
thread_run(../example/not_interleaved2.cpp)
thread_run(../example/thread_pool.cpp)
thread_run(../example/user_scheduler.cpp)
thread_run(../example/executor.cpp)
thread_run(../example/generic_executor_ref.cpp)
thread_run(../example/serial_executor.cpp)
thread_run(../example/serial_executor_cont.cpp)
thread_run(../example/future_when_all.cpp)
thread_run(../example/parallel_accumulate.cpp)
thread_run(../example/parallel_quick_sort.cpp)
thread_run(../example/with_lock_guard.cpp)
thread_run(../example/fib_task_region.cpp)

#ts_shared_upwards
thread_run(./sync/mutual_exclusion/locks/unique_lock/cons/move_ctor_shared_lock_try_pass.cpp)
thread_run(./sync/mutual_exclusion/locks/unique_lock/cons/move_ctor_shared_lock_for_pass.cpp)
thread_run(./sync/mutual_exclusion/locks/unique_lock/cons/move_ctor_shared_lock_until_pass.cpp)

thread_run(./sync/mutual_exclusion/locks/upgrade_lock/cons/move_ctor_shared_lock_try_pass.cpp)
thread_run(./sync/mutual_exclusion/locks/upgrade_lock/cons/move_ctor_shared_lock_for_pass.cpp)
thread_run(./sync/mutual_exclusion/locks/upgrade_lock/cons/move_ctor_shared_lock_until_pass.cpp)

#ts_shared_lock_guard
bcm_test(NAME thread_test_sync_mutual_exclusion_locks_shared_lock_guard_copy_assign_fail SOURCES ${CMAKE_WORKSPACE_SOURCE}/./sync/mutual_exclusion/locks/shared_lock_guard/copy_assign_fail.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME thread_test_sync_mutual_exclusion_locks_shared_lock_guard_copy_ctor_fail SOURCES ${CMAKE_WORKSPACE_SOURCE}/./sync/mutual_exclusion/locks/shared_lock_guard/copy_ctor_fail.cpp COMPILE_ONLY WILL_FAIL)
thread_run(./sync/mutual_exclusion/locks/shared_lock_guard/adopt_lock_pass.cpp)
thread_run(./sync/mutual_exclusion/locks/shared_lock_guard/default_pass.cpp)
thread_run(./sync/mutual_exclusion/locks/shared_lock_guard/types_pass.cpp)

#ts_reverse_lock
bcm_test(NAME thread_test_sync_mutual_exclusion_locks_reverse_lock_copy_assign_fail SOURCES ${CMAKE_WORKSPACE_SOURCE}/./sync/mutual_exclusion/locks/reverse_lock/copy_assign_fail.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME thread_test_sync_mutual_exclusion_locks_reverse_lock_copy_ctor_fail SOURCES ${CMAKE_WORKSPACE_SOURCE}/./sync/mutual_exclusion/locks/reverse_lock/copy_ctor_fail.cpp COMPILE_ONLY WILL_FAIL)
thread_run(./sync/mutual_exclusion/locks/reverse_lock/unique_lock_ctor_pass.cpp)
thread_run(./sync/mutual_exclusion/locks/reverse_lock/types_pass.cpp)


#ts_synchronized_value
thread_run(./sync/mutual_exclusion/synchronized_value/copy_assign_pass.cpp)
thread_run(./sync/mutual_exclusion/synchronized_value/copy_ctor_pass.cpp)
thread_run(./sync/mutual_exclusion/synchronized_value/copy_T_assign_pass.cpp)
thread_run(./sync/mutual_exclusion/synchronized_value/copy_T_ctor_pass.cpp)
thread_run(./sync/mutual_exclusion/synchronized_value/default_ctor_pass.cpp)
thread_run(./sync/mutual_exclusion/synchronized_value/indirect_pass.cpp)
thread_run(./sync/mutual_exclusion/synchronized_value/move_assign_pass.cpp)
thread_run(./sync/mutual_exclusion/synchronized_value/move_ctor_pass.cpp)
thread_run(./sync/mutual_exclusion/synchronized_value/move_T_assign_pass.cpp)
thread_run(./sync/mutual_exclusion/synchronized_value/move_T_ctor_pass.cpp)
thread_run(./sync/mutual_exclusion/synchronized_value/swap_pass.cpp)
thread_run(./sync/mutual_exclusion/synchronized_value/swap_T_pass.cpp)
thread_run(./sync/mutual_exclusion/synchronized_value/synchronize_pass.cpp)
thread_run(./sync/mutual_exclusion/synchronized_value/call_pass.cpp)

#ts_with_lock_guard
thread_run(./sync/mutual_exclusion/with_lock_guard/with_lock_guard_simple.cpp)
thread_run(./sync/mutual_exclusion/with_lock_guard/with_lock_guard_bind.cpp)
thread_run(./sync/mutual_exclusion/with_lock_guard/with_lock_guard_move.cpp)
thread_run(./sync/mutual_exclusion/with_lock_guard/with_lock_guard_lambda.cpp)

#ts_invoke
thread_run(./functional/invoke/invoke_int_0_pass.cpp)
thread_run(./functional/invoke/invoke_lvalue_pass.cpp)
thread_run(./functional/invoke/invoke_rvalue_pass.cpp)

#ts_invoker
thread_run(./functional/invoker/invoker_int_0_pass.cpp)
#thread_run(./functional/invoker/invoker_lvalue_pass.cpp)
thread_run(./functional/invoker/invoker_rvalue_pass.cpp)

#ts_more
thread_run(test_7666.cpp )
thread_run(test_7720.cpp )
thread_run(test_7755.cpp )
thread_run(test_8455.cpp )
thread_run(test_8508.cpp )
#thread_run(test_8557.cpp )
thread_run(test_8586.cpp )
thread_run(test_8943.cpp )
thread_run(test_8960.cpp )
thread_run(test_9079_a.cpp )
thread_run(test_9079_b.cpp )
thread_run(test_9192.cpp )
#thread_run(test_9303.cpp )
#thread_run(test_9720.cpp )
#thread_run(test_10125.cpp )
#thread_run(test_10128.cpp )
#thread_run(test_10340.cpp )

#ts_more_cpp11
thread_run(test_8596.cpp )
thread_run(test_8600.cpp )

#perf
#thread_run(../example/perf_condition_variable.cpp )
#thread_run(../example/perf_shared_mutex.cpp )

#ts_exception_list
thread_run(./experimental/parallel/v1/exception_list_pass.cpp)

#ts_task_region
thread_run(./experimental/parallel/v2/task_region_pass.cpp)

#ts_
thread_run(../example/this_executor.cpp)
thread_run(../example/default_executor.cpp)