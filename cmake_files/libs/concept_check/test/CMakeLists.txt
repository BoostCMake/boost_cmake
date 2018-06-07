include(BCMTest)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)


bcm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_concept_check
                        )

# Copyright David Abrahams, Jeremy Siek, Vladimir Prus
# 2006. Distributed under the Boost Software License, Version
# 1.0. (See accompanying file LICENSE_1_0.txt or copy at
# http://www.boost.org/LICENSE_1_0.txt)

# TODO: Disable this broken test for now
# bcm_test(NAME concept_check_test_stl_concept_covering SOURCES ${CMAKE_WORKSPACE_SOURCE}/stl_concept_covering.cpp)
bcm_test(NAME concept_check_test_stl_concept_check SOURCES ${CMAKE_WORKSPACE_SOURCE}/../stl_concept_check.cpp)
bcm_test(NAME concept_check_test_concept_check_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/../concept_check_test.cpp)
bcm_test(NAME concept_check_test_class_concept_check_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/../class_concept_check_test.cpp)
bcm_test(NAME concept_check_test_concept_check_fail_expected SOURCES ${CMAKE_WORKSPACE_SOURCE}/../concept_check_fail_expected.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME concept_check_test_class_concept_fail_expected SOURCES ${CMAKE_WORKSPACE_SOURCE}/../class_concept_fail_expected.cpp COMPILE_ONLY WILL_FAIL)

bcm_test(NAME concept_check_test_where SOURCES ${CMAKE_WORKSPACE_SOURCE}/../where.cpp)
bcm_test(NAME concept_check_test_where_fail SOURCES ${CMAKE_WORKSPACE_SOURCE}/../where_fail.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME concept_check_test_usage_fail SOURCES ${CMAKE_WORKSPACE_SOURCE}/../usage_fail.cpp COMPILE_ONLY WILL_FAIL)

bcm_test(NAME concept_check_test_old_concept_pass SOURCES ${CMAKE_WORKSPACE_SOURCE}/../old_concept_pass.cpp)
bcm_test(NAME concept_check_test_function_requires_fail SOURCES ${CMAKE_WORKSPACE_SOURCE}/../function_requires_fail.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME concept_check_test_old_concept_function_fail SOURCES ${CMAKE_WORKSPACE_SOURCE}/../old_concept_function_fail.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME concept_check_test_old_concept_class_fail SOURCES ${CMAKE_WORKSPACE_SOURCE}/../old_concept_class_fail.cpp COMPILE_ONLY WILL_FAIL)


