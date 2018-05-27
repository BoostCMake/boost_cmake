cmake_minimum_required(VERSION 3.5)
project(${CMAKE_WORKSPACE_NAME}_interprocess)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

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

bcm_setup_version(VERSION 1.58.0)

add_library(${CMAKE_WORKSPACE_NAME}_interprocess INTERFACE)
set_property(TARGET ${CMAKE_WORKSPACE_NAME}_interprocess PROPERTY EXPORT_NAME interprocess)

target_link_libraries(${CMAKE_WORKSPACE_NAME}_interprocess INTERFACE boost::core)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_interprocess INTERFACE boost::static_assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_interprocess INTERFACE boost::container)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_interprocess INTERFACE boost::date_time)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_interprocess INTERFACE boost::winapi)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_interprocess INTERFACE boost::move)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_interprocess INTERFACE boost::assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_interprocess INTERFACE boost::type_traits)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_interprocess INTERFACE boost::integer)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_interprocess INTERFACE boost::intrusive)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_interprocess INTERFACE boost::config)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_interprocess INTERFACE boost::unordered)

if("${CMAKE_SYSTEM_NAME}" MATCHES "Linux")
    target_link_libraries(${CMAKE_WORKSPACE_NAME}_interprocess INTERFACE -lrt)
endif()
if(WIN32)
    target_link_libraries(${CMAKE_WORKSPACE_NAME}_interprocess INTERFACE -lole32 -loleaut32 -lpsapi -ladvapi32)
endif()


bcm_deploy(TARGETS ${CMAKE_WORKSPACE_NAME}_interprocess INCLUDE include NAMESPACE ${CMAKE_WORKSPACE_NAME}::)

add_subdirectory(test)
