include(CMTest)

find_package(${CMAKE_WORKSPACE_NAME}_move)
find_package(${CMAKE_WORKSPACE_NAME}_functional)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_any
                        ${CMAKE_WORKSPACE_NAME}::move
                        ${CMAKE_WORKSPACE_NAME}::functional
                        )

cm_test(NAME any_test_any_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/any_test.cpp)

cm_test(NAME any_test_any_test_no_rtti SOURCES ${CURRENT_TEST_SOURCES_DIR}/any_test.cpp)
set_target_properties(any_test_any_test_no_rtti PROPERTIES CXX_RTTI off)

cm_test(NAME any_test_any_test_rv SOURCES ${CURRENT_TEST_SOURCES_DIR}/any_test_rv.cpp)
cm_test(NAME any_test_any_cast_cv_failed SOURCES ${CURRENT_TEST_SOURCES_DIR}/any_cast_cv_failed.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME any_test_any_test_temporary_to_ref_failed SOURCES ${CURRENT_TEST_SOURCES_DIR}/any_test_temporary_to_ref_failed.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME any_test_any_test_cv_to_rv_failed SOURCES ${CURRENT_TEST_SOURCES_DIR}/any_test_cv_to_rv_failed.cpp COMPILE_ONLY WILL_FAIL)
