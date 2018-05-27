cmake_minimum_required(VERSION 3.5)
project(${CMAKE_WORKSPACE_NAME}_integer)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(${CMAKE_WORKSPACE_NAME}_static_assert)
find_package(${CMAKE_WORKSPACE_NAME}_config)

bcm_setup_version(VERSION 1.58.0)

add_library(${CMAKE_WORKSPACE_NAME}_integer INTERFACE)
set_property(TARGET ${CMAKE_WORKSPACE_NAME}_integer PROPERTY EXPORT_NAME integer)

target_link_libraries(${CMAKE_WORKSPACE_NAME}_integer INTERFACE boost::static_assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_integer INTERFACE boost::config)


bcm_deploy(TARGETS ${CMAKE_WORKSPACE_NAME}_integer INCLUDE include NAMESPACE ${CMAKE_WORKSPACE_NAME}::)

add_subdirectory(test)
