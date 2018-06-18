include(BCMTest)
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

cm_test(NAME mpi_test_all_gather_test SOURCES all_gather_test.cpp)
cm_test(NAME mpi_test_all_reduce_test SOURCES all_reduce_test.cpp)
cm_test(NAME mpi_test_all_to_all_test SOURCES all_to_all_test.cpp)
cm_test(NAME mpi_test_broadcast_test SOURCES broadcast_test.cpp ARGS 2 17)
cm_test(NAME mpi_test_gather_test SOURCES gather_test.cpp)
cm_test(NAME mpi_test_is_mpi_op_test SOURCES is_mpi_op_test.cpp ARGS 1)
cm_test(NAME mpi_test_mt_level_test SOURCES mt_level_test.cpp ARGS 1)
cm_test(NAME mpi_test_mt_init_test_single SOURCES mt_init_test.cpp ARGS "single" 1 4)
cm_test(NAME mpi_test_mt_init_test_funneled SOURCES mt_init_test.cpp ARGS "funneled" 1 4)
cm_test(NAME mpi_test_mt_init_test_serialized SOURCES mt_init_test.cpp ARGS "serialized" 1 4)
cm_test(NAME mpi_test_mt_init_test_multiple SOURCES mt_init_test.cpp ARGS "multiple" 1 4)
# Note: Microsoft MPI fails nonblocking_test on 1 processor
if(APPLE)
    cm_test(NAME mpi_test_nonblocking_test SOURCES nonblocking_test.cpp)
endif()
cm_test(NAME mpi_test_reduce_test SOURCES reduce_test.cpp)
cm_test(NAME mpi_test_ring_test SOURCES ring_test.cpp ARGS 2 3 4 7 8 13 17)
cm_test(NAME mpi_test_scan_test SOURCES scan_test.cpp)
cm_test(NAME mpi_test_scatter_test SOURCES scatter_test.cpp)
# Note: Microsoft MPI fails all skeleton-content tests
cm_test(NAME mpi_test_skeleton_content_test SOURCES skeleton_content_test.cpp ARGS 2 3 4 7 8 13 17)
cm_test(NAME mpi_test_graph_topology_test SOURCES graph_topology_test.cpp ARGS 2 7 13)
cm_test(NAME mpi_test_pointer_test SOURCES pointer_test.cpp ARGS 2)
cm_test(NAME mpi_test_groups_test SOURCES groups_test.cpp)