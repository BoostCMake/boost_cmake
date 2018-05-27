cmake_minimum_required(VERSION 3.5)
project(${CMAKE_WORKSPACE_NAME}_ratio)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(${CMAKE_WORKSPACE_NAME}_core)
find_package(${CMAKE_WORKSPACE_NAME}_static_assert)
find_package(${CMAKE_WORKSPACE_NAME}_mpl)
find_package(${CMAKE_WORKSPACE_NAME}_type_traits)
find_package(${CMAKE_WORKSPACE_NAME}_rational)
find_package(${CMAKE_WORKSPACE_NAME}_integer)
find_package(${CMAKE_WORKSPACE_NAME}_config)

bcm_setup_version(VERSION 1.58.0)

add_library(${CMAKE_WORKSPACE_NAME}_ratio INTERFACE)
set_property(TARGET ${CMAKE_WORKSPACE_NAME}_ratio PROPERTY EXPORT_NAME ratio)

target_link_libraries(${CMAKE_WORKSPACE_NAME}_ratio INTERFACE boost::core)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_ratio INTERFACE boost::static_assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_ratio INTERFACE boost::mpl)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_ratio INTERFACE boost::type_traits)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_ratio INTERFACE boost::rational)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_ratio INTERFACE boost::integer)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_ratio INTERFACE boost::config)


bcm_deploy(TARGETS ${CMAKE_WORKSPACE_NAME}_ratio INCLUDE include NAMESPACE ${CMAKE_WORKSPACE_NAME}::)

add_subdirectory(test)
