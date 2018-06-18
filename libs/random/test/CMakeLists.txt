include(BCMTest)

find_package(${CMAKE_WORKSPACE_NAME}_preprocessor)
find_package(${CMAKE_WORKSPACE_NAME}_exception)
find_package(${CMAKE_WORKSPACE_NAME}_multiprecision)
find_package(${CMAKE_WORKSPACE_NAME}_bind)
find_package(${CMAKE_WORKSPACE_NAME}_concept_check)
find_package(${CMAKE_WORKSPACE_NAME}_numeric_conversion)
find_package(${CMAKE_WORKSPACE_NAME}_test)
find_package(${CMAKE_WORKSPACE_NAME}_lexical_cast)
find_package(${CMAKE_WORKSPACE_NAME}_assign)
find_package(${CMAKE_WORKSPACE_NAME}_smart_ptr)
find_package(${CMAKE_WORKSPACE_NAME}_unit_test_framework)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_random
                       ${CMAKE_WORKSPACE_NAME}::preprocessor
                       ${CMAKE_WORKSPACE_NAME}::exception
                       ${CMAKE_WORKSPACE_NAME}::multiprecision
                       ${CMAKE_WORKSPACE_NAME}::bind
                       ${CMAKE_WORKSPACE_NAME}::concept_check
                       ${CMAKE_WORKSPACE_NAME}::numeric_conversion
                       ${CMAKE_WORKSPACE_NAME}::test
                       ${CMAKE_WORKSPACE_NAME}::lexical_cast
                       ${CMAKE_WORKSPACE_NAME}::assign
                       ${CMAKE_WORKSPACE_NAME}::smart_ptr
                       ${CMAKE_WORKSPACE_NAME}::unit_test_framework
                       )

# Copyright 2003 Jens Maurer
# Copyright 2009-2011 Steven Watanabe
# Distributed under the Boost Software License, Version 1.0. (See accompany-
# ing file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

# Boost Random Library test Jamfile

# bring in rules for testing


cm_test(NAME random_test_test_const_mod SOURCES test_const_mod.cpp)
cm_test(NAME random_test_test_generate_canonical SOURCES test_generate_canonical.cpp)
cm_test(NAME random_test_test_random_number_generator SOURCES test_random_number_generator.cpp)
cm_test(NAME random_test___example_random_demo SOURCES ../example/random_demo.cpp)
cm_test(NAME random_test_test_random_device SOURCES test_random_device.cpp)

