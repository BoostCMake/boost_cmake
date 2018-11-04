include(CMTest)

find_package(${CMAKE_WORKSPACE_NAME}_thread)
find_package(${CMAKE_WORKSPACE_NAME}_interprocess)
find_package(${CMAKE_WORKSPACE_NAME}_smart_ptr)
find_package(${CMAKE_WORKSPACE_NAME}_test)
find_package(${CMAKE_WORKSPACE_NAME}_foreach)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_lockfree
                        ${CMAKE_WORKSPACE_NAME}::thread
                        ${CMAKE_WORKSPACE_NAME}::interprocess
                        ${CMAKE_WORKSPACE_NAME}::smart_ptr
                        ${CMAKE_WORKSPACE_NAME}::test
                        ${CMAKE_WORKSPACE_NAME}::foreach
                        )

# (C) Copyright 2010: Tim Blechmann
# Distributed under the Boost Software License, Version 1.0.
# (See accompanying file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

file(GLOB TEST_FILES ${CURRENT_TEST_SOURCES_DIR}/*.cpp)
foreach(FILEB ${TEST_FILES})
    get_filename_component(NAME ${FILEB} NAME_WE)
    cm_test(NAME lockfree_test_${NAME} SOURCES ${FILEB})
endforeach()
