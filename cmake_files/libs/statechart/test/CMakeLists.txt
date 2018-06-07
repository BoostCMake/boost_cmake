include(BCMTest)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)

find_package(${CMAKE_WORKSPACE_NAME}_test)

bcm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_statechart
                        boost::assign
                        boost::test
                        )
set(normal)
set(native -DBOOST_STATECHART_USE_NATIVE_RTTI)
set(relaxed -DBOOST_STATECHART_RELAX_TRANSITION_CONTEXT)
set(both ${native} ${relaxed})

function(statechart_st_run_variants NAME NEED_PATCH)
    bcm_test(NAME statechart_test_${NAME}_normal SOURCES ${CMAKE_WORKSPACE_SOURCE}/${NAME}.cpp ${NEED_PATCH})
    target_compile_definitions(statechart_test_${NAME}_normal PRIVATE ${normal})

    bcm_test(NAME statechart_test_${NAME}_native SOURCES ${CMAKE_WORKSPACE_SOURCE}/${NAME}.cpp ${NEED_PATCH})
    target_compile_definitions(statechart_test_${NAME}_native PRIVATE ${native})

    bcm_test(NAME statechart_test_${NAME}_relaxed SOURCES ${CMAKE_WORKSPACE_SOURCE}/${NAME}.cpp ${NEED_PATCH})
    target_compile_definitions(statechart_test_${NAME}_relaxed PRIVATE ${relaxed})

    bcm_test(NAME statechart_test_${NAME}_both SOURCES ${CMAKE_WORKSPACE_SOURCE}/${NAME}.cpp ${NEED_PATCH})
    target_compile_definitions(statechart_test_${NAME}_both PRIVATE ${both})
endfunction(statechart_st_run_variants)

function(statechart_compile_fail_variants NAME)
    bcm_test(NAME statechart_test_${NAME}_normal SOURCES ${CMAKE_WORKSPACE_SOURCE}/${NAME}.cpp COMPILE_ONLY WILL_FAIL ${NEED_PATCH})
    target_compile_definitions(statechart_test_${NAME}_normal PRIVATE ${normal})

    bcm_test(NAME statechart_test_${NAME}_native SOURCES ${CMAKE_WORKSPACE_SOURCE}/${NAME}.cpp COMPILE_ONLY WILL_FAIL ${NEED_PATCH})
    target_compile_definitions(statechart_test_${NAME}_native PRIVATE ${native})

    bcm_test(NAME statechart_test_${NAME}_relaxed SOURCES ${CMAKE_WORKSPACE_SOURCE}/${NAME}.cpp COMPILE_ONLY WILL_FAIL ${NEED_PATCH})
    target_compile_definitions(statechart_test_${NAME}_relaxed PRIVATE ${relaxed})

    bcm_test(NAME statechart_test_${NAME}_both SOURCES ${CMAKE_WORKSPACE_SOURCE}/${NAME}.cpp COMPILE_ONLY WILL_FAIL ${NEED_PATCH})
    target_compile_definitions(statechart_test_${NAME}_both PRIVATE ${both})
endfunction(statechart_compile_fail_variants)

function(statechart_st_lib_run NAME)

endfunction()

statechart_compile_fail_variants(InvalidChartTest1 )
statechart_compile_fail_variants(InvalidChartTest2 )
statechart_compile_fail_variants(InvalidChartTest3 )
statechart_st_run_variants(TransitionTest NEED_PATCH)
statechart_compile_fail_variants(InvalidTransitionTest1 )
statechart_compile_fail_variants(InvalidTransitionTest2 )
statechart_st_run_variants(InStateReactionTest NEED_PATCH)
statechart_st_run_variants(TerminationTest NEED_PATCH)
statechart_st_run_variants(DeferralTest NEED_PATCH)
statechart_st_run_variants(DeferralBug NEED_PATCH)
statechart_st_run_variants(CustomReactionTest NEED_PATCH)
statechart_compile_fail_variants(InvalidResultAssignTest )
statechart_compile_fail_variants(InvalidResultDefCtorTest )
statechart_st_run_variants(InvalidResultCopyTest NEED_PATCH)
statechart_st_run_variants(UnconsumedResultTest NEED_PATCH)
statechart_st_run_variants(HistoryTest NEED_PATCH)
statechart_compile_fail_variants(InconsistentHistoryTest1 )
statechart_compile_fail_variants(InconsistentHistoryTest2 )
statechart_compile_fail_variants(InconsistentHistoryTest3 )
statechart_compile_fail_variants(InconsistentHistoryTest4 )
statechart_compile_fail_variants(InconsistentHistoryTest5 )
statechart_compile_fail_variants(InconsistentHistoryTest6 )
statechart_compile_fail_variants(InconsistentHistoryTest7 )
statechart_compile_fail_variants(InconsistentHistoryTest8 )
statechart_compile_fail_variants(UnsuppDeepHistoryTest )
statechart_st_run_variants(StateCastTest NEED_PATCH)
statechart_st_run_variants(TypeInfoTest NEED_PATCH)
statechart_st_run_variants(StateIterationTest NEED_PATCH)
statechart_st_run_variants(FifoSchedulerTest NEED_PATCH)
statechart_st_run_variants(TriggeringEventTest NEED_PATCH)

