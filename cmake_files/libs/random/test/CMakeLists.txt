include(BCMTest)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)

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

bcm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_random
                        boost::preprocessor
                        boost::exception
                        boost::multiprecision
                        boost::bind
                        boost::concept_check
                        boost::numeric_conversion
                        boost::test
                        boost::lexical_cast
                        boost::assign
                        boost::smart_ptr
                        boost::unit_test_framework
                        )

# Copyright 2003 Jens Maurer
# Copyright 2009-2011 Steven Watanabe
# Distributed under the Boost Software License, Version 1.0. (See accompany-
# ing file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

# Boost Random Library test Jamfile

# bring in rules for testing


bcm_test(NAME random_test_test_const_mod SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_const_mod.cpp)
bcm_test(NAME random_test_test_generate_canonical SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_generate_canonical.cpp)
bcm_test(NAME random_test_test_random_number_generator SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_random_number_generator.cpp)
bcm_test(NAME random_test___example_random_demo SOURCES ${CMAKE_WORKSPACE_SOURCE}/../example/random_demo.cpp)
bcm_test(NAME random_test_test_random_device SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_random_device.cpp NEED_PATCH)

bcm_test(NAME random_test_test_minstd_rand0 SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_minstd_rand0.cpp)
bcm_test(NAME random_test_test_minstd_rand SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_minstd_rand.cpp)
bcm_test(NAME random_test_test_rand48 SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_rand48.cpp)
bcm_test(NAME random_test_test_mt11213b SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_mt11213b.cpp)
bcm_test(NAME random_test_test_mt19937 SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_mt19937.cpp)
bcm_test(NAME random_test_test_mt19937_64 SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_mt19937_64.cpp)
bcm_test(NAME random_test_test_ecuyer1988 SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_ecuyer1988.cpp)
bcm_test(NAME random_test_test_hellekalek1995 SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_hellekalek1995.cpp)
bcm_test(NAME random_test_test_linear_feedback_shift SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_linear_feedback_shift.cpp)
bcm_test(NAME random_test_test_taus88 SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_taus88.cpp)
bcm_test(NAME random_test_test_kreutzer1986 SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_kreutzer1986.cpp)
bcm_test(NAME random_test_test_ranlux3 SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_ranlux3.cpp)
bcm_test(NAME random_test_test_ranlux4 SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_ranlux4.cpp)
bcm_test(NAME random_test_test_ranlux3_01 SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_ranlux3_01.cpp)
bcm_test(NAME random_test_test_ranlux4_01 SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_ranlux4_01.cpp)
bcm_test(NAME random_test_test_ranlux64_4 SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_ranlux64_4.cpp)
bcm_test(NAME random_test_test_ranlux64_3 SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_ranlux64_3.cpp)
bcm_test(NAME random_test_test_ranlux64_3_01 SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_ranlux64_3_01.cpp)
bcm_test(NAME random_test_test_ranlux64_4_01 SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_ranlux64_4_01.cpp)
bcm_test(NAME random_test_test_ranlux24_base SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_ranlux24_base.cpp)
bcm_test(NAME random_test_test_ranlux24 SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_ranlux24.cpp)
bcm_test(NAME random_test_test_ranlux48_base SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_ranlux48_base.cpp)
bcm_test(NAME random_test_test_ranlux48 SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_ranlux48.cpp)
bcm_test(NAME random_test_test_knuth_b SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_knuth_b.cpp)
bcm_test(NAME random_test_test_independent_bits31 SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_independent_bits31.cpp)
bcm_test(NAME random_test_test_independent_bits32 SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_independent_bits32.cpp)
bcm_test(NAME random_test_test_lagged_fibonacci SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_lagged_fibonacci.cpp)
bcm_test(NAME random_test_test_lagged_fibonacci607 SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_lagged_fibonacci607.cpp)
bcm_test(NAME random_test_test_lagged_fibonacci1279 SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_lagged_fibonacci1279.cpp)
bcm_test(NAME random_test_test_lagged_fibonacci2281 SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_lagged_fibonacci2281.cpp)
bcm_test(NAME random_test_test_lagged_fibonacci3217 SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_lagged_fibonacci3217.cpp)
bcm_test(NAME random_test_test_lagged_fibonacci4423 SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_lagged_fibonacci4423.cpp)
bcm_test(NAME random_test_test_lagged_fibonacci9689 SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_lagged_fibonacci9689.cpp)
bcm_test(NAME random_test_test_lagged_fibonacci19937 SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_lagged_fibonacci19937.cpp)
bcm_test(NAME random_test_test_lagged_fibonacci23209 SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_lagged_fibonacci23209.cpp)
bcm_test(NAME random_test_test_lagged_fibonacci44497 SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_lagged_fibonacci44497.cpp)
bcm_test(NAME random_test_test_zero_seed SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_zero_seed.cpp)

# Disable by default.  These don't add much and the larger
# ones can overflow the stack.

bcm_test(NAME random_test_test_seed_seq SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_seed_seq.cpp)