cm_test(NAME random_test_test_minstd_rand0 SOURCES test_minstd_rand0.cpp)
cm_test(NAME random_test_test_minstd_rand SOURCES test_minstd_rand.cpp)
cm_test(NAME random_test_test_rand48 SOURCES test_rand48.cpp)
cm_test(NAME random_test_test_mt11213b SOURCES test_mt11213b.cpp)
cm_test(NAME random_test_test_mt19937 SOURCES test_mt19937.cpp)
cm_test(NAME random_test_test_mt19937_64 SOURCES test_mt19937_64.cpp)
cm_test(NAME random_test_test_ecuyer1988 SOURCES test_ecuyer1988.cpp)
cm_test(NAME random_test_test_hellekalek1995 SOURCES test_hellekalek1995.cpp)
cm_test(NAME random_test_test_linear_feedback_shift SOURCES test_linear_feedback_shift.cpp)
cm_test(NAME random_test_test_taus88 SOURCES test_taus88.cpp)
cm_test(NAME random_test_test_kreutzer1986 SOURCES test_kreutzer1986.cpp)
cm_test(NAME random_test_test_ranlux3 SOURCES test_ranlux3.cpp)
cm_test(NAME random_test_test_ranlux4 SOURCES test_ranlux4.cpp)
cm_test(NAME random_test_test_ranlux3_01 SOURCES test_ranlux3_01.cpp)
cm_test(NAME random_test_test_ranlux4_01 SOURCES test_ranlux4_01.cpp)
cm_test(NAME random_test_test_ranlux64_4 SOURCES test_ranlux64_4.cpp)
cm_test(NAME random_test_test_ranlux64_3 SOURCES test_ranlux64_3.cpp)
cm_test(NAME random_test_test_ranlux64_3_01 SOURCES test_ranlux64_3_01.cpp)
cm_test(NAME random_test_test_ranlux64_4_01 SOURCES test_ranlux64_4_01.cpp)
cm_test(NAME random_test_test_ranlux24_base SOURCES test_ranlux24_base.cpp)
cm_test(NAME random_test_test_ranlux24 SOURCES test_ranlux24.cpp)
cm_test(NAME random_test_test_ranlux48_base SOURCES test_ranlux48_base.cpp)
cm_test(NAME random_test_test_ranlux48 SOURCES test_ranlux48.cpp)
cm_test(NAME random_test_test_knuth_b SOURCES test_knuth_b.cpp)
cm_test(NAME random_test_test_independent_bits31 SOURCES test_independent_bits31.cpp)
cm_test(NAME random_test_test_independent_bits32 SOURCES test_independent_bits32.cpp)
cm_test(NAME random_test_test_lagged_fibonacci SOURCES test_lagged_fibonacci.cpp)
cm_test(NAME random_test_test_lagged_fibonacci607 SOURCES test_lagged_fibonacci607.cpp)
cm_test(NAME random_test_test_lagged_fibonacci1279 SOURCES test_lagged_fibonacci1279.cpp)
cm_test(NAME random_test_test_lagged_fibonacci2281 SOURCES test_lagged_fibonacci2281.cpp)
cm_test(NAME random_test_test_lagged_fibonacci3217 SOURCES test_lagged_fibonacci3217.cpp)
cm_test(NAME random_test_test_lagged_fibonacci4423 SOURCES test_lagged_fibonacci4423.cpp)
cm_test(NAME random_test_test_lagged_fibonacci9689 SOURCES test_lagged_fibonacci9689.cpp)
cm_test(NAME random_test_test_lagged_fibonacci19937 SOURCES test_lagged_fibonacci19937.cpp)
cm_test(NAME random_test_test_lagged_fibonacci23209 SOURCES test_lagged_fibonacci23209.cpp)
cm_test(NAME random_test_test_lagged_fibonacci44497 SOURCES test_lagged_fibonacci44497.cpp)
cm_test(NAME random_test_test_zero_seed SOURCES test_zero_seed.cpp)

# Disable by default.  These don't add much and the larger
# ones can overflow the stack.

cm_test(NAME random_test_test_seed_seq SOURCES test_seed_seq.cpp)

