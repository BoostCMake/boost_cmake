cmake_minimum_required(VERSION 3.5)
find_package(MPI)
if(NOT MPI_CXX_FOUND)
    return()
endif()

project(${CMAKE_WORKSPACE_NAME}_mpi)

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
            src/broadcast.cpp
            src/communicator.cpp
            src/computation_tree.cpp
            src/content_oarchive.cpp
            src/environment.cpp
            src/exception.cpp
            src/graph_communicator.cpp
            src/group.cpp
            src/intercommunicator.cpp
            src/mpi_datatype_cache.cpp
            src/mpi_datatype_oarchive.cpp
            src/packed_iarchive.cpp
            src/packed_oarchive.cpp
            src/packed_skeleton_iarchive.cpp
            src/packed_skeleton_oarchive.cpp
            src/point_to_point.cpp
            src/request.cpp
            src/text_skeleton_oarchive.cpp
            src/timer.cpp)
target_compile_definitions(${CMAKE_WORKSPACE_NAME}_mpi PRIVATE -DBOOST_MPI_DYN_LINK=1 -DBOOST_MPI_SOURCE=1)

target_link_libraries(${CMAKE_WORKSPACE_NAME}_mpi PUBLIC boost::assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_mpi PUBLIC boost::throw_exception)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_mpi PUBLIC boost::optional)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_mpi PUBLIC boost::smart_ptr)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_mpi PUBLIC boost::serialization)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_mpi PUBLIC boost::python)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_mpi PUBLIC boost::graph)

set_property(TARGET ${CMAKE_WORKSPACE_NAME}_mpi PROPERTY EXPORT_NAME mpi)

target_include_directories(${CMAKE_WORKSPACE_NAME}_mpi PRIVATE include)
bcm_deploy(TARGETS ${CMAKE_WORKSPACE_NAME}_mpi INCLUDE include NAMESPACE ${CMAKE_WORKSPACE_NAME}::)

target_include_directories(${CMAKE_WORKSPACE_NAME}_mpi PUBLIC ${MPI_CXX_INCLUDE_PATH})
target_link_libraries(${CMAKE_WORKSPACE_NAME}_mpi PUBLIC ${MPI_CXX_LINK_FLAGS} ${MPI_CXX_LIBRARIES})

find_package(PythonLibs)
if(PythonLibs_FOUND)
    project(${CMAKE_WORKSPACE_NAME}_mpi_python)
    bcm_setup_version(VERSION 1.58.0)

    add_library(${CMAKE_WORKSPACE_NAME}_mpi_python SHARED  src/python/serialize.cpp)
    target_compile_definitions(${CMAKE_WORKSPACE_NAME}_mpi_python PRIVATE -DBOOST_MPI_DYN_LINK=1 -DBOOST_MPI_PYTHON_DYN_LINK=1
                               -DBOOST_PYTHON_DYN_LINK=1 -DBOOST_MPI_PYTHON_SOURCE=1)

    target_link_libraries(${CMAKE_WORKSPACE_NAME}_mpi_python PRIVATE boost::mpi)

    bcm_deploy(TARGETS ${CMAKE_WORKSPACE_NAME}_mpi_python INCLUDE include NAMESPACE ${CMAKE_WORKSPACE_NAME}::)

endif()

add_subdirectory(test)

