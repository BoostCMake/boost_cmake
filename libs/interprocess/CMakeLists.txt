cmake_minimum_required(VERSION 3.5)

find_package(CM)
include(CMDeploy)
include(CMSetupVersion)

cm_project(${CMAKE_WORKSPACE_NAME} interprocess)

find_package(${CMAKE_WORKSPACE_NAME}_core)
find_package(${CMAKE_WORKSPACE_NAME}_static_assert)
find_package(${CMAKE_WORKSPACE_NAME}_container)
find_package(${CMAKE_WORKSPACE_NAME}_date_time)
find_package(${CMAKE_WORKSPACE_NAME}_winapi)
find_package(${CMAKE_WORKSPACE_NAME}_move)
find_package(${CMAKE_WORKSPACE_NAME}_assert)
find_package(${CMAKE_WORKSPACE_NAME}_type_traits)
find_package(${CMAKE_WORKSPACE_NAME}_integer)
find_package(${CMAKE_WORKSPACE_NAME}_intrusive)
find_package(${CMAKE_WORKSPACE_NAME}_config)
find_package(${CMAKE_WORKSPACE_NAME}_unordered)

cm_setup_version(VERSION 1.60.0)

add_library(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} INTERFACE)
set_property(TARGET ${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PROPERTY EXPORT_NAME interprocess)

target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} INTERFACE ${CMAKE_WORKSPACE_NAME}::core)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} INTERFACE ${CMAKE_WORKSPACE_NAME}::static_assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} INTERFACE ${CMAKE_WORKSPACE_NAME}::container)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} INTERFACE ${CMAKE_WORKSPACE_NAME}::date_time)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} INTERFACE ${CMAKE_WORKSPACE_NAME}::winapi)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} INTERFACE ${CMAKE_WORKSPACE_NAME}::move)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} INTERFACE ${CMAKE_WORKSPACE_NAME}::assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} INTERFACE ${CMAKE_WORKSPACE_NAME}::type_traits)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} INTERFACE ${CMAKE_WORKSPACE_NAME}::integer)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} INTERFACE ${CMAKE_WORKSPACE_NAME}::intrusive)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} INTERFACE ${CMAKE_WORKSPACE_NAME}::config)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} INTERFACE ${CMAKE_WORKSPACE_NAME}::unordered)

if("${CMAKE_SYSTEM_NAME}" MATCHES "Linux")
    target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} INTERFACE -lrt)
endif()
if(WIN32)
    target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} INTERFACE -lole32 -loleaut32 -lpsapi -ladvapi32)
endif()

cm_deploy(TARGETS ${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} INCLUDE ${CURRENT_SOURCES_DIR}/include NAMESPACE ${CMAKE_WORKSPACE_NAME}::)

add_subdirectory(test)
