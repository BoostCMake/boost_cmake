cmake_minimum_required(VERSION 3.5)
project(${CMAKE_WORKSPACE_NAME}_assign)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(${CMAKE_WORKSPACE_NAME}_static_assert)
find_package(${CMAKE_WORKSPACE_NAME}_ptr_container)
find_package(${CMAKE_WORKSPACE_NAME}_tuple)
find_package(${CMAKE_WORKSPACE_NAME}_mpl)
find_package(${CMAKE_WORKSPACE_NAME}_range)
find_package(${CMAKE_WORKSPACE_NAME}_type_traits)
find_package(${CMAKE_WORKSPACE_NAME}_preprocessor)
find_package(${CMAKE_WORKSPACE_NAME}_array)
find_package(${CMAKE_WORKSPACE_NAME}_config)

bcm_setup_version(VERSION 1.58.0)

add_library(${CMAKE_WORKSPACE_NAME}_assign INTERFACE)
set_property(TARGET ${CMAKE_WORKSPACE_NAME}_assign PROPERTY EXPORT_NAME assign)

target_link_libraries(${CMAKE_WORKSPACE_NAME}_assign INTERFACE boost::static_assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_assign INTERFACE boost::ptr_container)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_assign INTERFACE boost::tuple)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_assign INTERFACE boost::mpl)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_assign INTERFACE boost::range)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_assign INTERFACE boost::type_traits)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_assign INTERFACE boost::preprocessor)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_assign INTERFACE boost::array)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_assign INTERFACE boost::config)

bcm_deploy(TARGETS ${CMAKE_WORKSPACE_NAME}_assign INCLUDE ${CMAKE_WORKSPACE_SOURCE}/include NAMESPACE ${CMAKE_WORKSPACE_NAME}::)

add_subdirectory(test)
