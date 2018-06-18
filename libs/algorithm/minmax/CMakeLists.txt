cmake_minimum_required(VERSION 3.5)
project(${CMAKE_WORKSPACE_NAME}_algorithm_minmax)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)
if(CMAKE_SOURCES_DIR)
    set(CURRENT_SOURCES_DIR ${CMAKE_SOURCES_DIR}/libs/${CURRENT_PROJECT_NAME})
endif()

#find_package(${CMAKE_WORKSPACE_NAME}_regex)

cm_setup_version(VERSION 1.58.0)

add_library(${CMAKE_WORKSPACE_NAME}_algorithm_minmax INTERFACE)
set_property(TARGET ${CMAKE_WORKSPACE_NAME}_algorithm_minmax PROPERTY EXPORT_NAME minmax)

#target_link_libraries(${CMAKE_WORKSPACE_NAME}_algorithm INTERFACE ${CMAKE_WORKSPACE_NAME}::regex)

cm_deploy(TARGETS ${CMAKE_WORKSPACE_NAME}_algorithm_minmax INCLUDE include NAMESPACE ${CMAKE_WORKSPACE_NAME}::)

add_subdirectory(test)