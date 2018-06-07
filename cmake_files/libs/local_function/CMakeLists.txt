cmake_minimum_required(VERSION 3.5)
project(${CMAKE_WORKSPACE_NAME}_local_function)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(${CMAKE_WORKSPACE_NAME}_scope_exit)
find_package(${CMAKE_WORKSPACE_NAME}_mpl)
find_package(${CMAKE_WORKSPACE_NAME}_type_traits)
find_package(${CMAKE_WORKSPACE_NAME}_typeof)
find_package(${CMAKE_WORKSPACE_NAME}_utility)
find_package(${CMAKE_WORKSPACE_NAME}_config)
find_package(${CMAKE_WORKSPACE_NAME}_preprocessor)

bcm_setup_version(VERSION 1.58.0)

add_library(${CMAKE_WORKSPACE_NAME}_local_function INTERFACE)
set_property(TARGET ${CMAKE_WORKSPACE_NAME}_local_function PROPERTY EXPORT_NAME local_function)

target_link_libraries(${CMAKE_WORKSPACE_NAME}_local_function INTERFACE boost::scope_exit)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_local_function INTERFACE boost::mpl)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_local_function INTERFACE boost::type_traits)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_local_function INTERFACE boost::typeof)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_local_function INTERFACE boost::utility)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_local_function INTERFACE boost::config)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_local_function INTERFACE boost::preprocessor)


bcm_deploy(TARGETS ${CMAKE_WORKSPACE_NAME}_local_function INCLUDE ${CMAKE_WORKSPACE_SOURCE}/include NAMESPACE ${CMAKE_WORKSPACE_NAME}::)

add_subdirectory(test)
