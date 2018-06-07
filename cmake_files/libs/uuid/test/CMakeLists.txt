include(BCMTest)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)

find_package(${CMAKE_WORKSPACE_NAME}_functional)
find_package(${CMAKE_WORKSPACE_NAME}_test)
find_package(${CMAKE_WORKSPACE_NAME}_lexical_cast)

bcm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_uuid
                        boost::functional
                        boost::test
                        boost::lexical_cast
                        )

# Copyright 2007 Andy Tompkins.
# Distributed under the Boost Software License, Version 1.0. (See
# accompanying file LICENSE_1_0.txt or copy at
# http://www.boost.org/LICENSE_1_0.txt)


# make sure each header file is self-contained

# test inclucing all .hpp files in 2 translations units
# to look for issues when using multiple translation units
# eg. missing inline on a global functionstate is not missing

# main test

# test uuid_io.hpp

# test generators

# test tagging an object

# test use cases

# test serializing uuids
# TODO - This test fails to like with ${CMAKE_WORKSPACE_NAME}_wserialization
#[ run test_wserialization.cpp
#    ../../serialization/build//${CMAKE_WORKSPACE_NAME}_serialization
#    ../../serialization/build//${CMAKE_WORKSPACE_NAME}_wserialization
#    : : : <dependency>../../config/test/all//BOOST_NO_STD_WSTREAMBUF
#]

# test sha1 hash function

# test MSVC 12 (VS2013) optimizer bug with SIMD operations. See https://svn.boost.org/trac/boost/ticket/8509#comment:3.
# Only happens in Release x64 builds.
bcm_test(NAME uuid_test_compile_uuid SOURCES ${CMAKE_WORKSPACE_SOURCE}/compile_uuid.cpp COMPILE_ONLY)
bcm_test(NAME uuid_test_compile_uuid_no_type_traits SOURCES ${CMAKE_WORKSPACE_SOURCE}/compile_uuid.cpp COMPILE_ONLY)
target_compile_definitions(uuid_test_compile_uuid_no_type_traits  PUBLIC BOOST_UUID_NO_TYPE_TRAITS)
bcm_test(NAME uuid_test_test_compile_uuid_io SOURCES ${CMAKE_WORKSPACE_SOURCE}/compile_uuid_io.cpp COMPILE_ONLY)
bcm_test(NAME uuid_test_compile_uuid_serialize SOURCES ${CMAKE_WORKSPACE_SOURCE}/compile_uuid_serialize.cpp COMPILE_ONLY)
bcm_test(NAME uuid_test_compile_uuid_generators SOURCES ${CMAKE_WORKSPACE_SOURCE}/compile_uuid_generators.cpp COMPILE_ONLY)
bcm_test(NAME uuid_test_compile_nil_generator SOURCES ${CMAKE_WORKSPACE_SOURCE}/compile_nil_generator.cpp COMPILE_ONLY)
bcm_test(NAME uuid_test_compile_name_generator SOURCES ${CMAKE_WORKSPACE_SOURCE}/compile_name_generator.cpp COMPILE_ONLY)
bcm_test(NAME uuid_test_compile_string_generator SOURCES ${CMAKE_WORKSPACE_SOURCE}/compile_string_generator.cpp COMPILE_ONLY)
bcm_test(NAME uuid_test_compile_random_generator SOURCES ${CMAKE_WORKSPACE_SOURCE}/compile_random_generator.cpp COMPILE_ONLY)
bcm_test(NAME uuid_test_compile_seed_rng SOURCES ${CMAKE_WORKSPACE_SOURCE}/compile_seed_rng.cpp COMPILE_ONLY)
bcm_test(NAME uuid_test_test_include1 SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_include1.cpp ${CMAKE_WORKSPACE_SOURCE}/test_include2.cpp)
bcm_test(NAME uuid_test_test_test_uuid SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_uuid.cpp)
bcm_test(NAME uuid_test_test_test_uuid_no_simd SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_uuid_no_simd.cpp)
bcm_test(NAME uuid_test_test_test_io SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_io.cpp)
bcm_test(NAME uuid_test_test_test_nil_generator SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_nil_generator.cpp)
bcm_test(NAME uuid_test_test_name_generator SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_name_generator.cpp)
bcm_test(NAME uuid_test_test_string_generator SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_string_generator.cpp)
bcm_test(NAME uuid_test_test_random_generator SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_random_generator.cpp)
bcm_test(NAME uuid_test_test_tagging SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_tagging.cpp)
bcm_test(NAME uuid_test_test_uuid_class SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_uuid_class.cpp)
bcm_test(NAME uuid_test_test_uuid_in_map SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_uuid_in_map.cpp)
bcm_test(NAME uuid_test_test_serialization SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_serialization.cpp)
bcm_test(NAME uuid_test_test_sha1 SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_sha1.cpp)
# bcm_test(NAME uuid_test_test_msvc_simd_bug981648 SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_msvc_simd_bug981648_main.cpp)

