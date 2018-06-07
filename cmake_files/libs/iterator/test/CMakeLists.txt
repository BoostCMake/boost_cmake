include(BCMTest)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)

find_package(${CMAKE_WORKSPACE_NAME}_tuple)
find_package(${CMAKE_WORKSPACE_NAME}_bind)
find_package(${CMAKE_WORKSPACE_NAME}_test)
find_package(${CMAKE_WORKSPACE_NAME}_assign)

bcm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_iterator
                        boost::tuple
                        boost::bind
                        boost::test
                        boost::assign
                        )

# Copyright David Abrahams 2003. Distributed under the Boost
# Software License, Version 1.0. (See accompanying
# file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

# These first two tests will run last, and are expected to fail
# for many less-capable compilers.

bcm_test(NAME iterator_test_interoperable_fail SOURCES ${CMAKE_WORKSPACE_SOURCE}/interoperable_fail.cpp COMPILE_ONLY WILL_FAIL)
# test uses expected success, so that we catch unrelated
# compilation problems.
bcm_test(NAME iterator_test_is_convertible_fail SOURCES ${CMAKE_WORKSPACE_SOURCE}/is_convertible_fail.cpp)

bcm_test(NAME iterator_test_zip_iterator_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/zip_iterator_test.cpp)
# bcm_test(NAME iterator_test_zip_iterator_test2_std_tuple SOURCES ${CMAKE_WORKSPACE_SOURCE}/zip_iterator_test2_std_tuple.cpp)
# bcm_test(NAME iterator_test_zip_iterator_test2_fusion_vector SOURCES ${CMAKE_WORKSPACE_SOURCE}/zip_iterator_test2_fusion_vector.cpp)
# bcm_test(NAME iterator_test_zip_iterator_test2_fusion_list SOURCES ${CMAKE_WORKSPACE_SOURCE}/zip_iterator_test2_fusion_list.cpp)
# See bug report for fusion https://svn.boost.org/trac/boost/ticket/11572
# bcm_test(NAME iterator_test_zip_iterator_test2_fusion_deque SOURCES ${CMAKE_WORKSPACE_SOURCE}/zip_iterator_test2_fusion_deque.cpp)
# bcm_test(NAME iterator_test_zip_iterator_test_fusion SOURCES ${CMAKE_WORKSPACE_SOURCE}/zip_iterator_test_fusion.cpp)
# bcm_test(NAME iterator_test_zip_iterator_test_std_tuple SOURCES ${CMAKE_WORKSPACE_SOURCE}/zip_iterator_test_std_tuple.cpp)
# bcm_test(NAME iterator_test_zip_iterator_test_std_pair SOURCES ${CMAKE_WORKSPACE_SOURCE}/zip_iterator_test_std_pair.cpp)

# These tests should work for just about everything.
bcm_test(NAME iterator_test_is_lvalue_iterator SOURCES ${CMAKE_WORKSPACE_SOURCE}/is_lvalue_iterator.cpp COMPILE_ONLY)
bcm_test(NAME iterator_test_is_readable_iterator SOURCES ${CMAKE_WORKSPACE_SOURCE}/is_readable_iterator.cpp COMPILE_ONLY)
bcm_test(NAME iterator_test_pointee SOURCES ${CMAKE_WORKSPACE_SOURCE}/pointee.cpp COMPILE_ONLY)

bcm_test(NAME iterator_test_unit_tests SOURCES ${CMAKE_WORKSPACE_SOURCE}/unit_tests.cpp)
bcm_test(NAME iterator_test_concept_tests SOURCES ${CMAKE_WORKSPACE_SOURCE}/concept_tests.cpp)
bcm_test(NAME iterator_test_iterator_adaptor_cc SOURCES ${CMAKE_WORKSPACE_SOURCE}/iterator_adaptor_cc.cpp)
bcm_test(NAME iterator_test_iterator_adaptor_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/iterator_adaptor_test.cpp)
bcm_test(NAME iterator_test_iterator_archetype_cc SOURCES ${CMAKE_WORKSPACE_SOURCE}/iterator_archetype_cc.cpp COMPILE_ONLY)
bcm_test(NAME iterator_test_iter_archetype_default_ctor SOURCES ${CMAKE_WORKSPACE_SOURCE}/iter_archetype_default_ctor.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME iterator_test_lvalue_concept_fail SOURCES ${CMAKE_WORKSPACE_SOURCE}/lvalue_concept_fail.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME iterator_test_transform_iterator_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/transform_iterator_test.cpp)
bcm_test(NAME iterator_test_indirect_iterator_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/indirect_iterator_test.cpp)
bcm_test(NAME iterator_test_indirect_iter_member_types SOURCES ${CMAKE_WORKSPACE_SOURCE}/indirect_iter_member_types.cpp COMPILE_ONLY)
bcm_test(NAME iterator_test_filter_iterator_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/filter_iterator_test.cpp)
bcm_test(NAME iterator_test_iterator_facade SOURCES ${CMAKE_WORKSPACE_SOURCE}/iterator_facade.cpp)
bcm_test(NAME iterator_test_reverse_iterator_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/reverse_iterator_test.cpp)
bcm_test(NAME iterator_test_counting_iterator_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/counting_iterator_test.cpp)
bcm_test(NAME iterator_test_interoperable SOURCES ${CMAKE_WORKSPACE_SOURCE}/interoperable.cpp)
bcm_test(NAME iterator_test_iterator_traits_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/iterator_traits_test.cpp)
bcm_test(NAME iterator_test_permutation_iterator_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/permutation_iterator_test.cpp)
bcm_test(NAME iterator_test_function_input_iterator_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/function_input_iterator_test.cpp)

bcm_test(NAME iterator_test_generator_iterator_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/generator_iterator_test.cpp)

bcm_test(NAME iterator_test_minimum_category SOURCES ${CMAKE_WORKSPACE_SOURCE}/minimum_category.cpp)
bcm_test(NAME iterator_test_minimum_category_compile_fail SOURCES ${CMAKE_WORKSPACE_SOURCE}/minimum_category_compile_fail.cpp COMPILE_ONLY WILL_FAIL)

