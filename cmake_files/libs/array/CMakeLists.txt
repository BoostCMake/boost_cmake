cmake_minimum_required(VERSION 3.5)
project(${CMAKE_WORKSPACE_NAME}_array)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(${CMAKE_WORKSPACE_NAME}_assert)
find_package(${CMAKE_WORKSPACE_NAME}_core)
find_package(${CMAKE_WORKSPACE_NAME}_static_assert)
find_package(${CMAKE_WORKSPACE_NAME}_config)
find_package(${CMAKE_WORKSPACE_NAME}_throw_exception)

bcm_setup_version(VERSION 1.58.0)

add_library(${CMAKE_WORKSPACE_NAME}_array INTERFACE)
set_property(TARGET ${CMAKE_WORKSPACE_NAME}_array PROPERTY EXPORT_NAME array)

target_link_libraries(${CMAKE_WORKSPACE_NAME}_array INTERFACE boost::assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_array INTERFACE boost::core)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_array INTERFACE boost::static_assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_array INTERFACE boost::config)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_array INTERFACE boost::throw_exception)

bcm_deploy(TARGETS ${CMAKE_WORKSPACE_NAME}_array INCLUDE ${CMAKE_WORKSPACE_SOURCE}/include NAMESPACE ${CMAKE_WORKSPACE_NAME}::)

add_subdirectory(test)