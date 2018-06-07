include(BCMTest)
workspace_src(${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)

find_package(${CMAKE_WORKSPACE_NAME}_range)
find_package(${CMAKE_WORKSPACE_NAME}_test)
find_package(${CMAKE_WORKSPACE_NAME}_assign)

bcm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_bimap
                        boost::range
                        boost::test
                        boost::assign
                        )

# Boost.Bimap
#
# Copyright (c) 2006-2007 Matias Capeletto
#
# Distributed under the Boost Software License, Version 1.0.
# (See accompanying file LICENSE_1_0.txt or copy at
# http://www.boost.org/LICENSE_1_0.txt)

# bring in rules for testing

# HACK: Workaround broken includes
configure_file(${CMAKE_WORKSPACE_SOURCE}/test_bimap.hpp ${CMAKE_CURRENT_BINARY_DIR}/include/libs/bimap/test/test_bimap.hpp @ONLY)

find_package(${CMAKE_WORKSPACE_NAME}_xpressive)

bcm_test(NAME bimap_test_test_tagged SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_tagged.cpp)


bcm_test(NAME bimap_test_test_structured_pair SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_structured_pair.cpp)
bcm_test(NAME bimap_test_test_mutant SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_mutant.cpp)
bcm_test(NAME bimap_test_test_mutant_relation SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_mutant_relation.cpp)


bcm_test(NAME bimap_test_test_bimap_set_of SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_bimap_set_of.cpp)
bcm_test(NAME bimap_test_test_bimap_multiset_of SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_bimap_multiset_of.cpp)
bcm_test(NAME bimap_test_test_bimap_unordered_set_of SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_bimap_unordered_set_of.cpp)
bcm_test(NAME bimap_test_test_bimap_unordered_multiset_of SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_bimap_unordered_multiset_of.cpp)
bcm_test(NAME bimap_test_test_bimap_list_of SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_bimap_list_of.cpp)
bcm_test(NAME bimap_test_test_bimap_vector_of SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_bimap_vector_of.cpp)

bcm_test(NAME bimap_test_test_bimap_ordered SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_bimap_ordered.cpp)
bcm_test(NAME bimap_test_test_bimap_unordered SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_bimap_unordered.cpp)
bcm_test(NAME bimap_test_test_bimap_sequenced SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_bimap_sequenced.cpp)
foreach(TARGET bimap_test_test_bimap_ordered bimap_test_test_bimap_unordered bimap_test_test_bimap_sequenced)
    target_include_directories(${TARGET} PUBLIC ${CMAKE_CURRENT_BINARY_DIR}/include)
endforeach()

bcm_test(NAME bimap_test_test_bimap_unconstrained SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_bimap_unconstrained.cpp)
bcm_test(NAME bimap_test_test_bimap_assign SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_bimap_assign.cpp)
bcm_test(NAME bimap_test_test_bimap_property_map SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_bimap_property_map.cpp)
bcm_test(NAME bimap_test_test_bimap_modify SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_bimap_modify.cpp)
bcm_test(NAME bimap_test_test_bimap_range SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_bimap_range.cpp)
bcm_test(NAME bimap_test_test_bimap_operator_bracket SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_bimap_operator_bracket.cpp)
bcm_test(NAME bimap_test_test_bimap_lambda SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_bimap_lambda.cpp)
bcm_test(NAME bimap_test_test_bimap_mutable SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_bimap_mutable.cpp)
bcm_test(NAME bimap_test_test_bimap_extra SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_bimap_extra.cpp)
bcm_test(NAME bimap_test_test_bimap_convenience_header SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_bimap_convenience_header.cpp)
bcm_test(NAME bimap_test_test_bimap_project SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_bimap_project.cpp)
bcm_test(NAME bimap_test_test_bimap_serialization SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_bimap_serialization.cpp)
bcm_test(NAME bimap_test_test_bimap_info SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_bimap_info.cpp)


bcm_test(NAME bimap_test_compile_fail_test_bimap_mutable_1 SOURCES ${CMAKE_WORKSPACE_SOURCE}/compile_fail/test_bimap_mutable_1.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME bimap_test_compile_fail_test_bimap_mutable_2 SOURCES ${CMAKE_WORKSPACE_SOURCE}/compile_fail/test_bimap_mutable_2.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME bimap_test_compile_fail_test_bimap_mutable_3 SOURCES ${CMAKE_WORKSPACE_SOURCE}/compile_fail/test_bimap_mutable_3.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME bimap_test_compile_fail_test_bimap_info_1 SOURCES ${CMAKE_WORKSPACE_SOURCE}/compile_fail/test_bimap_info_1.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME bimap_test_compile_fail_test_bimap_info_2 SOURCES ${CMAKE_WORKSPACE_SOURCE}/compile_fail/test_bimap_info_2.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME bimap_test_compile_fail_test_bimap_info_3 SOURCES ${CMAKE_WORKSPACE_SOURCE}/compile_fail/test_bimap_info_3.cpp COMPILE_ONLY WILL_FAIL)

bcm_test(NAME bimap_test_example_bimap_and_${CMAKE_WORKSPACE_NAME}_property_map SOURCES ${CMAKE_WORKSPACE_SOURCE}/../example/bimap_and_boost/property_map.cpp)
bcm_test(NAME bimap_test_example_bimap_and_${CMAKE_WORKSPACE_NAME}_range SOURCES ${CMAKE_WORKSPACE_SOURCE}/../example/bimap_and_boost/range.cpp)
bcm_test(NAME bimap_test_example_bimap_and_${CMAKE_WORKSPACE_NAME}_foreach SOURCES ${CMAKE_WORKSPACE_SOURCE}/../example/bimap_and_boost/foreach.cpp)
bcm_test(NAME bimap_test_example_bimap_and_${CMAKE_WORKSPACE_NAME}_lambda SOURCES ${CMAKE_WORKSPACE_SOURCE}/../example/bimap_and_boost/lambda.cpp)
bcm_test(NAME bimap_test_example_bimap_and_${CMAKE_WORKSPACE_NAME}_assign SOURCES ${CMAKE_WORKSPACE_SOURCE}/../example/bimap_and_boost/assign.cpp)
if(${CMAKE_WORKSPACE_NAME}_xpressive_FOUND)
    bcm_test(NAME bimap_test_example_bimap_and_${CMAKE_WORKSPACE_NAME}_xpressive SOURCES ${CMAKE_WORKSPACE_SOURCE}/../example/bimap_and_boost/xpressive.cpp)
    target_link_libraries(bimap_test_example_bimap_and_${CMAKE_WORKSPACE_NAME}_xpressive boost::xpressive)
endif()
bcm_test(NAME bimap_test_example_bimap_and_${CMAKE_WORKSPACE_NAME}_typeof SOURCES ${CMAKE_WORKSPACE_SOURCE}/../example/bimap_and_boost/typeof.cpp)
bcm_test(NAME bimap_test_example_bimap_and_${CMAKE_WORKSPACE_NAME}_serialization SOURCES ${CMAKE_WORKSPACE_SOURCE}/../example/bimap_and_boost/serialization.cpp COMPILE_ONLY)

