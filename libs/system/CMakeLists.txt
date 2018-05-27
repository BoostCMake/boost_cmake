cmake_minimum_required(VERSION 3.5)
project(${CMAKE_WORKSPACE_NAME}_system)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(${CMAKE_WORKSPACE_NAME}_assert)
find_package(${CMAKE_WORKSPACE_NAME}_core)
find_package(${CMAKE_WORKSPACE_NAME}_config)
find_package(${CMAKE_WORKSPACE_NAME}_predef)

bcm_setup_version(VERSION 1.58.0)

add_library(${CMAKE_WORKSPACE_NAME}_system
            src/error_code.cpp
            )

if(BUILD_SHARED_LIBS)
    target_compile_definitions(${CMAKE_WORKSPACE_NAME}_system PRIVATE -DBOOST_SYSTEM_DYN_LINK=1)
else()
    target_compile_definitions(${CMAKE_WORKSPACE_NAME}_system PRIVATE -DBOOST_SYSTEM_STATIC_LINK=1)
endif()
set_property(TARGET ${CMAKE_WORKSPACE_NAME}_system PROPERTY EXPORT_NAME system)

target_link_libraries(${CMAKE_WORKSPACE_NAME}_system PUBLIC boost::assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_system PUBLIC boost::core)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_system PUBLIC boost::config)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_system PUBLIC boost::predef)


target_include_directories(${CMAKE_WORKSPACE_NAME}_system PRIVATE include)

bcm_deploy(TARGETS ${CMAKE_WORKSPACE_NAME}_system INCLUDE include NAMESPACE ${CMAKE_WORKSPACE_NAME}::)

add_subdirectory(test)
