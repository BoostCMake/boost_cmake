include(BCMTest)

bcm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_system
                        )
include(BCMProperties)

add_library(system_test_throw_test throw_test.cpp)
bcm_mark_as_test(system_test_throw_test)
target_link_libraries(system_test_throw_test ${CMAKE_WORKSPACE_NAME}_system)
if(BUILD_SHARED_LIBS)
    target_compile_definitions(system_test_throw_test PUBLIC BOOST_SYSTEM_DYN_LINK=1)
else()
    target_compile_definitions(system_test_throw_test PUBLIC BOOST_SYSTEM_STATIC_LINK=1)
endif()

set_target_properties(system_test_throw_test PROPERTIES CXX_EXCEPTIONS On)

bcm_test(NAME system_test_error_code_test SOURCES error_code_test.cpp)
bcm_test(NAME system_test_error_code_user_test SOURCES error_code_user_test.cpp)
bcm_test(NAME system_test_system_error_test SOURCES system_error_test.cpp)

bcm_test(NAME system_test_dynamic_link_test SOURCES dynamic_link_test.cpp)
set_target_properties(system_test_dynamic_link_test PROPERTIES CXX_EXCEPTIONS On)

target_link_libraries(system_test_dynamic_link_test system_test_throw_test)

bcm_test(NAME system_test_initialization_test SOURCES initialization_test.cpp)
bcm_test(NAME system_test_header_only_test SOURCES header_only_test.cpp)
bcm_test(NAME system_test_system_config_test SOURCES config_test.cpp)

