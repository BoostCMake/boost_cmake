include(CMTest)

find_package(${CMAKE_WORKSPACE_NAME}_timer)
find_package(${CMAKE_WORKSPACE_NAME}_preprocessor)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_program_options
                        ${CMAKE_WORKSPACE_NAME}::timer
                        ${CMAKE_WORKSPACE_NAME}::preprocessor
                        )

#test-suite program_options
cm_test(NAME program_options_test_options_description_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/options_description_test.cpp)
cm_test(NAME program_options_test_parsers_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/parsers_test.cpp ARGS ${CMAKE_CURRENT_SOURCE_DIR}/config_test.cfg)
cm_test(NAME program_options_test_variable_map_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/variable_map_test.cpp)
cm_test(NAME program_options_test_cmdline_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/cmdline_test.cpp)
cm_test(NAME program_options_test_positional_options_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/positional_options_test.cpp)
cm_test(NAME program_options_test_unicode_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/unicode_test.cpp)
cm_test(NAME program_options_test_winmain SOURCES ${CURRENT_TEST_SOURCES_DIR}/winmain.cpp)
cm_test(NAME program_options_test_exception_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/exception_test.cpp)
cm_test(NAME program_options_test_split_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/split_test.cpp)
cm_test(NAME program_options_test_unrecognized_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/unrecognized_test.cpp)
cm_test(NAME program_options_test_required_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/required_test.cpp ARGS ${CMAKE_CURRENT_SOURCE_DIR}/required_test.cfg)
cm_test(NAME program_options_test_exception_txt_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/exception_txt_test.cpp)
cm_test(NAME program_options_test_options_description_no_rtti_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/options_description_test.cpp)
set_target_properties(program_options_test_options_description_no_rtti_test PROPERTIES CXX_RTTI Off)
target_compile_definitions(program_options_test_options_description_no_rtti_test PUBLIC BOOST_NO_RTTI BOOST_NO_TYPEID)
