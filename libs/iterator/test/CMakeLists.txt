include(CMTest)

find_package(${CMAKE_WORKSPACE_NAME}_tuple)
find_package(${CMAKE_WORKSPACE_NAME}_bind)
find_package(${CMAKE_WORKSPACE_NAME}_test)
find_package(${CMAKE_WORKSPACE_NAME}_assign)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_iterator
                        ${CMAKE_WORKSPACE_NAME}::tuple
                        ${CMAKE_WORKSPACE_NAME}::bind
                        ${CMAKE_WORKSPACE_NAME}::test
                        ${CMAKE_WORKSPACE_NAME}::assign
                        )

# Copyright David Abrahams 2003. Distributed under the Boost
# Software License, Version 1.0. (See accompanying
# file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

# These first two tests will run last, and are expected to fail
# for many less-capable compilers.


#test-suite iterator
cm_test(NAME iterator_test_interoperable_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/interoperable_fail.cpp COMPILE_ONLY WILL_FAIL)
# test uses expected success, so that we catch unrelated
# compilation problems.
cm_test(NAME iterator_test_is_convertible_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/is_convertible_fail.cpp)

cm_test(NAME iterator_test_zip_iterator_test2_std_tuple SOURCES ${CURRENT_TEST_SOURCES_DIR}/zip_iterator_test2_std_tuple.cpp)
cm_test(NAME iterator_test_zip_iterator_test2_fusion_vector SOURCES ${CURRENT_TEST_SOURCES_DIR}/zip_iterator_test2_fusion_vector.cpp)
cm_test(NAME iterator_test_zip_iterator_test2_fusion_list SOURCES ${CURRENT_TEST_SOURCES_DIR}/zip_iterator_test2_fusion_list.cpp)
cm_test(NAME iterator_test_zip_iterator_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/zip_iterator_test.cpp)
#    [ run zip_iterator_test2_fusion_deque.cpp ] // See bug report for fusion https://svn.boost.org/trac/boost/ticket/11572
cm_test(NAME iterator_test_zip_iterator_test_fusion SOURCES ${CURRENT_TEST_SOURCES_DIR}/zip_iterator_test_fusion.cpp)
cm_test(NAME iterator_test_zip_iterator_test_std_tuple SOURCES ${CURRENT_TEST_SOURCES_DIR}/zip_iterator_test_std_tuple.cpp)
cm_test(NAME iterator_test_zip_iterator_test_std_pair SOURCES ${CURRENT_TEST_SOURCES_DIR}/zip_iterator_test_std_pair.cpp)

# These tests should work for just about everything.
cm_test(NAME iterator_test_is_lvalue_iterator SOURCES ${CURRENT_TEST_SOURCES_DIR}/is_lvalue_iterator.cpp COMPILE_ONLY)
cm_test(NAME iterator_test_is_readable_iterator SOURCES ${CURRENT_TEST_SOURCES_DIR}/is_readable_iterator.cpp COMPILE_ONLY)
cm_test(NAME iterator_test_pointee SOURCES ${CURRENT_TEST_SOURCES_DIR}/pointee.cpp COMPILE_ONLY)

cm_test(NAME iterator_test_unit_tests SOURCES ${CURRENT_TEST_SOURCES_DIR}/unit_tests.cpp)
# TODO: fix test. error: expected template-name before ‘<’ token
# cm_test(NAME iterator_test_concept_tests SOURCES ${CURRENT_TEST_SOURCES_DIR}/concept_tests.cpp)

cm_test(NAME iterator_test_iterator_adaptor_cc SOURCES ${CURRENT_TEST_SOURCES_DIR}/iterator_adaptor_cc.cpp)
cm_test(NAME iterator_test_iterator_adaptor_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/iterator_adaptor_test.cpp)
cm_test(NAME iterator_test_iterator_archetype_cc SOURCES ${CURRENT_TEST_SOURCES_DIR}/iterator_archetype_cc.cpp COMPILE_ONLY)
cm_test(NAME iterator_test_iter_archetype_default_ctor SOURCES ${CURRENT_TEST_SOURCES_DIR}/iter_archetype_default_ctor.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME iterator_test_lvalue_concept_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/lvalue_concept_fail.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME iterator_test_transform_iterator_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/transform_iterator_test.cpp)
cm_test(NAME iterator_test_indirect_iterator_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/indirect_iterator_test.cpp)
cm_test(NAME iterator_test_indirect_iter_member_types SOURCES ${CURRENT_TEST_SOURCES_DIR}/indirect_iter_member_types.cpp COMPILE_ONLY)
cm_test(NAME iterator_test_filter_iterator_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/filter_iterator_test.cpp)
cm_test(NAME iterator_test_iterator_facade SOURCES ${CURRENT_TEST_SOURCES_DIR}/iterator_facade.cpp)
cm_test(NAME iterator_test_reverse_iterator_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/reverse_iterator_test.cpp)
cm_test(NAME iterator_test_counting_iterator_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/counting_iterator_test.cpp)
cm_test(NAME iterator_test_interoperable SOURCES ${CURRENT_TEST_SOURCES_DIR}/interoperable.cpp)
cm_test(NAME iterator_test_iterator_traits_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/iterator_traits_test.cpp)
cm_test(NAME iterator_test_permutation_iterator_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/permutation_iterator_test.cpp)
cm_test(NAME iterator_test_function_input_iterator_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/function_input_iterator_test.cpp)

cm_test(NAME iterator_test_generator_iterator_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/generator_iterator_test.cpp)

cm_test(NAME iterator_test_minimum_category SOURCES ${CURRENT_TEST_SOURCES_DIR}/minimum_category.cpp)
cm_test(NAME iterator_test_minimum_category_compile_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/minimum_category_compile_fail.cpp COMPILE_ONLY WILL_FAIL)
