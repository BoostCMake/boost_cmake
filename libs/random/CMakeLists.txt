cmake_minimum_required(VERSION 3.5)
project(${CMAKE_WORKSPACE_NAME}_random)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(${CMAKE_WORKSPACE_NAME}_core)
find_package(${CMAKE_WORKSPACE_NAME}_static_assert)
find_package(${CMAKE_WORKSPACE_NAME}_mpl)
find_package(${CMAKE_WORKSPACE_NAME}_system)
find_package(${CMAKE_WORKSPACE_NAME}_assert)
find_package(${CMAKE_WORKSPACE_NAME}_range)
find_package(${CMAKE_WORKSPACE_NAME}_type_traits)
find_package(${CMAKE_WORKSPACE_NAME}_integer)
find_package(${CMAKE_WORKSPACE_NAME}_config)
find_package(${CMAKE_WORKSPACE_NAME}_throw_exception)
find_package(${CMAKE_WORKSPACE_NAME}_math)
find_package(${CMAKE_WORKSPACE_NAME}_utility)

bcm_setup_version(VERSION 1.58.0)

add_library(${CMAKE_WORKSPACE_NAME}_random
            src/random_device.cpp
            )

if(BUILD_SHARED_LIBS)
    target_compile_definitions(${CMAKE_WORKSPACE_NAME}_random PRIVATE -DBOOST_RANDOM_DYN_LINK=1)
endif()

set_property(TARGET ${CMAKE_WORKSPACE_NAME}_random PROPERTY EXPORT_NAME random)

target_link_libraries(${CMAKE_WORKSPACE_NAME}_random PUBLIC boost::core)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_random PUBLIC boost::static_assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_random PUBLIC boost::mpl)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_random PUBLIC boost::system)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_random PUBLIC boost::assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_random PUBLIC boost::range)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_random PUBLIC boost::type_traits)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_random PUBLIC boost::integer)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_random PUBLIC boost::config)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_random PUBLIC boost::throw_exception)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_random PUBLIC boost::math)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_random PUBLIC boost::utility)

target_include_directories(${CMAKE_WORKSPACE_NAME}_random PRIVATE include)

bcm_deploy(TARGETS ${CMAKE_WORKSPACE_NAME}_random INCLUDE include NAMESPACE ${CMAKE_WORKSPACE_NAME}::)

add_subdirectory(test)