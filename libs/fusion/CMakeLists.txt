cmake_minimum_required(VERSION 3.5)
project(${CMAKE_WORKSPACE_NAME}_fusion)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(${CMAKE_WORKSPACE_NAME}_function_types)
find_package(${CMAKE_WORKSPACE_NAME}_core)
find_package(${CMAKE_WORKSPACE_NAME}_static_assert)
find_package(${CMAKE_WORKSPACE_NAME}_typeof)
find_package(${CMAKE_WORKSPACE_NAME}_mpl)
find_package(${CMAKE_WORKSPACE_NAME}_tuple)
find_package(${CMAKE_WORKSPACE_NAME}_functional)
find_package(${CMAKE_WORKSPACE_NAME}_type_traits)
find_package(${CMAKE_WORKSPACE_NAME}_preprocessor)
find_package(${CMAKE_WORKSPACE_NAME}_config)
find_package(${CMAKE_WORKSPACE_NAME}_utility)

bcm_setup_version(VERSION 1.58.0)

add_library(${CMAKE_WORKSPACE_NAME}_fusion INTERFACE)
set_property(TARGET ${CMAKE_WORKSPACE_NAME}_fusion PROPERTY EXPORT_NAME fusion)

target_link_libraries(${CMAKE_WORKSPACE_NAME}_fusion INTERFACE boost::function_types)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_fusion INTERFACE boost::core)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_fusion INTERFACE boost::static_assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_fusion INTERFACE boost::typeof)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_fusion INTERFACE boost::mpl)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_fusion INTERFACE boost::tuple)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_fusion INTERFACE boost::functional)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_fusion INTERFACE boost::type_traits)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_fusion INTERFACE boost::preprocessor)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_fusion INTERFACE boost::config)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_fusion INTERFACE boost::utility)


bcm_deploy(TARGETS ${CMAKE_WORKSPACE_NAME}_fusion INCLUDE include NAMESPACE ${CMAKE_WORKSPACE_NAME}::)

add_subdirectory(test)
