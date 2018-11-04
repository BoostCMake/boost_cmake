cmake_minimum_required(VERSION 3.5)

find_package(CM)
include(CMDeploy)
include(CMSetupVersion)

cm_project(${CMAKE_WORKSPACE_NAME} system)

find_package(${CMAKE_WORKSPACE_NAME}_assert)
find_package(${CMAKE_WORKSPACE_NAME}_core)
find_package(${CMAKE_WORKSPACE_NAME}_config)
find_package(${CMAKE_WORKSPACE_NAME}_predef)

cm_setup_version(VERSION 1.60.0)

add_library(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME}
        ${CURRENT_SOURCES_DIR}/src/error_code.cpp
            )

if(BUILD_SHARED_LIBS)
    target_compile_definitions(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PRIVATE -DBOOST_SYSTEM_DYN_LINK=1)
else()
    target_compile_definitions(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PRIVATE -DBOOST_SYSTEM_STATIC_LINK=1)
endif()
set_property(TARGET ${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PROPERTY EXPORT_NAME system)

target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::core)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::config)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::predef)

target_include_directories(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PRIVATE ${CURRENT_SOURCES_DIR}/include)

cm_deploy(TARGETS ${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} INCLUDE ${CURRENT_SOURCES_DIR}/include NAMESPACE ${CMAKE_WORKSPACE_NAME}::)

add_subdirectory(test)
