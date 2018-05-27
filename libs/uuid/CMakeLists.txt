cmake_minimum_required(VERSION 3.5)
project(${CMAKE_WORKSPACE_NAME}_uuid)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(${CMAKE_WORKSPACE_NAME}_core)
find_package(${CMAKE_WORKSPACE_NAME}_static_assert)
find_package(${CMAKE_WORKSPACE_NAME}_iterator)
find_package(${CMAKE_WORKSPACE_NAME}_winapi)
find_package(${CMAKE_WORKSPACE_NAME}_random)
find_package(${CMAKE_WORKSPACE_NAME}_assert)
find_package(${CMAKE_WORKSPACE_NAME}_type_traits)
find_package(${CMAKE_WORKSPACE_NAME}_smart_ptr)
find_package(${CMAKE_WORKSPACE_NAME}_io)
find_package(${CMAKE_WORKSPACE_NAME}_serialization)
find_package(${CMAKE_WORKSPACE_NAME}_config)
find_package(${CMAKE_WORKSPACE_NAME}_throw_exception)

bcm_setup_version(VERSION 1.58.0)

add_library(${CMAKE_WORKSPACE_NAME}_uuid INTERFACE)
set_property(TARGET ${CMAKE_WORKSPACE_NAME}_uuid PROPERTY EXPORT_NAME uuid)

target_link_libraries(${CMAKE_WORKSPACE_NAME}_uuid INTERFACE boost::core)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_uuid INTERFACE boost::static_assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_uuid INTERFACE boost::iterator)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_uuid INTERFACE boost::winapi)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_uuid INTERFACE boost::random)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_uuid INTERFACE boost::assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_uuid INTERFACE boost::type_traits)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_uuid INTERFACE boost::smart_ptr)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_uuid INTERFACE boost::io)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_uuid INTERFACE boost::serialization)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_uuid INTERFACE boost::config)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_uuid INTERFACE boost::throw_exception)


bcm_deploy(TARGETS ${CMAKE_WORKSPACE_NAME}_uuid INCLUDE include NAMESPACE ${CMAKE_WORKSPACE_NAME}::)

add_subdirectory(test)
