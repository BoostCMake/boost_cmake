include(BCMTest)

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

# Cmake for building the GIL test app

cm_test(NAME gil_test_image SOURCES image.cpp sample_image.cpp error_if.cpp)
target_compile_definitions(gil_test_image PUBLIC BOOST_GIL_NO_IO _SCL_SECURE_NO_WARNINGS)
target_compile_options(gil_test_image PUBLIC -Wno-c++11-narrowing)
cm_test(NAME gil_test_channel SOURCES channel.cpp error_if.cpp)
target_compile_definitions(gil_test_channel PUBLIC BOOST_GIL_NO_IO _SCL_SECURE_NO_WARNINGS)
target_compile_options(gil_test_channel PUBLIC -Wno-c++11-narrowing)
cm_test(NAME gil_test_pixel SOURCES pixel.cpp error_if.cpp)
target_compile_definitions(gil_test_pixel PUBLIC BOOST_GIL_NO_IO _SCL_SECURE_NO_WARNINGS)
target_compile_options(gil_test_pixel PUBLIC -Wno-c++11-narrowing)
cm_test(NAME gil_test_pixel_iterator SOURCES pixel_iterator.cpp error_if.cpp)
target_compile_definitions(gil_test_pixel_iterator PUBLIC BOOST_GIL_NO_IO _SCL_SECURE_NO_WARNINGS)
target_compile_options(gil_test_pixel_iterator PUBLIC -Wno-c++11-narrowing)
cm_test(NAME gil_test_image_io SOURCES image_io.cpp error_if.cpp)
target_compile_definitions(gil_test_image_io PUBLIC BOOST_GIL_NO_IO _SCL_SECURE_NO_WARNINGS)
target_compile_options(gil_test_image_io PUBLIC -Wno-c++11-narrowing)