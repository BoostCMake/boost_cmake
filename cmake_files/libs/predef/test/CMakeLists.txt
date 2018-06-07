include(BCMTest)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)


bcm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_predef)

include(BCMProperties)

bcm_test(NAME predef_test_info_as_cpp SOURCES ${CMAKE_WORKSPACE_SOURCE}/info_as_cpp.cpp)
bcm_test(NAME predef_test_info_as_c SOURCES ${CMAKE_WORKSPACE_SOURCE}/info_as_c.c)
if(APPLE)
    bcm_test(NAME predef_test_info_as_objcpp SOURCES ${CMAKE_WORKSPACE_SOURCE}/info_as_objcpp.mm)
    set_source_files_properties(predef_test_info_as_objcpp.mm PROPERTIES COMPILE_FLAGS "-x objective-c++")
    bcm_test(NAME predef_test_info_as_objc SOURCES ${CMAKE_WORKSPACE_SOURCE}/info_as_objc.m)
    set_source_files_properties(predef_test_info_as_objc.m PROPERTIES COMPILE_FLAGS "-x objective-c")
endif()
bcm_test(NAME predef_test_version SOURCES ${CMAKE_WORKSPACE_SOURCE}/version.cpp)
bcm_test(NAME predef_test_make SOURCES ${CMAKE_WORKSPACE_SOURCE}/make.cpp)
if(APPLE)
    bcm_test(NAME predef_test_macos_endian SOURCES ${CMAKE_WORKSPACE_SOURCE}/macos_endian.c COMPILE_ONLY)
    bcm_test(NAME predef_test_macos_vs_bsd SOURCES ${CMAKE_WORKSPACE_SOURCE}/macos_vs_bsd.c COMPILE_ONLY)
endif()
if(NOT CMAKE_SYSTEM_NAME MATCHES "Linux")
    if(CMAKE_CXX_COMPILER_ID MATCHES "Clang")
        # bcm_test(NAME predef_test_check_value SOURCES ${CMAKE_WORKSPACE_SOURCE}/check_value.cpp)
    endif()
endif()

