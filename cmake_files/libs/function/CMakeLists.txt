cmake_minimum_required(VERSION 3.5)
project(${CMAKE_WORKSPACE_NAME}_function)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(${CMAKE_WORKSPACE_NAME}_core)
find_package(${CMAKE_WORKSPACE_NAME}_bind)
find_package(${CMAKE_WORKSPACE_NAME}_mpl)
find_package(${CMAKE_WORKSPACE_NAME}_move)
find_package(${CMAKE_WORKSPACE_NAME}_type_traits)
find_package(${CMAKE_WORKSPACE_NAME}_assert)
find_package(${CMAKE_WORKSPACE_NAME}_type_index)
find_package(${CMAKE_WORKSPACE_NAME}_preprocessor)
find_package(${CMAKE_WORKSPACE_NAME}_integer)
find_package(${CMAKE_WORKSPACE_NAME}_config)
find_package(${CMAKE_WORKSPACE_NAME}_throw_exception)
find_package(${CMAKE_WORKSPACE_NAME}_typeof)

bcm_setup_version(VERSION 1.58.0)

add_library(${CMAKE_WORKSPACE_NAME}_function INTERFACE)
set_property(TARGET ${CMAKE_WORKSPACE_NAME}_function PROPERTY EXPORT_NAME function)

target_link_libraries(${CMAKE_WORKSPACE_NAME}_function INTERFACE boost::core)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_function INTERFACE boost::bind)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_function INTERFACE boost::mpl)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_function INTERFACE boost::move)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_function INTERFACE boost::type_traits)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_function INTERFACE boost::assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_function INTERFACE boost::type_index)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_function INTERFACE boost::preprocessor)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_function INTERFACE boost::integer)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_function INTERFACE boost::config)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_function INTERFACE boost::throw_exception)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_function INTERFACE boost::typeof)


bcm_deploy(TARGETS ${CMAKE_WORKSPACE_NAME}_function INCLUDE ${CMAKE_WORKSPACE_SOURCE}/include NAMESPACE ${CMAKE_WORKSPACE_NAME}::)

add_subdirectory(test)
