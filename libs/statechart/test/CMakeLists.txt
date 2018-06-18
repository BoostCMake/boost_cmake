include(BCMTest)

find_package(${CMAKE_WORKSPACE_NAME}_test)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_statechart
                       ${CMAKE_WORKSPACE_NAME}::assign
                       ${CMAKE_WORKSPACE_NAME}::test
                       )
set(normal)
set(native -DBOOST_STATECHART_USE_NATIVE_RTTI)
set(relaxed -DBOOST_STATECHART_RELAX_TRANSITION_CONTEXT)
set(both ${native} ${relaxed})

function(statechart_st_run_variants NAME)
    cm_test(NAME statechart_test_${NAME}_normal SOURCES ${NAME}.cpp)
    target_compile_definitions(statechart_test_${NAME}_normal PRIVATE ${normal})

    cm_test(NAME statechart_test_${NAME}_native SOURCES ${NAME}.cpp)
    target_compile_definitions(statechart_test_${NAME}_native PRIVATE ${native})

    cm_test(NAME statechart_test_${NAME}_relaxed SOURCES ${NAME}.cpp)
    target_compile_definitions(statechart_test_${NAME}_relaxed PRIVATE ${relaxed})

    cm_test(NAME statechart_test_${NAME}_both SOURCES ${NAME}.cpp)
    target_compile_definitions(statechart_test_${NAME}_both PRIVATE ${both})
endfunction(statechart_st_run_variants)

function(statechart_compile_fail_variants NAME)
    cm_test(NAME statechart_test_${NAME}_normal SOURCES ${NAME}.cpp COMPILE_ONLY WILL_FAIL)
    target_compile_definitions(statechart_test_${NAME}_normal PRIVATE ${normal})

    cm_test(NAME statechart_test_${NAME}_native SOURCES ${NAME}.cpp COMPILE_ONLY WILL_FAIL)
    target_compile_definitions(statechart_test_${NAME}_native PRIVATE ${native})

    cm_test(NAME statechart_test_${NAME}_relaxed SOURCES ${NAME}.cpp COMPILE_ONLY WILL_FAIL)
    target_compile_definitions(statechart_test_${NAME}_relaxed PRIVATE ${relaxed})

    cm_test(NAME statechart_test_${NAME}_both SOURCES ${NAME}.cpp COMPILE_ONLY WILL_FAIL)
    target_compile_definitions(statechart_test_${NAME}_both PRIVATE ${both})
endfunction(statechart_compile_fail_variants)

function(statechart_st_lib_run NAME)

endfunction()

statechart_compile_fail_variants(InvalidChartTest1)
statechart_compile_fail_variants(InvalidChartTest2)
statechart_compile_fail_variants(InvalidChartTest3)
statechart_st_run_variants(TransitionTest)
statechart_compile_fail_variants(InvalidTransitionTest1)
statechart_compile_fail_variants(InvalidTransitionTest2)
statechart_st_run_variants(InStateReactionTest)
statechart_st_run_variants(TerminationTest)
statechart_st_run_variants(DeferralTest)
statechart_st_run_variants(DeferralBug)
statechart_st_run_variants(CustomReactionTest)
statechart_compile_fail_variants(InvalidResultAssignTest)
statechart_compile_fail_variants(InvalidResultDefCtorTest)
statechart_st_run_variants(InvalidResultCopyTest)
statechart_st_run_variants(UnconsumedResultTest)
statechart_st_run_variants(HistoryTest)
statechart_compile_fail_variants(InconsistentHistoryTest1)
statechart_compile_fail_variants(InconsistentHistoryTest2)
statechart_compile_fail_variants(InconsistentHistoryTest3)
statechart_compile_fail_variants(InconsistentHistoryTest4)
statechart_compile_fail_variants(InconsistentHistoryTest5)
statechart_compile_fail_variants(InconsistentHistoryTest6)
statechart_compile_fail_variants(InconsistentHistoryTest7)
statechart_compile_fail_variants(InconsistentHistoryTest8)
statechart_compile_fail_variants(UnsuppDeepHistoryTest)
statechart_st_run_variants(StateCastTest)
statechart_st_run_variants(TypeInfoTest)
statechart_st_run_variants(StateIterationTest)
statechart_st_run_variants(FifoSchedulerTest)
statechart_st_run_variants(TriggeringEventTest)

#fix it
add_library(TuTestLibNormal STATIC TuTest.cpp)
target_compile_definitions(TuTestLibNormal PRIVATE ${normal})
target_link_libraries(TuTestLibNormal PRIVATE ${CMAKE_WORKSPACE_NAME}::assign ${CMAKE_WORKSPACE_NAME}::statechart)

add_library(TuTestLibNative STATIC TuTest.cpp)
target_compile_definitions(TuTestLibNative PRIVATE ${native})
target_link_libraries(TuTestLibNative PRIVATE ${CMAKE_WORKSPACE_NAME}::assign ${CMAKE_WORKSPACE_NAME}::statechart)

add_library(TuTestDllNormal SHARED TuTest.cpp)
target_compile_definitions(TuTestDllNormal PRIVATE ${normal})
target_link_libraries(TuTestDllNormal PRIVATE ${CMAKE_WORKSPACE_NAME}::assign ${CMAKE_WORKSPACE_NAME}::statechart)

add_library(TuTestDllNative SHARED TuTest.cpp)
target_compile_definitions(TuTestDllNative PRIVATE ${native})
target_link_libraries(TuTestDllNative PRIVATE ${CMAKE_WORKSPACE_NAME}::assign ${CMAKE_WORKSPACE_NAME}::statechart)

cm_test(NAME statechart_test_TuTestLibNormal SOURCES TuTestMain.cpp)
target_link_libraries(statechart_test_TuTestLibNormal TuTestLibNormal)

cm_test(NAME statechart_test_TuTestLibNative SOURCES TuTestMain.cpp)
target_link_libraries(statechart_test_TuTestLibNative TuTestLibNative)

cm_test(NAME statechart_test_TuTestDllNormal SOURCES TuTestMain.cpp)
target_link_libraries(statechart_test_TuTestDllNormal TuTestDllNormal)

cm_test(NAME statechart_test_TuTestDllNative SOURCES TuTestMain.cpp)
target_link_libraries(statechart_test_TuTestDllNative TuTestDllNative)

cm_test(NAME statechart_test_BitMachine SOURCES ../example/BitMachine/BitMachine.cpp COMPILE_ONLY)
cm_test(NAME statechart_test_Camera SOURCES ../example/Camera/Camera.cpp ../example/Camera/Configuring.cpp ../example/Camera/Main.cpp ../example/Camera/Shooting.cpp COMPILE_ONLY)
cm_test(NAME statechart_test_Handcrafted SOURCES ../example/Handcrafted/Handcrafted.cpp COMPILE_ONLY)
cm_test(NAME statechart_test_Keyboard SOURCES ../example/Keyboard/Keyboard.cpp COMPILE_ONLY)
cm_test(NAME statechart_test_Performance SOURCES ../example/Performance/Performance.cpp COMPILE_ONLY)
cm_test(NAME statechart_test_PingPong SOURCES ../example/PingPong/PingPong.cpp ../example/PingPong/Player.cpp COMPILE_ONLY)
cm_test(NAME statechart_test_StopWatch SOURCES ../example/StopWatch/StopWatch.cpp COMPILE_ONLY)
cm_test(NAME statechart_test_StopWatch2 SOURCES ../example/StopWatch/StopWatch2.cpp COMPILE_ONLY)
