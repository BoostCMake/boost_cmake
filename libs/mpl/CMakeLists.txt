cmake_minimum_required(VERSION 3.5)
project(${CMAKE_WORKSPACE_NAME}_mpl)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(${CMAKE_WORKSPACE_NAME}_core)
find_package(${CMAKE_WORKSPACE_NAME}_static_assert)
find_package(${CMAKE_WORKSPACE_NAME}_predef)
find_package(${CMAKE_WORKSPACE_NAME}_type_traits)
find_package(${CMAKE_WORKSPACE_NAME}_preprocessor)
find_package(${CMAKE_WORKSPACE_NAME}_config)
find_package(${CMAKE_WORKSPACE_NAME}_utility)

bcm_setup_version(VERSION 1.58.0)

add_library(${CMAKE_WORKSPACE_NAME}_mpl INTERFACE)
set_property(TARGET ${CMAKE_WORKSPACE_NAME}_mpl PROPERTY EXPORT_NAME mpl)

target_link_libraries(${CMAKE_WORKSPACE_NAME}_mpl INTERFACE boost::core)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_mpl INTERFACE boost::static_assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_mpl INTERFACE boost::predef)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_mpl INTERFACE boost::type_traits)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_mpl INTERFACE boost::preprocessor)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_mpl INTERFACE boost::config)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_mpl INTERFACE boost::utility)


bcm_deploy(TARGETS ${CMAKE_WORKSPACE_NAME}_mpl INCLUDE include NAMESPACE ${CMAKE_WORKSPACE_NAME}::)

add_subdirectory(test)
