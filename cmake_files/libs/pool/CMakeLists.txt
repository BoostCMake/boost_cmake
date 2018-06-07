cmake_minimum_required(VERSION 3.5)
project(${CMAKE_WORKSPACE_NAME}_pool)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(${CMAKE_WORKSPACE_NAME}_thread)
find_package(${CMAKE_WORKSPACE_NAME}_assert)
find_package(${CMAKE_WORKSPACE_NAME}_type_traits)
find_package(${CMAKE_WORKSPACE_NAME}_integer)
find_package(${CMAKE_WORKSPACE_NAME}_config)
find_package(${CMAKE_WORKSPACE_NAME}_throw_exception)

bcm_setup_version(VERSION 1.58.0)

add_library(${CMAKE_WORKSPACE_NAME}_pool INTERFACE)
set_property(TARGET ${CMAKE_WORKSPACE_NAME}_pool PROPERTY EXPORT_NAME pool)

target_link_libraries(${CMAKE_WORKSPACE_NAME}_pool INTERFACE boost::thread)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_pool INTERFACE boost::assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_pool INTERFACE boost::type_traits)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_pool INTERFACE boost::integer)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_pool INTERFACE boost::config)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_pool INTERFACE boost::throw_exception)


bcm_deploy(TARGETS ${CMAKE_WORKSPACE_NAME}_pool INCLUDE ${CMAKE_WORKSPACE_SOURCE}/include NAMESPACE ${CMAKE_WORKSPACE_NAME}::)

add_subdirectory(test)
