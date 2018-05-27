cmake_minimum_required(VERSION 3.5)
project(${CMAKE_WORKSPACE_NAME}_atomic)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(${CMAKE_WORKSPACE_NAME}_assert)
find_package(${CMAKE_WORKSPACE_NAME}_type_traits)
find_package(${CMAKE_WORKSPACE_NAME}_config)

bcm_setup_version(VERSION 1.58.0)

add_library(${CMAKE_WORKSPACE_NAME}_atomic src/lockpool.cpp)

if(BUILD_SHARED_LIBS)
    target_compile_definitions(${CMAKE_WORKSPACE_NAME}_atomic PRIVATE -DBOOST_ATOMIC_DYN_LINK=1)
else()
    target_compile_definitions(${CMAKE_WORKSPACE_NAME}_atomic PRIVATE -DBOOST_ATOMIC_STATIC_LINK=1)
endif()

if(CMAKE_HOST_WIN32)
    target_compile_definitions(${CMAKE_WORKSPACE_NAME}_atomic PRIVATE -DBOOST_USE_WINDOWS_H -D_WIN32_WINNT=0x0500)
    if(MINGW)
        target_link_libraries(${CMAKE_WORKSPACE_NAME}_atomic PRIVATE kernel32)
    endif()
endif()

set_property(TARGET ${CMAKE_WORKSPACE_NAME}_atomic PROPERTY EXPORT_NAME atomic)

target_link_libraries(${CMAKE_WORKSPACE_NAME}_atomic PUBLIC boost::assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_atomic PUBLIC boost::type_traits)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_atomic PUBLIC boost::config)

target_include_directories(${CMAKE_WORKSPACE_NAME}_atomic PRIVATE include)

bcm_deploy(TARGETS ${CMAKE_WORKSPACE_NAME}_atomic INCLUDE include NAMESPACE ${CMAKE_WORKSPACE_NAME}::)

add_subdirectory(test)
