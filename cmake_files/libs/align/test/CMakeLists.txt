include(BCMTest)


bcm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_align)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)
# Copyright 2014-2015 Glen Joseph Fernandes
# (glenjofe@gmail.com)
#
# Distributed under the Boost Software License, Version 1.0.
# (http://www.boost.org/LICENSE_1_0.txt)


bcm_test(NAME align_test_align_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/align_test.cpp)
# bcm_test(NAME align_test_align_down_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/align_down_test.cpp)
# bcm_test(NAME align_test_align_up_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/align_up_test.cpp)
bcm_test(NAME align_test_aligned_alloc_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/aligned_alloc_test.cpp)
bcm_test(NAME align_test_aligned_allocator_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/aligned_allocator_test.cpp)
bcm_test(NAME align_test_aligned_allocator_adaptor_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/aligned_allocator_adaptor_test.cpp)
bcm_test(NAME align_test_aligned_delete_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/aligned_delete_test.cpp)
bcm_test(NAME align_test_alignment_of_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/alignment_of_test.cpp)
# bcm_test(NAME align_test_assume_aligned_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/assume_aligned_test.cpp)
bcm_test(NAME align_test_is_aligned_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/is_aligned_test.cpp)

