include(BCMTest)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)

find_package(${CMAKE_WORKSPACE_NAME}_timer)
find_package(${CMAKE_WORKSPACE_NAME}_preprocessor)

bcm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_program_options
                        boost::timer
                        boost::preprocessor
                        )

bcm_test(NAME program_options_test_options_description_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/options_description_test.cpp)
bcm_test(NAME program_options_test_parsers_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/parsers_test.cpp ARGS ${CMAKE_CURRENT_SOURCE_DIR}/config_test.cfg)
bcm_test(NAME program_options_test_variable_map_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/variable_map_test.cpp)
bcm_test(NAME program_options_test_cmdline_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/cmdline_test.cpp)
bcm_test(NAME program_options_test_positional_options_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/positional_options_test.cpp)
bcm_test(NAME program_options_test_unicode_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/unicode_test.cpp)
bcm_test(NAME program_options_test_winmain SOURCES ${CMAKE_WORKSPACE_SOURCE}/winmain.cpp)
bcm_test(NAME program_options_test_exception_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/exception_test.cpp)
bcm_test(NAME program_options_test_split_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/split_test.cpp)
bcm_test(NAME program_options_test_unrecognized_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/unrecognized_test.cpp)
bcm_test(NAME program_options_test_required_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/required_test.cpp ARGS ${CMAKE_CURRENT_SOURCE_DIR}/required_test.cfg)
bcm_test(NAME program_options_test_exception_txt_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/exception_txt_test.cpp)
bcm_test(NAME program_options_test_options_description_no_rtti_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/options_description_test.cpp)
set_target_properties(program_options_test_options_description_no_rtti_test PROPERTIES CXX_RTTI Off)
target_compile_definitions(program_options_test_options_description_no_rtti_test PUBLIC BOOST_NO_RTTI BOOST_NO_TYPEID)


