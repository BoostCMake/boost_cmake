cmake_minimum_required(VERSION 3.5)
project(${CMAKE_WORKSPACE_NAME}_dynamic_bitset)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(${CMAKE_WORKSPACE_NAME}_core)
find_package(${CMAKE_WORKSPACE_NAME}_static_assert)
find_package(${CMAKE_WORKSPACE_NAME}_move)
find_package(${CMAKE_WORKSPACE_NAME}_serialization)
find_package(${CMAKE_WORKSPACE_NAME}_integer)
find_package(${CMAKE_WORKSPACE_NAME}_config)
find_package(${CMAKE_WORKSPACE_NAME}_throw_exception)

bcm_setup_version(VERSION 1.58.0)

add_library(${CMAKE_WORKSPACE_NAME}_dynamic_bitset INTERFACE)
set_property(TARGET ${CMAKE_WORKSPACE_NAME}_dynamic_bitset PROPERTY EXPORT_NAME dynamic_bitset)

target_link_libraries(${CMAKE_WORKSPACE_NAME}_dynamic_bitset INTERFACE boost::core)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_dynamic_bitset INTERFACE boost::static_assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_dynamic_bitset INTERFACE boost::move)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_dynamic_bitset INTERFACE boost::serialization)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_dynamic_bitset INTERFACE boost::integer)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_dynamic_bitset INTERFACE boost::config)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_dynamic_bitset INTERFACE boost::throw_exception)


bcm_deploy(TARGETS ${CMAKE_WORKSPACE_NAME}_dynamic_bitset INCLUDE ${CMAKE_WORKSPACE_SOURCE}/include NAMESPACE ${CMAKE_WORKSPACE_NAME}::)

add_subdirectory(test)