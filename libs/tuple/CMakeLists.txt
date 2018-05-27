cmake_minimum_required(VERSION 3.5)
project(${CMAKE_WORKSPACE_NAME}_tuple)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(${CMAKE_WORKSPACE_NAME}_core)
find_package(${CMAKE_WORKSPACE_NAME}_static_assert)
find_package(${CMAKE_WORKSPACE_NAME}_type_traits)
find_package(${CMAKE_WORKSPACE_NAME}_config)

bcm_setup_version(VERSION 1.58.0)

add_library(${CMAKE_WORKSPACE_NAME}_tuple INTERFACE)
set_property(TARGET ${CMAKE_WORKSPACE_NAME}_tuple PROPERTY EXPORT_NAME tuple)

target_link_libraries(${CMAKE_WORKSPACE_NAME}_tuple INTERFACE boost::core)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_tuple INTERFACE boost::static_assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_tuple INTERFACE boost::type_traits)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_tuple INTERFACE boost::config)


bcm_deploy(TARGETS ${CMAKE_WORKSPACE_NAME}_tuple INCLUDE include NAMESPACE ${CMAKE_WORKSPACE_NAME}::)

add_subdirectory(test)
