cmake_minimum_required(VERSION 3.5)
project(${CMAKE_WORKSPACE_NAME}_preprocessor)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)


bcm_setup_version(VERSION 1.58.0)

add_library(${CMAKE_WORKSPACE_NAME}_preprocessor INTERFACE)
set_property(TARGET ${CMAKE_WORKSPACE_NAME}_preprocessor PROPERTY EXPORT_NAME preprocessor)


bcm_deploy(TARGETS ${CMAKE_WORKSPACE_NAME}_preprocessor INCLUDE ${CMAKE_WORKSPACE_SOURCE}/include NAMESPACE ${CMAKE_WORKSPACE_NAME}::)

add_subdirectory(test)
