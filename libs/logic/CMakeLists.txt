cmake_minimum_required(VERSION 3.5)
project(${CMAKE_WORKSPACE_NAME}_logic)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(${CMAKE_WORKSPACE_NAME}_core)
find_package(${CMAKE_WORKSPACE_NAME}_config)

bcm_setup_version(VERSION 1.58.0)

add_library(${CMAKE_WORKSPACE_NAME}_logic INTERFACE)
set_property(TARGET ${CMAKE_WORKSPACE_NAME}_logic PROPERTY EXPORT_NAME logic)

target_link_libraries(${CMAKE_WORKSPACE_NAME}_logic INTERFACE boost::core)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_logic INTERFACE boost::config)

bcm_deploy(TARGETS ${CMAKE_WORKSPACE_NAME}_logic INCLUDE include NAMESPACE ${CMAKE_WORKSPACE_NAME}::)

add_subdirectory(test)
