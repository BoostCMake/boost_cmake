cmake_minimum_required(VERSION 3.5)


find_package(CM)
include(CMDeploy)
include(CMSetupVersion)

cm_project(${CMAKE_WORKSPACE_NAME} chrono)

find_package(${CMAKE_WORKSPACE_NAME}_core)
find_package(${CMAKE_WORKSPACE_NAME}_static_assert)
find_package(${CMAKE_WORKSPACE_NAME}_ratio)
find_package(${CMAKE_WORKSPACE_NAME}_predef)
find_package(${CMAKE_WORKSPACE_NAME}_winapi)
find_package(${CMAKE_WORKSPACE_NAME}_mpl)
find_package(${CMAKE_WORKSPACE_NAME}_move)
find_package(${CMAKE_WORKSPACE_NAME}_system)
find_package(${CMAKE_WORKSPACE_NAME}_assert)
find_package(${CMAKE_WORKSPACE_NAME}_type_traits)
find_package(${CMAKE_WORKSPACE_NAME}_typeof)
find_package(${CMAKE_WORKSPACE_NAME}_integer)
find_package(${CMAKE_WORKSPACE_NAME}_config)
find_package(${CMAKE_WORKSPACE_NAME}_throw_exception)
find_package(${CMAKE_WORKSPACE_NAME}_utility)

cm_setup_version(VERSION 1.60.0)

add_library(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME}
        ${CURRENT_SOURCES_DIR}/src/chrono.cpp
        ${CURRENT_SOURCES_DIR}/src/thread_clock.cpp
        ${CURRENT_SOURCES_DIR}/src/process_cpu_clocks.cpp
            )

if(BUILD_SHARED_LIBS)
    target_compile_definitions(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PRIVATE -DBOOST_CHRONO_DYN_LINK=1 -DBOOST_ALL_DYN_LINK=1)
else()
    target_compile_definitions(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PRIVATE -DBOOST_CHRONO_STATIC_LINK=1 -DBOOST_All_STATIC_LINK=1)
endif()

if(NOT BUILD_MULTITHREADED_LIBRARIES)
    target_compile_definitions(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PRIVATE -DBOOST_CHRONO_THREAD_DISABLED)
endif()

set_property(TARGET ${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PROPERTY EXPORT_NAME chrono)

target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::core)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::static_assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::ratio)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::predef)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::winapi)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::mpl)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::move)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::system)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::type_traits)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::typeof)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::integer)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::config)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::throw_exception)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::utility)

target_include_directories(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PRIVATE ${CURRENT_SOURCES_DIR}/include)

cm_deploy(TARGETS ${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} INCLUDE ${CURRENT_SOURCES_DIR}/include NAMESPACE ${CMAKE_WORKSPACE_NAME}::)

add_subdirectory(test)
