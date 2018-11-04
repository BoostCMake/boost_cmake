include(CMTest)

patch_directory(${CURRENT_TEST_SOURCES_DIR} ${CMAKE_CURRENT_SOURCE_DIR}/files ${CMAKE_CURRENT_BINARY_DIR})

find_package(${CMAKE_WORKSPACE_NAME}_numeric_ublas)
find_package(${CMAKE_WORKSPACE_NAME}_test)
find_package(${CMAKE_WORKSPACE_NAME}_multiprecision)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_numeric_odeint
                        ${CMAKE_WORKSPACE_NAME}::numeric_ublas
                        ${CMAKE_WORKSPACE_NAME}::test
                        ${CMAKE_WORKSPACE_NAME}::multiprecision
                        )

# Copyright 2012-2013 Karsten Ahnert
# Copyright 2012-2013 Mario Mulansky
# Copyright 2013 Pascal Germroth
# Distributed under the Boost Software License, Version 1.0.
# (See accompanying file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

# bring in rules for testing


# make sure you are using a new version of boost.build, otherwise the local
# odeint will not be included properly
# you can fix older boost.build versions by applying the patch provided in
# odeint's root, e.g.:
# cd ~/odeint-v2
# sudo patch /usr/share/boost-build/build/toolset.jam toolset.jam.patch

#  test-suite "eigen"
cm_test(NAME numeric_test_external_eigen_is_resizeable SOURCES ${CURRENT_TEST_SOURCES_DIR}/eigen/is_resizeable.cpp)
cm_test(NAME numeric_test_external_eigen_same_size SOURCES ${CURRENT_TEST_SOURCES_DIR}/eigen/same_size.cpp)
cm_test(NAME numeric_test_external_eigen_resize SOURCES ${CURRENT_TEST_SOURCES_DIR}/eigen/resize.cpp)
cm_test(NAME numeric_test_external_eigen_runge_kutta4 SOURCES ${CURRENT_TEST_SOURCES_DIR}/eigen/runge_kutta4.cpp)
cm_test(NAME numeric_test_external_eigen_runge_kutta_dopri5 SOURCES ${CURRENT_TEST_SOURCES_DIR}/eigen/runge_kutta_dopri5.cpp)
cm_test(NAME numeric_test_external_eigen_integrate SOURCES ${CURRENT_TEST_SOURCES_DIR}/eigen/runge_kutta.cpp)
cm_test(NAME numeric_test_external_eigen_fail_integrate SOURCES ${CURRENT_TEST_SOURCES_DIR}/eigen/fail_integrate.cpp COMPILE_ONLY WILL_FAIL)

# test-suite "gmp"
cm_test(NAME numeric_test_external_gme_check_gmp SOURCES ${CURRENT_TEST_SOURCES_DIR}/gmp/check_gmp.cpp)
target_compile_definitions(numeric_test_external_gme_check_gmp PUBLIC -DBOOST_TEST_DYN_LINK=1)
cm_test(NAME numeric_test_external_gmp_gmp_integrate SOURCES ${CURRENT_TEST_SOURCES_DIR}/gmp/gmp_integrate.cpp)
target_compile_definitions(numeric_test_external_gmp_gmp_integrate PUBLIC -DBOOST_TEST_DYN_LINK=1)

# test-suite "gsl"
cm_test(NAME numeric_test_external_gsl_check_gsl SOURCES ${CURRENT_TEST_SOURCES_DIR}/gsl/check_gsl.cpp)
target_compile_definitions(numeric_test_external_gsl_check_gsl PUBLIC -DBOOST_TEST_DYN_LINK=1)

# test-suite "mkl"
cm_test(NAME numeric_test_external_mkl_check_mkl SOURCES ${CURRENT_TEST_SOURCES_DIR}/mkl/check_mkl.cpp)
target_compile_definitions(numeric_test_external_mkl_check_mkl PUBLIC -DBOOST_TEST_DYN_LINK=1)

# test-suite "mpi"
cm_test(NAME numeric_test_external_mpi_split_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/mpi/split_test.cpp)
cm_test(NAME numeric_test_external_mpi_state_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/mpi/state_test.cpp)
cm_test(NAME numeric_test_external_mpi_norm_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/mpi/norm_test.cpp)

# test-suite "mtl4"
cm_test(NAME numeric_test_external_mtl4_mtl4_resize SOURCES ${CURRENT_TEST_SOURCES_DIR}/mtl4/mtl4_resize.cpp)

# test-suite "nt2"
cm_test(NAME numeric_test_external_nt2_copy SOURCES ${CURRENT_TEST_SOURCES_DIR}/nt2/copy.cpp)
cm_test(NAME numeric_test_external_nt2_norm_inf SOURCES ${CURRENT_TEST_SOURCES_DIR}/nt2/norm_inf.cpp)
cm_test(NAME numeric_test_external_nt2_resize SOURCES ${CURRENT_TEST_SOURCES_DIR}/nt2/resize.cpp)
cm_test(NAME numeric_test_external_nt2_is_resizeable SOURCES ${CURRENT_TEST_SOURCES_DIR}/nt2/is_resizeable.cpp)
cm_test(NAME numeric_test_external_nt2_algebra_dispatcher SOURCES ${CURRENT_TEST_SOURCES_DIR}/nt2/algebra_dispatcher.cpp)

# test-suite "vexcl"
cm_test(NAME numeric_test_external_vexcl_lorenz SOURCES ${CURRENT_TEST_SOURCES_DIR}/vexcl/lorenz.cpp)
target_compile_definitions(numeric_test_external_vexcl_lorenz PUBLIC -DBOOST_TEST_DYN_LINK=1)
cm_test(NAME numeric_test_external_vexcl_norm_inf SOURCES ${CURRENT_TEST_SOURCES_DIR}/vexcl/norm_inf.cpp)
target_compile_definitions(numeric_test_external_vexcl_norm_inf PUBLIC -DBOOST_TEST_DYN_LINK=1)
