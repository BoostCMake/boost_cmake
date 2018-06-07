cmake_minimum_required(VERSION 3.5)
project(${CMAKE_WORKSPACE_NAME}_any)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(${CMAKE_WORKSPACE_NAME}_core)
find_package(${CMAKE_WORKSPACE_NAME}_static_assert)
find_package(${CMAKE_WORKSPACE_NAME}_mpl)
find_package(${CMAKE_WORKSPACE_NAME}_type_index)
find_package(${CMAKE_WORKSPACE_NAME}_type_traits)
find_package(${CMAKE_WORKSPACE_NAME}_config)
find_package(${CMAKE_WORKSPACE_NAME}_throw_exception)

bcm_setup_version(VERSION 1.58.0)

add_library(${CMAKE_WORKSPACE_NAME}_any INTERFACE)
set_property(TARGET ${CMAKE_WORKSPACE_NAME}_any PROPERTY EXPORT_NAME any)

target_link_libraries(${CMAKE_WORKSPACE_NAME}_any INTERFACE boost::core)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_any INTERFACE boost::static_assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_any INTERFACE boost::mpl)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_any INTERFACE boost::type_index)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_any INTERFACE boost::type_traits)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_any INTERFACE boost::config)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_any INTERFACE boost::throw_exception)

bcm_deploy(TARGETS ${CMAKE_WORKSPACE_NAME}_any INCLUDE ${CMAKE_WORKSPACE_SOURCE}/include NAMESPACE ${CMAKE_WORKSPACE_NAME}::)

add_subdirectory(test)
