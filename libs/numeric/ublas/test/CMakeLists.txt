include(CMTest)

patch_directory(${CURRENT_TEST_SOURCES_DIR} ${CMAKE_CURRENT_SOURCE_DIR}/files ${CMAKE_CURRENT_BINARY_DIR})

find_package(${CMAKE_WORKSPACE_NAME}_detail)
find_package(${CMAKE_WORKSPACE_NAME}_timer)
find_package(${CMAKE_WORKSPACE_NAME}_numeric_interval)
find_package(${CMAKE_WORKSPACE_NAME}_test)
find_package(${CMAKE_WORKSPACE_NAME}_math)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_numeric_ublas
${CMAKE_WORKSPACE_NAME}::detail
${CMAKE_WORKSPACE_NAME}::timer
${CMAKE_WORKSPACE_NAME}::numeric_interval
${CMAKE_WORKSPACE_NAME}::test
${CMAKE_WORKSPACE_NAME}::math
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

set(UBLAS_TESTSET "-DUSE_DOUBLE -DUSE_STD_COMPLEX -DUSE_RANGE -DUSE_SLICE -DUSE_UNBOUNDED_ARRAY -DUSE_STD_VECTOR -DUSE_BOUNDED_VECTOR -DUSE_MATRIX")
set(UBLAS_TESTSET_SPARSE "-DUSE_DOUBLE -DUSE_STD_COMPLEX -DUSE_UNBOUNDED_ARRAY -DUSE_MAP_ARRAY -DUSE_STD_MAP -DUSE_MAPPED_VECTOR -DUSE_COMPRESSED_VECTOR -DUSE_MAPPED_MATRIX -DUSE_COMPRESSED_MATRIX")
set(UBLAS_TESTSET_SPARSE_COO "-DUSE_DOUBLE -DUSE_STD_COMPLEX -DUSE_UNBOUNDED_ARRAY -DUSE_COORDINATE_VECTOR -DUSE_COORDINATE_MATRIX")

#  Sparse storage: USE_MAP_ARRAY USE_STD_MAP
#  Sparse vectors: USE_MAPPED_VECTOR USE_COMPRESSED_VECTOR USE_COORDINATE_VECTOR
#  Sparse matrices: USE_MAPPED_MATRIX USE_COMPRESSED_MATRIX USE_COORDINATE_MATRIX USE_MAPPED_VECTOR_OF_MAPPED_VECTOR USE_GENERALIZED_VECTOR_OF_VECTOR

# USE_RANGE USE_SLICE	 # Too complex for regression testing
# Generalize VofV still failing
#            USE_GENERALIZED_VECTOR_OF_VECTOR



# Project settings


# Test commented out because ${CMAKE_WORKSPACE_NAME}::interval does not behave like a scalar type
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

cm_test(NAME numeric_test_ublas_test1 SOURCES ${CURRENT_TEST_SOURCES_DIR}/test1.cpp  ${CURRENT_TEST_SOURCES_DIR}/test11.cpp  ${CURRENT_TEST_SOURCES_DIR}/test12.cpp  ${CURRENT_TEST_SOURCES_DIR}/test13.cpp)
target_compile_definitions(numeric_test_ublas_test1 PUBLIC ${UBLAS_TESTSET})

cm_test(NAME numeric_test_ublas_test2 SOURCES ${CURRENT_TEST_SOURCES_DIR}/test2.cpp  ${CURRENT_TEST_SOURCES_DIR}/test21.cpp  ${CURRENT_TEST_SOURCES_DIR}/test22.cpp  ${CURRENT_TEST_SOURCES_DIR}/test23.cpp)
target_compile_definitions(numeric_test_ublas_test2 PUBLIC ${UBLAS_TESTSET})

cm_test(NAME numeric_test_ublas_test3 SOURCES ${CURRENT_TEST_SOURCES_DIR}/test3.cpp  ${CURRENT_TEST_SOURCES_DIR}/test31.cpp  ${CURRENT_TEST_SOURCES_DIR}/test32.cpp  ${CURRENT_TEST_SOURCES_DIR}/test33.cpp)
target_compile_definitions(numeric_test_ublas_test3 PUBLIC ${UBLAS_TESTSET_SPARSE})

cm_test(NAME numeric_test_ublas_test3_coo SOURCES ${CURRENT_TEST_SOURCES_DIR}/test3.cpp  ${CURRENT_TEST_SOURCES_DIR}/test31.cpp  ${CURRENT_TEST_SOURCES_DIR}/test32.cpp  ${CURRENT_TEST_SOURCES_DIR}/test33.cpp)
target_compile_definitions(numeric_test_ublas_test3_coo PUBLIC ${UBLAS_TESTSET_SPARSE_COO})

cm_test(NAME numeric_test_ublas_test3_mvov SOURCES ${CURRENT_TEST_SOURCES_DIR}/test3.cpp  ${CURRENT_TEST_SOURCES_DIR}/test31.cpp  ${CURRENT_TEST_SOURCES_DIR}/test32.cpp  ${CURRENT_TEST_SOURCES_DIR}/test33.cpp)
target_compile_definitions(numeric_test_ublas_test3_mvov PUBLIC -DUSE_FLOAT -DUSE_DOUBLE -DUSE_STD_COMPLEX -DUSE_STD_MAP -DUSE_MAPPED_VECTOR_OF_MAPPED_VECTOR)

