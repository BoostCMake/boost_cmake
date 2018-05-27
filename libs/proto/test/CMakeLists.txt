include(BCMTest)

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

bcm_test(NAME proto_test_calculator SOURCES calculator.cpp)
bcm_test(NAME proto_test_constrained_ops SOURCES constrained_ops.cpp)
bcm_test(NAME proto_test_cpp-next_bug SOURCES cpp-next_bug.cpp)
bcm_test(NAME proto_test_deep_copy SOURCES deep_copy.cpp)
bcm_test(NAME proto_test_display_expr SOURCES display_expr.cpp)
bcm_test(NAME proto_test_deduce_domain SOURCES deduce_domain.cpp)
bcm_test(NAME proto_test_env_var SOURCES env_var.cpp)
# bcm_test(NAME proto_test_examples SOURCES examples.cpp)
bcm_test(NAME proto_test_external_transforms SOURCES external_transforms.cpp)
bcm_test(NAME proto_test_lambda SOURCES lambda.cpp)
bcm_test(NAME proto_test_make_expr SOURCES make_expr.cpp)
bcm_test(NAME proto_test_matches SOURCES matches.cpp)
bcm_test(NAME proto_test_flatten SOURCES flatten.cpp)
bcm_test(NAME proto_test_switch SOURCES switch.cpp)
bcm_test(NAME proto_test_toy_spirit SOURCES toy_spirit.cpp)
bcm_test(NAME proto_test_toy_spirit2 SOURCES toy_spirit2.cpp)
bcm_test(NAME proto_test_make SOURCES make.cpp)
bcm_test(NAME proto_test_mem_ptr SOURCES mem_ptr.cpp)
bcm_test(NAME proto_test_mpl SOURCES mpl.cpp)
bcm_test(NAME proto_test_noinvoke SOURCES noinvoke.cpp)
bcm_test(NAME proto_test_pack_expansion SOURCES pack_expansion.cpp)
bcm_test(NAME proto_test_protect SOURCES protect.cpp)
bcm_test(NAME proto_test_bug2407 SOURCES bug2407.cpp COMPILE_ONLY)