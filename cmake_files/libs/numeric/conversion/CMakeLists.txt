cmake_minimum_required(VERSION 3.5)
project(${CMAKE_WORKSPACE_NAME}_numeric_conversion)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(${CMAKE_WORKSPACE_NAME}_core)
find_package(${CMAKE_WORKSPACE_NAME}_conversion)
find_package(${CMAKE_WORKSPACE_NAME}_mpl)
find_package(${CMAKE_WORKSPACE_NAME}_type_traits)
find_package(${CMAKE_WORKSPACE_NAME}_preprocessor)
find_package(${CMAKE_WORKSPACE_NAME}_config)
find_package(${CMAKE_WORKSPACE_NAME}_throw_exception)

bcm_setup_version(VERSION 1.64.0)

add_library(${CMAKE_WORKSPACE_NAME}_numeric_conversion INTERFACE
)
set_property(TARGET ${CMAKE_WORKSPACE_NAME}_numeric_conversion PROPERTY EXPORT_NAME numeric_conversion)

target_link_libraries(${CMAKE_WORKSPACE_NAME}_numeric_conversion INTERFACE boost::core)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_numeric_conversion INTERFACE boost::conversion)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_numeric_conversion INTERFACE boost::mpl)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_numeric_conversion INTERFACE boost::type_traits)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_numeric_conversion INTERFACE boost::preprocessor)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_numeric_conversion INTERFACE boost::config)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_numeric_conversion INTERFACE boost::throw_exception)




bcm_deploy(TARGETS ${CMAKE_WORKSPACE_NAME}_numeric_conversion INCLUDE ${CMAKE_WORKSPACE_SOURCE}/include NAMESPACE ${CMAKE_WORKSPACE_NAME}::)

add_subdirectory(test)