#fix it
add_library(TuTestLibNormal STATIC ${CMAKE_WORKSPACE_SOURCE}/TuTest.cpp)
target_compile_definitions(TuTestLibNormal PRIVATE ${normal})
target_link_libraries(TuTestLibNormal PRIVATE boost::assign boost::statechart)

add_library(TuTestLibNative STATIC ${CMAKE_WORKSPACE_SOURCE}/TuTest.cpp)
target_compile_definitions(TuTestLibNative PRIVATE ${native})
target_link_libraries(TuTestLibNative PRIVATE boost::assign boost::statechart)

add_library(TuTestDllNormal SHARED ${CMAKE_WORKSPACE_SOURCE}/TuTest.cpp)
target_compile_definitions(TuTestDllNormal PRIVATE ${normal})
target_link_libraries(TuTestDllNormal PRIVATE boost::assign boost::statechart)

add_library(TuTestDllNative SHARED ${CMAKE_WORKSPACE_SOURCE}/TuTest.cpp)
target_compile_definitions(TuTestDllNative PRIVATE ${native})
target_link_libraries(TuTestDllNative PRIVATE boost::assign boost::statechart)

bcm_test(NAME statechart_test_TuTestLibNormal SOURCES ${CMAKE_WORKSPACE_SOURCE}/TuTestMain.cpp NEED_PATCH)
target_link_libraries(statechart_test_TuTestLibNormal TuTestLibNormal)

bcm_test(NAME statechart_test_TuTestLibNative SOURCES ${CMAKE_WORKSPACE_SOURCE}/TuTestMain.cpp NEED_PATCH)
target_link_libraries(statechart_test_TuTestLibNative TuTestLibNative)

bcm_test(NAME statechart_test_TuTestDllNormal SOURCES ${CMAKE_WORKSPACE_SOURCE}/TuTestMain.cpp NEED_PATCH)
target_link_libraries(statechart_test_TuTestDllNormal TuTestDllNormal)

bcm_test(NAME statechart_test_TuTestDllNative SOURCES ${CMAKE_WORKSPACE_SOURCE}/TuTestMain.cpp NEED_PATCH)
target_link_libraries(statechart_test_TuTestDllNative TuTestDllNative)

bcm_test(NAME statechart_test_BitMachine SOURCES ${CMAKE_WORKSPACE_SOURCE}/../example/BitMachine/BitMachine.cpp COMPILE_ONLY)
bcm_test(NAME statechart_test_Camera SOURCES ${CMAKE_WORKSPACE_SOURCE}/../example/Camera/Camera.cpp ${CMAKE_WORKSPACE_SOURCE}/../example/Camera/Configuring.cpp ${CMAKE_WORKSPACE_SOURCE}/../example/Camera/Main.cpp ${CMAKE_WORKSPACE_SOURCE}/../example/Camera/Shooting.cpp COMPILE_ONLY)
bcm_test(NAME statechart_test_Handcrafted SOURCES ${CMAKE_WORKSPACE_SOURCE}/../example/Handcrafted/Handcrafted.cpp COMPILE_ONLY)
bcm_test(NAME statechart_test_Keyboard SOURCES ${CMAKE_WORKSPACE_SOURCE}/../example/Keyboard/Keyboard.cpp COMPILE_ONLY)
bcm_test(NAME statechart_test_Performance SOURCES ${CMAKE_WORKSPACE_SOURCE}/../example/Performance/Performance.cpp COMPILE_ONLY)
bcm_test(NAME statechart_test_PingPong SOURCES ${CMAKE_WORKSPACE_SOURCE}/../example/PingPong/PingPong.cpp ${CMAKE_WORKSPACE_SOURCE}/../example/PingPong/Player.cpp COMPILE_ONLY)
bcm_test(NAME statechart_test_StopWatch SOURCES ${CMAKE_WORKSPACE_SOURCE}/../example/StopWatch/StopWatch.cpp COMPILE_ONLY)
bcm_test(NAME statechart_test_StopWatch2 SOURCES ${CMAKE_WORKSPACE_SOURCE}/../example/StopWatch/StopWatch2.cpp COMPILE_ONLY)
