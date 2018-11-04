include(CMTest)

patch_directory(${CURRENT_TEST_SOURCES_DIR} ${CMAKE_CURRENT_SOURCE_DIR}/files ${CMAKE_CURRENT_BINARY_DIR})

find_package(${CMAKE_WORKSPACE_NAME}_variant)
find_package(${CMAKE_WORKSPACE_NAME}_test)
find_package(${CMAKE_WORKSPACE_NAME}_array)
find_package(${CMAKE_WORKSPACE_NAME}_lexical_cast)
find_package(${CMAKE_WORKSPACE_NAME}_utility)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_context
                        ${CMAKE_WORKSPACE_NAME}::variant
                        ${CMAKE_WORKSPACE_NAME}::test
                        ${CMAKE_WORKSPACE_NAME}::array
                        ${CMAKE_WORKSPACE_NAME}::lexical_cast
                        ${CMAKE_WORKSPACE_NAME}::utility
                        )

# Boost.Context Library Tests Jamfile

#          Copyright Oliver Kowalke 2009.
# Distributed under the Boost Software License, Version 1.0.
#    (See accompanying file LICENSE_1_0.txt or copy at
#          http://www.boost.org/LICENSE_1_0.txt)

cm_test(NAME context_test_test_context SOURCES ${CMAKE_CURRENT_BINARY_DIR}/test_context.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
if (NOT (CMAKE_CXX_COMPILER_ID STREQUAL "Clang"))
    cm_test(NAME context_test_test_execution_context SOURCES ${CMAKE_CURRENT_BINARY_DIR}/test_execution_context.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
endif()
