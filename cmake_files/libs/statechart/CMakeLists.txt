cmake_minimum_required(VERSION 3.5)
project(${CMAKE_WORKSPACE_NAME}_statechart)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(${CMAKE_WORKSPACE_NAME}_function)
find_package(${CMAKE_WORKSPACE_NAME}_core)
find_package(${CMAKE_WORKSPACE_NAME}_static_assert)
find_package(${CMAKE_WORKSPACE_NAME}_thread)
find_package(${CMAKE_WORKSPACE_NAME}_bind)
find_package(${CMAKE_WORKSPACE_NAME}_mpl)
find_package(${CMAKE_WORKSPACE_NAME}_detail)
find_package(${CMAKE_WORKSPACE_NAME}_assert)
find_package(${CMAKE_WORKSPACE_NAME}_type_traits)
find_package(${CMAKE_WORKSPACE_NAME}_smart_ptr)
find_package(${CMAKE_WORKSPACE_NAME}_config)
find_package(${CMAKE_WORKSPACE_NAME}_conversion)

bcm_setup_version(VERSION 1.58.0)

add_library(${CMAKE_WORKSPACE_NAME}_statechart INTERFACE)
set_property(TARGET ${CMAKE_WORKSPACE_NAME}_statechart PROPERTY EXPORT_NAME statechart)

target_link_libraries(${CMAKE_WORKSPACE_NAME}_statechart INTERFACE boost::function)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_statechart INTERFACE boost::core)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_statechart INTERFACE boost::static_assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_statechart INTERFACE boost::thread)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_statechart INTERFACE boost::bind)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_statechart INTERFACE boost::mpl)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_statechart INTERFACE boost::detail)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_statechart INTERFACE boost::assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_statechart INTERFACE boost::type_traits)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_statechart INTERFACE boost::smart_ptr)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_statechart INTERFACE boost::config)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_statechart INTERFACE boost::conversion)


bcm_deploy(TARGETS ${CMAKE_WORKSPACE_NAME}_statechart INCLUDE ${CMAKE_WORKSPACE_SOURCE}/include NAMESPACE ${CMAKE_WORKSPACE_NAME}::)

add_subdirectory(test)
