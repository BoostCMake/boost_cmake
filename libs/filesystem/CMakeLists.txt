cmake_minimum_required(VERSION 3.5)
project(${CMAKE_WORKSPACE_NAME}_filesystem)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(${CMAKE_WORKSPACE_NAME}_core)
find_package(${CMAKE_WORKSPACE_NAME}_static_assert)
find_package(${CMAKE_WORKSPACE_NAME}_functional)
find_package(${CMAKE_WORKSPACE_NAME}_iterator)
find_package(${CMAKE_WORKSPACE_NAME}_system)
find_package(${CMAKE_WORKSPACE_NAME}_detail)
find_package(${CMAKE_WORKSPACE_NAME}_assert)
find_package(${CMAKE_WORKSPACE_NAME}_range)
find_package(${CMAKE_WORKSPACE_NAME}_type_traits)
find_package(${CMAKE_WORKSPACE_NAME}_smart_ptr)
find_package(${CMAKE_WORKSPACE_NAME}_io)
find_package(${CMAKE_WORKSPACE_NAME}_config)

bcm_setup_version(VERSION 1.58.0)

add_library(${CMAKE_WORKSPACE_NAME}_filesystem
            src/path_traits.cpp
            src/portability.cpp
            src/unique_path.cpp
            src/path.cpp
            src/windows_file_codecvt.cpp
            src/operations.cpp
            src/codecvt_error_category.cpp
            src/utf8_codecvt_facet.cpp
            )

if(BUILD_SHARED_LIBS)
    target_compile_definitions(${CMAKE_WORKSPACE_NAME}_filesystem PRIVATE -DBOOST_FILESYSTEM_DYN_LINK=1)
else()
    target_compile_definitions(${CMAKE_WORKSPACE_NAME}_filesystem PRIVATE -DBOOST_FILESYSTEM_STATIC_LINK=1)
endif()

set_property(TARGET ${CMAKE_WORKSPACE_NAME}_filesystem PROPERTY EXPORT_NAME filesystem)

target_link_libraries(${CMAKE_WORKSPACE_NAME}_filesystem PUBLIC boost::core)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_filesystem PUBLIC boost::static_assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_filesystem PUBLIC boost::functional)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_filesystem PUBLIC boost::iterator)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_filesystem PUBLIC boost::system)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_filesystem PUBLIC boost::detail)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_filesystem PUBLIC boost::assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_filesystem PUBLIC boost::range)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_filesystem PUBLIC boost::type_traits)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_filesystem PUBLIC boost::smart_ptr)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_filesystem PUBLIC boost::io)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_filesystem PUBLIC boost::config)

target_include_directories(${CMAKE_WORKSPACE_NAME}_filesystem PRIVATE include)

bcm_deploy(TARGETS ${CMAKE_WORKSPACE_NAME}_filesystem INCLUDE include NAMESPACE ${CMAKE_WORKSPACE_NAME}::)

add_subdirectory(test)
