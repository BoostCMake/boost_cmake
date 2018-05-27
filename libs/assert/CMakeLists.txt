cmake_minimum_required(VERSION 3.5)
project(${CMAKE_WORKSPACE_NAME}_assert)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(${CMAKE_WORKSPACE_NAME}_config)

bcm_setup_version(VERSION 1.58.0)

add_library(${CMAKE_WORKSPACE_NAME}_assert INTERFACE)
set_property(TARGET ${CMAKE_WORKSPACE_NAME}_assert PROPERTY EXPORT_NAME assert)

target_link_libraries(${CMAKE_WORKSPACE_NAME}_assert INTERFACE boost::config)

bcm_deploy(TARGETS ${CMAKE_WORKSPACE_NAME}_assert INCLUDE include NAMESPACE ${CMAKE_WORKSPACE_NAME}::)

add_subdirectory(test)