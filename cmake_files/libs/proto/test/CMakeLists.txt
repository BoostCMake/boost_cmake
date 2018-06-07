include(BCMTest)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)

find_package(${CMAKE_WORKSPACE_NAME}_assert)
find_package(${CMAKE_WORKSPACE_NAME}_smart_ptr)
find_package(${CMAKE_WORKSPACE_NAME}_test)
find_package(${CMAKE_WORKSPACE_NAME}_unit_test_framework)
find_package(${CMAKE_WORKSPACE_NAME}_mpl)

bcm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_proto
                        boost::unit_test_framework
                        boost::assert
                        boost::smart_ptr
                        boost::test
                        boost::mpl
                        )

# (C) Copyright 2004: Eric Niebler
# Distributed under the Boost Software License, Version 1.0.
# (See accompanying file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

# bring in rules for testing

#        <define>BOOST_PROTO_DONT_USE_PREPROCESSED_FILES

bcm_test(NAME proto_test_calculator SOURCES ${CMAKE_WORKSPACE_SOURCE}/calculator.cpp NEED_PATCH)
bcm_test(NAME proto_test_constrained_ops SOURCES ${CMAKE_WORKSPACE_SOURCE}/constrained_ops.cpp NEED_PATCH)
bcm_test(NAME proto_test_cpp-next_bug SOURCES ${CMAKE_WORKSPACE_SOURCE}/cpp-next_bug.cpp NEED_PATCH)
bcm_test(NAME proto_test_deep_copy SOURCES ${CMAKE_WORKSPACE_SOURCE}/deep_copy.cpp NEED_PATCH)
bcm_test(NAME proto_test_display_expr SOURCES ${CMAKE_WORKSPACE_SOURCE}/display_expr.cpp NEED_PATCH)
bcm_test(NAME proto_test_deduce_domain SOURCES ${CMAKE_WORKSPACE_SOURCE}/deduce_domain.cpp NEED_PATCH)
bcm_test(NAME proto_test_env_var SOURCES ${CMAKE_WORKSPACE_SOURCE}/env_var.cpp NEED_PATCH)
# bcm_test(NAME proto_test_examples SOURCES ${CMAKE_WORKSPACE_SOURCE}/examples.cpp NEED_PATCH)
bcm_test(NAME proto_test_external_transforms SOURCES ${CMAKE_WORKSPACE_SOURCE}/external_transforms.cpp NEED_PATCH)
bcm_test(NAME proto_test_lambda SOURCES ${CMAKE_WORKSPACE_SOURCE}/lambda.cpp NEED_PATCH)
bcm_test(NAME proto_test_make_expr SOURCES ${CMAKE_WORKSPACE_SOURCE}/make_expr.cpp NEED_PATCH)
bcm_test(NAME proto_test_matches SOURCES ${CMAKE_WORKSPACE_SOURCE}/matches.cpp NEED_PATCH)
bcm_test(NAME proto_test_flatten SOURCES ${CMAKE_WORKSPACE_SOURCE}/flatten.cpp NEED_PATCH)
bcm_test(NAME proto_test_switch SOURCES ${CMAKE_WORKSPACE_SOURCE}/switch.cpp NEED_PATCH)
bcm_test(NAME proto_test_toy_spirit SOURCES ${CMAKE_WORKSPACE_SOURCE}/toy_spirit.cpp NEED_PATCH)
bcm_test(NAME proto_test_toy_spirit2 SOURCES ${CMAKE_WORKSPACE_SOURCE}/toy_spirit2.cpp NEED_PATCH)
bcm_test(NAME proto_test_make SOURCES ${CMAKE_WORKSPACE_SOURCE}/make.cpp NEED_PATCH)
bcm_test(NAME proto_test_mem_ptr SOURCES ${CMAKE_WORKSPACE_SOURCE}/mem_ptr.cpp NEED_PATCH)
bcm_test(NAME proto_test_mpl SOURCES ${CMAKE_WORKSPACE_SOURCE}/mpl.cpp NEED_PATCH)
bcm_test(NAME proto_test_noinvoke SOURCES ${CMAKE_WORKSPACE_SOURCE}/noinvoke.cpp NEED_PATCH)
bcm_test(NAME proto_test_pack_expansion SOURCES ${CMAKE_WORKSPACE_SOURCE}/pack_expansion.cpp NEED_PATCH)
bcm_test(NAME proto_test_protect SOURCES ${CMAKE_WORKSPACE_SOURCE}/protect.cpp NEED_PATCH)
bcm_test(NAME proto_test_bug2407 SOURCES ${CMAKE_WORKSPACE_SOURCE}/bug2407.cpp COMPILE_ONLY)