cm_test(NAME numeric_test_ublas_test4 SOURCES ${CURRENT_TEST_SOURCES_DIR}/test4.cpp  ${CURRENT_TEST_SOURCES_DIR}/test42.cpp ${CURRENT_TEST_SOURCES_DIR}/test43.cpp)
target_compile_definitions(numeric_test_ublas_test4 PUBLIC ${UBLAS_TESTSET})

cm_test(NAME numeric_test_ublas_test5 SOURCES ${CURRENT_TEST_SOURCES_DIR}/test5.cpp  ${CURRENT_TEST_SOURCES_DIR}/test52.cpp ${CURRENT_TEST_SOURCES_DIR}/test53.cpp)
target_compile_definitions(numeric_test_ublas_test5 PUBLIC ${UBLAS_TESTSET})

cm_test(NAME numeric_test_ublas_test6 SOURCES ${CURRENT_TEST_SOURCES_DIR}/test6.cpp  ${CURRENT_TEST_SOURCES_DIR}/test62.cpp ${CURRENT_TEST_SOURCES_DIR}/test63.cpp)
target_compile_definitions(numeric_test_ublas_test6 PUBLIC ${UBLAS_TESTSET})

cm_test(NAME numeric_test_ublas_placement_new SOURCES ${CURRENT_TEST_SOURCES_DIR}/placement_new.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})

cm_test(NAME numeric_test_ublas_concepts SOURCES ${CURRENT_TEST_SOURCES_DIR}/concepts.cpp COMPILE_ONLY SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
target_compile_definitions(numeric_test_ublas_concepts PUBLIC -DEXTERNAL)

cm_test(NAME numeric_test_ublas_test_lu SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_lu.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})

cm_test(NAME numeric_test_ublas_triangular_access SOURCES ${CURRENT_TEST_SOURCES_DIR}/triangular_access.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
target_compile_definitions(numeric_test_ublas_triangular_access PUBLIC -DNOMESSAGES)

cm_test(NAME numeric_test_ublas_triangular_layout SOURCES ${CURRENT_TEST_SOURCES_DIR}/triangular_layout.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME numeric_test_ublas_comp_mat_erase SOURCES ${CURRENT_TEST_SOURCES_DIR}/comp_mat_erase.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME numeric_test_ublas_sparse_view_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/sparse_view_test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME numeric_test_ublas_begin_end SOURCES ${CURRENT_TEST_SOURCES_DIR}/begin_end.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME numeric_test_ublas_num_columns SOURCES ${CURRENT_TEST_SOURCES_DIR}/num_columns.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME numeric_test_ublas_num_rows SOURCES ${CURRENT_TEST_SOURCES_DIR}/num_rows.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME numeric_test_ublas_ublas_size SOURCES ${CURRENT_TEST_SOURCES_DIR}/size.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME numeric_test_ublas_test_coordinate_matrix_sort SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_coordinate_matrix_sort.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})

cm_test(NAME numeric_test_ublas_test_coordinate_matrix_always_do_full_sort SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_coordinate_matrix_sort.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
target_compile_definitions(numeric_test_ublas_test_coordinate_matrix_always_do_full_sort PUBLIC -DBOOST_UBLAS_COO_ALWAYS_DO_FULL_SORT)

cm_test(NAME numeric_test_ublas_test_complex_norms SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_complex_norms.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})

cm_test(NAME numeric_test_ublas_test_assignment SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_assignment.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
target_compile_definitions(numeric_test_ublas_test_assignment PUBLIC -DBOOST_UBLAS_COO_ALWAYS_DO_FULL_SORT)

cm_test(NAME numeric_test_ublas_ublas_test_triangular SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_triangular.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME numeric_test_ublas_test_ticket7296 SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_ticket7296.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})

cm_test(NAME numeric_test_ublas_test_inplace_solve_basic SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_inplace_solve.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
target_compile_definitions(numeric_test_ublas_test_inplace_solve_basic PUBLIC ${UBLAS_TESTSET})

cm_test(NAME numeric_test_ublas_test_inplace_solve_sparse SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_inplace_solve.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
target_compile_definitions(numeric_test_ublas_test_inplace_solve_sparse PUBLIC ${UBLAS_TESTSET_SPARSE_COO})

cm_test(NAME numeric_test_ublas_test_inplace_solve_mvov SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_inplace_solve.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
target_compile_definitions(numeric_test_ublas_test_inplace_solve_mvov PUBLIC -DUSE_MAPPED_VECTOR_OF_MAPPED_VECTOR)

cm_test(NAME numeric_test_ublas_test_coordinate_vector_inplace_merge SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_coordinate_vector_inplace_merge.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME numeric_test_ublas_test_coordinate_matrix_inplace_merge SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_coordinate_matrix_inplace_merge.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME numeric_test_ublas_test_banded_storage_layout SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_banded_storage_layout.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME numeric_test_ublas_test_fixed_containers SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_fixed_containers.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME numeric_test_ublas_test_matrix_vector SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_matrix_vector.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
