cmake_minimum_required(VERSION 3.5)
project(${CMAKE_WORKSPACE_NAME}_optional)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(${CMAKE_WORKSPACE_NAME}_core)
find_package(${CMAKE_WORKSPACE_NAME}_static_assert)
find_package(${CMAKE_WORKSPACE_NAME}_config)
find_package(${CMAKE_WORKSPACE_NAME}_mpl)
find_package(${CMAKE_WORKSPACE_NAME}_move)
find_package(${CMAKE_WORKSPACE_NAME}_detail)
find_package(${CMAKE_WORKSPACE_NAME}_assert)
find_package(${CMAKE_WORKSPACE_NAME}_type_traits)
find_package(${CMAKE_WORKSPACE_NAME}_throw_exception)
find_package(${CMAKE_WORKSPACE_NAME}_utility)

bcm_setup_version(VERSION 1.58.0)

add_library(${CMAKE_WORKSPACE_NAME}_optional INTERFACE)
set_property(TARGET ${CMAKE_WORKSPACE_NAME}_optional PROPERTY EXPORT_NAME optional)

target_link_libraries(${CMAKE_WORKSPACE_NAME}_optional INTERFACE boost::core)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_optional INTERFACE boost::static_assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_optional INTERFACE boost::config)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_optional INTERFACE boost::mpl)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_optional INTERFACE boost::move)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_optional INTERFACE boost::detail)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_optional INTERFACE boost::assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_optional INTERFACE boost::type_traits)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_optional INTERFACE boost::throw_exception)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_optional INTERFACE boost::utility)


bcm_deploy(TARGETS ${CMAKE_WORKSPACE_NAME}_optional INCLUDE include NAMESPACE ${CMAKE_WORKSPACE_NAME}::)

add_subdirectory(test)
