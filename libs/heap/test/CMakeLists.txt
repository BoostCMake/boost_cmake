include(CMTest)

find_package(${CMAKE_WORKSPACE_NAME}_random)
find_package(${CMAKE_WORKSPACE_NAME}_smart_ptr)
find_package(${CMAKE_WORKSPACE_NAME}_test)
find_package(${CMAKE_WORKSPACE_NAME}_foreach)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_heap
                        ${CMAKE_WORKSPACE_NAME}::random
                        ${CMAKE_WORKSPACE_NAME}::smart_ptr
                        ${CMAKE_WORKSPACE_NAME}::test
                        ${CMAKE_WORKSPACE_NAME}::foreach
                        )

# (C) Copyright 2010: Tim Blechmann
# Distributed under the Boost Software License, Version 1.0.
# (See accompanying file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

file(GLOB TEST_FILES *.cpp)
foreach(FILEB ${TEST_FILES})
    get_filename_component(NAME ${FILEB} NAME_WE)
    cm_test(NAME heap_test_${NAME} SOURCES ${FILEB})
endforeach()
