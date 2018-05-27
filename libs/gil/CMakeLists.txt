cmake_minimum_required(VERSION 3.5)
project(${CMAKE_WORKSPACE_NAME}_gil)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(${CMAKE_WORKSPACE_NAME}_core)
find_package(${CMAKE_WORKSPACE_NAME}_static_assert)
find_package(${CMAKE_WORKSPACE_NAME}_iterator)
find_package(${CMAKE_WORKSPACE_NAME}_bind)
find_package(${CMAKE_WORKSPACE_NAME}_mpl)
find_package(${CMAKE_WORKSPACE_NAME}_type_traits)
find_package(${CMAKE_WORKSPACE_NAME}_concept_check)
find_package(${CMAKE_WORKSPACE_NAME}_smart_ptr)
find_package(${CMAKE_WORKSPACE_NAME}_config)
find_package(${CMAKE_WORKSPACE_NAME}_preprocessor)

bcm_setup_version(VERSION 1.58.0)

add_library(${CMAKE_WORKSPACE_NAME}_gil INTERFACE)
set_property(TARGET ${CMAKE_WORKSPACE_NAME}_gil PROPERTY EXPORT_NAME gil)

target_link_libraries(${CMAKE_WORKSPACE_NAME}_gil INTERFACE boost::core)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_gil INTERFACE boost::static_assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_gil INTERFACE boost::iterator)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_gil INTERFACE boost::bind)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_gil INTERFACE boost::mpl)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_gil INTERFACE boost::type_traits)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_gil INTERFACE boost::concept_check)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_gil INTERFACE boost::smart_ptr)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_gil INTERFACE boost::config)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_gil INTERFACE boost::preprocessor)


bcm_deploy(TARGETS ${CMAKE_WORKSPACE_NAME}_gil INCLUDE include NAMESPACE ${CMAKE_WORKSPACE_NAME}::)

add_subdirectory(test)
