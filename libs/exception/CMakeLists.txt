cmake_minimum_required(VERSION 3.5)
project(${CMAKE_WORKSPACE_NAME}_exception)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(${CMAKE_WORKSPACE_NAME}_core)
find_package(${CMAKE_WORKSPACE_NAME}_tuple)
find_package(${CMAKE_WORKSPACE_NAME}_assert)
find_package(${CMAKE_WORKSPACE_NAME}_smart_ptr)
find_package(${CMAKE_WORKSPACE_NAME}_config)
find_package(${CMAKE_WORKSPACE_NAME}_throw_exception)

bcm_setup_version(VERSION 1.58.0)

add_library(${CMAKE_WORKSPACE_NAME}_exception
            src/clone_current_exception_non_intrusive.cpp
            )

set_property(TARGET ${CMAKE_WORKSPACE_NAME}_exception PROPERTY EXPORT_NAME exception)

target_link_libraries(${CMAKE_WORKSPACE_NAME}_exception PUBLIC boost::core)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_exception PUBLIC boost::tuple)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_exception PUBLIC boost::assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_exception PUBLIC boost::smart_ptr)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_exception PUBLIC boost::config)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_exception PUBLIC boost::throw_exception)


target_include_directories(${CMAKE_WORKSPACE_NAME}_exception PRIVATE include)

bcm_deploy(TARGETS ${CMAKE_WORKSPACE_NAME}_exception INCLUDE include NAMESPACE ${CMAKE_WORKSPACE_NAME}::)

add_subdirectory(test)
