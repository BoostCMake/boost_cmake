cmake_minimum_required(VERSION 3.5)
project(${CMAKE_WORKSPACE_NAME}_utility)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(${CMAKE_WORKSPACE_NAME}_core)
find_package(${CMAKE_WORKSPACE_NAME}_static_assert)
find_package(${CMAKE_WORKSPACE_NAME}_mpl)
find_package(${CMAKE_WORKSPACE_NAME}_type_traits)
find_package(${CMAKE_WORKSPACE_NAME}_preprocessor)
find_package(${CMAKE_WORKSPACE_NAME}_config)
find_package(${CMAKE_WORKSPACE_NAME}_throw_exception)
#find_package(${CMAKE_WORKSPACE_NAME}_random)

bcm_setup_version(VERSION 1.58.0)

add_library(${CMAKE_WORKSPACE_NAME}_utility INTERFACE)
set_property(TARGET ${CMAKE_WORKSPACE_NAME}_utility PROPERTY EXPORT_NAME utility)

target_link_libraries(${CMAKE_WORKSPACE_NAME}_utility INTERFACE boost::core)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_utility INTERFACE boost::static_assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_utility INTERFACE boost::mpl)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_utility INTERFACE boost::type_traits)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_utility INTERFACE boost::preprocessor)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_utility INTERFACE boost::config)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_utility INTERFACE boost::throw_exception)
#target_link_libraries(${CMAKE_WORKSPACE_NAME}_utility INTERFACE boost::random)


bcm_deploy(TARGETS ${CMAKE_WORKSPACE_NAME}_utility INCLUDE ${CMAKE_WORKSPACE_SOURCE}/include NAMESPACE ${CMAKE_WORKSPACE_NAME}::)

add_subdirectory(test)
