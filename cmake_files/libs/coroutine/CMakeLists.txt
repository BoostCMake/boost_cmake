cmake_minimum_required(VERSION 3.5)
project(${CMAKE_WORKSPACE_NAME}_coroutine)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(${CMAKE_WORKSPACE_NAME}_core)
find_package(${CMAKE_WORKSPACE_NAME}_exception)
find_package(${CMAKE_WORKSPACE_NAME}_thread)
find_package(${CMAKE_WORKSPACE_NAME}_move)
find_package(${CMAKE_WORKSPACE_NAME}_system)
find_package(${CMAKE_WORKSPACE_NAME}_assert)
find_package(${CMAKE_WORKSPACE_NAME}_range)
find_package(${CMAKE_WORKSPACE_NAME}_type_traits)
find_package(${CMAKE_WORKSPACE_NAME}_context)
find_package(${CMAKE_WORKSPACE_NAME}_config)
find_package(${CMAKE_WORKSPACE_NAME}_throw_exception)
find_package(${CMAKE_WORKSPACE_NAME}_utility)

bcm_setup_version(VERSION 1.58.0)

add_library(${CMAKE_WORKSPACE_NAME}_coroutine
        ${CMAKE_WORKSPACE_SOURCE}/src/exceptions.cpp
            )

if(BUILD_SHARED_LIBS)
    target_compile_definitions(${CMAKE_WORKSPACE_NAME}_coroutine PRIVATE -DBOOST_COROUTINES_DYN_LINK=1)
endif()

set_property(TARGET ${CMAKE_WORKSPACE_NAME}_coroutine PROPERTY EXPORT_NAME coroutine)

target_link_libraries(${CMAKE_WORKSPACE_NAME}_coroutine PUBLIC boost::core)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_coroutine PUBLIC boost::exception)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_coroutine PUBLIC boost::thread)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_coroutine PUBLIC boost::move)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_coroutine PUBLIC boost::system)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_coroutine PUBLIC boost::assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_coroutine PUBLIC boost::range)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_coroutine PUBLIC boost::type_traits)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_coroutine PUBLIC boost::context)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_coroutine PUBLIC boost::config)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_coroutine PUBLIC boost::throw_exception)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_coroutine PUBLIC boost::utility)

target_sources(${CMAKE_WORKSPACE_NAME}_coroutine PRIVATE ${CMAKE_WORKSPACE_SOURCE}/src/detail/coroutine_context.cpp)
if(WIN32)
    target_sources(${CMAKE_WORKSPACE_NAME}_coroutine PRIVATE ${CMAKE_WORKSPACE_SOURCE}/src/windows/stack_traits.cpp)
else()
    target_sources(${CMAKE_WORKSPACE_NAME}_coroutine PRIVATE ${CMAKE_WORKSPACE_SOURCE}/src/posix/stack_traits.cpp)
endif()

target_include_directories(${CMAKE_WORKSPACE_NAME}_coroutine PRIVATE ${CMAKE_WORKSPACE_SOURCE}/include)

bcm_deploy(TARGETS ${CMAKE_WORKSPACE_NAME}_coroutine INCLUDE ${CMAKE_WORKSPACE_SOURCE}/include NAMESPACE ${CMAKE_WORKSPACE_NAME}::)

add_subdirectory(test)
