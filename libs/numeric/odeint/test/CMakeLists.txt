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

# odeint_numeric
cm_test(NAME numeric_test_odeint_numeric_runge_kutta SOURCES ${CURRENT_TEST_SOURCES_DIR}/numeric/runge_kutta.cpp)
cm_test(NAME numeric_test_odeint_numeric_symplectic SOURCES ${CURRENT_TEST_SOURCES_DIR}/numeric/symplectic.cpp)
cm_test(NAME numeric_test_odeint_numeric_rosenbrock SOURCES ${CURRENT_TEST_SOURCES_DIR}/numeric/rosenbrock.cpp)
cm_test(NAME numeric_test_odeint_numeric_adams_bashforth SOURCES ${CURRENT_TEST_SOURCES_DIR}/numeric/adams_bashforth.cpp)
cm_test(NAME numeric_test_odeint_numeric_adams_bashforth_moulton SOURCES ${CURRENT_TEST_SOURCES_DIR}/numeric/adams_bashforth_moulton.cpp)
cm_test(NAME numeric_test_odeint_numeric_abm_time_dependent SOURCES ${CURRENT_TEST_SOURCES_DIR}/numeric/abm_time_dependent.cpp)
cm_test(NAME numeric_test_odeint_numeric_order_quadrature_formula SOURCES ${CURRENT_TEST_SOURCES_DIR}/numeric/order_quadrature_formula.cpp)
cm_test(NAME numeric_test_odeint_numeric_velocity_verlet SOURCES ${CURRENT_TEST_SOURCES_DIR}/numeric/velocity_verlet.cpp)

# odeint_regress
cm_test(NAME numeric_test_odeint_regression_regression_147 SOURCES ${CURRENT_TEST_SOURCES_DIR}/regression/regression_147.cpp)
cm_test(NAME numeric_test_odeint_regression_regression_149 SOURCES ${CURRENT_TEST_SOURCES_DIR}/regression/regression_149.cpp COMPILE_ONLY)
cm_test(NAME numeric_test_odeint_regression_regression_168 SOURCES ${CURRENT_TEST_SOURCES_DIR}/regression/regression_168.cpp)

