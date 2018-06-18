include(BCMTest)

find_package(${CMAKE_WORKSPACE_NAME}_timer)
find_package(${CMAKE_WORKSPACE_NAME}_preprocessor)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_program_options
                       ${CMAKE_WORKSPACE_NAME}::timer
                       ${CMAKE_WORKSPACE_NAME}::preprocessor
                       )

cm_test(NAME program_options_test_options_description_test SOURCES options_description_test.cpp)
cm_test(NAME program_options_test_parsers_test SOURCES parsers_test.cpp ARGS ${CMAKE_CURRENT_SOURCE_DIR}/config_test.cfg)
cm_test(NAME program_options_test_variable_map_test SOURCES variable_map_test.cpp)
cm_test(NAME program_options_test_cmdline_test SOURCES cmdline_test.cpp)
cm_test(NAME program_options_test_positional_options_test SOURCES positional_options_test.cpp)
cm_test(NAME program_options_test_unicode_test SOURCES unicode_test.cpp)
cm_test(NAME program_options_test_winmain SOURCES winmain.cpp)
cm_test(NAME program_options_test_exception_test SOURCES exception_test.cpp)
cm_test(NAME program_options_test_split_test SOURCES split_test.cpp)
cm_test(NAME program_options_test_unrecognized_test SOURCES unrecognized_test.cpp)
cm_test(NAME program_options_test_required_test SOURCES required_test.cpp ARGS ${CMAKE_CURRENT_SOURCE_DIR}/required_test.cfg)
cm_test(NAME program_options_test_exception_txt_test SOURCES exception_txt_test.cpp)
cm_test(NAME program_options_test_options_description_no_rtti_test SOURCES options_description_test.cpp)
set_target_properties(program_options_test_options_description_no_rtti_test PROPERTIES CXX_RTTI Off)
target_compile_definitions(program_options_test_options_description_no_rtti_test PUBLIC BOOST_NO_RTTI BOOST_NO_TYPEID)


