cmake_minimum_required(VERSION 3.5)
project(${CMAKE_WORKSPACE_NAME}_disjoint_sets)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(${CMAKE_WORKSPACE_NAME}_graph)

bcm_setup_version(VERSION 1.58.0)

add_library(${CMAKE_WORKSPACE_NAME}_disjoint_sets INTERFACE)
set_property(TARGET ${CMAKE_WORKSPACE_NAME}_disjoint_sets PROPERTY EXPORT_NAME disjoint_sets)

target_link_libraries(${CMAKE_WORKSPACE_NAME}_disjoint_sets INTERFACE boost::graph)


bcm_deploy(TARGETS ${CMAKE_WORKSPACE_NAME}_disjoint_sets INCLUDE include NAMESPACE ${CMAKE_WORKSPACE_NAME}::)

add_subdirectory(test)
