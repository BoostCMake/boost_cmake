include(BCMTest)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)

find_package(${CMAKE_WORKSPACE_NAME}_detail)
find_package(${CMAKE_WORKSPACE_NAME}_timer)
find_package(${CMAKE_WORKSPACE_NAME}_numeric_interval)
find_package(${CMAKE_WORKSPACE_NAME}_test)
find_package(${CMAKE_WORKSPACE_NAME}_math)

bcm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_numeric_ublas
boost::detail
boost::timer
boost::numeric_interval
boost::test
boost::math
)

# Copyright (c) 2004-2011 Michael Stevens, David Bellot
# Use, modification and distribution are subject to the
# Boost Software License, Version 1.0. (See accompanying file
# LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

# Bring in rules for testing

# Define features to test:
#  Value types: USE_FLOAT USE_DOUBLE USE_STD_COMPLEX
#  Proxies: USE_RANGE USE_SLICE
#  Storage types: USE_BOUNDED_ARRAY USE_UNBOUNDED_ARRAY
#  Vector types: USE_STD_VECTOR USE_BOUNDED_VECTOR
#  Matrix types: USE_MATRIX USE_BOUNDED_MATRIX USE_VECTOR_OF_VECTOR
#  Adaptors: USE_ADAPTOR

set(UBLAS_TESTSET "USE_DOUBLE;USE_STD_COMPLEX;USE_RANGE;USE_SLICE;USE_UNBOUNDED_ARRAY;USE_STD_VECTOR;USE_BOUNDED_VECTOR;USE_MATRIX" CACHE STRING "")
set(UBLAS_TESTSET_SPARSE "USE_DOUBLE;USE_STD_COMPLEX;USE_UNBOUNDED_ARRAY;USE_MAP_ARRAY;USE_STD_MAP;USE_MAPPED_VECTOR;USE_COMPRESSED_VECTOR;USE_MAPPED_MATRIX;USE_COMPRESSED_MATRIX" CACHE STRING "")
set(UBLAS_TESTSET_SPARSE_COO "USE_DOUBLE;USE_STD_COMPLEX;USE_UNBOUNDED_ARRAY;USE_COORDINATE_VECTOR;USE_COORDINATE_MATRIX" CACHE STRING "")

#  Sparse storage: USE_MAP_ARRAY USE_STD_MAP
#  Sparse vectors: USE_MAPPED_VECTOR USE_COMPRESSED_VECTOR USE_COORDINATE_VECTOR
#  Sparse matrices: USE_MAPPED_MATRIX USE_COMPRESSED_MATRIX USE_COORDINATE_MATRIX USE_MAPPED_VECTOR_OF_MAPPED_VECTOR USE_GENERALIZED_VECTOR_OF_VECTOR

# USE_RANGE USE_SLICE	 # Too complex for regression testing
# Generalize VofV still failing
#            USE_GENERALIZED_VECTOR_OF_VECTOR



# Project settings


# Test commented out because boost::interval does not behave like a scalar type
#      [ run test7.cpp
#            test71.cpp
#            test72.cpp
#            test73.cpp
#        : : :
#            <define>BOOST_UBLAS_USE_INTERVAL
#            <define>${UBLAS_TESTSET}
#      ]

