include(CMTest)

patch_directory(${CURRENT_TEST_SOURCES_DIR} ${CMAKE_CURRENT_SOURCE_DIR}/files ${CMAKE_CURRENT_BINARY_DIR})

find_package(${CMAKE_WORKSPACE_NAME}_test)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_statechart
                        ${CMAKE_WORKSPACE_NAME}::assign
                        ${CMAKE_WORKSPACE_NAME}::test
                        )
set(normal)
set(native -DBOOST_STATECHART_USE_NATIVE_RTTI)
set(relaxed -DBOOST_STATECHART_RELAX_TRANSITION_CONTEXT)
set(both ${native} ${relaxed})

function(statechart_st_run_variants)
    set(options)
    set(multiValueArgs)
    set(oneValueArgs NAME SOURCES_PREFIX HEADER_PREFIX)
    cmake_parse_arguments(PARSE "${options}" "${oneValueArgs}"
            "${multiValueArgs}" ${ARGN} )
    set(ADD_ARG "")
    if (PARSE_HEADER_PREFIX)
        set(ADD_ARG SOURCES_PREFIX ${PARSE_HEADER_PREFIX})
    endif()
    cm_test(NAME statechart_test_${PARSE_NAME}_normal SOURCES ${PARSE_SOURCES_PREFIX}/${PARSE_NAME}.cpp ${ADD_ARG})
    target_compile_definitions(statechart_test_${PARSE_NAME}_normal PRIVATE ${normal})

    cm_test(NAME statechart_test_${PARSE_NAME}_native SOURCES ${PARSE_SOURCES_PREFIX}/${PARSE_NAME}.cpp ${ADD_ARG})
    target_compile_definitions(statechart_test_${PARSE_NAME}_native PRIVATE ${native})

    cm_test(NAME statechart_test_${PARSE_NAME}_relaxed SOURCES ${PARSE_SOURCES_PREFIX}/${PARSE_NAME}.cpp ${ADD_ARG})
    target_compile_definitions(statechart_test_${PARSE_NAME}_relaxed PRIVATE ${relaxed})

    cm_test(NAME statechart_test_${PARSE_NAME}_both SOURCES ${PARSE_SOURCES_PREFIX}/${PARSE_NAME}.cpp ${ADD_ARG})
    target_compile_definitions(statechart_test_${PARSE_NAME}_both PRIVATE ${both})
endfunction(statechart_st_run_variants)

function(statechart_compile_fail_variants)
    set(options)
    set(multiValueArgs)
    set(oneValueArgs NAME SOURCES_PREFIX HEADER_PREFIX)
    cmake_parse_arguments(PARSE "${options}" "${oneValueArgs}"
            "${multiValueArgs}" ${ARGN} )
    set(ADD_ARG "")
    if (PARSE_HEADER_PREFIX)
        set(ADD_ARG SOURCES_PREFIX ${PARSE_HEADER_PREFIX})
    endif()

    cm_test(NAME statechart_test_${PARSE_NAME}_normal SOURCES ${PARSE_SOURCES_PREFIX}/${PARSE_NAME}.cpp COMPILE_ONLY WILL_FAIL ${ADD_ARG})
    target_compile_definitions(statechart_test_${PARSE_NAME}_normal PRIVATE ${normal})

    cm_test(NAME statechart_test_${PARSE_NAME}_native SOURCES ${PARSE_SOURCES_PREFIX}/${PARSE_NAME}.cpp COMPILE_ONLY WILL_FAIL ${ADD_ARG})
    target_compile_definitions(statechart_test_${PARSE_NAME}_native PRIVATE ${native})

    cm_test(NAME statechart_test_${PARSE_NAME}_relaxed SOURCES ${PARSE_SOURCES_PREFIX}/${PARSE_NAME}.cpp COMPILE_ONLY WILL_FAIL ${ADD_ARG})
    target_compile_definitions(statechart_test_${PARSE_NAME}_relaxed PRIVATE ${relaxed})

    cm_test(NAME statechart_test_${PARSE_NAME}_both SOURCES ${PARSE_SOURCES_PREFIX}/${PARSE_NAME}.cpp COMPILE_ONLY WILL_FAIL ${ADD_ARG})
    target_compile_definitions(statechart_test_${PARSE_NAME}_both PRIVATE ${both})
endfunction(statechart_compile_fail_variants)

function(statechart_st_lib_run NAME)