bcm_test(NAME random_test_test_binomial SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_binomial.cpp)
bcm_test(NAME random_test_test_binomial_distribution SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_binomial_distribution.cpp)
bcm_test(NAME random_test_test_poisson SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_poisson.cpp)
bcm_test(NAME random_test_test_poisson_distribution SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_poisson_distribution.cpp)
bcm_test(NAME random_test_test_discrete SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_discrete.cpp)
bcm_test(NAME random_test_test_discrete_distribution SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_discrete_distribution.cpp)
bcm_test(NAME random_test_test_gamma SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_gamma.cpp)
bcm_test(NAME random_test_test_gamma_distribution SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_gamma_distribution.cpp)
bcm_test(NAME random_test_test_weibull SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_weibull.cpp)
bcm_test(NAME random_test_test_weibull_distribution SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_weibull_distribution.cpp)
bcm_test(NAME random_test_test_extreme_value SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_extreme_value.cpp)
bcm_test(NAME random_test_test_extreme_value_distribution SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_extreme_value_distribution.cpp)
bcm_test(NAME random_test_test_negative_binomial SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_negative_binomial.cpp)
bcm_test(NAME random_test_test_negative_binomial_distribution SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_negative_binomial_distribution.cpp)
bcm_test(NAME random_test_test_chi_squared SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_chi_squared.cpp)
bcm_test(NAME random_test_test_chi_squared_distribution SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_chi_squared_distribution.cpp)
bcm_test(NAME random_test_test_fisher_f SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_fisher_f.cpp)
bcm_test(NAME random_test_test_fisher_f_distribution SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_fisher_f_distribution.cpp)
bcm_test(NAME random_test_test_student_t SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_student_t.cpp)
bcm_test(NAME random_test_test_student_t_distribution SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_student_t_distribution.cpp)
bcm_test(NAME random_test_test_normal SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_normal.cpp)
bcm_test(NAME random_test_test_normal_distribution SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_normal_distribution.cpp)
bcm_test(NAME random_test_test_piecewise_constant SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_piecewise_constant.cpp)
bcm_test(NAME random_test_test_piecewise_constant_distribution SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_piecewise_constant_distribution.cpp)
bcm_test(NAME random_test_test_piecewise_linear SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_piecewise_linear.cpp)
bcm_test(NAME random_test_test_piecewise_linear_distribution SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_piecewise_linear_distribution.cpp)
bcm_test(NAME random_test_test_exponential SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_exponential.cpp)
bcm_test(NAME random_test_test_exponential_distribution SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_exponential_distribution.cpp)
bcm_test(NAME random_test_test_bernoulli SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_bernoulli.cpp)
bcm_test(NAME random_test_test_bernoulli_distribution SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_bernoulli_distribution.cpp)
bcm_test(NAME random_test_test_cauchy SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_cauchy.cpp)
bcm_test(NAME random_test_test_cauchy_distribution SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_cauchy_distribution.cpp)
bcm_test(NAME random_test_test_geometric SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_geometric.cpp)
bcm_test(NAME random_test_test_geometric_distribution SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_geometric_distribution.cpp)
bcm_test(NAME random_test_test_lognormal SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_lognormal.cpp)
bcm_test(NAME random_test_test_lognormal_distribution SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_lognormal_distribution.cpp)
bcm_test(NAME random_test_test_triangle SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_triangle.cpp)
bcm_test(NAME random_test_test_triangle_distribution SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_triangle_distribution.cpp)
bcm_test(NAME random_test_test_uniform_int SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_uniform_int.cpp)
bcm_test(NAME random_test_test_uniform_int_distribution SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_uniform_int_distribution.cpp)
bcm_test(NAME random_test_test_uniform_real SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_uniform_real.cpp)
bcm_test(NAME random_test_test_uniform_real_distribution SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_uniform_real_distribution.cpp)
bcm_test(NAME random_test_test_uniform_on_sphere SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_uniform_on_sphere.cpp)
bcm_test(NAME random_test_test_uniform_on_sphere_distribution SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_uniform_on_sphere_distribution.cpp)
bcm_test(NAME random_test_test_uniform_smallint SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_uniform_smallint.cpp)
bcm_test(NAME random_test_test_uniform_smallint_distribution SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_uniform_smallint_distribution.cpp)
bcm_test(NAME random_test_test_old_uniform_real SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_old_uniform_real.cpp)
bcm_test(NAME random_test_test_old_uniform_real_distribution SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_old_uniform_real_distribution.cpp)
bcm_test(NAME random_test_test_old_uniform_int SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_old_uniform_int.cpp)
bcm_test(NAME random_test_test_old_uniform_int_distribution SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_old_uniform_int_distribution.cpp)
bcm_test(NAME random_test_test_beta SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_beta.cpp)
bcm_test(NAME random_test_test_beta_distribution SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_beta_distribution.cpp)
bcm_test(NAME random_test_test_laplace SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_laplace.cpp)
bcm_test(NAME random_test_test_laplace_distribution SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_laplace_distribution.cpp)
bcm_test(NAME random_test_test_non_central_chi_squared SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_non_central_chi_squared.cpp)
bcm_test(NAME random_test_test_non_central_chi_squared_distribution SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_non_central_chi_squared_distribution.cpp)
# bcm_test(NAME random_test_test_hyperexponential SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_hyperexponential.cpp)
# bcm_test(NAME random_test_test_hyperexponential_distribution SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_hyperexponential_distribution.cpp)

# run nondet_random_speed.cpp ;
# run random_device.cpp ;
# run random_speed.cpp ;
# run statistic_tests.cpp ;

#
# Multiprecision tests:
#
# bcm_test(NAME random_test_multiprecision_int_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/multiprecision_int_test.cpp)
# This one runs too slow in debug mode, we really need inline expansions turned on amonst other things:
# bcm_test(NAME random_test_multiprecision_float_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/multiprecision_float_test.cpp)
