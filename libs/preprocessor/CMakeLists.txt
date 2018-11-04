cmake_minimum_required(VERSION 3.5)

find_package(CM)
include(CMDeploy)
include(CMSetupVersion)

cm_project(${CMAKE_WORKSPACE_NAME} preprocessor)


cm_setup_version(VERSION 1.60.0)

add_library(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} INTERFACE)
set_property(TARGET ${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PROPERTY EXPORT_NAME preprocessor)

cm_deploy(TARGETS ${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} INCLUDE ${CURRENT_SOURCES_DIR}/include NAMESPACE ${CMAKE_WORKSPACE_NAME}::)

add_subdirectory(test)