#            <define>INTERAL
#            <define>SKIP_BAD
# TODO: Disable tests for now
# bcm_test(NAME test1 SOURCES ${CMAKE_WORKSPACE_SOURCE}/test1.cpp)
# target_compile_definitions(test1 PUBLIC ${UBLAS_TESTSET})
# bcm_test(NAME test2 SOURCES ${CMAKE_WORKSPACE_SOURCE}/test2.cpp)
# target_compile_definitions(test2 PUBLIC ${UBLAS_TESTSET})
# bcm_test(NAME test3 SOURCES ${CMAKE_WORKSPACE_SOURCE}/test3.cpp)
# target_compile_definitions(test3 PUBLIC ${UBLAS_TESTSET_SPARSE})
# bcm_test(NAME test3_coo SOURCES ${CMAKE_WORKSPACE_SOURCE}/test3.cpp)
# target_compile_definitions(test3_coo PUBLIC ${UBLAS_TESTSET_SPARSE_COO})
# bcm_test(NAME test3_mvov SOURCES ${CMAKE_WORKSPACE_SOURCE}/test3.cpp)
# target_compile_definitions(test3_mvov PUBLIC USE_MAPPED_VECTOR_OF_MAPPED_VECTOR)
# bcm_test(NAME test4 SOURCES ${CMAKE_WORKSPACE_SOURCE}/test4.cpp)
# target_compile_definitions(test4 PUBLIC ${UBLAS_TESTSET})
# bcm_test(NAME test5 SOURCES ${CMAKE_WORKSPACE_SOURCE}/test5.cpp)
# target_compile_definitions(test5 PUBLIC ${UBLAS_TESTSET})
# bcm_test(NAME test6 SOURCES ${CMAKE_WORKSPACE_SOURCE}/test6.cpp)
# target_compile_definitions(test6 PUBLIC ${UBLAS_TESTSET})
# bcm_test(NAME placement_new SOURCES ${CMAKE_WORKSPACE_SOURCE}/placement_new.cpp)
# bcm_test(NAME concepts SOURCES ${CMAKE_WORKSPACE_SOURCE}/concepts.cpp COMPILE_ONLY)
# target_compile_definitions(concepts PUBLIC EXTERNAL)
# bcm_test(NAME test_lu SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_lu.cpp)
# bcm_test(NAME triangular_access SOURCES ${CMAKE_WORKSPACE_SOURCE}/triangular_access.cpp)
# target_compile_definitions(triangular_access PUBLIC NOMESSAGES)
# bcm_test(NAME triangular_layout SOURCES ${CMAKE_WORKSPACE_SOURCE}/triangular_layout.cpp)
# bcm_test(NAME comp_mat_erase SOURCES ${CMAKE_WORKSPACE_SOURCE}/comp_mat_erase.cpp)
# bcm_test(NAME sparse_view_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/sparse_view_test.cpp)
# bcm_test(NAME begin_end SOURCES ${CMAKE_WORKSPACE_SOURCE}/begin_end.cpp)
# bcm_test(NAME num_columns SOURCES ${CMAKE_WORKSPACE_SOURCE}/num_columns.cpp)
# bcm_test(NAME num_rows SOURCES ${CMAKE_WORKSPACE_SOURCE}/num_rows.cpp)
# bcm_test(NAME ublas_size SOURCES ${CMAKE_WORKSPACE_SOURCE}/size.cpp)
# bcm_test(NAME test_coordinate_matrix_sort SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_coordinate_matrix_sort.cpp)
# bcm_test(NAME test_coordinate_matrix_always_do_full_sort SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_coordinate_matrix_sort.cpp)
# target_compile_definitions(test_coordinate_matrix_always_do_full_sort PUBLIC BOOST_UBLAS_COO_ALWAYS_DO_FULL_SORT)
# bcm_test(NAME test_complex_norms SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_complex_norms.cpp)
# bcm_test(NAME test_assignment SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_assignment.cpp)
# target_compile_definitions(test_assignment PUBLIC BOOST_UBLAS_COO_ALWAYS_DO_FULL_SORT)
# bcm_test(NAME ublas_test_triangular SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_triangular.cpp)
# bcm_test(NAME test_ticket7296 SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_ticket7296.cpp)
# bcm_test(NAME test_inplace_solve_basic SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_inplace_solve.cpp)
# target_compile_definitions(test_inplace_solve_basic PUBLIC ${UBLAS_TESTSET})
# bcm_test(NAME test_inplace_solve_sparse SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_inplace_solve.cpp)
# target_compile_definitions(test_inplace_solve_sparse PUBLIC ${UBLAS_TESTSET_SPARSE_COO})
# bcm_test(NAME test_inplace_solve_mvov SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_inplace_solve.cpp)
# target_compile_definitions(test_inplace_solve_mvov PUBLIC USE_MAPPED_VECTOR_OF_MAPPED_VECTOR)
# bcm_test(NAME test_coordinate_vector_inplace_merge SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_coordinate_vector_inplace_merge.cpp)
# bcm_test(NAME test_coordinate_matrix_inplace_merge SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_coordinate_matrix_inplace_merge.cpp)
# bcm_test(NAME test_banded_storage_layout SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_banded_storage_layout.cpp)
# bcm_test(NAME test_fixed_containers SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_fixed_containers.cpp)
# bcm_test(NAME test_matrix_vector SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_matrix_vector.cpp)

