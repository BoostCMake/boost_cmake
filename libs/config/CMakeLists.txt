cmake_minimum_required(VERSION 3.5)
project(${CMAKE_WORKSPACE_NAME}_config)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)


bcm_setup_version(VERSION 1.58.0)

add_library(${CMAKE_WORKSPACE_NAME}_config INTERFACE)
set_property(TARGET ${CMAKE_WORKSPACE_NAME}_config PROPERTY EXPORT_NAME config)


bcm_deploy(TARGETS ${CMAKE_WORKSPACE_NAME}_config INCLUDE include NAMESPACE ${CMAKE_WORKSPACE_NAME}::)

add_subdirectory(test)
