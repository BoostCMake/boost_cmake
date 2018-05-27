cmake_minimum_required(VERSION 3.5)
project(${CMAKE_WORKSPACE_NAME}_units)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(${CMAKE_WORKSPACE_NAME}_core)
find_package(${CMAKE_WORKSPACE_NAME}_static_assert)
find_package(${CMAKE_WORKSPACE_NAME}_mpl)
find_package(${CMAKE_WORKSPACE_NAME}_assert)
find_package(${CMAKE_WORKSPACE_NAME}_type_traits)
find_package(${CMAKE_WORKSPACE_NAME}_preprocessor)
find_package(${CMAKE_WORKSPACE_NAME}_typeof)
find_package(${CMAKE_WORKSPACE_NAME}_io)
find_package(${CMAKE_WORKSPACE_NAME}_integer)
find_package(${CMAKE_WORKSPACE_NAME}_serialization)
find_package(${CMAKE_WORKSPACE_NAME}_config)
find_package(${CMAKE_WORKSPACE_NAME}_math)
find_package(${CMAKE_WORKSPACE_NAME}_lambda)

bcm_setup_version(VERSION 1.58.0)

add_library(${CMAKE_WORKSPACE_NAME}_units INTERFACE)
set_property(TARGET ${CMAKE_WORKSPACE_NAME}_units PROPERTY EXPORT_NAME units)

target_link_libraries(${CMAKE_WORKSPACE_NAME}_units INTERFACE boost::core)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_units INTERFACE boost::static_assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_units INTERFACE boost::mpl)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_units INTERFACE boost::assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_units INTERFACE boost::type_traits)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_units INTERFACE boost::preprocessor)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_units INTERFACE boost::typeof)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_units INTERFACE boost::io)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_units INTERFACE boost::integer)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_units INTERFACE boost::serialization)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_units INTERFACE boost::config)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_units INTERFACE boost::math)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_units INTERFACE boost::lambda)


bcm_deploy(TARGETS ${CMAKE_WORKSPACE_NAME}_units INCLUDE include NAMESPACE ${CMAKE_WORKSPACE_NAME}::)

add_subdirectory(test)
