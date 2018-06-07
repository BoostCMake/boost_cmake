cmake_minimum_required(VERSION 3.5)
project(${CMAKE_WORKSPACE_NAME}_winapi)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(${CMAKE_WORKSPACE_NAME}_config)
find_package(${CMAKE_WORKSPACE_NAME}_predef)

bcm_setup_version(VERSION 1.58.0)

add_library(${CMAKE_WORKSPACE_NAME}_winapi INTERFACE)
set_property(TARGET ${CMAKE_WORKSPACE_NAME}_winapi PROPERTY EXPORT_NAME winapi)

target_link_libraries(${CMAKE_WORKSPACE_NAME}_winapi INTERFACE boost::config)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_winapi INTERFACE boost::predef)


bcm_deploy(TARGETS ${CMAKE_WORKSPACE_NAME}_winapi INCLUDE ${CMAKE_WORKSPACE_SOURCE}/include NAMESPACE ${CMAKE_WORKSPACE_NAME}::)

add_subdirectory(test)
