include(BCMTest)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)

find_package(${CMAKE_WORKSPACE_NAME}_numeric_ublas)
find_package(${CMAKE_WORKSPACE_NAME}_test)
find_package(${CMAKE_WORKSPACE_NAME}_multiprecision)

bcm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_numeric_odeint
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
# bcm_test(NAME euler_stepper SOURCES ${CMAKE_WORKSPACE_SOURCE}/euler_stepper.cpp)
# bcm_test(NAME runge_kutta_concepts SOURCES ${CMAKE_WORKSPACE_SOURCE}/runge_kutta_concepts.cpp)
# bcm_test(NAME runge_kutta_error_concepts SOURCES ${CMAKE_WORKSPACE_SOURCE}/runge_kutta_error_concepts.cpp)
# bcm_test(NAME runge_kutta_controlled_concepts SOURCES ${CMAKE_WORKSPACE_SOURCE}/runge_kutta_controlled_concepts.cpp)
# bcm_test(NAME resizing SOURCES ${CMAKE_WORKSPACE_SOURCE}/resizing.cpp)
bcm_test(NAME numeric_odeint_test_default_operations SOURCES ${CMAKE_WORKSPACE_SOURCE}/default_operations.cpp)
bcm_test(NAME numeric_odeint_test_range_algebra SOURCES ${CMAKE_WORKSPACE_SOURCE}/range_algebra.cpp)
# bcm_test(NAME implicit_euler SOURCES ${CMAKE_WORKSPACE_SOURCE}/implicit_euler.cpp)
bcm_test(NAME numeric_odeint_test_fusion_algebra SOURCES ${CMAKE_WORKSPACE_SOURCE}/fusion_algebra.cpp)
# bcm_test(NAME stepper_with_units SOURCES ${CMAKE_WORKSPACE_SOURCE}/stepper_with_units.cpp)
# bcm_test(NAME stepper_copying SOURCES ${CMAKE_WORKSPACE_SOURCE}/stepper_copying.cpp)
# bcm_test(NAME stepper_with_ranges SOURCES ${CMAKE_WORKSPACE_SOURCE}/stepper_with_ranges.cpp)
# bcm_test(NAME rosenbrock4 SOURCES ${CMAKE_WORKSPACE_SOURCE}/rosenbrock4.cpp)
# bcm_test(NAME rosenbrock4_mp SOURCES ${CMAKE_WORKSPACE_SOURCE}/rosenbrock4_mp.cpp)
bcm_test(NAME numeric_odeint_test_is_pair SOURCES ${CMAKE_WORKSPACE_SOURCE}/is_pair.cpp)
# bcm_test(NAME adams_bashforth SOURCES ${CMAKE_WORKSPACE_SOURCE}/adams_bashforth.cpp)
# bcm_test(NAME adams_moulton SOURCES ${CMAKE_WORKSPACE_SOURCE}/adams_moulton.cpp)
# bcm_test(NAME adams_bashforth_moulton SOURCES ${CMAKE_WORKSPACE_SOURCE}/adams_bashforth_moulton.cpp)
# bcm_test(NAME generic_stepper SOURCES ${CMAKE_WORKSPACE_SOURCE}/generic_stepper.cpp)
# bcm_test(NAME generic_error_stepper SOURCES ${CMAKE_WORKSPACE_SOURCE}/generic_error_stepper.cpp)
# bcm_test(NAME bulirsch_stoer SOURCES ${CMAKE_WORKSPACE_SOURCE}/bulirsch_stoer.cpp)
# bcm_test(NAME integrate_times SOURCES ${CMAKE_WORKSPACE_SOURCE}/integrate_times.cpp)
# bcm_test(NAME integrate_times_iterator SOURCES ${CMAKE_WORKSPACE_SOURCE}/integrate_times.cpp)
# target_compile_definitions(integrate_times_iterator PUBLIC ODEINT_INTEGRATE_ITERATOR)
# bcm_test(NAME integrate SOURCES ${CMAKE_WORKSPACE_SOURCE}/integrate.cpp)
# bcm_test(NAME integrate_iterator SOURCES ${CMAKE_WORKSPACE_SOURCE}/integrate.cpp)
# target_compile_definitions(integrate_iterator PUBLIC ODEINT_INTEGRATE_ITERATOR)
# bcm_test(NAME integrate_implicit SOURCES ${CMAKE_WORKSPACE_SOURCE}/integrate_implicit.cpp)
# bcm_test(NAME integrate_implicit_iterator SOURCES ${CMAKE_WORKSPACE_SOURCE}/integrate_implicit.cpp)
# target_compile_definitions(integrate_implicit_iterator PUBLIC ODEINT_INTEGRATE_ITERATOR)
# bcm_test(NAME generation SOURCES ${CMAKE_WORKSPACE_SOURCE}/generation.cpp)
# bcm_test(NAME trivial_state SOURCES ${CMAKE_WORKSPACE_SOURCE}/trivial_state.cpp)
bcm_test(NAME numeric_odeint_test_is_resizeable SOURCES ${CMAKE_WORKSPACE_SOURCE}/is_resizeable.cpp)
bcm_test(NAME numeric_odeint_test_numeric_odeint_resize SOURCES ${CMAKE_WORKSPACE_SOURCE}/resize.cpp)
bcm_test(NAME numeric_odeint_test_same_size SOURCES ${CMAKE_WORKSPACE_SOURCE}/same_size.cpp)
bcm_test(NAME numeric_odeint_test_split SOURCES ${CMAKE_WORKSPACE_SOURCE}/split.cpp)
# bcm_test(NAME symplectic_steppers SOURCES ${CMAKE_WORKSPACE_SOURCE}/symplectic_steppers.cpp)
# bcm_test(NAME integrators_symplectic SOURCES ${CMAKE_WORKSPACE_SOURCE}/integrators_symplectic.cpp)
# bcm_test(NAME integrators_symplectic_iterator SOURCES ${CMAKE_WORKSPACE_SOURCE}/integrators_symplectic.cpp)
# target_compile_definitions(integrators_symplectic_iterator PUBLIC ODEINT_INTEGRATE_ITERATOR)
# bcm_test(NAME velocity_verlet SOURCES ${CMAKE_WORKSPACE_SOURCE}/velocity_verlet.cpp)
# bcm_test(NAME multi_array SOURCES ${CMAKE_WORKSPACE_SOURCE}/multi_array.cpp)
# bcm_test(NAME algebra_dispatcher SOURCES ${CMAKE_WORKSPACE_SOURCE}/algebra_dispatcher.cpp COMPILE_ONLY)
bcm_test(NAME numeric_odeint_test_integrate_stepper_refs SOURCES ${CMAKE_WORKSPACE_SOURCE}/integrate_stepper_refs.cpp)
bcm_test(NAME numeric_odeint_test_const_step_iterator SOURCES ${CMAKE_WORKSPACE_SOURCE}/const_step_iterator.cpp)
bcm_test(NAME numeric_odeint_test_const_step_time_iterator SOURCES ${CMAKE_WORKSPACE_SOURCE}/const_step_time_iterator.cpp)
bcm_test(NAME numeric_odeint_test_adaptive_iterator SOURCES ${CMAKE_WORKSPACE_SOURCE}/adaptive_iterator.cpp)
bcm_test(NAME numeric_odeint_test_adaptive_time_iterator SOURCES ${CMAKE_WORKSPACE_SOURCE}/adaptive_time_iterator.cpp)
bcm_test(NAME numeric_odeint_test_n_step_iterator SOURCES ${CMAKE_WORKSPACE_SOURCE}/n_step_iterator.cpp)
bcm_test(NAME numeric_odeint_test_n_step_time_iterator SOURCES ${CMAKE_WORKSPACE_SOURCE}/n_step_time_iterator.cpp)
bcm_test(NAME numeric_odeint_test_times_iterator SOURCES ${CMAKE_WORKSPACE_SOURCE}/times_iterator.cpp)
bcm_test(NAME numeric_odeint_test_times_time_iterator SOURCES ${CMAKE_WORKSPACE_SOURCE}/times_time_iterator.cpp)
# bcm_test(NAME step_size_limitation SOURCES ${CMAKE_WORKSPACE_SOURCE}/step_size_limitation.cpp)
# bcm_test(NAME integrate_overflow SOURCES ${CMAKE_WORKSPACE_SOURCE}/integrate_overflow.cpp)
bcm_test(NAME numeric_odeint_test_unwrap_${CMAKE_WORKSPACE_NAME}_reference SOURCES ${CMAKE_WORKSPACE_SOURCE}/unwrap_${CMAKE_WORKSPACE_NAME}_reference.cpp COMPILE_ONLY)
bcm_test(NAME numeric_odeint_test_unwrap_reference_C++11 SOURCES ${CMAKE_WORKSPACE_SOURCE}/unwrap_reference.cpp COMPILE_ONLY)
# bcm_test(NAME unwrap_reference_C++98 SOURCES ${CMAKE_WORKSPACE_SOURCE}/unwrap_reference.cpp COMPILE_ONLY WILL_FAIL)
# bcm_test(NAME std_array SOURCES ${CMAKE_WORKSPACE_SOURCE}/std_array.cpp COMPILE_ONLY)

# also run numeric tests


# test-suite "odeint-iterator_integrate"
#    :
#    [ run integrate.cpp : : : : integrate_iterator ]
#    : <testing.launcher>valgrind
#      <define>ODEINT_ITERATOR_INTEGRATE
#    ;


