include(BCMTest)

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

cm_test(NAME iterator_test_interoperable_fail SOURCES interoperable_fail.cpp COMPILE_ONLY WILL_FAIL)
# test uses expected success, so that we catch unrelated
# compilation problems.
cm_test(NAME iterator_test_is_convertible_fail SOURCES is_convertible_fail.cpp)

cm_test(NAME iterator_test_zip_iterator_test SOURCES zip_iterator_test.cpp)
# cm_test(NAME iterator_test_zip_iterator_test2_std_tuple SOURCES zip_iterator_test2_std_tuple.cpp)
# cm_test(NAME iterator_test_zip_iterator_test2_fusion_vector SOURCES zip_iterator_test2_fusion_vector.cpp)
# cm_test(NAME iterator_test_zip_iterator_test2_fusion_list SOURCES zip_iterator_test2_fusion_list.cpp)
# See bug report for fusion https://svn.boost.org/trac/boost/ticket/11572
# cm_test(NAME iterator_test_zip_iterator_test2_fusion_deque SOURCES zip_iterator_test2_fusion_deque.cpp)
# cm_test(NAME iterator_test_zip_iterator_test_fusion SOURCES zip_iterator_test_fusion.cpp)
# cm_test(NAME iterator_test_zip_iterator_test_std_tuple SOURCES zip_iterator_test_std_tuple.cpp)
# cm_test(NAME iterator_test_zip_iterator_test_std_pair SOURCES zip_iterator_test_std_pair.cpp)

# These tests should work for just about everything.
cm_test(NAME iterator_test_is_lvalue_iterator SOURCES is_lvalue_iterator.cpp COMPILE_ONLY)
cm_test(NAME iterator_test_is_readable_iterator SOURCES is_readable_iterator.cpp COMPILE_ONLY)
cm_test(NAME iterator_test_pointee SOURCES pointee.cpp COMPILE_ONLY)

cm_test(NAME iterator_test_unit_tests SOURCES unit_tests.cpp)
cm_test(NAME iterator_test_concept_tests SOURCES concept_tests.cpp)
cm_test(NAME iterator_test_iterator_adaptor_cc SOURCES iterator_adaptor_cc.cpp)
cm_test(NAME iterator_test_iterator_adaptor_test SOURCES iterator_adaptor_test.cpp)
cm_test(NAME iterator_test_iterator_archetype_cc SOURCES iterator_archetype_cc.cpp COMPILE_ONLY)
cm_test(NAME iterator_test_iter_archetype_default_ctor SOURCES iter_archetype_default_ctor.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME iterator_test_lvalue_concept_fail SOURCES lvalue_concept_fail.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME iterator_test_transform_iterator_test SOURCES transform_iterator_test.cpp)
cm_test(NAME iterator_test_indirect_iterator_test SOURCES indirect_iterator_test.cpp)
cm_test(NAME iterator_test_indirect_iter_member_types SOURCES indirect_iter_member_types.cpp COMPILE_ONLY)
cm_test(NAME iterator_test_filter_iterator_test SOURCES filter_iterator_test.cpp)
cm_test(NAME iterator_test_iterator_facade SOURCES iterator_facade.cpp)
cm_test(NAME iterator_test_reverse_iterator_test SOURCES reverse_iterator_test.cpp)
cm_test(NAME iterator_test_counting_iterator_test SOURCES counting_iterator_test.cpp)
cm_test(NAME iterator_test_interoperable SOURCES interoperable.cpp)
cm_test(NAME iterator_test_iterator_traits_test SOURCES iterator_traits_test.cpp)
cm_test(NAME iterator_test_permutation_iterator_test SOURCES permutation_iterator_test.cpp)
cm_test(NAME iterator_test_function_input_iterator_test SOURCES function_input_iterator_test.cpp)

cm_test(NAME iterator_test_generator_iterator_test SOURCES generator_iterator_test.cpp)

cm_test(NAME iterator_test_minimum_category SOURCES minimum_category.cpp)
cm_test(NAME iterator_test_minimum_category_compile_fail SOURCES minimum_category_compile_fail.cpp COMPILE_ONLY WILL_FAIL)

