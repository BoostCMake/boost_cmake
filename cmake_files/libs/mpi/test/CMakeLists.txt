include(BCMTest)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)
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

bcm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_mpi
                        boost::regex
                        boost::multiprecision
                        boost::bind
                        boost::random
                        boost::typeof
                        boost::serialization
                        boost::numeric_ublas
                        boost::test
                        )
find_package(MPI)
if(NOT MPI_CXX_FOUND)
    return()
endif()

bcm_test(NAME mpi_test_all_gather_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/all_gather_test.cpp)
bcm_test(NAME mpi_test_all_reduce_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/all_reduce_test.cpp)
bcm_test(NAME mpi_test_all_to_all_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/all_to_all_test.cpp)
bcm_test(NAME mpi_test_broadcast_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/broadcast_test.cpp ARGS 2 17)
bcm_test(NAME mpi_test_gather_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/gather_test.cpp)
bcm_test(NAME mpi_test_is_mpi_op_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/is_mpi_op_test.cpp ARGS 1)
bcm_test(NAME mpi_test_mt_level_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/mt_level_test.cpp ARGS 1 NEED_PATCH)
bcm_test(NAME mpi_test_mt_init_test_single SOURCES ${CMAKE_WORKSPACE_SOURCE}/mt_init_test.cpp ARGS "single" 1 4 NEED_PATCH)
bcm_test(NAME mpi_test_mt_init_test_funneled SOURCES ${CMAKE_WORKSPACE_SOURCE}/mt_init_test.cpp ARGS "funneled" 1 4 NEED_PATCH)
bcm_test(NAME mpi_test_mt_init_test_serialized SOURCES ${CMAKE_WORKSPACE_SOURCE}/mt_init_test.cpp ARGS "serialized" 1 4 NEED_PATCH)
bcm_test(NAME mpi_test_mt_init_test_multiple SOURCES ${CMAKE_WORKSPACE_SOURCE}/mt_init_test.cpp ARGS "multiple" 1 4 NEED_PATCH)
# Note: Microsoft MPI fails nonblocking_test on 1 processor
if (APPLE)
    bcm_test(NAME mpi_test_nonblocking_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/nonblocking_test.cpp)
endif()
bcm_test(NAME mpi_test_reduce_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/reduce_test.cpp)
bcm_test(NAME mpi_test_ring_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/ring_test.cpp ARGS 2 3 4 7 8 13 17)
bcm_test(NAME mpi_test_scan_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/scan_test.cpp)
bcm_test(NAME mpi_test_scatter_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/scatter_test.cpp)
# Note: Microsoft MPI fails all skeleton-content tests
bcm_test(NAME mpi_test_skeleton_content_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/skeleton_content_test.cpp ARGS 2 3 4 7 8 13 17)
bcm_test(NAME mpi_test_graph_topology_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/graph_topology_test.cpp ARGS 2 7 13)
bcm_test(NAME mpi_test_pointer_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/pointer_test.cpp ARGS 2)
bcm_test(NAME mpi_test_groups_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/groups_test.cpp)