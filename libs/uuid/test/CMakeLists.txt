include(CMTest)

find_package(${CMAKE_WORKSPACE_NAME}_functional)
find_package(${CMAKE_WORKSPACE_NAME}_test)
find_package(${CMAKE_WORKSPACE_NAME}_lexical_cast)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_uuid
                        ${CMAKE_WORKSPACE_NAME}::functional
                        ${CMAKE_WORKSPACE_NAME}::test
                        ${CMAKE_WORKSPACE_NAME}::lexical_cast
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

# test sha1 hash function

# test MSVC 12 (VS2013) optimizer bug with SIMD operations. See https://svn.boost.org/trac/boost/ticket/8509#comment:3.
# Only happens in Release x64 builds.

#test-suite uuid
cm_test(NAME uuid_test_compile_uuid SOURCES ${CURRENT_TEST_SOURCES_DIR}/compile_uuid.cpp COMPILE_ONLY)
cm_test(NAME uuid_test_compile_uuid_no_type_traits SOURCES ${CURRENT_TEST_SOURCES_DIR}/compile_uuid.cpp COMPILE_ONLY)
target_compile_definitions(uuid_test_compile_uuid_no_type_traits  PUBLIC BOOST_UUID_NO_TYPE_TRAITS)
cm_test(NAME uuid_test_test_compile_uuid_io SOURCES ${CURRENT_TEST_SOURCES_DIR}/compile_uuid_io.cpp COMPILE_ONLY)
cm_test(NAME uuid_test_compile_uuid_serialize SOURCES ${CURRENT_TEST_SOURCES_DIR}/compile_uuid_serialize.cpp COMPILE_ONLY)
cm_test(NAME uuid_test_compile_uuid_generators SOURCES ${CURRENT_TEST_SOURCES_DIR}/compile_uuid_generators.cpp COMPILE_ONLY)
cm_test(NAME uuid_test_compile_nil_generator SOURCES ${CURRENT_TEST_SOURCES_DIR}/compile_nil_generator.cpp COMPILE_ONLY)
cm_test(NAME uuid_test_compile_name_generator SOURCES ${CURRENT_TEST_SOURCES_DIR}/compile_name_generator.cpp COMPILE_ONLY)
cm_test(NAME uuid_test_compile_string_generator SOURCES ${CURRENT_TEST_SOURCES_DIR}/compile_string_generator.cpp COMPILE_ONLY)
cm_test(NAME uuid_test_compile_random_generator SOURCES ${CURRENT_TEST_SOURCES_DIR}/compile_random_generator.cpp COMPILE_ONLY)
cm_test(NAME uuid_test_compile_seed_rng SOURCES ${CURRENT_TEST_SOURCES_DIR}/compile_seed_rng.cpp COMPILE_ONLY)

cm_test(NAME uuid_test_test_include1 SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_include1.cpp ${CURRENT_TEST_SOURCES_DIR}/test_include2.cpp)

cm_test(NAME uuid_test_test_test_uuid SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_uuid.cpp)
cm_test(NAME uuid_test_test_test_uuid_no_simd SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_uuid_no_simd.cpp)

cm_test(NAME uuid_test_test_test_io SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_io.cpp)

cm_test(NAME uuid_test_test_test_nil_generator SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_nil_generator.cpp)
cm_test(NAME uuid_test_test_name_generator SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_name_generator.cpp)
cm_test(NAME uuid_test_test_string_generator SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_string_generator.cpp)
cm_test(NAME uuid_test_test_random_generator SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_random_generator.cpp)

cm_test(NAME uuid_test_test_tagging SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_tagging.cpp)

cm_test(NAME uuid_test_test_uuid_class SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_uuid_class.cpp)
cm_test(NAME uuid_test_test_uuid_in_map SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_uuid_in_map.cpp)

cm_test(NAME uuid_test_test_serialization SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_serialization.cpp)

cm_test(NAME uuid_test_test_sha1 SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_sha1.cpp)

if(MSVC)
    cm_test(NAME uuid_test_test_msvc_simd_bug981648_main SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_msvc_simd_bug981648_main.cpp ${CURRENT_TEST_SOURCES_DIR}/test_msvc_simd_bug981648_foo.cpp)
endif()
