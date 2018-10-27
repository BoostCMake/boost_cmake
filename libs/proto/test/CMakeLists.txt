include(CMTest)

patch_directory(${CURRENT_TEST_SOURCES_DIR} ${CMAKE_CURRENT_SOURCE_DIR}/files ${CMAKE_CURRENT_BINARY_DIR})

find_package(${CMAKE_WORKSPACE_NAME}_assert)
find_package(${CMAKE_WORKSPACE_NAME}_smart_ptr)
find_package(${CMAKE_WORKSPACE_NAME}_test)
find_package(${CMAKE_WORKSPACE_NAME}_mpl)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_proto
                        ${CMAKE_WORKSPACE_NAME}::assert
                        ${CMAKE_WORKSPACE_NAME}::smart_ptr
                        ${CMAKE_WORKSPACE_NAME}::test
                        ${CMAKE_WORKSPACE_NAME}::mpl
                        )

# (C) Copyright 2004: Eric Niebler
# Distributed under the Boost Software License, Version 1.0.
# (See accompanying file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

#test-suite "proto"
cm_test(NAME proto_test_calculator SOURCES ${CMAKE_CURRENT_BINARY_DIR}/calculator.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME proto_test_constrained_ops SOURCES ${CMAKE_CURRENT_BINARY_DIR}/constrained_ops.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME proto_test_cpp-next_bug SOURCES ${CMAKE_CURRENT_BINARY_DIR}/cpp-next_bug.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME proto_test_deep_copy SOURCES ${CMAKE_CURRENT_BINARY_DIR}/deep_copy.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME proto_test_display_expr SOURCES ${CMAKE_CURRENT_BINARY_DIR}/display_expr.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME proto_test_deduce_domain SOURCES ${CMAKE_CURRENT_BINARY_DIR}/deduce_domain.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME proto_test_env_var SOURCES ${CMAKE_CURRENT_BINARY_DIR}/env_var.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
# TODO: fix test. error: no match for call to ‘(lambda_transform::LambdaEval) (const type, int, boost::fusion::tuple<int, int>&)’
# cm_test(NAME proto_test_examples SOURCES ${CMAKE_CURRENT_BINARY_DIR}/examples.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME proto_test_external_transforms SOURCES ${CMAKE_CURRENT_BINARY_DIR}/external_transforms.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME proto_test_lambda SOURCES ${CMAKE_CURRENT_BINARY_DIR}/lambda.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME proto_test_make_expr SOURCES ${CMAKE_CURRENT_BINARY_DIR}/make_expr.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME proto_test_matches SOURCES ${CMAKE_CURRENT_BINARY_DIR}/matches.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME proto_test_flatten SOURCES ${CMAKE_CURRENT_BINARY_DIR}/flatten.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME proto_test_switch SOURCES ${CMAKE_CURRENT_BINARY_DIR}/switch.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME proto_test_toy_spirit SOURCES ${CMAKE_CURRENT_BINARY_DIR}/toy_spirit.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME proto_test_toy_spirit2 SOURCES ${CMAKE_CURRENT_BINARY_DIR}/toy_spirit2.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME proto_test_make SOURCES ${CMAKE_CURRENT_BINARY_DIR}/make.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME proto_test_mem_ptr SOURCES ${CMAKE_CURRENT_BINARY_DIR}/mem_ptr.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME proto_test_mpl SOURCES ${CMAKE_CURRENT_BINARY_DIR}/mpl.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME proto_test_noinvoke SOURCES ${CMAKE_CURRENT_BINARY_DIR}/noinvoke.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME proto_test_pack_expansion SOURCES ${CMAKE_CURRENT_BINARY_DIR}/pack_expansion.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME proto_test_protect SOURCES ${CMAKE_CURRENT_BINARY_DIR}/protect.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME proto_test_bug2407 SOURCES ${CURRENT_TEST_SOURCES_DIR}/bug2407.cpp COMPILE_ONLY)
