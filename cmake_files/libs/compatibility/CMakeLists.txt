cmake_minimum_required(VERSION 3.5)
project(${CMAKE_WORKSPACE_NAME}_compatibility)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

bcm_setup_version(VERSION 1.58.0)

add_library(${CMAKE_WORKSPACE_NAME}_compatibility INTERFACE)
set_property(TARGET ${CMAKE_WORKSPACE_NAME}_compatibility PROPERTY EXPORT_NAME compatibility)

bcm_deploy(TARGETS ${CMAKE_WORKSPACE_NAME}_compatibility INCLUDE ${CMAKE_WORKSPACE_SOURCE}/include NAMESPACE ${CMAKE_WORKSPACE_NAME}::)

add_subdirectory(test)
