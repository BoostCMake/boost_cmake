cmake_minimum_required(VERSION 3.5)
project(${CMAKE_WORKSPACE_NAME}_asio)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(${CMAKE_WORKSPACE_NAME}_date_time)
find_package(${CMAKE_WORKSPACE_NAME}_coroutine)
find_package(${CMAKE_WORKSPACE_NAME}_function)
find_package(${CMAKE_WORKSPACE_NAME}_bind)
find_package(${CMAKE_WORKSPACE_NAME}_chrono)
find_package(${CMAKE_WORKSPACE_NAME}_system)
find_package(${CMAKE_WORKSPACE_NAME}_regex)
find_package(${CMAKE_WORKSPACE_NAME}_assert)
find_package(${CMAKE_WORKSPACE_NAME}_core)
find_package(${CMAKE_WORKSPACE_NAME}_type_traits)
find_package(${CMAKE_WORKSPACE_NAME}_smart_ptr)
find_package(${CMAKE_WORKSPACE_NAME}_array)
find_package(${CMAKE_WORKSPACE_NAME}_config)
find_package(${CMAKE_WORKSPACE_NAME}_throw_exception)

bcm_setup_version(VERSION 1.58.0)

add_library(${CMAKE_WORKSPACE_NAME}_asio INTERFACE
            )
set_property(TARGET ${CMAKE_WORKSPACE_NAME}_asio PROPERTY EXPORT_NAME asio)

target_link_libraries(${CMAKE_WORKSPACE_NAME}_asio INTERFACE boost::date_time)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_asio INTERFACE boost::coroutine)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_asio INTERFACE boost::function)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_asio INTERFACE boost::bind)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_asio INTERFACE boost::chrono)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_asio INTERFACE boost::system)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_asio INTERFACE boost::regex)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_asio INTERFACE boost::assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_asio INTERFACE boost::core)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_asio INTERFACE boost::type_traits)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_asio INTERFACE boost::smart_ptr)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_asio INTERFACE boost::array)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_asio INTERFACE boost::config)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_asio INTERFACE boost::throw_exception)

find_package(Threads)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_asio INTERFACE Threads::Threads)

find_package(OpenSSL)
if(OpenSSL_FOUND)
    target_link_libraries(${CMAKE_WORKSPACE_NAME}_asio INTERFACE OpenSSL::SSL)
endif()


bcm_deploy(TARGETS ${CMAKE_WORKSPACE_NAME}_asio INCLUDE include NAMESPACE ${CMAKE_WORKSPACE_NAME}::)

add_subdirectory(test)
