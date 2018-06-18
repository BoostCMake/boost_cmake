include(BCMTest)


cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_concept_check
                       )

# Copyright David Abrahams, Jeremy Siek, Vladimir Prus
# 2006. Distributed under the Boost Software License, Version
# 1.0. (See accompanying file LICENSE_1_0.txt or copy at
# http://www.boost.org/LICENSE_1_0.txt)

# TODO: Disable this broken test for now
# cm_test(NAME concept_check_test_stl_concept_covering SOURCES stl_concept_covering.cpp)
cm_test(NAME concept_check_test_stl_concept_check SOURCES ../stl_concept_check.cpp)
cm_test(NAME concept_check_test_concept_check_test SOURCES ../concept_check_test.cpp)
cm_test(NAME concept_check_test_class_concept_check_test SOURCES ../class_concept_check_test.cpp)
cm_test(NAME concept_check_test_concept_check_fail_expected SOURCES ../concept_check_fail_expected.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME concept_check_test_class_concept_fail_expected SOURCES ../class_concept_fail_expected.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME concept_check_test_where SOURCES ../where.cpp)
cm_test(NAME concept_check_test_where_fail SOURCES ../where_fail.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME concept_check_test_usage_fail SOURCES ../usage_fail.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME concept_check_test_old_concept_pass SOURCES ../old_concept_pass.cpp)
cm_test(NAME concept_check_test_function_requires_fail SOURCES ../function_requires_fail.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME concept_check_test_old_concept_function_fail SOURCES ../old_concept_function_fail.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME concept_check_test_old_concept_class_fail SOURCES ../old_concept_class_fail.cpp COMPILE_ONLY WILL_FAIL)


