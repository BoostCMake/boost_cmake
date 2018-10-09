include(CMTest)

find_package(${CMAKE_WORKSPACE_NAME}_detail)
find_package(${CMAKE_WORKSPACE_NAME}_test)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_multi_array
                        ${CMAKE_WORKSPACE_NAME}::detail
                        ${CMAKE_WORKSPACE_NAME}::test
                        )

# Copyright David Abrahams 2003. Permission to copy, use,
# modify, sell and distribute this software is granted provided this
# copyright notice appears in all copies. This software is provided
# "as is" without express or implied warranty, and with no claim as
# to its suitability for any purpose.

#test-suite multi_array
cm_test(NAME multi_array_test_fail_cbracket SOURCES ${CURRENT_TEST_SOURCES_DIR}/fail_cbracket.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME multi_array_test_fail_cdata SOURCES ${CURRENT_TEST_SOURCES_DIR}/fail_cdata.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME multi_array_test_fail_citerator SOURCES ${CURRENT_TEST_SOURCES_DIR}/fail_citerator.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME multi_array_test_fail_cparen SOURCES ${CURRENT_TEST_SOURCES_DIR}/fail_cparen.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME multi_array_test_fail_criterator SOURCES ${CURRENT_TEST_SOURCES_DIR}/fail_criterator.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME multi_array_test_fail_csubarray SOURCES ${CURRENT_TEST_SOURCES_DIR}/fail_csubarray.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME multi_array_test_fail_csubarray2 SOURCES ${CURRENT_TEST_SOURCES_DIR}/fail_csubarray2.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME multi_array_test_fail_csubarray3 SOURCES ${CURRENT_TEST_SOURCES_DIR}/fail_csubarray3.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME multi_array_test_fail_cview SOURCES ${CURRENT_TEST_SOURCES_DIR}/fail_cview.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME multi_array_test_fail_cview2 SOURCES ${CURRENT_TEST_SOURCES_DIR}/fail_cview2.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME multi_array_test_fail_cview3 SOURCES ${CURRENT_TEST_SOURCES_DIR}/fail_cview3.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME multi_array_test_fail_ref_cbracket SOURCES ${CURRENT_TEST_SOURCES_DIR}/fail_ref_cbracket.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME multi_array_test_fail_ref_cdata SOURCES ${CURRENT_TEST_SOURCES_DIR}/fail_ref_cdata.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME multi_array_test_fail_ref_citerator SOURCES ${CURRENT_TEST_SOURCES_DIR}/fail_ref_citerator.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME multi_array_test_fail_ref_cparen SOURCES ${CURRENT_TEST_SOURCES_DIR}/fail_ref_cparen.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME multi_array_test_fail_ref_criterator SOURCES ${CURRENT_TEST_SOURCES_DIR}/fail_ref_criterator.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME multi_array_test_fail_ref_csubarray SOURCES ${CURRENT_TEST_SOURCES_DIR}/fail_ref_csubarray.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME multi_array_test_fail_ref_csubarray2 SOURCES ${CURRENT_TEST_SOURCES_DIR}/fail_ref_csubarray2.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME multi_array_test_fail_ref_csubarray3 SOURCES ${CURRENT_TEST_SOURCES_DIR}/fail_ref_csubarray3.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME multi_array_test_fail_ref_cview SOURCES ${CURRENT_TEST_SOURCES_DIR}/fail_ref_cview.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME multi_array_test_fail_ref_cview2 SOURCES ${CURRENT_TEST_SOURCES_DIR}/fail_ref_cview2.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME multi_array_test_fail_ref_cview3 SOURCES ${CURRENT_TEST_SOURCES_DIR}/fail_ref_cview3.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME multi_array_test_constructors SOURCES ${CURRENT_TEST_SOURCES_DIR}/constructors.cpp)
cm_test(NAME multi_array_test_access SOURCES ${CURRENT_TEST_SOURCES_DIR}/access.cpp)
cm_test(NAME multi_array_test_compare SOURCES ${CURRENT_TEST_SOURCES_DIR}/compare.cpp)
cm_test(NAME multi_array_test_iterators SOURCES ${CURRENT_TEST_SOURCES_DIR}/iterators.cpp)
cm_test(NAME multi_array_test_slice SOURCES ${CURRENT_TEST_SOURCES_DIR}/slice.cpp)
cm_test(NAME multi_array_test_assign SOURCES ${CURRENT_TEST_SOURCES_DIR}/assign.cpp)
cm_test(NAME multi_array_test_assign_to_array SOURCES ${CURRENT_TEST_SOURCES_DIR}/assign_to_array.cpp)
cm_test(NAME multi_array_test_index_bases SOURCES ${CURRENT_TEST_SOURCES_DIR}/index_bases.cpp)
cm_test(NAME multi_array_test_storage_order_convert SOURCES ${CURRENT_TEST_SOURCES_DIR}/storage_order_convert.cpp)
cm_test(NAME multi_array_test_storage_order SOURCES ${CURRENT_TEST_SOURCES_DIR}/storage_order.cpp)
cm_test(NAME multi_array_test_reshape SOURCES ${CURRENT_TEST_SOURCES_DIR}/reshape.cpp)
cm_test(NAME multi_array_test_range1 SOURCES ${CURRENT_TEST_SOURCES_DIR}/range1.cpp)
cm_test(NAME multi_array_test_idxgen1 SOURCES ${CURRENT_TEST_SOURCES_DIR}/idxgen1.cpp)
cm_test(NAME multi_array_test_stl_interaction SOURCES ${CURRENT_TEST_SOURCES_DIR}/stl_interaction.cpp)
cm_test(NAME multi_array_test_resize SOURCES ${CURRENT_TEST_SOURCES_DIR}/resize.cpp)
cm_test(NAME multi_array_test_assert SOURCES ${CURRENT_TEST_SOURCES_DIR}/assert.cpp)
cm_test(NAME multi_array_test_reverse_view SOURCES ${CURRENT_TEST_SOURCES_DIR}/reverse_view.cpp)

cm_test(NAME multi_array_test_concept_checks SOURCES ${CURRENT_TEST_SOURCES_DIR}/concept_checks.cpp COMPILE_ONLY)
