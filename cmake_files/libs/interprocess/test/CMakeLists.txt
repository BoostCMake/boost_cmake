include(BCMTest)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)

find_package(${CMAKE_WORKSPACE_NAME}_functional)
find_package(${CMAKE_WORKSPACE_NAME}_multi_index)
find_package(${CMAKE_WORKSPACE_NAME}_timer)

bcm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_interprocess
                        boost::functional
                        boost::multi_index
                        boost::timer
                        )

# Boost Interprocess Library Test Jamfile

#  (C) Copyright Ion Gaztanaga 2006.
# Use, modification and distribution are subject to the
# Boost Software License, Version 1.0. (See accompanying file
# LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

# Adapted from John Maddock's TR1 Jamfile.v2
# Copyright John Maddock 2005.
# Use, modification and distribution are subject to the
# Boost Software License, Version 1.0. (See accompanying file
# LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

# this rule enumerates through all the sources and invokes
# the run rule for each source, the result is a list of all
# the run rules, which we can pass on to the test_suite rule:

file(GLOB TEST_FILES *.cpp)
foreach(FILEB ${TEST_FILES})
    get_filename_component(NAME ${FILEB} NAME_WE)
    bcm_test(NAME interprocess_test_${NAME} SOURCES ${FILEB})
endforeach()

