cmake_minimum_required(VERSION 3.5)
project(${CMAKE_WORKSPACE_NAME}_lambda)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(${CMAKE_WORKSPACE_NAME}_core)
find_package(${CMAKE_WORKSPACE_NAME}_iterator)
find_package(${CMAKE_WORKSPACE_NAME}_tuple)
find_package(${CMAKE_WORKSPACE_NAME}_bind)
find_package(${CMAKE_WORKSPACE_NAME}_mpl)
find_package(${CMAKE_WORKSPACE_NAME}_detail)
find_package(${CMAKE_WORKSPACE_NAME}_type_traits)
find_package(${CMAKE_WORKSPACE_NAME}_preprocessor)
find_package(${CMAKE_WORKSPACE_NAME}_utility)
find_package(${CMAKE_WORKSPACE_NAME}_config)

bcm_setup_version(VERSION 1.58.0)

add_library(${CMAKE_WORKSPACE_NAME}_lambda INTERFACE)
set_property(TARGET ${CMAKE_WORKSPACE_NAME}_lambda PROPERTY EXPORT_NAME lambda)

target_link_libraries(${CMAKE_WORKSPACE_NAME}_lambda INTERFACE boost::core)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_lambda INTERFACE boost::iterator)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_lambda INTERFACE boost::tuple)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_lambda INTERFACE boost::bind)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_lambda INTERFACE boost::mpl)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_lambda INTERFACE boost::detail)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_lambda INTERFACE boost::type_traits)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_lambda INTERFACE boost::preprocessor)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_lambda INTERFACE boost::utility)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_lambda INTERFACE boost::config)


bcm_deploy(TARGETS ${CMAKE_WORKSPACE_NAME}_lambda INCLUDE include NAMESPACE ${CMAKE_WORKSPACE_NAME}::)

add_subdirectory(test)
