cmake_minimum_required(VERSION 3.5)
project(${CMAKE_WORKSPACE_NAME}_smart_ptr)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(${CMAKE_WORKSPACE_NAME}_core)
find_package(${CMAKE_WORKSPACE_NAME}_static_assert)
find_package(${CMAKE_WORKSPACE_NAME}_predef)
find_package(${CMAKE_WORKSPACE_NAME}_move)
find_package(${CMAKE_WORKSPACE_NAME}_assert)
find_package(${CMAKE_WORKSPACE_NAME}_type_traits)
find_package(${CMAKE_WORKSPACE_NAME}_config)
find_package(${CMAKE_WORKSPACE_NAME}_throw_exception)

bcm_setup_version(VERSION 1.58.0)

add_library(${CMAKE_WORKSPACE_NAME}_smart_ptr INTERFACE)
set_property(TARGET ${CMAKE_WORKSPACE_NAME}_smart_ptr PROPERTY EXPORT_NAME smart_ptr)

target_link_libraries(${CMAKE_WORKSPACE_NAME}_smart_ptr INTERFACE boost::core)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_smart_ptr INTERFACE boost::static_assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_smart_ptr INTERFACE boost::predef)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_smart_ptr INTERFACE boost::move)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_smart_ptr INTERFACE boost::assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_smart_ptr INTERFACE boost::type_traits)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_smart_ptr INTERFACE boost::config)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_smart_ptr INTERFACE boost::throw_exception)


bcm_deploy(TARGETS ${CMAKE_WORKSPACE_NAME}_smart_ptr INCLUDE include NAMESPACE ${CMAKE_WORKSPACE_NAME}::)

add_subdirectory(test)
