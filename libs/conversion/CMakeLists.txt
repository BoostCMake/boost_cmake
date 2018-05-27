cmake_minimum_required(VERSION 3.5)
project(${CMAKE_WORKSPACE_NAME}_conversion)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(${CMAKE_WORKSPACE_NAME}_assert)
find_package(${CMAKE_WORKSPACE_NAME}_type_traits)
find_package(${CMAKE_WORKSPACE_NAME}_typeof)
find_package(${CMAKE_WORKSPACE_NAME}_config)
find_package(${CMAKE_WORKSPACE_NAME}_throw_exception)
find_package(${CMAKE_WORKSPACE_NAME}_smart_ptr)

bcm_setup_version(VERSION 1.58.0)

add_library(${CMAKE_WORKSPACE_NAME}_conversion INTERFACE
            )
set_property(TARGET ${CMAKE_WORKSPACE_NAME}_conversion PROPERTY EXPORT_NAME conversion)

target_link_libraries(${CMAKE_WORKSPACE_NAME}_conversion INTERFACE boost::assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_conversion INTERFACE boost::type_traits)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_conversion INTERFACE boost::typeof)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_conversion INTERFACE boost::config)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_conversion INTERFACE boost::throw_exception)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_conversion INTERFACE boost::smart_ptr)


bcm_deploy(TARGETS ${CMAKE_WORKSPACE_NAME}_conversion INCLUDE include NAMESPACE ${CMAKE_WORKSPACE_NAME}::)

add_subdirectory(test)
