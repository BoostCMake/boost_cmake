cmake_minimum_required(VERSION 3.5)
project(${CMAKE_WORKSPACE_NAME}_function_types)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(${CMAKE_WORKSPACE_NAME}_core)
find_package(${CMAKE_WORKSPACE_NAME}_mpl)
find_package(${CMAKE_WORKSPACE_NAME}_detail)
find_package(${CMAKE_WORKSPACE_NAME}_type_traits)
find_package(${CMAKE_WORKSPACE_NAME}_preprocessor)
find_package(${CMAKE_WORKSPACE_NAME}_config)

bcm_setup_version(VERSION 1.58.0)

add_library(${CMAKE_WORKSPACE_NAME}_function_types INTERFACE)
set_property(TARGET ${CMAKE_WORKSPACE_NAME}_function_types PROPERTY EXPORT_NAME function_types)

target_link_libraries(${CMAKE_WORKSPACE_NAME}_function_types INTERFACE boost::core)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_function_types INTERFACE boost::mpl)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_function_types INTERFACE boost::detail)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_function_types INTERFACE boost::type_traits)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_function_types INTERFACE boost::preprocessor)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_function_types INTERFACE boost::config)


bcm_deploy(TARGETS ${CMAKE_WORKSPACE_NAME}_function_types INCLUDE ${CMAKE_WORKSPACE_SOURCE}/include NAMESPACE ${CMAKE_WORKSPACE_NAME}::)

add_subdirectory(test)
