cmake_minimum_required(VERSION 3.5)
project(${CMAKE_WORKSPACE_NAME}_circular_buffer)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(${CMAKE_WORKSPACE_NAME}_core)
find_package(${CMAKE_WORKSPACE_NAME}_static_assert)
find_package(${CMAKE_WORKSPACE_NAME}_container)
find_package(${CMAKE_WORKSPACE_NAME}_iterator)
find_package(${CMAKE_WORKSPACE_NAME}_move)
find_package(${CMAKE_WORKSPACE_NAME}_assert)
find_package(${CMAKE_WORKSPACE_NAME}_type_traits)
find_package(${CMAKE_WORKSPACE_NAME}_concept_check)
find_package(${CMAKE_WORKSPACE_NAME}_config)
find_package(${CMAKE_WORKSPACE_NAME}_throw_exception)
find_package(${CMAKE_WORKSPACE_NAME}_utility)

bcm_setup_version(VERSION 1.58.0)

add_library(${CMAKE_WORKSPACE_NAME}_circular_buffer INTERFACE
            )
set_property(TARGET ${CMAKE_WORKSPACE_NAME}_circular_buffer PROPERTY EXPORT_NAME circular_buffer)

target_link_libraries(${CMAKE_WORKSPACE_NAME}_circular_buffer INTERFACE boost::core)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_circular_buffer INTERFACE boost::static_assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_circular_buffer INTERFACE boost::container)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_circular_buffer INTERFACE boost::iterator)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_circular_buffer INTERFACE boost::move)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_circular_buffer INTERFACE boost::assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_circular_buffer INTERFACE boost::type_traits)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_circular_buffer INTERFACE boost::concept_check)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_circular_buffer INTERFACE boost::config)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_circular_buffer INTERFACE boost::throw_exception)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_circular_buffer INTERFACE boost::utility)


bcm_deploy(TARGETS ${CMAKE_WORKSPACE_NAME}_circular_buffer INCLUDE ${CMAKE_WORKSPACE_SOURCE}/include NAMESPACE ${CMAKE_WORKSPACE_NAME}::)

add_subdirectory(test)
