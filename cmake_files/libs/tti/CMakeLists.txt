cmake_minimum_required(VERSION 3.5)
project(${CMAKE_WORKSPACE_NAME}_tti)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(${CMAKE_WORKSPACE_NAME}_function_types)
find_package(${CMAKE_WORKSPACE_NAME}_mpl)
find_package(${CMAKE_WORKSPACE_NAME}_type_traits)
find_package(${CMAKE_WORKSPACE_NAME}_preprocessor)
find_package(${CMAKE_WORKSPACE_NAME}_config)

bcm_setup_version(VERSION 1.58.0)

add_library(${CMAKE_WORKSPACE_NAME}_tti INTERFACE)
set_property(TARGET ${CMAKE_WORKSPACE_NAME}_tti PROPERTY EXPORT_NAME tti)

target_link_libraries(${CMAKE_WORKSPACE_NAME}_tti INTERFACE boost::function_types)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_tti INTERFACE boost::mpl)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_tti INTERFACE boost::type_traits)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_tti INTERFACE boost::preprocessor)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_tti INTERFACE boost::config)


bcm_deploy(TARGETS ${CMAKE_WORKSPACE_NAME}_tti INCLUDE ${CMAKE_WORKSPACE_SOURCE}/include NAMESPACE ${CMAKE_WORKSPACE_NAME}::)

add_subdirectory(test)
