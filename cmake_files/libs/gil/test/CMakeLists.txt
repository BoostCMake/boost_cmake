include(BCMTest)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)

find_package(${CMAKE_WORKSPACE_NAME}_crc)
find_package(${CMAKE_WORKSPACE_NAME}_lambda)

bcm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_gil
                        boost::crc
                        boost::lambda
                        )

# Copyright 2008 Lubomir Bourdev and Hailin Jin
#
# Distributed under the Boost Software License, Version 1.0.
# (See accompanying file LICENSE_1_0.txt or copy at
# http://www.boost.org/LICENSE_1_0.txt)

# Cmake for building the GIL test app

bcm_test(NAME gil_test_image SOURCES ${CMAKE_WORKSPACE_SOURCE}/image.cpp ${CMAKE_WORKSPACE_SOURCE}/sample_image.cpp ${CMAKE_WORKSPACE_SOURCE}/error_if.cpp)
target_compile_definitions(gil_test_image PUBLIC BOOST_GIL_NO_IO _SCL_SECURE_NO_WARNINGS)
target_compile_options(gil_test_image PUBLIC -Wno-c++11-narrowing)
bcm_test(NAME gil_test_channel SOURCES ${CMAKE_WORKSPACE_SOURCE}/channel.cpp ${CMAKE_WORKSPACE_SOURCE}/error_if.cpp)
target_compile_definitions(gil_test_channel PUBLIC BOOST_GIL_NO_IO _SCL_SECURE_NO_WARNINGS)
target_compile_options(gil_test_channel PUBLIC -Wno-c++11-narrowing)
bcm_test(NAME gil_test_pixel SOURCES ${CMAKE_WORKSPACE_SOURCE}/pixel.cpp ${CMAKE_WORKSPACE_SOURCE}/error_if.cpp)
target_compile_definitions(gil_test_pixel PUBLIC BOOST_GIL_NO_IO _SCL_SECURE_NO_WARNINGS)
target_compile_options(gil_test_pixel PUBLIC -Wno-c++11-narrowing)
bcm_test(NAME gil_test_pixel_iterator SOURCES ${CMAKE_WORKSPACE_SOURCE}/pixel_iterator.cpp ${CMAKE_WORKSPACE_SOURCE}/error_if.cpp)
target_compile_definitions(gil_test_pixel_iterator PUBLIC BOOST_GIL_NO_IO _SCL_SECURE_NO_WARNINGS)
target_compile_options(gil_test_pixel_iterator PUBLIC -Wno-c++11-narrowing)
bcm_test(NAME gil_test_image_io SOURCES ${CMAKE_WORKSPACE_SOURCE}/image_io.cpp ${CMAKE_WORKSPACE_SOURCE}/error_if.cpp)
target_compile_definitions(gil_test_image_io PUBLIC BOOST_GIL_NO_IO _SCL_SECURE_NO_WARNINGS)
target_compile_options(gil_test_image_io PUBLIC -Wno-c++11-narrowing)