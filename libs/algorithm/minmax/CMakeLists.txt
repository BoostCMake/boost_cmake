cmake_minimum_required(VERSION 3.5)
project(${CMAKE_WORKSPACE_NAME}_algorithm_minmax)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

#find_package(${CMAKE_WORKSPACE_NAME}_regex)

bcm_setup_version(VERSION 1.58.0)

add_library(${CMAKE_WORKSPACE_NAME}_algorithm_minmax INTERFACE)
set_property(TARGET ${CMAKE_WORKSPACE_NAME}_algorithm_minmax PROPERTY EXPORT_NAME minmax)

#target_link_libraries(${CMAKE_WORKSPACE_NAME}_algorithm INTERFACE boost::regex)

bcm_deploy(TARGETS ${CMAKE_WORKSPACE_NAME}_algorithm_minmax INCLUDE include NAMESPACE ${CMAKE_WORKSPACE_NAME}::)

add_subdirectory(test)