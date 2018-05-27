cmake_minimum_required(VERSION 3.5)
project(${CMAKE_WORKSPACE_NAME}_numeric_interval)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(${CMAKE_WORKSPACE_NAME}_logic)
find_package(${CMAKE_WORKSPACE_NAME}_config)
find_package(${CMAKE_WORKSPACE_NAME}_detail)

bcm_setup_version(VERSION 1.58.0)

add_library(${CMAKE_WORKSPACE_NAME}_numeric_interval INTERFACE
)
set_property(TARGET ${CMAKE_WORKSPACE_NAME}_numeric_interval PROPERTY EXPORT_NAME numeric_interval)

target_link_libraries(${CMAKE_WORKSPACE_NAME}_numeric_interval INTERFACE boost::logic)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_numeric_interval INTERFACE boost::config)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_numeric_interval INTERFACE boost::detail)




bcm_deploy(TARGETS ${CMAKE_WORKSPACE_NAME}_numeric_interval INCLUDE include NAMESPACE ${CMAKE_WORKSPACE_NAME}::)

add_subdirectory(test)
