cmake_minimum_required(VERSION 3.5)
project(${CMAKE_WORKSPACE_NAME}_scope_exit)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(${CMAKE_WORKSPACE_NAME}_function)
find_package(${CMAKE_WORKSPACE_NAME}_core)
find_package(${CMAKE_WORKSPACE_NAME}_mpl)
find_package(${CMAKE_WORKSPACE_NAME}_type_traits)
find_package(${CMAKE_WORKSPACE_NAME}_typeof)
find_package(${CMAKE_WORKSPACE_NAME}_config)
find_package(${CMAKE_WORKSPACE_NAME}_preprocessor)

bcm_setup_version(VERSION 1.58.0)

add_library(${CMAKE_WORKSPACE_NAME}_scope_exit INTERFACE)
set_property(TARGET ${CMAKE_WORKSPACE_NAME}_scope_exit PROPERTY EXPORT_NAME scope_exit)

target_link_libraries(${CMAKE_WORKSPACE_NAME}_scope_exit INTERFACE boost::function)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_scope_exit INTERFACE boost::core)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_scope_exit INTERFACE boost::mpl)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_scope_exit INTERFACE boost::type_traits)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_scope_exit INTERFACE boost::typeof)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_scope_exit INTERFACE boost::config)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_scope_exit INTERFACE boost::preprocessor)


bcm_deploy(TARGETS ${CMAKE_WORKSPACE_NAME}_scope_exit INCLUDE include NAMESPACE ${CMAKE_WORKSPACE_NAME}::)

add_subdirectory(test)
