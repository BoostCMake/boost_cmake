include(CMTest)

find_package(${CMAKE_WORKSPACE_NAME}_container)
find_package(${CMAKE_WORKSPACE_NAME}_type_traits)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_intrusive
                        ${CMAKE_WORKSPACE_NAME}::container
                        ${CMAKE_WORKSPACE_NAME}::type_traits
                        )

# Boost Intrusive Library Test Jamfile
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

file(GLOB TEST_FILES ${CURRENT_TEST_SOURCES_DIR}/*.cpp)
foreach(FILEB ${TEST_FILES})
    get_filename_component(NAME ${FILEB} NAME_WE)
    cm_test(NAME intrusive_test_${NAME} SOURCES ${FILEB})
endforeach()
