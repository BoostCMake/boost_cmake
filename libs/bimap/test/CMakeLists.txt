include(CMTest)

find_package(${CMAKE_WORKSPACE_NAME}_range)
find_package(${CMAKE_WORKSPACE_NAME}_test)
find_package(${CMAKE_WORKSPACE_NAME}_assign)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_bimap
                        ${CMAKE_WORKSPACE_NAME}::range
                        ${CMAKE_WORKSPACE_NAME}::test
                        ${CMAKE_WORKSPACE_NAME}::assign
                        )

# Boost.Bimap
#
# Copyright (c) 2006-2007 Matias Capeletto
#
# Distributed under the Boost Software License, Version 1.0.
# (See accompanying file LICENSE_1_0.txt or copy at
# http://www.boost.org/LICENSE_1_0.txt)

configure_file(${CURRENT_TEST_SOURCES_DIR}/test_bimap.hpp ${CMAKE_CURRENT_BINARY_DIR}/include/libs/bimap/test/test_bimap.hpp @ONLY)

find_package(${CMAKE_WORKSPACE_NAME}_xpressive)

#test-suite "tagged_test"
cm_test(NAME bimap_test_test_tagged SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_tagged.cpp)

#test-suite "relation_test"
cm_test(NAME bimap_test_test_structured_pair SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_structured_pair.cpp)
cm_test(NAME bimap_test_test_mutant SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_mutant.cpp)
cm_test(NAME bimap_test_test_mutant_relation SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_mutant_relation.cpp)

#test-suite "bimap_test"
cm_test(NAME bimap_test_test_bimap_set_of SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_bimap_set_of.cpp)
cm_test(NAME bimap_test_test_bimap_multiset_of SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_bimap_multiset_of.cpp)
cm_test(NAME bimap_test_test_bimap_unordered_set_of SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_bimap_unordered_set_of.cpp)
cm_test(NAME bimap_test_test_bimap_unordered_multiset_of SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_bimap_unordered_multiset_of.cpp)
cm_test(NAME bimap_test_test_bimap_list_of SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_bimap_list_of.cpp)
cm_test(NAME bimap_test_test_bimap_vector_of SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_bimap_vector_of.cpp)

cm_test(NAME bimap_test_test_bimap_ordered SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_bimap_ordered.cpp)
cm_test(NAME bimap_test_test_bimap_unordered SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_bimap_unordered.cpp)
cm_test(NAME bimap_test_test_bimap_sequenced SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_bimap_sequenced.cpp)
foreach(TARGET bimap_test_test_bimap_ordered bimap_test_test_bimap_unordered bimap_test_test_bimap_sequenced)
    target_include_directories(${TARGET} PUBLIC ${CMAKE_CURRENT_BINARY_DIR}/include)
endforeach()
cm_test(NAME bimap_test_test_bimap_unconstrained SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_bimap_unconstrained.cpp)
cm_test(NAME bimap_test_test_bimap_assign SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_bimap_assign.cpp)
cm_test(NAME bimap_test_test_bimap_property_map SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_bimap_property_map.cpp)
cm_test(NAME bimap_test_test_bimap_modify SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_bimap_modify.cpp)
cm_test(NAME bimap_test_test_bimap_range SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_bimap_range.cpp)
cm_test(NAME bimap_test_test_bimap_operator_bracket SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_bimap_operator_bracket.cpp)
cm_test(NAME bimap_test_test_bimap_lambda SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_bimap_lambda.cpp)
cm_test(NAME bimap_test_test_bimap_mutable SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_bimap_mutable.cpp)
cm_test(NAME bimap_test_test_bimap_extra SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_bimap_extra.cpp)
cm_test(NAME bimap_test_test_bimap_convenience_header SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_bimap_convenience_header.cpp)
cm_test(NAME bimap_test_test_bimap_project SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_bimap_project.cpp)
cm_test(NAME bimap_test_test_bimap_serialization SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_bimap_serialization.cpp)
cm_test(NAME bimap_test_test_bimap_info SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_bimap_info.cpp)

#test-suite "compile_fail_test"
cm_test(NAME bimap_test_compile_fail_test_bimap_mutable_1 SOURCES ${CURRENT_TEST_SOURCES_DIR}/compile_fail/test_bimap_mutable_1.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME bimap_test_compile_fail_test_bimap_mutable_2 SOURCES ${CURRENT_TEST_SOURCES_DIR}/compile_fail/test_bimap_mutable_2.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME bimap_test_compile_fail_test_bimap_mutable_3 SOURCES ${CURRENT_TEST_SOURCES_DIR}/compile_fail/test_bimap_mutable_3.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME bimap_test_compile_fail_test_bimap_info_1 SOURCES ${CURRENT_TEST_SOURCES_DIR}/compile_fail/test_bimap_info_1.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME bimap_test_compile_fail_test_bimap_info_2 SOURCES ${CURRENT_TEST_SOURCES_DIR}/compile_fail/test_bimap_info_2.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME bimap_test_compile_fail_test_bimap_info_3 SOURCES ${CURRENT_TEST_SOURCES_DIR}/compile_fail/test_bimap_info_3.cpp COMPILE_ONLY WILL_FAIL)

#test-suite "bimap_and_boost"
cm_test(NAME bimap_test_example_bimap_and_${CMAKE_WORKSPACE_NAME}_property_map SOURCES ${CURRENT_TEST_SOURCES_DIR}/../example/bimap_and_boost/property_map.cpp)
cm_test(NAME bimap_test_example_bimap_and_${CMAKE_WORKSPACE_NAME}_range SOURCES ${CURRENT_TEST_SOURCES_DIR}/../example/bimap_and_boost/range.cpp)
cm_test(NAME bimap_test_example_bimap_and_${CMAKE_WORKSPACE_NAME}_foreach SOURCES ${CURRENT_TEST_SOURCES_DIR}/../example/bimap_and_boost/foreach.cpp)
cm_test(NAME bimap_test_example_bimap_and_${CMAKE_WORKSPACE_NAME}_lambda SOURCES ${CURRENT_TEST_SOURCES_DIR}/../example/bimap_and_boost/lambda.cpp)
cm_test(NAME bimap_test_example_bimap_and_${CMAKE_WORKSPACE_NAME}_assign SOURCES ${CURRENT_TEST_SOURCES_DIR}/../example/bimap_and_boost/assign.cpp)
if(${CMAKE_WORKSPACE_NAME}_xpressive_FOUND)
    cm_test(NAME bimap_test_example_bimap_and_${CMAKE_WORKSPACE_NAME}_xpressive SOURCES ${CURRENT_TEST_SOURCES_DIR}/../example/bimap_and_boost/xpressive.cpp)
    target_link_libraries(bimap_test_example_bimap_and_${CMAKE_WORKSPACE_NAME}_xpressive ${CMAKE_WORKSPACE_NAME}::xpressive)
endif()
cm_test(NAME bimap_test_example_bimap_and_${CMAKE_WORKSPACE_NAME}_typeof SOURCES ${CURRENT_TEST_SOURCES_DIR}/../example/bimap_and_boost/typeof.cpp)
cm_test(NAME bimap_test_example_bimap_and_${CMAKE_WORKSPACE_NAME}_serialization SOURCES ${CURRENT_TEST_SOURCES_DIR}/../example/bimap_and_boost/serialization.cpp COMPILE_ONLY)
