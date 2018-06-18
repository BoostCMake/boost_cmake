include(BCMTest)

find_package(${CMAKE_WORKSPACE_NAME}_random)
find_package(${CMAKE_WORKSPACE_NAME}_foreach)
find_package(${CMAKE_WORKSPACE_NAME}_test)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_accumulators
                       ${CMAKE_WORKSPACE_NAME}::random
                       ${CMAKE_WORKSPACE_NAME}::foreach
                       ${CMAKE_WORKSPACE_NAME}::test
                       )

# (C) Copyright 2005: Eric Niebler
# Distributed under the Boost Software License, Version 1.0.
# (See accompanying file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

# bring in rules for testing

# TODO: Tests disabled because of problems in ublas
cm_test(NAME accumulators_test_count SOURCES count.cpp)
cm_test(NAME accumulators_test_covariance SOURCES covariance.cpp)
cm_test(NAME accumulators_test_droppable SOURCES droppable.cpp)
cm_test(NAME accumulators_test_error_of SOURCES error_of.cpp)
cm_test(NAME accumulators_test_extended_p_square SOURCES extended_p_square.cpp)
cm_test(NAME accumulators_test_extended_p_square_quantile SOURCES extended_p_square_quantile.cpp)
cm_test(NAME accumulators_test_external_accumulator SOURCES external_accumulator.cpp)
cm_test(NAME accumulators_test_external_weights SOURCES external_weights.cpp)
cm_test(NAME accumulators_test_kurtosis SOURCES kurtosis.cpp)
cm_test(NAME accumulators_test_max SOURCES max.cpp)
cm_test(NAME accumulators_test_mean SOURCES mean.cpp)
cm_test(NAME accumulators_test_median SOURCES median.cpp)
cm_test(NAME accumulators_test_min SOURCES min.cpp)
cm_test(NAME accumulators_test_moment SOURCES moment.cpp)
cm_test(NAME accumulators_test_pot_quantile SOURCES pot_quantile.cpp)
cm_test(NAME accumulators_test_p_square_cumul_dist SOURCES p_square_cumul_dist.cpp)
cm_test(NAME accumulators_test_p_square_quantile SOURCES p_square_quantile.cpp)
cm_test(NAME accumulators_test_reference SOURCES reference.cpp)
cm_test(NAME accumulators_test_rolling_count SOURCES rolling_count.cpp)
cm_test(NAME accumulators_test_rolling_sum SOURCES rolling_sum.cpp)
cm_test(NAME accumulators_test_rolling_mean SOURCES rolling_mean.cpp)
cm_test(NAME accumulators_test_skewness SOURCES skewness.cpp)
cm_test(NAME accumulators_test_sum SOURCES sum.cpp)
cm_test(NAME accumulators_test_sum_kahan SOURCES sum_kahan.cpp)
cm_test(NAME accumulators_test_tail SOURCES tail.cpp)
cm_test(NAME accumulators_test_tail_mean SOURCES tail_mean.cpp)
cm_test(NAME accumulators_test_tail_quantile SOURCES tail_quantile.cpp)
cm_test(NAME accumulators_test_tail_variate_means SOURCES tail_variate_means.cpp)

if(NOT APPLE AND NOT CMAKE_CXX_COMPILER_ID MATCHES "Clang")
    cm_test(NAME accumulators_test_valarray SOURCES valarray.cpp)
endif()

cm_test(NAME accumulators_test_variance SOURCES variance.cpp)
cm_test(NAME accumulators_test_vector SOURCES vector.cpp)
cm_test(NAME accumulators_test_weighted_covariance SOURCES weighted_covariance.cpp)
cm_test(NAME accumulators_test_weighted_extended_p_square SOURCES weighted_extended_p_square.cpp)
cm_test(NAME accumulators_test_weighted_kurtosis SOURCES weighted_kurtosis.cpp)
cm_test(NAME accumulators_test_weighted_mean SOURCES weighted_mean.cpp)
cm_test(NAME accumulators_test_weighted_median SOURCES weighted_median.cpp)
cm_test(NAME accumulators_test_weighted_moment SOURCES weighted_moment.cpp)
cm_test(NAME accumulators_test_weighted_p_square_cumul_dist SOURCES weighted_p_square_cumul_dist.cpp)
cm_test(NAME accumulators_test_weighted_p_square_quantile SOURCES weighted_p_square_quantile.cpp)
cm_test(NAME accumulators_test_weighted_skewness SOURCES weighted_skewness.cpp)
cm_test(NAME accumulators_test_weighted_sum SOURCES weighted_sum.cpp)
cm_test(NAME accumulators_test_weighted_sum_kahan SOURCES weighted_sum_kahan.cpp)
cm_test(NAME accumulators_test_weighted_variance SOURCES weighted_variance.cpp)
cm_test(NAME accumulators_test_weighted_pot_quantile SOURCES weighted_pot_quantile.cpp)
cm_test(NAME accumulators_test_weighted_tail_mean SOURCES weighted_tail_mean.cpp)
cm_test(NAME accumulators_test_weighted_tail_quantile SOURCES weighted_tail_quantile.cpp)
cm_test(NAME accumulators_test_weighted_tail_variate_means SOURCES weighted_tail_variate_means.cpp)