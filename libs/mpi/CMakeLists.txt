cmake_minimum_required(VERSION 3.5)
find_package(MPI)
if(NOT MPI_CXX_FOUND)
    return()
endif()

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

cm_project(${CMAKE_WORKSPACE_NAME} mpi)

if(CMAKE_SOURCES_DIR)
    set(CURRENT_SOURCES_DIR ${CMAKE_SOURCES_DIR}/libs/${CURRENT_PROJECT_NAME})
endif()

find_package(${CMAKE_WORKSPACE_NAME}_assert)
find_package(${CMAKE_WORKSPACE_NAME}_throw_exception)
find_package(${CMAKE_WORKSPACE_NAME}_optional)
find_package(${CMAKE_WORKSPACE_NAME}_smart_ptr)
find_package(${CMAKE_WORKSPACE_NAME}_serialization)
find_package(${CMAKE_WORKSPACE_NAME}_graph)
find_package(${CMAKE_WORKSPACE_NAME}_python)

cm_setup_version(VERSION 1.58.0)

add_library(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME}
            ${CURRENT_SOURCES_DIR}/src/broadcast.cpp
            ${CURRENT_SOURCES_DIR}/src/communicator.cpp
            ${CURRENT_SOURCES_DIR}/src/computation_tree.cpp
            ${CURRENT_SOURCES_DIR}/src/content_oarchive.cpp
            ${CURRENT_SOURCES_DIR}/src/environment.cpp
            ${CURRENT_SOURCES_DIR}/src/exception.cpp
            ${CURRENT_SOURCES_DIR}/src/graph_communicator.cpp
            ${CURRENT_SOURCES_DIR}/src/group.cpp
            ${CURRENT_SOURCES_DIR}/src/intercommunicator.cpp
            ${CURRENT_SOURCES_DIR}/src/mpi_datatype_cache.cpp
            ${CURRENT_SOURCES_DIR}/src/mpi_datatype_oarchive.cpp
            ${CURRENT_SOURCES_DIR}/src/packed_iarchive.cpp
            ${CURRENT_SOURCES_DIR}/src/packed_oarchive.cpp
            ${CURRENT_SOURCES_DIR}/src/packed_skeleton_iarchive.cpp
            ${CURRENT_SOURCES_DIR}/src/packed_skeleton_oarchive.cpp
            ${CURRENT_SOURCES_DIR}/src/point_to_point.cpp
            ${CURRENT_SOURCES_DIR}/src/request.cpp
            ${CURRENT_SOURCES_DIR}/src/text_skeleton_oarchive.cpp
            ${CURRENT_SOURCES_DIR}/src/timer.cpp)

target_compile_definitions(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PRIVATE -DBOOST_MPI_DYN_LINK=1 -DBOOST_MPI_SOURCE=1)

target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::throw_exception)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::optional)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::smart_ptr)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::serialization)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::python)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::graph)

set_property(TARGET ${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PROPERTY EXPORT_NAME ${CURRENT_PROJECT_NAME})

target_include_directories(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PRIVATE ${CURRENT_SOURCES_DIR}/include)
cm_deploy(TARGETS ${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} INCLUDE ${CURRENT_SOURCES_DIR}/include NAMESPACE ${CMAKE_WORKSPACE_NAME}::)

target_include_directories(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${MPI_CXX_INCLUDE_PATH})
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${MPI_CXX_LINK_FLAGS} ${MPI_CXX_LIBRARIES})

find_package(PythonLibs)
if(PythonLibs_FOUND)
    project(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME}_python)
    cm_setup_version(VERSION 1.58.0)

    add_library(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME}_python SHARED ${CURRENT_SOURCES_DIR}/src/python/serialize.cpp)
    target_compile_definitions(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME}_python PRIVATE -DBOOST_MPI_DYN_LINK=1 -DBOOST_MPI_PYTHON_DYN_LINK=1
                               -DBOOST_PYTHON_DYN_LINK=1 -DBOOST_MPI_PYTHON_SOURCE=1)

    target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME}_python PRIVATE ${CMAKE_WORKSPACE_NAME}::${CURRENT_PROJECT_NAME})

    cm_deploy(TARGETS ${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME}_python INCLUDE include NAMESPACE ${CMAKE_WORKSPACE_NAME}::)

endif()

add_subdirectory(test)