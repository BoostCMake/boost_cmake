include(CMTest)

##############################################################################
##
## (C) Copyright Ion Gaztanaga 2008-2009 Distributed under the Boost
## Software License, Version 1.0. (See accompanying file
## LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)
##
##
##############################################################################
find_package(${CMAKE_WORKSPACE_NAME}_regex)
find_package(${CMAKE_WORKSPACE_NAME}_multiprecision)
find_package(${CMAKE_WORKSPACE_NAME}_bind)
find_package(${CMAKE_WORKSPACE_NAME}_random)
find_package(${CMAKE_WORKSPACE_NAME}_typeof)
find_package(${CMAKE_WORKSPACE_NAME}_test)
find_package(${CMAKE_WORKSPACE_NAME}_serialization)
find_package(${CMAKE_WORKSPACE_NAME}_numeric_ublas)
find_package(${CMAKE_WORKSPACE_NAME}_test)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_mpi
                        ${CMAKE_WORKSPACE_NAME}::regex
                        ${CMAKE_WORKSPACE_NAME}::multiprecision
                        ${CMAKE_WORKSPACE_NAME}::bind
                        ${CMAKE_WORKSPACE_NAME}::random
                        ${CMAKE_WORKSPACE_NAME}::typeof
                        ${CMAKE_WORKSPACE_NAME}::serialization
                        ${CMAKE_WORKSPACE_NAME}::numeric_ublas
                        ${CMAKE_WORKSPACE_NAME}::test
                        )
find_package(MPI)
if(NOT MPI_CXX_FOUND)
    return()
endif()

cm_test(NAME mpi_test_broadcast_stl_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/broadcast_stl_test.cpp ARGS 2)
cm_test(NAME mpi_test_all_gather_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/all_gather_test.cpp)
cm_test(NAME mpi_test_all_reduce_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/all_reduce_test.cpp)
cm_test(NAME mpi_test_all_to_all_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/all_to_all_test.cpp)
cm_test(NAME mpi_test_broadcast_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/broadcast_test.cpp ARGS 2 17)
cm_test(NAME mpi_test_gather_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/gather_test.cpp)
cm_test(NAME mpi_test_is_mpi_op_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/is_mpi_op_test.cpp ARGS 1)
cm_test(NAME mpi_test_mt_level_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/mt_level_test.cpp ARGS 1)
cm_test(NAME mpi_test_mt_init_test_single SOURCES ${CURRENT_TEST_SOURCES_DIR}/mt_init_test.cpp ARGS "single" 1 4)

cm_test(NAME mpi_test_mt_init_test_funneled SOURCES ${CURRENT_TEST_SOURCES_DIR}/mt_init_test.cpp ARGS "funneled" 1 4 SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME mpi_test_mt_init_test_serialized SOURCES ${CURRENT_TEST_SOURCES_DIR}/mt_init_test.cpp ARGS "serialized" 1 4 SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME mpi_test_mt_init_test_multiple SOURCES ${CURRENT_TEST_SOURCES_DIR}/mt_init_test.cpp ARGS "multiple" 1 4 SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})

#cm_test(NAME mpi_test_mt_init_test_funneled SOURCES ${CMAKE_CURRENT_BINARY_DIR}/mt_init_test.cpp ARGS "funneled" 1 4 SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
#cm_test(NAME mpi_test_mt_init_test_serialized SOURCES ${CMAKE_CURRENT_BINARY_DIR}/mt_init_test.cpp ARGS "serialized" 1 4 SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
#cm_test(NAME mpi_test_mt_init_test_multiple SOURCES ${CMAKE_CURRENT_BINARY_DIR}/mt_init_test.cpp ARGS "multiple" 1 4 SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})

# Note: Microsoft MPI fails nonblocking_test on 1 processor
if (APPLE)
    cm_test(NAME mpi_test_nonblocking_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/nonblocking_test.cpp)
endif()
cm_test(NAME mpi_test_reduce_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/reduce_test.cpp)
cm_test(NAME mpi_test_ring_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/ring_test.cpp ARGS 2 3 4 7 8 13 17)
cm_test(NAME mpi_test_sendrecv_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/sendrecv_test.cpp ARGS 1 4 7 48)
cm_test(NAME mpi_test_scan_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/scan_test.cpp)
cm_test(NAME mpi_test_scatter_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/scatter_test.cpp)
# Note: Microsoft MPI fails all skeleton-content tests
cm_test(NAME mpi_test_skeleton_content_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/skeleton_content_test.cpp ARGS 2 3 4 7 8 13 17)
cm_test(NAME mpi_test_graph_topology_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/graph_topology_test.cpp ARGS 2 7 13)
cm_test(NAME mpi_test_pointer_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/pointer_test.cpp ARGS 2)
cm_test(NAME mpi_test_groups_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/groups_test.cpp)
