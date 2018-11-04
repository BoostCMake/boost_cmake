include(CMTest)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_concept_check
                        )

# Copyright David Abrahams, Jeremy Siek, Vladimir Prus
# 2006. Distributed under the Boost Software License, Version
# 1.0. (See accompanying file LICENSE_1_0.txt or copy at
# http://www.boost.org/LICENSE_1_0.txt)

#test-suite concept_check
# TODO: fix test. Reason error: no match for ‘operator==’ (operand types are ‘boost::input_iterator_archetype<boost::equal_op_first_archetype<> >::reference’ and ‘const boost::equal_op_second_archetype<>’)
#cm_test(NAME concept_check_test_stl_concept_covering SOURCES ${CURRENT_TEST_SOURCES_DIR}/../stl_concept_covering.cpp)

cm_test(NAME concept_check_test_stl_concept_check SOURCES ${CURRENT_TEST_SOURCES_DIR}/../stl_concept_check.cpp)
cm_test(NAME concept_check_test_concept_check_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/../concept_check_test.cpp)
cm_test(NAME concept_check_test_class_concept_check_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/../class_concept_check_test.cpp)
cm_test(NAME concept_check_test_concept_check_fail_expected SOURCES ${CURRENT_TEST_SOURCES_DIR}/../concept_check_fail_expected.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME concept_check_test_class_concept_fail_expected SOURCES ${CURRENT_TEST_SOURCES_DIR}/../class_concept_fail_expected.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME concept_check_test_where SOURCES ${CURRENT_TEST_SOURCES_DIR}/../where.cpp)
cm_test(NAME concept_check_test_where_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/../where_fail.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME concept_check_test_usage_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/../usage_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME concept_check_test_old_concept_pass SOURCES ${CURRENT_TEST_SOURCES_DIR}/../old_concept_pass.cpp)
cm_test(NAME concept_check_test_function_requires_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/../function_requires_fail.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME concept_check_test_old_concept_function_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/../old_concept_function_fail.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME concept_check_test_old_concept_class_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/../old_concept_class_fail.cpp COMPILE_ONLY WILL_FAIL)
