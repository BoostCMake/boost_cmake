include(CMTest)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_system
                        )
include(CMProperties)

add_library(system_test_throw_test ${CURRENT_TEST_SOURCES_DIR}/throw_test.cpp)
cm_mark_as_test(system_test_throw_test)
target_link_libraries(system_test_throw_test ${CMAKE_WORKSPACE_NAME}_system)
if(BUILD_SHARED_LIBS)
    target_compile_definitions(system_test_throw_test PUBLIC BOOST_SYSTEM_DYN_LINK=1)
else()
    target_compile_definitions(system_test_throw_test PUBLIC BOOST_SYSTEM_STATIC_LINK=1)
endif()

set_target_properties(system_test_throw_test PROPERTIES CXX_EXCEPTIONS On)

#test-suite "system"
cm_test(NAME system_test_error_code_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/error_code_test.cpp)
cm_test(NAME system_test_error_code_user_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/error_code_user_test.cpp)
cm_test(NAME system_test_system_error_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/system_error_test.cpp)

cm_test(NAME system_test_dynamic_link_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/dynamic_link_test.cpp)
set_target_properties(system_test_dynamic_link_test PROPERTIES CXX_EXCEPTIONS On)

target_link_libraries(system_test_dynamic_link_test system_test_throw_test)

cm_test(NAME system_test_initialization_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/initialization_test.cpp)
cm_test(NAME system_test_header_only_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/header_only_test.cpp)
cm_test(NAME system_test_system_config_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/config_test.cpp)
