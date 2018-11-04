include(CMTest)

find_package(${CMAKE_WORKSPACE_NAME}_crc)
find_package(${CMAKE_WORKSPACE_NAME}_lambda)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_gil
                        ${CMAKE_WORKSPACE_NAME}::crc
                        ${CMAKE_WORKSPACE_NAME}::lambda
                        )

# Copyright 2008 Lubomir Bourdev and Hailin Jin
#
# Distributed under the Boost Software License, Version 1.0.
# (See accompanying file LICENSE_1_0.txt or copy at
# http://www.boost.org/LICENSE_1_0.txt)

#test-suite gil
cm_test(NAME gil_test_image SOURCES ${CURRENT_TEST_SOURCES_DIR}/image.cpp ${CURRENT_TEST_SOURCES_DIR}/sample_image.cpp ${CURRENT_TEST_SOURCES_DIR}/error_if.cpp)
target_compile_definitions(gil_test_image PUBLIC BOOST_GIL_NO_IO _SCL_SECURE_NO_WARNINGS)
target_compile_options(gil_test_image PUBLIC -Wno-c++11-narrowing)
cm_test(NAME gil_test_channel SOURCES ${CURRENT_TEST_SOURCES_DIR}/channel.cpp ${CURRENT_TEST_SOURCES_DIR}/error_if.cpp)
target_compile_definitions(gil_test_channel PUBLIC BOOST_GIL_NO_IO _SCL_SECURE_NO_WARNINGS)
target_compile_options(gil_test_channel PUBLIC -Wno-c++11-narrowing)
cm_test(NAME gil_test_pixel SOURCES ${CURRENT_TEST_SOURCES_DIR}/pixel.cpp ${CURRENT_TEST_SOURCES_DIR}/error_if.cpp)
target_compile_definitions(gil_test_pixel PUBLIC BOOST_GIL_NO_IO _SCL_SECURE_NO_WARNINGS)
target_compile_options(gil_test_pixel PUBLIC -Wno-c++11-narrowing)
cm_test(NAME gil_test_pixel_iterator SOURCES ${CURRENT_TEST_SOURCES_DIR}/pixel_iterator.cpp ${CURRENT_TEST_SOURCES_DIR}/error_if.cpp)
target_compile_definitions(gil_test_pixel_iterator PUBLIC BOOST_GIL_NO_IO _SCL_SECURE_NO_WARNINGS)
target_compile_options(gil_test_pixel_iterator PUBLIC -Wno-c++11-narrowing)
cm_test(NAME gil_test_image_io SOURCES ${CURRENT_TEST_SOURCES_DIR}/image_io.cpp ${CURRENT_TEST_SOURCES_DIR}/error_if.cpp)
target_compile_definitions(gil_test_image_io PUBLIC BOOST_GIL_NO_IO _SCL_SECURE_NO_WARNINGS)
target_compile_options(gil_test_image_io PUBLIC -Wno-c++11-narrowing)