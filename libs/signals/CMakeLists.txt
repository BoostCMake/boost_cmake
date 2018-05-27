cmake_minimum_required(VERSION 3.5)
project(${CMAKE_WORKSPACE_NAME}_signals)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(${CMAKE_WORKSPACE_NAME}_align)
find_package(${CMAKE_WORKSPACE_NAME}_function)
find_package(${CMAKE_WORKSPACE_NAME}_core)
find_package(${CMAKE_WORKSPACE_NAME}_iterator)
find_package(${CMAKE_WORKSPACE_NAME}_optional)
find_package(${CMAKE_WORKSPACE_NAME}_mpl)
find_package(${CMAKE_WORKSPACE_NAME}_type_traits)
find_package(${CMAKE_WORKSPACE_NAME}_smart_ptr)
find_package(${CMAKE_WORKSPACE_NAME}_config)
find_package(${CMAKE_WORKSPACE_NAME}_any)
find_package(${CMAKE_WORKSPACE_NAME}_utility)

bcm_setup_version(VERSION 1.58.0)

add_library(${CMAKE_WORKSPACE_NAME}_signals
            src/connection.cpp
            src/slot.cpp
            src/signal_base.cpp
            src/named_slot_map.cpp
            src/trackable.cpp
            )

if(BUILD_SHARED_LIBS)
    target_compile_definitions(${CMAKE_WORKSPACE_NAME}_signals PRIVATE -DBOOST_SIGNALS_DYN_LINK=1 -DBOOST_SIGNALS_NO_LIB=1)
endif()

set_property(TARGET ${CMAKE_WORKSPACE_NAME}_signals PROPERTY EXPORT_NAME signals)

target_link_libraries(${CMAKE_WORKSPACE_NAME}_signals PUBLIC boost::align)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_signals PUBLIC boost::function)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_signals PUBLIC boost::core)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_signals PUBLIC boost::iterator)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_signals PUBLIC boost::optional)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_signals PUBLIC boost::mpl)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_signals PUBLIC boost::type_traits)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_signals PUBLIC boost::smart_ptr)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_signals PUBLIC boost::config)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_signals PUBLIC boost::any)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_signals PUBLIC boost::utility)

target_include_directories(${CMAKE_WORKSPACE_NAME}_signals PRIVATE include)

bcm_deploy(TARGETS ${CMAKE_WORKSPACE_NAME}_signals INCLUDE include NAMESPACE ${CMAKE_WORKSPACE_NAME}::)

add_subdirectory(test)
