cmake_minimum_required(VERSION 3.5)
project(${CMAKE_WORKSPACE_NAME}_detail)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(${CMAKE_WORKSPACE_NAME}_core)
find_package(${CMAKE_WORKSPACE_NAME}_static_assert)
find_package(${CMAKE_WORKSPACE_NAME}_mpl)
find_package(${CMAKE_WORKSPACE_NAME}_type_traits)
find_package(${CMAKE_WORKSPACE_NAME}_preprocessor)
find_package(${CMAKE_WORKSPACE_NAME}_config)

bcm_setup_version(VERSION 1.58.0)

add_library(${CMAKE_WORKSPACE_NAME}_detail INTERFACE)
set_property(TARGET ${CMAKE_WORKSPACE_NAME}_detail PROPERTY EXPORT_NAME detail)

target_link_libraries(${CMAKE_WORKSPACE_NAME}_detail INTERFACE boost::core)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_detail INTERFACE boost::static_assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_detail INTERFACE boost::mpl)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_detail INTERFACE boost::type_traits)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_detail INTERFACE boost::preprocessor)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_detail INTERFACE boost::config)


bcm_deploy(TARGETS ${CMAKE_WORKSPACE_NAME}_detail INCLUDE include NAMESPACE ${CMAKE_WORKSPACE_NAME}::)

add_subdirectory(test)
