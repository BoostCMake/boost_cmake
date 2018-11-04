include(CMTest)

find_package(${CMAKE_WORKSPACE_NAME}_static_assert)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_typeof
                        ${CMAKE_WORKSPACE_NAME}::static_assert
                        )

# Copyright (C) 2006 Vladimir Prus
# Copyright (C) 2006 Arkadiy Vertleyb
# Use, modification and distribution is subject to the Boost Software
# License, Version 1.0. (http://www.boost.org/LICENSE_1_0.txt)

# Boost Typeof Library test Jamfile


file(GLOB test_sources RELATIVE "${CMAKE_CURRENT_SOURCE_DIR}" ${CURRENT_TEST_SOURCES_DIR}/*_test*.cpp)
FOREACH(item ${test_sources})
    IF(${item} MATCHES "odr*.cpp")
        LIST(REMOVE_ITEM test_sources ${item})
    ENDIF(${item} MATCHES "odr*.cpp")
ENDFOREACH(item)

foreach(source IN LISTS test_sources)
    string(REPLACE ".cpp" "" name "${source}")

    cm_test(typeof_test_${name}_native SOURCES ${source} COMPILE_ONLY)
    target_compile_definitions(typeof_test_${name}_native PUBLIC -DBOOST_TYPEOF_NATIVE)

    cm_test(typeof_test_${name}__emulation SOURCES ${source} COMPILE_ONLY)
    target_compile_definitions(typeof_test_${name}_emulation PUBLIC -DBOOST_TYPEOF_EMULATION)
endforeach()

cm_test(NAME typeof_test_odr_native SOURCES ${CURRENT_TEST_SOURCES_DIR}/odr1.cpp)
target_compile_definitions(typeof_test_odr_native PUBLIC -DBOOST_TYPEOF_NATIVE)
cm_test(NAME typeof_test_odr_emulation SOURCES ${CURRENT_TEST_SOURCES_DIR}/odr1.cpp)
target_compile_definitions(typeof_test_odr_emulation PUBLIC BOOST_TYPEOF_EMULATION)
cm_test(NAME typeof_test_odr_no_uns SOURCES ${CURRENT_TEST_SOURCES_DIR}/odr_no_uns1.cpp)
target_compile_definitions(typeof_test_odr_no_uns PUBLIC -DBOOST_TYPEOF_EMULATION)


