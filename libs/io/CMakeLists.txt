cmake_minimum_required(VERSION 3.5)
project(${CMAKE_WORKSPACE_NAME}_io)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(${CMAKE_WORKSPACE_NAME}_config)

bcm_setup_version(VERSION 1.58.0)

add_library(${CMAKE_WORKSPACE_NAME}_io INTERFACE)
set_property(TARGET ${CMAKE_WORKSPACE_NAME}_io PROPERTY EXPORT_NAME io)

target_link_libraries(${CMAKE_WORKSPACE_NAME}_io INTERFACE boost::config)


bcm_deploy(TARGETS ${CMAKE_WORKSPACE_NAME}_io INCLUDE include NAMESPACE ${CMAKE_WORKSPACE_NAME}::)

add_subdirectory(test)
