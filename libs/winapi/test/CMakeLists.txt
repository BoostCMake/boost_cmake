include(CMTest)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_winapi
        ${CMAKE_WORKSPACE_NAME}:regexp
        ${CMAKE_WORKSPACE_NAME}::test
        )

file(GLOB_RECURSE HEADERS ${CURRENT_TEST_SOURCES_DIR}/../include/boost/detail/*.hpp)
foreach(HEADER ${HEADERS})
    string(REPLACE "/" "_" NAME ${HEADER})
        
    cm_test(NAME winapi_test_compile_decl_header_${NAME} SOURCES ${CURRENT_TEST_SOURCES_DIR}/compile/decl_header.cpp COMPILE_ONLY)
    target_compile_definitions(winapi_test_compile_decl_header_${NAME} PRIVATE -DBOOST_WINAPI_TEST_HEADER=${NAME})
    cm_test(NAME winapi_test_compile_decl_header_use_winh_${NAME} SOURCES ${CURRENT_TEST_SOURCES_DIR}/compile/decl_header.cpp COMPILE_ONLY)
    target_compile_definitions(winapi_test_compile_decl_header_use_winh_${NAME} PRIVATE -DBOOST_WINAPI_TEST_HEADER=${NAME} -DBOOST_USE_WINDOWS_H)
    cm_test(NAME winapi_test_compile_windows_h_pre_${NAME} SOURCES ${CURRENT_TEST_SOURCES_DIR}/compile/windows_h_pre.cpp COMPILE_ONLY)
    target_compile_definitions(winapi_test_compile_windows_h_pre_${NAME} PRIVATE -DBOOST_WINAPI_TEST_HEADER=${NAME})
    cm_test(NAME winapi_test_compile_windows_h_post_${NAME} SOURCES ${CURRENT_TEST_SOURCES_DIR}/compile/windows_h_post.cpp COMPILE_ONLY)
    target_compile_definitions(winapi_test_compile_windows_h_post_${NAME} PRIVATE -DBOOST_WINAPI_TEST_HEADER=${NAME})
    
endforeach()
