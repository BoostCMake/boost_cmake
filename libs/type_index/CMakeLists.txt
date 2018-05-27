cmake_minimum_required(VERSION 3.5)
project(${CMAKE_WORKSPACE_NAME}_type_index)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(${CMAKE_WORKSPACE_NAME}_core)
find_package(${CMAKE_WORKSPACE_NAME}_static_assert)
find_package(${CMAKE_WORKSPACE_NAME}_mpl)
find_package(${CMAKE_WORKSPACE_NAME}_smart_ptr)
find_package(${CMAKE_WORKSPACE_NAME}_type_traits)
find_package(${CMAKE_WORKSPACE_NAME}_config)
find_package(${CMAKE_WORKSPACE_NAME}_throw_exception)
find_package(${CMAKE_WORKSPACE_NAME}_preprocessor)

bcm_setup_version(VERSION 1.58.0)

add_library(${CMAKE_WORKSPACE_NAME}_type_index INTERFACE)
set_property(TARGET ${CMAKE_WORKSPACE_NAME}_type_index PROPERTY EXPORT_NAME type_index)

target_link_libraries(${CMAKE_WORKSPACE_NAME}_type_index INTERFACE boost::core)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_type_index INTERFACE boost::static_assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_type_index INTERFACE boost::mpl)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_type_index INTERFACE boost::smart_ptr)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_type_index INTERFACE boost::type_traits)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_type_index INTERFACE boost::config)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_type_index INTERFACE boost::throw_exception)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_type_index INTERFACE boost::preprocessor)


bcm_deploy(TARGETS ${CMAKE_WORKSPACE_NAME}_type_index INCLUDE include NAMESPACE ${CMAKE_WORKSPACE_NAME}::)

add_subdirectory(test)
