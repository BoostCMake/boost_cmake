cmake_minimum_required(VERSION 3.5)
project(${CMAKE_WORKSPACE_NAME}_rational)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(${CMAKE_WORKSPACE_NAME}_core)
find_package(${CMAKE_WORKSPACE_NAME}_static_assert)
find_package(${CMAKE_WORKSPACE_NAME}_assert)
find_package(${CMAKE_WORKSPACE_NAME}_type_traits)
find_package(${CMAKE_WORKSPACE_NAME}_integer)
find_package(${CMAKE_WORKSPACE_NAME}_config)
find_package(${CMAKE_WORKSPACE_NAME}_throw_exception)
find_package(${CMAKE_WORKSPACE_NAME}_utility)

bcm_setup_version(VERSION 1.58.0)

add_library(${CMAKE_WORKSPACE_NAME}_rational INTERFACE)
set_property(TARGET ${CMAKE_WORKSPACE_NAME}_rational PROPERTY EXPORT_NAME rational)

target_link_libraries(${CMAKE_WORKSPACE_NAME}_rational INTERFACE boost::core)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_rational INTERFACE boost::static_assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_rational INTERFACE boost::assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_rational INTERFACE boost::type_traits)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_rational INTERFACE boost::integer)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_rational INTERFACE boost::config)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_rational INTERFACE boost::throw_exception)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_rational INTERFACE boost::utility)


bcm_deploy(TARGETS ${CMAKE_WORKSPACE_NAME}_rational INCLUDE include NAMESPACE ${CMAKE_WORKSPACE_NAME}::)

add_subdirectory(test)
