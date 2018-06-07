cmake_minimum_required(VERSION 3.5)
project(${CMAKE_WORKSPACE_NAME}_type_erasure)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(${CMAKE_WORKSPACE_NAME}_core)
find_package(${CMAKE_WORKSPACE_NAME}_thread)
find_package(${CMAKE_WORKSPACE_NAME}_iterator)
find_package(${CMAKE_WORKSPACE_NAME}_typeof)
find_package(${CMAKE_WORKSPACE_NAME}_mpl)
find_package(${CMAKE_WORKSPACE_NAME}_assert)
find_package(${CMAKE_WORKSPACE_NAME}_fusion)
find_package(${CMAKE_WORKSPACE_NAME}_type_traits)
find_package(${CMAKE_WORKSPACE_NAME}_preprocessor)
find_package(${CMAKE_WORKSPACE_NAME}_config)
find_package(${CMAKE_WORKSPACE_NAME}_throw_exception)
find_package(${CMAKE_WORKSPACE_NAME}_smart_ptr)

bcm_setup_version(VERSION 1.58.0)

add_library(${CMAKE_WORKSPACE_NAME}_type_erasure INTERFACE
            #src/dynamic_binding.cpp
            )
set_property(TARGET ${CMAKE_WORKSPACE_NAME}_type_erasure PROPERTY EXPORT_NAME type_erasure)

target_link_libraries(${CMAKE_WORKSPACE_NAME}_type_erasure INTERFACE boost::core)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_type_erasure INTERFACE boost::thread)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_type_erasure INTERFACE boost::iterator)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_type_erasure INTERFACE boost::typeof)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_type_erasure INTERFACE boost::mpl)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_type_erasure INTERFACE boost::assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_type_erasure INTERFACE boost::fusion)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_type_erasure INTERFACE boost::type_traits)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_type_erasure INTERFACE boost::preprocessor)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_type_erasure INTERFACE boost::config)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_type_erasure INTERFACE boost::throw_exception)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_type_erasure INTERFACE boost::smart_ptr)

# target_include_directories(${CMAKE_WORKSPACE_NAME}_type_erasure INTERFACE include)

bcm_deploy(TARGETS ${CMAKE_WORKSPACE_NAME}_type_erasure INCLUDE ${CMAKE_WORKSPACE_SOURCE}/include NAMESPACE ${CMAKE_WORKSPACE_NAME}::)

add_subdirectory(test)
