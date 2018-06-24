include(BCMTest)

patch_directory(${CURRENT_TEST_SOURCES_DIR} ${CMAKE_CURRENT_SOURCE_DIR}/files ${CMAKE_CURRENT_BINARY_DIR})

find_package(${CMAKE_WORKSPACE_NAME}_numeric_ublas)
find_package(${CMAKE_WORKSPACE_NAME}_test)
find_package(${CMAKE_WORKSPACE_NAME}_multiprecision)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_numeric_odeint
                        boost::numeric_ublas
                        boost::test
                        boost::multiprecision
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


# use test library
# <cxxflags>-D_SCL_SECURE_NO_WARNINGS

# disable in clang
# cm_test(NAME euler_stepper SOURCES ${CURRENT_TEST_SOURCES_DIR}/euler_stepper.cpp)
# cm_test(NAME runge_kutta_concepts SOURCES ${CURRENT_TEST_SOURCES_DIR}/runge_kutta_concepts.cpp)
# cm_test(NAME runge_kutta_error_concepts SOURCES ${CURRENT_TEST_SOURCES_DIR}/runge_kutta_error_concepts.cpp)
# cm_test(NAME runge_kutta_controlled_concepts SOURCES ${CURRENT_TEST_SOURCES_DIR}/runge_kutta_controlled_concepts.cpp)
# cm_test(NAME resizing SOURCES ${CURRENT_TEST_SOURCES_DIR}/resizing.cpp)
cm_test(NAME numeric_odeint_test_default_operations SOURCES ${CURRENT_TEST_SOURCES_DIR}/default_operations.cpp)
cm_test(NAME numeric_odeint_test_range_algebra SOURCES ${CURRENT_TEST_SOURCES_DIR}/range_algebra.cpp)
# cm_test(NAME implicit_euler SOURCES ${CURRENT_TEST_SOURCES_DIR}/implicit_euler.cpp)
cm_test(NAME numeric_odeint_test_fusion_algebra SOURCES ${CURRENT_TEST_SOURCES_DIR}/fusion_algebra.cpp)
# cm_test(NAME stepper_with_units SOURCES ${CURRENT_TEST_SOURCES_DIR}/stepper_with_units.cpp)
# cm_test(NAME stepper_copying SOURCES ${CURRENT_TEST_SOURCES_DIR}/stepper_copying.cpp)
# cm_test(NAME stepper_with_ranges SOURCES ${CURRENT_TEST_SOURCES_DIR}/stepper_with_ranges.cpp)
# cm_test(NAME rosenbrock4 SOURCES ${CURRENT_TEST_SOURCES_DIR}/rosenbrock4.cpp)
# cm_test(NAME rosenbrock4_mp SOURCES ${CURRENT_TEST_SOURCES_DIR}/rosenbrock4_mp.cpp)
cm_test(NAME numeric_odeint_test_is_pair SOURCES ${CURRENT_TEST_SOURCES_DIR}/is_pair.cpp)
# cm_test(NAME adams_bashforth SOURCES ${CURRENT_TEST_SOURCES_DIR}/adams_bashforth.cpp)
# cm_test(NAME adams_moulton SOURCES ${CURRENT_TEST_SOURCES_DIR}/adams_moulton.cpp)
# cm_test(NAME adams_bashforth_moulton SOURCES ${CURRENT_TEST_SOURCES_DIR}/adams_bashforth_moulton.cpp)
# cm_test(NAME generic_stepper SOURCES ${CURRENT_TEST_SOURCES_DIR}/generic_stepper.cpp)
# cm_test(NAME generic_error_stepper SOURCES ${CURRENT_TEST_SOURCES_DIR}/generic_error_stepper.cpp)
# cm_test(NAME bulirsch_stoer SOURCES ${CURRENT_TEST_SOURCES_DIR}/bulirsch_stoer.cpp)
# cm_test(NAME integrate_times SOURCES ${CURRENT_TEST_SOURCES_DIR}/integrate_times.cpp)
# cm_test(NAME integrate_times_iterator SOURCES ${CURRENT_TEST_SOURCES_DIR}/integrate_times.cpp)
# target_compile_definitions(integrate_times_iterator PUBLIC ODEINT_INTEGRATE_ITERATOR)
# cm_test(NAME integrate SOURCES ${CURRENT_TEST_SOURCES_DIR}/integrate.cpp)
# cm_test(NAME integrate_iterator SOURCES ${CURRENT_TEST_SOURCES_DIR}/integrate.cpp)
# target_compile_definitions(integrate_iterator PUBLIC ODEINT_INTEGRATE_ITERATOR)
# cm_test(NAME integrate_implicit SOURCES ${CURRENT_TEST_SOURCES_DIR}/integrate_implicit.cpp)
# cm_test(NAME integrate_implicit_iterator SOURCES ${CURRENT_TEST_SOURCES_DIR}/integrate_implicit.cpp)
# target_compile_definitions(integrate_implicit_iterator PUBLIC ODEINT_INTEGRATE_ITERATOR)
# cm_test(NAME generation SOURCES ${CURRENT_TEST_SOURCES_DIR}/generation.cpp)
# cm_test(NAME trivial_state SOURCES ${CURRENT_TEST_SOURCES_DIR}/trivial_state.cpp)
cm_test(NAME numeric_odeint_test_is_resizeable SOURCES ${CURRENT_TEST_SOURCES_DIR}/is_resizeable.cpp)
cm_test(NAME numeric_odeint_test_numeric_odeint_resize SOURCES ${CURRENT_TEST_SOURCES_DIR}/resize.cpp)
cm_test(NAME numeric_odeint_test_same_size SOURCES ${CURRENT_TEST_SOURCES_DIR}/same_size.cpp)
cm_test(NAME numeric_odeint_test_split SOURCES ${CURRENT_TEST_SOURCES_DIR}/split.cpp)
# cm_test(NAME symplectic_steppers SOURCES ${CURRENT_TEST_SOURCES_DIR}/symplectic_steppers.cpp)
# cm_test(NAME integrators_symplectic SOURCES ${CURRENT_TEST_SOURCES_DIR}/integrators_symplectic.cpp)
# cm_test(NAME integrators_symplectic_iterator SOURCES ${CURRENT_TEST_SOURCES_DIR}/integrators_symplectic.cpp)
# target_compile_definitions(integrators_symplectic_iterator PUBLIC ODEINT_INTEGRATE_ITERATOR)
# cm_test(NAME velocity_verlet SOURCES ${CURRENT_TEST_SOURCES_DIR}/velocity_verlet.cpp)
# cm_test(NAME multi_array SOURCES ${CURRENT_TEST_SOURCES_DIR}/multi_array.cpp)
# cm_test(NAME algebra_dispatcher SOURCES ${CURRENT_TEST_SOURCES_DIR}/algebra_dispatcher.cpp COMPILE_ONLY)
cm_test(NAME numeric_odeint_test_integrate_stepper_refs SOURCES ${CURRENT_TEST_SOURCES_DIR}/integrate_stepper_refs.cpp)
cm_test(NAME numeric_odeint_test_const_step_iterator SOURCES ${CURRENT_TEST_SOURCES_DIR}/const_step_iterator.cpp)
cm_test(NAME numeric_odeint_test_const_step_time_iterator SOURCES ${CURRENT_TEST_SOURCES_DIR}/const_step_time_iterator.cpp)
cm_test(NAME numeric_odeint_test_adaptive_iterator SOURCES ${CURRENT_TEST_SOURCES_DIR}/adaptive_iterator.cpp)
cm_test(NAME numeric_odeint_test_adaptive_time_iterator SOURCES ${CURRENT_TEST_SOURCES_DIR}/adaptive_time_iterator.cpp)
cm_test(NAME numeric_odeint_test_n_step_iterator SOURCES ${CURRENT_TEST_SOURCES_DIR}/n_step_iterator.cpp)
cm_test(NAME numeric_odeint_test_n_step_time_iterator SOURCES ${CURRENT_TEST_SOURCES_DIR}/n_step_time_iterator.cpp)
cm_test(NAME numeric_odeint_test_times_iterator SOURCES ${CURRENT_TEST_SOURCES_DIR}/times_iterator.cpp)
cm_test(NAME numeric_odeint_test_times_time_iterator SOURCES ${CURRENT_TEST_SOURCES_DIR}/times_time_iterator.cpp)
# cm_test(NAME step_size_limitation SOURCES ${CURRENT_TEST_SOURCES_DIR}/step_size_limitation.cpp)
# cm_test(NAME integrate_overflow SOURCES ${CURRENT_TEST_SOURCES_DIR}/integrate_overflow.cpp)
cm_test(NAME numeric_odeint_test_unwrap_${CMAKE_WORKSPACE_NAME}_reference SOURCES ${CURRENT_TEST_SOURCES_DIR}/unwrap_${CMAKE_WORKSPACE_NAME}_reference.cpp COMPILE_ONLY)
cm_test(NAME numeric_odeint_test_unwrap_reference_C++11 SOURCES ${CURRENT_TEST_SOURCES_DIR}/unwrap_reference.cpp COMPILE_ONLY)
# cm_test(NAME unwrap_reference_C++98 SOURCES ${CURRENT_TEST_SOURCES_DIR}/unwrap_reference.cpp COMPILE_ONLY WILL_FAIL)
# cm_test(NAME std_array SOURCES ${CURRENT_TEST_SOURCES_DIR}/std_array.cpp COMPILE_ONLY)

# also run numeric tests


# test-suite "odeint-iterator_integrate"
#    :
#    [ run integrate.cpp : : : : integrate_iterator ]
#    : <testing.launcher>valgrind
#      <define>ODEINT_ITERATOR_INTEGRATE
#    ;


