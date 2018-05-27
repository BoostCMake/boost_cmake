cmake_minimum_required(VERSION 3.5)
project(${CMAKE_WORKSPACE_NAME}_timer)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(${CMAKE_WORKSPACE_NAME}_core)
find_package(${CMAKE_WORKSPACE_NAME}_chrono)
find_package(${CMAKE_WORKSPACE_NAME}_system)
find_package(${CMAKE_WORKSPACE_NAME}_io)
find_package(${CMAKE_WORKSPACE_NAME}_config)
find_package(${CMAKE_WORKSPACE_NAME}_throw_exception)

bcm_setup_version(VERSION 1.58.0)

add_library(${CMAKE_WORKSPACE_NAME}_timer
            src/auto_timers_construction.cpp
            src/cpu_timer.cpp
            )

if(BUILD_SHARED_LIBS)
    target_compile_definitions(${CMAKE_WORKSPACE_NAME}_timer PRIVATE -DBOOST_TIMER_DYN_LINK=1)
else()
    target_compile_definitions(${CMAKE_WORKSPACE_NAME}_timer PRIVATE -DBOOST_TIMER_STATIC_LINK=1)
endif()

set_property(TARGET ${CMAKE_WORKSPACE_NAME}_timer PROPERTY EXPORT_NAME timer)

target_link_libraries(${CMAKE_WORKSPACE_NAME}_timer PUBLIC boost::core)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_timer PUBLIC boost::chrono)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_timer PUBLIC boost::system)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_timer PUBLIC boost::io)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_timer PUBLIC boost::config)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_timer PUBLIC boost::throw_exception)

target_include_directories(${CMAKE_WORKSPACE_NAME}_timer PRIVATE include)

bcm_deploy(TARGETS ${CMAKE_WORKSPACE_NAME}_timer INCLUDE include NAMESPACE ${CMAKE_WORKSPACE_NAME}::)

add_subdirectory(test)
