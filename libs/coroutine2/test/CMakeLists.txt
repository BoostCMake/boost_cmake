include(CMTest)

patch_directory(${CURRENT_TEST_SOURCES_DIR} ${CMAKE_CURRENT_SOURCE_DIR}/files ${CMAKE_CURRENT_BINARY_DIR})

find_package(${CMAKE_WORKSPACE_NAME}_assert)
find_package(${CMAKE_WORKSPACE_NAME}_context)
find_package(${CMAKE_WORKSPACE_NAME}_test)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_coroutine2
                        ${CMAKE_WORKSPACE_NAME}::assert
                        ${CMAKE_WORKSPACE_NAME}::context
                        ${CMAKE_WORKSPACE_NAME}::test
                        )

#if (NOT (CMAKE_CXX_COMPILER_ID STREQUAL "Clang"))
# TODO: fix test. boost-1.61.9
#cm_test(NAME coroutine2_test_test_coroutine SOURCES ${CMAKE_CURRENT_BINARY_DIR}/test_coroutine.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
#target_compile_options(coroutine2_test_test_coroutine PRIVATE -std=c++11)
#target_compile_definitions(coroutine2_test_test_coroutine PRIVATE -DBOOST_USE_SEGMENTED_STACKS)
#endif()
