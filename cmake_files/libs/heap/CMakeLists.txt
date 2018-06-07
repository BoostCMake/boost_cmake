cmake_minimum_required(VERSION 3.5)
project(${CMAKE_WORKSPACE_NAME}_heap)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(${CMAKE_WORKSPACE_NAME}_static_assert)
find_package(${CMAKE_WORKSPACE_NAME}_iterator)
find_package(${CMAKE_WORKSPACE_NAME}_bind)
find_package(${CMAKE_WORKSPACE_NAME}_mpl)
find_package(${CMAKE_WORKSPACE_NAME}_intrusive)
find_package(${CMAKE_WORKSPACE_NAME}_assert)
find_package(${CMAKE_WORKSPACE_NAME}_type_traits)
find_package(${CMAKE_WORKSPACE_NAME}_concept_check)
find_package(${CMAKE_WORKSPACE_NAME}_array)
find_package(${CMAKE_WORKSPACE_NAME}_config)
find_package(${CMAKE_WORKSPACE_NAME}_parameter)
find_package(${CMAKE_WORKSPACE_NAME}_throw_exception)

bcm_setup_version(VERSION 1.58.0)

add_library(${CMAKE_WORKSPACE_NAME}_heap INTERFACE)
set_property(TARGET ${CMAKE_WORKSPACE_NAME}_heap PROPERTY EXPORT_NAME heap)

target_link_libraries(${CMAKE_WORKSPACE_NAME}_heap INTERFACE boost::static_assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_heap INTERFACE boost::iterator)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_heap INTERFACE boost::bind)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_heap INTERFACE boost::mpl)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_heap INTERFACE boost::intrusive)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_heap INTERFACE boost::assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_heap INTERFACE boost::type_traits)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_heap INTERFACE boost::concept_check)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_heap INTERFACE boost::array)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_heap INTERFACE boost::config)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_heap INTERFACE boost::parameter)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_heap INTERFACE boost::throw_exception)


bcm_deploy(TARGETS ${CMAKE_WORKSPACE_NAME}_heap INCLUDE ${CMAKE_WORKSPACE_SOURCE}/include NAMESPACE ${CMAKE_WORKSPACE_NAME}::)

add_subdirectory(test)
