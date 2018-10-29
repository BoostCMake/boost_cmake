include(CMTest)

find_package(${CMAKE_WORKSPACE_NAME}_foreach)
find_package(${CMAKE_WORKSPACE_NAME}_rational)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_scope_exit
                        ${CMAKE_WORKSPACE_NAME}::foreach
                        ${CMAKE_WORKSPACE_NAME}::rational
                        )


# Copyright (C) 2006-2009, 2012 Alexander Nasonov
# Copyright (C) 2012 Lorenzo Caminiti
# Distributed under the Boost Software License, Version 1.0
# (see accompanying file LICENSE_1_0.txt or a copy at
# http://www.boost.org/LICENSE_1_0.txt)
# Home at http://www.boost.org/libs/scope_exit

function(run_vaseq target)
    cm_test(NAME scope_exit_test_${target} SOURCES ${CURRENT_TEST_SOURCES_DIR}/${target}.cpp)
    target_compile_definitions(scope_exit_test_${target} PUBLIC -DBOOST_TYPEOF_EMULATION)

    cm_test(NAME scope_exit_test_${target}_seq SOURCES ${CURRENT_TEST_SOURCES_DIR}/${target}_seq.cpp)
    target_compile_definitions(scope_exit_test_${target}_seq PUBLIC -DBOOST_TYPEOF_EMULATION)

    cm_test(NAME scope_exit_test_${target}_seq_nova SOURCES ${CURRENT_TEST_SOURCES_DIR}/${target}_seq_nova.cpp)
    target_compile_definitions(scope_exit_test_${target}_seq_nova PUBLIC -DBOOST_TYPEOF_EMULATION)
endfunction(run_vaseq)

function(run_typeof native_target emulation_target)
    cm_test(NAME scope_exit_test_${native_target} SOURCES ${CURRENT_TEST_SOURCES_DIR}/${native_target}.cpp)
    target_compile_definitions(scope_exit_test_${native_target} PUBLIC -DBOOST_TYPEOF_NATIVE)

    cm_test(NAME scope_exit_test_${emulation_target} SOURCES ${CURRENT_TEST_SOURCES_DIR}/${native_target}.cpp)
    target_compile_definitions(scope_exit_test_${emulation_target} PUBLIC -DBOOST_TYPEOF_EMULATION)
endfunction(run_typeof)

function(compile_fail_typeof native_target emulation_target)
    cm_test(NAME scope_exit_test_${native_target} SOURCES ${CURRENT_TEST_SOURCES_DIR}/${native_target}.cpp COMPILE_ONLY WILL_FAIL)
    target_compile_definitions(scope_exit_test_${native_target} PUBLIC -DBOOST_TYPEOF_NATIVE)

    cm_test(NAME scope_exit_test_${emulation_target} SOURCES ${CURRENT_TEST_SOURCES_DIR}/${native_target}.cpp COMPILE_ONLY WILL_FAIL)
    target_compile_definitions(scope_exit_test_${emulation_target} PUBLIC -DBOOST_TYPEOF_EMULATION)
endfunction(compile_fail_typeof)

run_vaseq(same_line)

if (CMAKE_CXX_COMPILER_ID MATCHES "GNU")
    run_vaseq(world)
    run_vaseq(world_checkpoint)
    run_vaseq(world_checkpoint_all)
endif()

run_vaseq(world_this)
run_vaseq(world_tpl)

cm_test(NAME scope_exit_test_world_void SOURCES ${CURRENT_TEST_SOURCES_DIR}/world_void.cpp)
cm_test(NAME scope_exit_test_world_void_nova SOURCES ${CURRENT_TEST_SOURCES_DIR}/world_void_nova.cpp)

run_typeof(native emulation)
run_typeof(native_tpl emulation_tpl)
run_typeof(native_this emulation_this)
run_typeof(native_this_tpl emulation_this_tpl)

compile_fail_typeof(native_const_error emulation_const_error)
compile_fail_typeof(native_cv_error emulation_cv_error)

cm_test(NAME scope_exit_test_native_tu_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/native_tu_test.cpp ${CURRENT_TEST_SOURCES_DIR}/native_tu1.cpp ${CURRENT_TEST_SOURCES_DIR}/native_tu2.cpp)
target_compile_definitions(scope_exit_test_native_tu_test PUBLIC -DBOOST_TYPEOF_NATIVE)
cm_test(NAME scope_exit_test_emulation_tu_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/native_tu_test.cpp ${CURRENT_TEST_SOURCES_DIR}/native_tu1.cpp ${CURRENT_TEST_SOURCES_DIR}/native_tu2.cpp)
target_compile_definitions(scope_exit_test_emulation_tu_test PUBLIC -DBOOST_TYPEOF_EMULATION)
