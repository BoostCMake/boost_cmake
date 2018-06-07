cmake_minimum_required(VERSION 3.5)
find_package(MPI)
if(NOT MPI_CXX_FOUND)
    return()
endif()

project(${CMAKE_WORKSPACE_NAME}_mpi)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(${CMAKE_WORKSPACE_NAME}_assert)
find_package(${CMAKE_WORKSPACE_NAME}_throw_exception)
find_package(${CMAKE_WORKSPACE_NAME}_optional)
find_package(${CMAKE_WORKSPACE_NAME}_smart_ptr)
find_package(${CMAKE_WORKSPACE_NAME}_serialization)
find_package(${CMAKE_WORKSPACE_NAME}_graph)
find_package(${CMAKE_WORKSPACE_NAME}_python)

bcm_setup_version(VERSION 1.58.0)

add_library(${CMAKE_WORKSPACE_NAME}_mpi
        ${CMAKE_WORKSPACE_SOURCE}/src/broadcast.cpp
        ${CMAKE_WORKSPACE_SOURCE}/src/communicator.cpp
        ${CMAKE_WORKSPACE_SOURCE}/src/computation_tree.cpp
        ${CMAKE_WORKSPACE_SOURCE}/src/content_oarchive.cpp
        ${CMAKE_WORKSPACE_SOURCE}/src/environment.cpp
        ${CMAKE_WORKSPACE_SOURCE}/src/exception.cpp
        ${CMAKE_WORKSPACE_SOURCE}/src/graph_communicator.cpp
        ${CMAKE_WORKSPACE_SOURCE}/src/group.cpp
        ${CMAKE_WORKSPACE_SOURCE}/src/intercommunicator.cpp
        ${CMAKE_WORKSPACE_SOURCE}/src/mpi_datatype_cache.cpp
        ${CMAKE_WORKSPACE_SOURCE}/src/mpi_datatype_oarchive.cpp
        ${CMAKE_WORKSPACE_SOURCE}/src/packed_iarchive.cpp
        ${CMAKE_WORKSPACE_SOURCE}/src/packed_oarchive.cpp
        ${CMAKE_WORKSPACE_SOURCE}/src/packed_skeleton_iarchive.cpp
        ${CMAKE_WORKSPACE_SOURCE}/src/packed_skeleton_oarchive.cpp
        ${CMAKE_WORKSPACE_SOURCE}/src/point_to_point.cpp
        ${CMAKE_WORKSPACE_SOURCE}/src/request.cpp
        ${CMAKE_WORKSPACE_SOURCE}/src/text_skeleton_oarchive.cpp
        ${CMAKE_WORKSPACE_SOURCE}/src/timer.cpp)
target_compile_definitions(${CMAKE_WORKSPACE_NAME}_mpi PRIVATE -DBOOST_MPI_DYN_LINK=1 -DBOOST_MPI_SOURCE=1)

target_link_libraries(${CMAKE_WORKSPACE_NAME}_mpi PUBLIC boost::assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_mpi PUBLIC boost::throw_exception)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_mpi PUBLIC boost::optional)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_mpi PUBLIC boost::smart_ptr)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_mpi PUBLIC boost::serialization)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_mpi PUBLIC boost::python)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_mpi PUBLIC boost::graph)

set_property(TARGET ${CMAKE_WORKSPACE_NAME}_mpi PROPERTY EXPORT_NAME mpi)

target_include_directories(${CMAKE_WORKSPACE_NAME}_mpi PRIVATE ${CMAKE_WORKSPACE_SOURCE}/include)
bcm_deploy(TARGETS ${CMAKE_WORKSPACE_NAME}_mpi INCLUDE ${CMAKE_WORKSPACE_SOURCE}/include NAMESPACE ${CMAKE_WORKSPACE_NAME}::)

target_include_directories(${CMAKE_WORKSPACE_NAME}_mpi PUBLIC ${MPI_CXX_INCLUDE_PATH})
target_link_libraries(${CMAKE_WORKSPACE_NAME}_mpi PUBLIC ${MPI_CXX_LINK_FLAGS} ${MPI_CXX_LIBRARIES})

find_package(PythonLibs)
if(PythonLibs_FOUND)
    project(${CMAKE_WORKSPACE_NAME}_mpi_python)
    bcm_setup_version(VERSION 1.58.0)

    add_library(${CMAKE_WORKSPACE_NAME}_mpi_python SHARED  ${CMAKE_WORKSPACE_SOURCE}/src/python/serialize.cpp)
    target_compile_definitions(${CMAKE_WORKSPACE_NAME}_mpi_python PRIVATE -DBOOST_MPI_DYN_LINK=1 -DBOOST_MPI_PYTHON_DYN_LINK=1
                               -DBOOST_PYTHON_DYN_LINK=1 -DBOOST_MPI_PYTHON_SOURCE=1)

    target_link_libraries(${CMAKE_WORKSPACE_NAME}_mpi_python PRIVATE boost::mpi)

    bcm_deploy(TARGETS ${CMAKE_WORKSPACE_NAME}_mpi_python INCLUDE ${CMAKE_WORKSPACE_SOURCE}/include NAMESPACE ${CMAKE_WORKSPACE_NAME}::)

endif()

add_subdirectory(test)