endfunction()

statechart_compile_fail_variants(NAME InvalidChartTest1 SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
statechart_compile_fail_variants(NAME InvalidChartTest2 SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
statechart_compile_fail_variants(NAME InvalidChartTest3 SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
statechart_st_run_variants(NAME TransitionTest SOURCES_PREFIX ${CMAKE_CURRENT_BINARY_DIR} HEADER_PREFIX ${CURRENT_TEST_SOURCES_DIR})
statechart_compile_fail_variants(NAME InvalidTransitionTest1 SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
statechart_compile_fail_variants(NAME InvalidTransitionTest2 SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
statechart_st_run_variants(NAME InStateReactionTest SOURCES_PREFIX ${CMAKE_CURRENT_BINARY_DIR} HEADER_PREFIX ${CURRENT_TEST_SOURCES_DIR})
statechart_st_run_variants(NAME TerminationTest SOURCES_PREFIX ${CMAKE_CURRENT_BINARY_DIR} HEADER_PREFIX ${CURRENT_TEST_SOURCES_DIR})
statechart_st_run_variants(NAME DeferralTest SOURCES_PREFIX ${CMAKE_CURRENT_BINARY_DIR} HEADER_PREFIX ${CURRENT_TEST_SOURCES_DIR})
statechart_st_run_variants(NAME DeferralBug SOURCES_PREFIX ${CMAKE_CURRENT_BINARY_DIR} HEADER_PREFIX ${CURRENT_TEST_SOURCES_DIR})
statechart_st_run_variants(NAME CustomReactionTest SOURCES_PREFIX ${CMAKE_CURRENT_BINARY_DIR} HEADER_PREFIX ${CURRENT_TEST_SOURCES_DIR})
statechart_compile_fail_variants(NAME InvalidResultAssignTest SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
statechart_compile_fail_variants(NAME InvalidResultDefCtorTest SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
statechart_st_run_variants(NAME InvalidResultCopyTest SOURCES_PREFIX ${CMAKE_CURRENT_BINARY_DIR} HEADER_PREFIX ${CURRENT_TEST_SOURCES_DIR})
statechart_st_run_variants(NAME UnconsumedResultTest SOURCES_PREFIX ${CMAKE_CURRENT_BINARY_DIR} HEADER_PREFIX ${CURRENT_TEST_SOURCES_DIR})
statechart_st_run_variants(NAME HistoryTest SOURCES_PREFIX ${CMAKE_CURRENT_BINARY_DIR} HEADER_PREFIX ${CURRENT_TEST_SOURCES_DIR})
statechart_compile_fail_variants(NAME InconsistentHistoryTest1 SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
statechart_compile_fail_variants(NAME InconsistentHistoryTest2 SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
statechart_compile_fail_variants(NAME InconsistentHistoryTest3 SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
statechart_compile_fail_variants(NAME InconsistentHistoryTest4 SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
statechart_compile_fail_variants(NAME InconsistentHistoryTest5 SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
statechart_compile_fail_variants(NAME InconsistentHistoryTest6 SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
statechart_compile_fail_variants(NAME InconsistentHistoryTest7 SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
statechart_compile_fail_variants(NAME InconsistentHistoryTest8 SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
statechart_compile_fail_variants(NAME UnsuppDeepHistoryTest SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
statechart_st_run_variants(NAME StateCastTest SOURCES_PREFIX ${CMAKE_CURRENT_BINARY_DIR} HEADER_PREFIX ${CURRENT_TEST_SOURCES_DIR})
statechart_st_run_variants(NAME TypeInfoTest SOURCES_PREFIX ${CMAKE_CURRENT_BINARY_DIR} HEADER_PREFIX ${CURRENT_TEST_SOURCES_DIR})
statechart_st_run_variants(NAME StateIterationTest SOURCES_PREFIX SOURCES_PREFIX ${CMAKE_CURRENT_BINARY_DIR} HEADER_PREFIX ${CURRENT_TEST_SOURCES_DIR})
statechart_st_run_variants(NAME FifoSchedulerTest SOURCES_PREFIX ${CMAKE_CURRENT_BINARY_DIR} HEADER_PREFIX ${CURRENT_TEST_SOURCES_DIR})
statechart_st_run_variants(NAME TriggeringEventTest SOURCES_PREFIX ${CMAKE_CURRENT_BINARY_DIR} HEADER_PREFIX ${CURRENT_TEST_SOURCES_DIR})

#fix it
add_library(TuTestLibNormal STATIC ${CURRENT_TEST_SOURCES_DIR}/TuTest.cpp)
target_compile_definitions(TuTestLibNormal PRIVATE ${normal})
target_link_libraries(TuTestLibNormal PRIVATE ${CMAKE_WORKSPACE_NAME}::assign ${CMAKE_WORKSPACE_NAME}::statechart)

add_library(TuTestLibNative STATIC ${CURRENT_TEST_SOURCES_DIR}/TuTest.cpp)
target_compile_definitions(TuTestLibNative PRIVATE ${native})
target_link_libraries(TuTestLibNative PRIVATE ${CMAKE_WORKSPACE_NAME}::assign ${CMAKE_WORKSPACE_NAME}::statechart)

add_library(TuTestDllNormal SHARED ${CURRENT_TEST_SOURCES_DIR}/TuTest.cpp)
target_compile_definitions(TuTestDllNormal PRIVATE ${normal})
target_link_libraries(TuTestDllNormal PRIVATE ${CMAKE_WORKSPACE_NAME}::assign ${CMAKE_WORKSPACE_NAME}::statechart)

add_library(TuTestDllNative SHARED ${CURRENT_TEST_SOURCES_DIR}/TuTest.cpp)
target_compile_definitions(TuTestDllNative PRIVATE ${native})
target_link_libraries(TuTestDllNative PRIVATE ${CMAKE_WORKSPACE_NAME}::assign ${CMAKE_WORKSPACE_NAME}::statechart)

cm_test(NAME statechart_test_TuTestLibNormal SOURCES ${CMAKE_CURRENT_BINARY_DIR}/TuTestMain.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
target_link_libraries(statechart_test_TuTestLibNormal TuTestLibNormal)

cm_test(NAME statechart_test_TuTestLibNative SOURCES ${CMAKE_CURRENT_BINARY_DIR}/TuTestMain.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
target_link_libraries(statechart_test_TuTestLibNative TuTestLibNative)

cm_test(NAME statechart_test_TuTestDllNormal SOURCES ${CMAKE_CURRENT_BINARY_DIR}/TuTestMain.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
target_link_libraries(statechart_test_TuTestDllNormal TuTestDllNormal)

cm_test(NAME statechart_test_TuTestDllNative SOURCES ${CMAKE_CURRENT_BINARY_DIR}/TuTestMain.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
target_link_libraries(statechart_test_TuTestDllNative TuTestDllNative)

cm_test(NAME statechart_test_BitMachine SOURCES ${CURRENT_TEST_SOURCES_DIR}/../example/BitMachine/BitMachine.cpp COMPILE_ONLY)
cm_test(NAME statechart_test_Camera SOURCES ${CURRENT_TEST_SOURCES_DIR}/../example/Camera/Camera.cpp ${CURRENT_TEST_SOURCES_DIR}/../example/Camera/Configuring.cpp ${CURRENT_TEST_SOURCES_DIR}/../example/Camera/Main.cpp ${CURRENT_TEST_SOURCES_DIR}/../example/Camera/Shooting.cpp COMPILE_ONLY)
cm_test(NAME statechart_test_Handcrafted SOURCES ${CURRENT_TEST_SOURCES_DIR}/../example/Handcrafted/Handcrafted.cpp COMPILE_ONLY)
cm_test(NAME statechart_test_Keyboard SOURCES ${CURRENT_TEST_SOURCES_DIR}/../example/Keyboard/Keyboard.cpp COMPILE_ONLY)
cm_test(NAME statechart_test_Performance SOURCES ${CURRENT_TEST_SOURCES_DIR}/../example/Performance/Performance.cpp COMPILE_ONLY)
cm_test(NAME statechart_test_PingPong SOURCES ${CURRENT_TEST_SOURCES_DIR}/../example/PingPong/PingPong.cpp ${CURRENT_TEST_SOURCES_DIR}/../example/PingPong/Player.cpp COMPILE_ONLY)
cm_test(NAME statechart_test_StopWatch SOURCES ${CURRENT_TEST_SOURCES_DIR}/../example/StopWatch/StopWatch.cpp COMPILE_ONLY)
cm_test(NAME statechart_test_StopWatch2 SOURCES ${CURRENT_TEST_SOURCES_DIR}/../example/StopWatch/StopWatch2.cpp COMPILE_ONLY)
