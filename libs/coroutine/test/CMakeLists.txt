include(CMTest)

patch_directory(${CURRENT_TEST_SOURCES_DIR} ${CMAKE_CURRENT_SOURCE_DIR}/files ${CMAKE_CURRENT_BINARY_DIR})

find_package(${CMAKE_WORKSPACE_NAME}_tuple)
find_package(${CMAKE_WORKSPACE_NAME}_bind)
find_package(${CMAKE_WORKSPACE_NAME}_foreach)
find_package(${CMAKE_WORKSPACE_NAME}_test)
find_package(${CMAKE_WORKSPACE_NAME}_lexical_cast)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_coroutine
                        ${CMAKE_WORKSPACE_NAME}::tuple
                        ${CMAKE_WORKSPACE_NAME}::bind
                        ${CMAKE_WORKSPACE_NAME}::foreach
                        ${CMAKE_WORKSPACE_NAME}::test
                        ${CMAKE_WORKSPACE_NAME}::lexical_cast
                        )

# Boost.Coroutine Library Tests Jamfile

#          Copyright Oliver Kowalke 2009.
# Distributed under the Boost Software License, Version 1.0.
#    (See accompanying file LICENSE_1_0.txt or copy at
#          http://www.boost.org/LICENSE_1_0.txt)

cm_test(NAME coroutine_test_test_asymmetric_coroutine SOURCES ${CMAKE_CURRENT_BINARY_DIR}/test_asymmetric_coroutine.cpp)
cm_test(NAME coroutine_test_test_symmetric_coroutine SOURCES ${CMAKE_CURRENT_BINARY_DIR}/test_symmetric_coroutine.cpp)
