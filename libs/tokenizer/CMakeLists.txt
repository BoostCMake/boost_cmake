cmake_minimum_required(VERSION 3.5)
project(${CMAKE_WORKSPACE_NAME}_tokenizer)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(${CMAKE_WORKSPACE_NAME}_iterator)
find_package(${CMAKE_WORKSPACE_NAME}_mpl)
find_package(${CMAKE_WORKSPACE_NAME}_assert)
find_package(${CMAKE_WORKSPACE_NAME}_config)
find_package(${CMAKE_WORKSPACE_NAME}_throw_exception)

bcm_setup_version(VERSION 1.58.0)

add_library(${CMAKE_WORKSPACE_NAME}_tokenizer INTERFACE)
set_property(TARGET ${CMAKE_WORKSPACE_NAME}_tokenizer PROPERTY EXPORT_NAME tokenizer)

target_link_libraries(${CMAKE_WORKSPACE_NAME}_tokenizer INTERFACE boost::iterator)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_tokenizer INTERFACE boost::mpl)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_tokenizer INTERFACE boost::assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_tokenizer INTERFACE boost::config)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_tokenizer INTERFACE boost::throw_exception)


bcm_deploy(TARGETS ${CMAKE_WORKSPACE_NAME}_tokenizer INCLUDE include NAMESPACE ${CMAKE_WORKSPACE_NAME}::)

add_subdirectory(test)
