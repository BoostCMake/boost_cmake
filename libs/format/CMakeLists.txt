cmake_minimum_required(VERSION 3.5)
project(${CMAKE_WORKSPACE_NAME}_format)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(${CMAKE_WORKSPACE_NAME}_config)
find_package(${CMAKE_WORKSPACE_NAME}_assert)
find_package(${CMAKE_WORKSPACE_NAME}_smart_ptr)
find_package(${CMAKE_WORKSPACE_NAME}_optional)
find_package(${CMAKE_WORKSPACE_NAME}_throw_exception)
find_package(${CMAKE_WORKSPACE_NAME}_utility)

bcm_setup_version(VERSION 1.58.0)

add_library(${CMAKE_WORKSPACE_NAME}_format INTERFACE
            )
set_property(TARGET ${CMAKE_WORKSPACE_NAME}_format PROPERTY EXPORT_NAME format)

target_link_libraries(${CMAKE_WORKSPACE_NAME}_format INTERFACE boost::config)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_format INTERFACE boost::assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_format INTERFACE boost::smart_ptr)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_format INTERFACE boost::optional)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_format INTERFACE boost::throw_exception)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_format INTERFACE boost::utility)


bcm_deploy(TARGETS ${CMAKE_WORKSPACE_NAME}_format INCLUDE include NAMESPACE ${CMAKE_WORKSPACE_NAME}::)

add_subdirectory(test)
