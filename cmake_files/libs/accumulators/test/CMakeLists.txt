include(BCMTest)
workspace_src(${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)

find_package(${CMAKE_WORKSPACE_NAME}_random)
find_package(${CMAKE_WORKSPACE_NAME}_foreach)
find_package(${CMAKE_WORKSPACE_NAME}_test)

bcm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_accumulators
                        boost::random
                        boost::foreach
                        boost::test
                        )

# (C) Copyright 2005: Eric Niebler
# Distributed under the Boost Software License, Version 1.0.
# (See accompanying file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

# bring in rules for testing

# TODO: Tests disabled because of problems in ublas
bcm_test(NAME accumulators_test_count SOURCES ${CMAKE_WORKSPACE_SOURCE}/count.cpp NEED_PATCH)
bcm_test(NAME accumulators_test_covariance SOURCES ${CMAKE_WORKSPACE_SOURCE}/covariance.cpp NEED_PATCH)
bcm_test(NAME accumulators_test_droppable SOURCES ${CMAKE_WORKSPACE_SOURCE}/droppable.cpp NEED_PATCH)
bcm_test(NAME accumulators_test_error_of SOURCES ${CMAKE_WORKSPACE_SOURCE}/error_of.cpp NEED_PATCH)
bcm_test(NAME accumulators_test_extended_p_square SOURCES ${CMAKE_WORKSPACE_SOURCE}/extended_p_square.cpp NEED_PATCH)
bcm_test(NAME accumulators_test_extended_p_square_quantile SOURCES ${CMAKE_WORKSPACE_SOURCE}/extended_p_square_quantile.cpp NEED_PATCH)
bcm_test(NAME accumulators_test_external_accumulator SOURCES ${CMAKE_WORKSPACE_SOURCE}/external_accumulator.cpp NEED_PATCH)
bcm_test(NAME accumulators_test_external_weights SOURCES ${CMAKE_WORKSPACE_SOURCE}/external_weights.cpp NEED_PATCH)
bcm_test(NAME accumulators_test_kurtosis SOURCES ${CMAKE_WORKSPACE_SOURCE}/kurtosis.cpp NEED_PATCH)
bcm_test(NAME accumulators_test_max SOURCES ${CMAKE_WORKSPACE_SOURCE}/max.cpp NEED_PATCH)
bcm_test(NAME accumulators_test_mean SOURCES ${CMAKE_WORKSPACE_SOURCE}/mean.cpp NEED_PATCH)
bcm_test(NAME accumulators_test_median SOURCES ${CMAKE_WORKSPACE_SOURCE}/median.cpp NEED_PATCH)
bcm_test(NAME accumulators_test_min SOURCES ${CMAKE_WORKSPACE_SOURCE}/min.cpp NEED_PATCH)
bcm_test(NAME accumulators_test_moment SOURCES ${CMAKE_WORKSPACE_SOURCE}/moment.cpp NEED_PATCH)
bcm_test(NAME accumulators_test_pot_quantile SOURCES ${CMAKE_WORKSPACE_SOURCE}/pot_quantile.cpp NEED_PATCH)
bcm_test(NAME accumulators_test_p_square_cumul_dist SOURCES ${CMAKE_WORKSPACE_SOURCE}/p_square_cumul_dist.cpp NEED_PATCH)
bcm_test(NAME accumulators_test_p_square_quantile SOURCES ${CMAKE_WORKSPACE_SOURCE}/p_square_quantile.cpp NEED_PATCH)
bcm_test(NAME accumulators_test_reference SOURCES ${CMAKE_WORKSPACE_SOURCE}/reference.cpp NEED_PATCH)
bcm_test(NAME accumulators_test_rolling_count SOURCES ${CMAKE_WORKSPACE_SOURCE}/rolling_count.cpp NEED_PATCH)
bcm_test(NAME accumulators_test_rolling_sum SOURCES ${CMAKE_WORKSPACE_SOURCE}/rolling_sum.cpp NEED_PATCH)
bcm_test(NAME accumulators_test_rolling_mean SOURCES ${CMAKE_WORKSPACE_SOURCE}/rolling_mean.cpp NEED_PATCH)
bcm_test(NAME accumulators_test_skewness SOURCES ${CMAKE_WORKSPACE_SOURCE}/skewness.cpp NEED_PATCH)
bcm_test(NAME accumulators_test_sum SOURCES ${CMAKE_WORKSPACE_SOURCE}/sum.cpp NEED_PATCH)
bcm_test(NAME accumulators_test_sum_kahan SOURCES ${CMAKE_WORKSPACE_SOURCE}/sum_kahan.cpp NEED_PATCH)
bcm_test(NAME accumulators_test_tail SOURCES ${CMAKE_WORKSPACE_SOURCE}/tail.cpp NEED_PATCH)
bcm_test(NAME accumulators_test_tail_mean SOURCES ${CMAKE_WORKSPACE_SOURCE}/tail_mean.cpp NEED_PATCH)
bcm_test(NAME accumulators_test_tail_quantile SOURCES ${CMAKE_WORKSPACE_SOURCE}/tail_quantile.cpp NEED_PATCH)
bcm_test(NAME accumulators_test_tail_variate_means SOURCES ${CMAKE_WORKSPACE_SOURCE}/tail_variate_means.cpp NEED_PATCH)

