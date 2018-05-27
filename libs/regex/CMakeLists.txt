cmake_minimum_required(VERSION 3.5)
project(${CMAKE_WORKSPACE_NAME}_regex)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(${CMAKE_WORKSPACE_NAME}_core)
find_package(${CMAKE_WORKSPACE_NAME}_static_assert)
find_package(${CMAKE_WORKSPACE_NAME}_iterator)
find_package(${CMAKE_WORKSPACE_NAME}_predef)
find_package(${CMAKE_WORKSPACE_NAME}_mpl)
find_package(${CMAKE_WORKSPACE_NAME}_functional)
find_package(${CMAKE_WORKSPACE_NAME}_assert)
find_package(${CMAKE_WORKSPACE_NAME}_type_traits)
find_package(${CMAKE_WORKSPACE_NAME}_concept_check)
find_package(${CMAKE_WORKSPACE_NAME}_smart_ptr)
find_package(${CMAKE_WORKSPACE_NAME}_integer)
find_package(${CMAKE_WORKSPACE_NAME}_config)
find_package(${CMAKE_WORKSPACE_NAME}_throw_exception)

bcm_setup_version(VERSION 1.58.0)

add_library(${CMAKE_WORKSPACE_NAME}_regex
            src/w32_regex_traits.cpp
            src/wide_posix_api.cpp
            src/regex_debug.cpp
            src/winstances.cpp
            src/regex_raw_buffer.cpp
            src/cregex.cpp
            src/instances.cpp
            src/static_mutex.cpp
            src/wc_regex_traits.cpp
            src/icu.cpp
            src/posix_api.cpp
            src/fileiter.cpp
            src/regex_traits_defaults.cpp
            src/c_regex_traits.cpp
            src/regex.cpp
            src/usinstances.cpp
            src/cpp_regex_traits.cpp
            )

if(BUILD_SHARED_LIBS)
    target_compile_definitions(${CMAKE_WORKSPACE_NAME}_regex PRIVATE -DBOOST_REGEX_DYN_LINK=1)
endif()

set_property(TARGET ${CMAKE_WORKSPACE_NAME}_regex PROPERTY EXPORT_NAME regex)

target_link_libraries(${CMAKE_WORKSPACE_NAME}_regex PUBLIC boost::core)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_regex PUBLIC boost::static_assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_regex PUBLIC boost::iterator)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_regex PUBLIC boost::predef)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_regex PUBLIC boost::mpl)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_regex PUBLIC boost::functional)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_regex PUBLIC boost::assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_regex PUBLIC boost::type_traits)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_regex PUBLIC boost::concept_check)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_regex PUBLIC boost::smart_ptr)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_regex PUBLIC boost::integer)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_regex PUBLIC boost::config)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_regex PUBLIC boost::throw_exception)

target_include_directories(${CMAKE_WORKSPACE_NAME}_regex PRIVATE include)

bcm_deploy(TARGETS ${CMAKE_WORKSPACE_NAME}_regex INCLUDE include NAMESPACE ${CMAKE_WORKSPACE_NAME}::)

add_subdirectory(test)