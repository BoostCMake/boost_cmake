include(BCMTest)

find_package(${CMAKE_WORKSPACE_NAME}_test)

bcm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_dynamic_bitset
                        boost::test
                        )

#
#              Copyright Vladimir Prus 2004
#
# Distributed under the Boost Software License, Version 1.0.
#     (See accompanying file LICENSE_1_0.txt or copy at
#           http://www.boost.org/LICENSE_1_0.txt)


bcm_test(NAME dynamic_bitset_test_dyn_bitset_unit_tests1 SOURCES ../dyn_bitset_unit_tests1.cpp)
bcm_test(NAME dynamic_bitset_test_dyn_bitset_unit_tests2 SOURCES ../dyn_bitset_unit_tests2.cpp)
#bcm_test(NAME dynamic_bitset_test_dyn_bitset_unit_tests3 SOURCES ../dyn_bitset_unit_tests3.cpp)
bcm_test(NAME dynamic_bitset_test_dyn_bitset_unit_tests4 SOURCES ../dyn_bitset_unit_tests4.cpp)
