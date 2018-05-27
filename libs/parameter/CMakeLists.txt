cmake_minimum_required(VERSION 3.5)
project(${CMAKE_WORKSPACE_NAME}_parameter)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(${CMAKE_WORKSPACE_NAME}_core)
find_package(${CMAKE_WORKSPACE_NAME}_mpl)
find_package(${CMAKE_WORKSPACE_NAME}_detail)
find_package(${CMAKE_WORKSPACE_NAME}_type_traits)
find_package(${CMAKE_WORKSPACE_NAME}_optional)
find_package(${CMAKE_WORKSPACE_NAME}_preprocessor)
find_package(${CMAKE_WORKSPACE_NAME}_config)
find_package(${CMAKE_WORKSPACE_NAME}_utility)

bcm_setup_version(VERSION 1.58.0)

add_library(${CMAKE_WORKSPACE_NAME}_parameter INTERFACE)
set_property(TARGET ${CMAKE_WORKSPACE_NAME}_parameter PROPERTY EXPORT_NAME parameter)

target_link_libraries(${CMAKE_WORKSPACE_NAME}_parameter INTERFACE boost::core)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_parameter INTERFACE boost::mpl)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_parameter INTERFACE boost::detail)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_parameter INTERFACE boost::type_traits)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_parameter INTERFACE boost::optional)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_parameter INTERFACE boost::preprocessor)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_parameter INTERFACE boost::config)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_parameter INTERFACE boost::utility)


bcm_deploy(TARGETS ${CMAKE_WORKSPACE_NAME}_parameter INCLUDE include NAMESPACE ${CMAKE_WORKSPACE_NAME}::)

add_subdirectory(test)
