include(CMTest)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_align)

# Copyright 2014-2015 Glen Joseph Fernandes
# (glenjofe@gmail.com)
#
# Distributed under the Boost Software License, Version 1.0.
# (http://www.boost.org/LICENSE_1_0.txt)

cm_test(NAME align_test_align_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/align_test.cpp)
cm_test(NAME align_test_aligned_alloc_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/aligned_alloc_test.cpp)
cm_test(NAME align_test_aligned_allocator_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/aligned_allocator_test.cpp)
cm_test(NAME align_test_aligned_allocator_adaptor_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/aligned_allocator_adaptor_test.cpp)
cm_test(NAME align_test_aligned_delete_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/aligned_delete_test.cpp)
cm_test(NAME align_test_alignment_of_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/alignment_of_test.cpp)
cm_test(NAME align_test_assume_aligned_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/assume_aligned_test.cpp)
cm_test(NAME align_test_is_aligned_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/is_aligned_test.cpp)
