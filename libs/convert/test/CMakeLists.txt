include(CMTest)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_convert
                        )
include(CMProperties)

cm_test(NAME convert_test_callable SOURCES ${CURRENT_TEST_SOURCES_DIR}/callable.cpp)
cm_test(NAME convert_test_fallbacks SOURCES ${CURRENT_TEST_SOURCES_DIR}/fallbacks.cpp)
cm_test(NAME convert_test_spirit_converter SOURCES ${CURRENT_TEST_SOURCES_DIR}/spirit_converter.cpp)
cm_test(NAME convert_test_stream_converter SOURCES ${CURRENT_TEST_SOURCES_DIR}/stream_converter.cpp)
cm_test(NAME convert_test_printf_converter SOURCES ${CURRENT_TEST_SOURCES_DIR}/printf_converter.cpp)
cm_test(NAME convert_test_strtol_converter SOURCES ${CURRENT_TEST_SOURCES_DIR}/strtol_converter.cpp)
cm_test(NAME convert_test_lcast_converter SOURCES ${CURRENT_TEST_SOURCES_DIR}/lcast_converter.cpp)
cm_test(NAME convert_test_encryption SOURCES ${CURRENT_TEST_SOURCES_DIR}/encryption.cpp)
cm_test(NAME convert_test_user_type SOURCES ${CURRENT_TEST_SOURCES_DIR}/user_type.cpp)
cm_test(NAME convert_test_str_to_int SOURCES ${CURRENT_TEST_SOURCES_DIR}/str_to_int.cpp)
cm_test(NAME convert_test_sfinae SOURCES ${CURRENT_TEST_SOURCES_DIR}/sfinae.cpp)
cm_test(NAME convert_test_has_member SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_member.cpp)
