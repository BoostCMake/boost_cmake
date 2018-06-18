include(BCMTest)


cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_predef)

include(BCMProperties)

cm_test(NAME predef_test_info_as_cpp SOURCES info_as_cpp.cpp)
cm_test(NAME predef_test_info_as_c SOURCES info_as_c.c)
if(APPLE)
    cm_test(NAME predef_test_info_as_objcpp SOURCES info_as_objcpp.mm)
    set_source_files_properties(predef_test_info_as_objcpp.mm PROPERTIES COMPILE_FLAGS "-x objective-c++")
    cm_test(NAME predef_test_info_as_objc SOURCES info_as_objc.m)
    set_source_files_properties(predef_test_info_as_objc.m PROPERTIES COMPILE_FLAGS "-x objective-c")
endif()
cm_test(NAME predef_test_version SOURCES version.cpp)
cm_test(NAME predef_test_make SOURCES make.cpp)
if(APPLE)
    cm_test(NAME predef_test_macos_endian SOURCES macos_endian.c COMPILE_ONLY)
    cm_test(NAME predef_test_macos_vs_bsd SOURCES macos_vs_bsd.c COMPILE_ONLY)
endif()
if(NOT CMAKE_SYSTEM_NAME MATCHES "Linux")
    if(CMAKE_CXX_COMPILER_ID MATCHES "Clang")
        # cm_test(NAME predef_test_check_value SOURCES check_value.cpp)
    endif()
endif()

