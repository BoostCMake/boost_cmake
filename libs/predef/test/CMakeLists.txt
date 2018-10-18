include(CMTest)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_predef)

include(CMProperties)

cm_test(NAME predef_test_info_as_cpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/info_as_cpp.cpp)
cm_test(NAME predef_test_info_as_c SOURCES ${CURRENT_TEST_SOURCES_DIR}/info_as_c.c)

if(APPLE)
    cm_test(NAME predef_test_info_as_objcpp SOURCES ${CURRENT_TEST_SOURCES_DIR}/info_as_objcpp.mm)
    set_source_files_properties(predef_test_info_as_objcpp.mm PROPERTIES COMPILE_FLAGS "-x objective-c++")
    cm_test(NAME predef_test_info_as_objc SOURCES ${CURRENT_TEST_SOURCES_DIR}/info_as_objc.m)
    set_source_files_properties(predef_test_info_as_objc.m PROPERTIES COMPILE_FLAGS "-x objective-c")
endif()

cm_test(NAME predef_test_version SOURCES ${CURRENT_TEST_SOURCES_DIR}/version.cpp)
cm_test(NAME predef_test_make SOURCES ${CURRENT_TEST_SOURCES_DIR}/make.cpp)

if(APPLE)
    cm_test(NAME predef_test_macos_endian SOURCES ${CURRENT_TEST_SOURCES_DIR}/macos_endian.c COMPILE_ONLY)
    cm_test(NAME predef_test_macos_vs_bsd SOURCES ${CURRENT_TEST_SOURCES_DIR}/macos_vs_bsd.c COMPILE_ONLY)
endif()

if(NOT CMAKE_SYSTEM_NAME MATCHES "Linux")
    if(CMAKE_CXX_COMPILER_ID MATCHES "Clang")
        cm_test(NAME predef_test_check_value SOURCES ${CURRENT_TEST_SOURCES_DIR}/check_value.cpp)
    endif()
endif()

