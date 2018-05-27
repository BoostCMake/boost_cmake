include(BCMTest)

find_package(${CMAKE_WORKSPACE_NAME}_move)
find_package(${CMAKE_WORKSPACE_NAME}_functional)

bcm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_any
                        boost::move
                        boost::functional
                        )

bcm_test(NAME any_test_any_test SOURCES any_test.cpp)

bcm_test(NAME any_test_any_test_no_rtti SOURCES any_test.cpp)
set_target_properties(any_test_any_test_no_rtti PROPERTIES CXX_RTTI off)

bcm_test(NAME any_test_any_test_rv SOURCES any_test_rv.cpp)
bcm_test(NAME any_test_any_cast_cv_failed SOURCES any_cast_cv_failed.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME any_test_any_test_temporary_to_ref_failed SOURCES any_test_temporary_to_ref_failed.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME any_test_any_test_cv_to_rv_failed SOURCES any_test_cv_to_rv_failed.cpp COMPILE_ONLY WILL_FAIL)