# test-suite "odeint"
cm_test(NAME numeric_test_odeint_euler_stepper SOURCES ${CURRENT_TEST_SOURCES_DIR}/euler_stepper.cpp)
cm_test(NAME numeric_test_odeint_runge_kutta_concepts SOURCES ${CURRENT_TEST_SOURCES_DIR}/runge_kutta_concepts.cpp)
cm_test(NAME numeric_test_odeint_runge_kutta_error_concepts SOURCES ${CURRENT_TEST_SOURCES_DIR}/runge_kutta_error_concepts.cpp)
cm_test(NAME numeric_test_odeint_runge_kutta_controlled_concepts SOURCES ${CURRENT_TEST_SOURCES_DIR}/runge_kutta_controlled_concepts.cpp)
cm_test(NAME numeric_test_odeint_resizing SOURCES ${CURRENT_TEST_SOURCES_DIR}/resizing.cpp)
cm_test(NAME numeric_test_odeint__default_operations SOURCES ${CURRENT_TEST_SOURCES_DIR}/default_operations.cpp)
cm_test(NAME numeric_test_odeint_range_algebra SOURCES ${CURRENT_TEST_SOURCES_DIR}/range_algebra.cpp)
cm_test(NAME numeric_test_odeint_implicit_euler SOURCES ${CURRENT_TEST_SOURCES_DIR}/implicit_euler.cpp)
cm_test(NAME numeric_test_odeint_numeric_test_odeint_fusion_algebra SOURCES ${CURRENT_TEST_SOURCES_DIR}/fusion_algebra.cpp)
cm_test(NAME numeric_test_odeint_stepper_with_units SOURCES ${CURRENT_TEST_SOURCES_DIR}/stepper_with_units.cpp)
cm_test(NAME numeric_test_odeint_stepper_copying SOURCES ${CURRENT_TEST_SOURCES_DIR}/stepper_copying.cpp)
cm_test(NAME numeric_test_odeint_stepper_with_ranges SOURCES ${CURRENT_TEST_SOURCES_DIR}/stepper_with_ranges.cpp)
cm_test(NAME numeric_test_odeint_rosenbrock4 SOURCES ${CURRENT_TEST_SOURCES_DIR}/rosenbrock4.cpp)
cm_test(NAME numeric_test_odeint_rosenbrock4_mp SOURCES ${CURRENT_TEST_SOURCES_DIR}/rosenbrock4_mp.cpp)
cm_test(NAME numeric_test_odeint_is_pair SOURCES ${CURRENT_TEST_SOURCES_DIR}/is_pair.cpp)
cm_test(NAME numeric_test_odeint_adams_bashforth SOURCES ${CURRENT_TEST_SOURCES_DIR}/adams_bashforth.cpp)
cm_test(NAME numeric_test_odeint_adams_moulton SOURCES ${CURRENT_TEST_SOURCES_DIR}/adams_moulton.cpp)
cm_test(NAME numeric_test_odeint_adams_bashforth_moulton SOURCES ${CURRENT_TEST_SOURCES_DIR}/adams_bashforth_moulton.cpp)
cm_test(NAME numeric_test_odeint_generic_stepper SOURCES ${CURRENT_TEST_SOURCES_DIR}/generic_stepper.cpp)
cm_test(NAME numeric_test_odeint_generic_error_stepper SOURCES ${CURRENT_TEST_SOURCES_DIR}/generic_error_stepper.cpp)
cm_test(NAME numeric_test_odeint_bulirsch_stoer SOURCES ${CURRENT_TEST_SOURCES_DIR}/bulirsch_stoer.cpp)
cm_test(NAME numeric_test_odeint_integrate_times SOURCES ${CURRENT_TEST_SOURCES_DIR}/integrate_times.cpp)
cm_test(NAME numeric_test_odeint_integrate_times_iterator SOURCES ${CURRENT_TEST_SOURCES_DIR}/integrate_times.cpp)
target_compile_definitions(numeric_test_odeint_integrate_times_iterator PUBLIC ODEINT_INTEGRATE_ITERATOR)
cm_test(NAME numeric_test_odeint_integrate SOURCES ${CURRENT_TEST_SOURCES_DIR}/integrate.cpp)
cm_test(NAME numeric_test_odeint_integrate_iterator SOURCES ${CURRENT_TEST_SOURCES_DIR}/integrate.cpp)
target_compile_definitions(numeric_test_odeint_integrate_iterator PUBLIC ODEINT_INTEGRATE_ITERATOR)
cm_test(NAME numeric_test_odeint_integrate_implicit SOURCES ${CURRENT_TEST_SOURCES_DIR}/integrate_implicit.cpp)
cm_test(NAME numeric_test_odeint_integrate_implicit_iterator SOURCES ${CURRENT_TEST_SOURCES_DIR}/integrate_implicit.cpp)
target_compile_definitions(numeric_test_odeint_integrate_implicit_iterator PUBLIC ODEINT_INTEGRATE_ITERATOR)
cm_test(NAME numeric_test_odeint_generation SOURCES ${CURRENT_TEST_SOURCES_DIR}/generation.cpp)
cm_test(NAME numeric_test_odeint_trivial_state SOURCES ${CURRENT_TEST_SOURCES_DIR}/trivial_state.cpp)
cm_test(NAME numeric_test_odeint_is_resizeable SOURCES ${CURRENT_TEST_SOURCES_DIR}/is_resizeable.cpp)
cm_test(NAME numeric_test_odeint_numeric_odeint_resize SOURCES ${CURRENT_TEST_SOURCES_DIR}/resize.cpp)
cm_test(NAME numeric_test_odeint_same_size SOURCES ${CURRENT_TEST_SOURCES_DIR}/same_size.cpp)
cm_test(NAME numeric_test_odeint_split SOURCES ${CURRENT_TEST_SOURCES_DIR}/split.cpp)
cm_test(NAME numeric_test_odeint_symplectic_steppers SOURCES ${CURRENT_TEST_SOURCES_DIR}/symplectic_steppers.cpp)
cm_test(NAME numeric_test_odeint_integrators_symplectic SOURCES ${CURRENT_TEST_SOURCES_DIR}/integrators_symplectic.cpp)
cm_test(NAME numeric_test_odeint_integrators_symplectic_iterator SOURCES ${CURRENT_TEST_SOURCES_DIR}/integrators_symplectic.cpp)
target_compile_definitions(numeric_test_odeint_integrators_symplectic_iterator PUBLIC ODEINT_INTEGRATE_ITERATOR)
cm_test(NAME numeric_test_odeint_velocity_verlet SOURCES ${CURRENT_TEST_SOURCES_DIR}/velocity_verlet.cpp)
cm_test(NAME numeric_test_odeint_multi_array SOURCES ${CURRENT_TEST_SOURCES_DIR}/multi_array.cpp)
cm_test(NAME numeric_test_odeint_algebra_dispatcher SOURCES ${CURRENT_TEST_SOURCES_DIR}/algebra_dispatcher.cpp COMPILE_ONLY)
cm_test(NAME numeric_test_odeint_integrate_stepper_refs SOURCES ${CURRENT_TEST_SOURCES_DIR}/integrate_stepper_refs.cpp)
cm_test(NAME numeric_test_odeint_const_step_iterator SOURCES ${CURRENT_TEST_SOURCES_DIR}/const_step_iterator.cpp)
cm_test(NAME numeric_test_odeint_const_step_time_iterator SOURCES ${CURRENT_TEST_SOURCES_DIR}/const_step_time_iterator.cpp)
cm_test(NAME numeric_test_numeric_test_odeintodeint_adaptive_iterator SOURCES ${CURRENT_TEST_SOURCES_DIR}/adaptive_iterator.cpp)
cm_test(NAME numeric_test_odeint_adaptive_time_iterator SOURCES ${CURRENT_TEST_SOURCES_DIR}/adaptive_time_iterator.cpp)
cm_test(NAME numeric_test_odeint_n_step_iterator SOURCES ${CURRENT_TEST_SOURCES_DIR}/n_step_iterator.cpp)
cm_test(NAME numeric_test_odeint_n_step_time_iterator SOURCES ${CURRENT_TEST_SOURCES_DIR}/n_step_time_iterator.cpp)
cm_test(NAME numeric_test_odeint_times_iterator SOURCES ${CURRENT_TEST_SOURCES_DIR}/times_iterator.cpp)
cm_test(NAME numeric_test_odeint_times_time_iterator SOURCES ${CURRENT_TEST_SOURCES_DIR}/times_time_iterator.cpp)
cm_test(NAME numeric_test_odeint_unwrap_${CMAKE_WORKSPACE_NAME}_reference SOURCES ${CURRENT_TEST_SOURCES_DIR}/unwrap_${CMAKE_WORKSPACE_NAME}_reference.cpp COMPILE_ONLY)
cm_test(NAME numeric_test_odeint_unwrap_reference_C++11 SOURCES ${CURRENT_TEST_SOURCES_DIR}/unwrap_reference.cpp COMPILE_ONLY)
cm_test(NAME numeric_test_odeint_unwrap_reference_C++98 SOURCES ${CURRENT_TEST_SOURCES_DIR}/unwrap_reference.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME numeric_test_odeint_std_array SOURCES ${CURRENT_TEST_SOURCES_DIR}/std_array.cpp COMPILE_ONLY)

# also run numeric tests


# test-suite "odeint-iterator_integrate"
#    :
#    [ run integrate.cpp : : : : integrate_iterator ]
#    : <testing.launcher>valgrind
#      <define>ODEINT_ITERATOR_INTEGRATE
#    ;