if(NOT APPLE AND NOT CMAKE_CXX_COMPILER_ID MATCHES "Clang")
    bcm_test(NAME accumulators_test_valarray SOURCES ${CMAKE_WORKSPACE_SOURCE}/valarray.cpp NEED_PATCH)
endif()

bcm_test(NAME accumulators_test_variance SOURCES ${CMAKE_WORKSPACE_SOURCE}/variance.cpp NEED_PATCH)
bcm_test(NAME accumulators_test_vector SOURCES ${CMAKE_WORKSPACE_SOURCE}/vector.cpp NEED_PATCH)
bcm_test(NAME accumulators_test_weighted_covariance SOURCES ${CMAKE_WORKSPACE_SOURCE}/weighted_covariance.cpp NEED_PATCH)
bcm_test(NAME accumulators_test_weighted_extended_p_square SOURCES ${CMAKE_WORKSPACE_SOURCE}/weighted_extended_p_square.cpp NEED_PATCH)
bcm_test(NAME accumulators_test_weighted_kurtosis SOURCES ${CMAKE_WORKSPACE_SOURCE}/weighted_kurtosis.cpp NEED_PATCH)
bcm_test(NAME accumulators_test_weighted_mean SOURCES ${CMAKE_WORKSPACE_SOURCE}/weighted_mean.cpp NEED_PATCH)
bcm_test(NAME accumulators_test_weighted_median SOURCES ${CMAKE_WORKSPACE_SOURCE}/weighted_median.cpp NEED_PATCH)
bcm_test(NAME accumulators_test_weighted_moment SOURCES ${CMAKE_WORKSPACE_SOURCE}/weighted_moment.cpp NEED_PATCH)
bcm_test(NAME accumulators_test_weighted_p_square_cumul_dist SOURCES ${CMAKE_WORKSPACE_SOURCE}/weighted_p_square_cumul_dist.cpp NEED_PATCH)
bcm_test(NAME accumulators_test_weighted_p_square_quantile SOURCES ${CMAKE_WORKSPACE_SOURCE}/weighted_p_square_quantile.cpp NEED_PATCH)
bcm_test(NAME accumulators_test_weighted_skewness SOURCES ${CMAKE_WORKSPACE_SOURCE}/weighted_skewness.cpp NEED_PATCH)
bcm_test(NAME accumulators_test_weighted_sum SOURCES ${CMAKE_WORKSPACE_SOURCE}/weighted_sum.cpp NEED_PATCH)
bcm_test(NAME accumulators_test_weighted_sum_kahan SOURCES ${CMAKE_WORKSPACE_SOURCE}/weighted_sum_kahan.cpp NEED_PATCH)
bcm_test(NAME accumulators_test_weighted_variance SOURCES ${CMAKE_WORKSPACE_SOURCE}/weighted_variance.cpp NEED_PATCH)
bcm_test(NAME accumulators_test_weighted_pot_quantile SOURCES ${CMAKE_WORKSPACE_SOURCE}/weighted_pot_quantile.cpp NEED_PATCH)
bcm_test(NAME accumulators_test_weighted_tail_mean SOURCES ${CMAKE_WORKSPACE_SOURCE}/weighted_tail_mean.cpp NEED_PATCH)
bcm_test(NAME accumulators_test_weighted_tail_quantile SOURCES ${CMAKE_WORKSPACE_SOURCE}/weighted_tail_quantile.cpp NEED_PATCH)
bcm_test(NAME accumulators_test_weighted_tail_variate_means SOURCES ${CMAKE_WORKSPACE_SOURCE}/weighted_tail_variate_means.cpp NEED_PATCH)