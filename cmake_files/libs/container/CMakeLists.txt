cmake_minimum_required(VERSION 3.5)
project(${CMAKE_WORKSPACE_NAME}_container)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(${CMAKE_WORKSPACE_NAME}_core)
find_package(${CMAKE_WORKSPACE_NAME}_static_assert)
find_package(${CMAKE_WORKSPACE_NAME}_move)
#find_package(${CMAKE_WORKSPACE_NAME}_functional)
find_package(${CMAKE_WORKSPACE_NAME}_assert)
find_package(${CMAKE_WORKSPACE_NAME}_type_traits)
find_package(${CMAKE_WORKSPACE_NAME}_intrusive)
find_package(${CMAKE_WORKSPACE_NAME}_config)

bcm_setup_version(VERSION 1.58.0)

add_library(${CMAKE_WORKSPACE_NAME}_container
        ${CMAKE_WORKSPACE_SOURCE}/src/alloc_lib.c
            # src/unsynchronized_pool_resource.cpp
            # src/monotonic_buffer_resource.cpp
            # src/synchronized_pool_resource.cpp
            # src/dlmalloc_2_8_6.c
            # src/dlmalloc_ext_2_8_6.c
            # src/pool_resource.cpp
            # src/global_resource.cpp
            )

if(BUILD_SHARED_LIBS)
    target_compile_definitions(${CMAKE_WORKSPACE_NAME}_container PRIVATE -DBOOST_CONTAINER_DYN_LINK=1)
else()
    target_compile_definitions(${CMAKE_WORKSPACE_NAME}_container PRIVATE -DBOOST_CONTAINER_STATIC_LINK=1)
endif()

set_property(TARGET ${CMAKE_WORKSPACE_NAME}_container PROPERTY EXPORT_NAME container)

target_link_libraries(${CMAKE_WORKSPACE_NAME}_container PUBLIC boost::core)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_container PUBLIC boost::static_assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_container PUBLIC boost::move)
#target_link_libraries(${CMAKE_WORKSPACE_NAME}_container PUBLIC boost::functional)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_container PUBLIC boost::assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_container PUBLIC boost::type_traits)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_container PUBLIC boost::intrusive)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_container PUBLIC boost::config)


target_include_directories(${CMAKE_WORKSPACE_NAME}_container PRIVATE ${CMAKE_WORKSPACE_SOURCE}/include)

bcm_deploy(TARGETS ${CMAKE_WORKSPACE_NAME}_container INCLUDE ${CMAKE_WORKSPACE_SOURCE}/include NAMESPACE ${CMAKE_WORKSPACE_NAME}::)

add_subdirectory(test)
