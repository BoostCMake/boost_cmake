cmake_minimum_required(VERSION 3.5)
project(${CMAKE_WORKSPACE_NAME}_multi_array)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(${CMAKE_WORKSPACE_NAME}_core)
find_package(${CMAKE_WORKSPACE_NAME}_static_assert)
find_package(${CMAKE_WORKSPACE_NAME}_iterator)
find_package(${CMAKE_WORKSPACE_NAME}_mpl)
find_package(${CMAKE_WORKSPACE_NAME}_functional)
find_package(${CMAKE_WORKSPACE_NAME}_assert)
find_package(${CMAKE_WORKSPACE_NAME}_type_traits)
find_package(${CMAKE_WORKSPACE_NAME}_concept_check)
find_package(${CMAKE_WORKSPACE_NAME}_array)
find_package(${CMAKE_WORKSPACE_NAME}_config)

bcm_setup_version(VERSION 1.58.0)

add_library(${CMAKE_WORKSPACE_NAME}_multi_array INTERFACE)
set_property(TARGET ${CMAKE_WORKSPACE_NAME}_multi_array PROPERTY EXPORT_NAME multi_array)

target_link_libraries(${CMAKE_WORKSPACE_NAME}_multi_array INTERFACE boost::core)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_multi_array INTERFACE boost::static_assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_multi_array INTERFACE boost::iterator)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_multi_array INTERFACE boost::mpl)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_multi_array INTERFACE boost::functional)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_multi_array INTERFACE boost::assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_multi_array INTERFACE boost::type_traits)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_multi_array INTERFACE boost::concept_check)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_multi_array INTERFACE boost::array)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_multi_array INTERFACE boost::config)

bcm_deploy(TARGETS ${CMAKE_WORKSPACE_NAME}_multi_array INCLUDE ${CMAKE_WORKSPACE_SOURCE}/include NAMESPACE ${CMAKE_WORKSPACE_NAME}::)

add_subdirectory(test)
