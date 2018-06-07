cmake_minimum_required(VERSION 3.5)
project(${CMAKE_WORKSPACE_NAME}_numeric_ublas)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(${CMAKE_WORKSPACE_NAME}_core)
find_package(${CMAKE_WORKSPACE_NAME}_iterator)
find_package(${CMAKE_WORKSPACE_NAME}_mpl)
find_package(${CMAKE_WORKSPACE_NAME}_static_assert)
find_package(${CMAKE_WORKSPACE_NAME}_numeric_interval)
find_package(${CMAKE_WORKSPACE_NAME}_range)
find_package(${CMAKE_WORKSPACE_NAME}_type_traits)
find_package(${CMAKE_WORKSPACE_NAME}_concept_check)
find_package(${CMAKE_WORKSPACE_NAME}_typeof)
find_package(${CMAKE_WORKSPACE_NAME}_serialization)
find_package(${CMAKE_WORKSPACE_NAME}_utility)
find_package(${CMAKE_WORKSPACE_NAME}_config)
find_package(${CMAKE_WORKSPACE_NAME}_smart_ptr)

bcm_setup_version(VERSION 1.58.0)

add_library(${CMAKE_WORKSPACE_NAME}_numeric_ublas INTERFACE
)
set_property(TARGET ${CMAKE_WORKSPACE_NAME}_numeric_ublas PROPERTY EXPORT_NAME numeric_ublas)

target_link_libraries(${CMAKE_WORKSPACE_NAME}_numeric_ublas INTERFACE boost::core)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_numeric_ublas INTERFACE boost::iterator)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_numeric_ublas INTERFACE boost::mpl)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_numeric_ublas INTERFACE boost::static_assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_numeric_ublas INTERFACE boost::numeric_interval)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_numeric_ublas INTERFACE boost::range)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_numeric_ublas INTERFACE boost::type_traits)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_numeric_ublas INTERFACE boost::concept_check)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_numeric_ublas INTERFACE boost::typeof)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_numeric_ublas INTERFACE boost::serialization)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_numeric_ublas INTERFACE boost::utility)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_numeric_ublas INTERFACE boost::config)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_numeric_ublas INTERFACE boost::smart_ptr)




bcm_deploy(TARGETS ${CMAKE_WORKSPACE_NAME}_numeric_ublas INCLUDE ${CMAKE_WORKSPACE_SOURCE}/include NAMESPACE ${CMAKE_WORKSPACE_NAME}::)

add_subdirectory(test)