cm_test(NAME random_test_test_binomial SOURCES test_binomial.cpp)
cm_test(NAME random_test_test_binomial_distribution SOURCES test_binomial_distribution.cpp)
cm_test(NAME random_test_test_poisson SOURCES test_poisson.cpp)
cm_test(NAME random_test_test_poisson_distribution SOURCES test_poisson_distribution.cpp)
cm_test(NAME random_test_test_discrete SOURCES test_discrete.cpp)
cm_test(NAME random_test_test_discrete_distribution SOURCES test_discrete_distribution.cpp)
cm_test(NAME random_test_test_gamma SOURCES test_gamma.cpp)
cm_test(NAME random_test_test_gamma_distribution SOURCES test_gamma_distribution.cpp)
cm_test(NAME random_test_test_weibull SOURCES test_weibull.cpp)
cm_test(NAME random_test_test_weibull_distribution SOURCES test_weibull_distribution.cpp)
cm_test(NAME random_test_test_extreme_value SOURCES test_extreme_value.cpp)
cm_test(NAME random_test_test_extreme_value_distribution SOURCES test_extreme_value_distribution.cpp)
cm_test(NAME random_test_test_negative_binomial SOURCES test_negative_binomial.cpp)
cm_test(NAME random_test_test_negative_binomial_distribution SOURCES test_negative_binomial_distribution.cpp)
cm_test(NAME random_test_test_chi_squared SOURCES test_chi_squared.cpp)
cm_test(NAME random_test_test_chi_squared_distribution SOURCES test_chi_squared_distribution.cpp)
cm_test(NAME random_test_test_fisher_f SOURCES test_fisher_f.cpp)
cm_test(NAME random_test_test_fisher_f_distribution SOURCES test_fisher_f_distribution.cpp)
cm_test(NAME random_test_test_student_t SOURCES test_student_t.cpp)
cm_test(NAME random_test_test_student_t_distribution SOURCES test_student_t_distribution.cpp)
cm_test(NAME random_test_test_normal SOURCES test_normal.cpp)
cm_test(NAME random_test_test_normal_distribution SOURCES test_normal_distribution.cpp)
cm_test(NAME random_test_test_piecewise_constant SOURCES test_piecewise_constant.cpp)
cm_test(NAME random_test_test_piecewise_constant_distribution SOURCES test_piecewise_constant_distribution.cpp)
cm_test(NAME random_test_test_piecewise_linear SOURCES test_piecewise_linear.cpp)
cm_test(NAME random_test_test_piecewise_linear_distribution SOURCES test_piecewise_linear_distribution.cpp)
cm_test(NAME random_test_test_exponential SOURCES test_exponential.cpp)
cm_test(NAME random_test_test_exponential_distribution SOURCES test_exponential_distribution.cpp)
cm_test(NAME random_test_test_bernoulli SOURCES test_bernoulli.cpp)
cm_test(NAME random_test_test_bernoulli_distribution SOURCES test_bernoulli_distribution.cpp)
cm_test(NAME random_test_test_cauchy SOURCES test_cauchy.cpp)
cm_test(NAME random_test_test_cauchy_distribution SOURCES test_cauchy_distribution.cpp)
cm_test(NAME random_test_test_geometric SOURCES test_geometric.cpp)
cm_test(NAME random_test_test_geometric_distribution SOURCES test_geometric_distribution.cpp)
cm_test(NAME random_test_test_lognormal SOURCES test_lognormal.cpp)
cm_test(NAME random_test_test_lognormal_distribution SOURCES test_lognormal_distribution.cpp)
cm_test(NAME random_test_test_triangle SOURCES test_triangle.cpp)
cm_test(NAME random_test_test_triangle_distribution SOURCES test_triangle_distribution.cpp)
cm_test(NAME random_test_test_uniform_int SOURCES test_uniform_int.cpp)
cm_test(NAME random_test_test_uniform_int_distribution SOURCES test_uniform_int_distribution.cpp)
cm_test(NAME random_test_test_uniform_real SOURCES test_uniform_real.cpp)
cm_test(NAME random_test_test_uniform_real_distribution SOURCES test_uniform_real_distribution.cpp)
cm_test(NAME random_test_test_uniform_on_sphere SOURCES test_uniform_on_sphere.cpp)
cm_test(NAME random_test_test_uniform_on_sphere_distribution SOURCES test_uniform_on_sphere_distribution.cpp)
cm_test(NAME random_test_test_uniform_smallint SOURCES test_uniform_smallint.cpp)
cm_test(NAME random_test_test_uniform_smallint_distribution SOURCES test_uniform_smallint_distribution.cpp)
cm_test(NAME random_test_test_old_uniform_real SOURCES test_old_uniform_real.cpp)
cm_test(NAME random_test_test_old_uniform_real_distribution SOURCES test_old_uniform_real_distribution.cpp)
cm_test(NAME random_test_test_old_uniform_int SOURCES test_old_uniform_int.cpp)
cm_test(NAME random_test_test_old_uniform_int_distribution SOURCES test_old_uniform_int_distribution.cpp)
cm_test(NAME random_test_test_beta SOURCES test_beta.cpp)
cm_test(NAME random_test_test_beta_distribution SOURCES test_beta_distribution.cpp)
cm_test(NAME random_test_test_laplace SOURCES test_laplace.cpp)
cm_test(NAME random_test_test_laplace_distribution SOURCES test_laplace_distribution.cpp)
cm_test(NAME random_test_test_non_central_chi_squared SOURCES test_non_central_chi_squared.cpp)
cm_test(NAME random_test_test_non_central_chi_squared_distribution SOURCES test_non_central_chi_squared_distribution.cpp)
# cm_test(NAME random_test_test_hyperexponential SOURCES test_hyperexponential.cpp)
# cm_test(NAME random_test_test_hyperexponential_distribution SOURCES test_hyperexponential_distribution.cpp)

# run nondet_random_speed.cpp ;
# run random_device.cpp ;
# run random_speed.cpp ;
# run statistic_tests.cpp ;

#
# Multiprecision tests:
#
# cm_test(NAME random_test_multiprecision_int_test SOURCES multiprecision_int_test.cpp)
# This one runs too slow in debug mode, we really need inline expansions turned on amonst other things:
# cm_test(NAME random_test_multiprecision_float_test SOURCES multiprecision_float_test.cpp)
