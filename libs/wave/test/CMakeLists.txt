include(CMTest)

find_package(${CMAKE_WORKSPACE_NAME}_any)
find_package(${CMAKE_WORKSPACE_NAME}_program_options)
find_package(${CMAKE_WORKSPACE_NAME}_lexical_cast)
find_package(${CMAKE_WORKSPACE_NAME}_filesystem)
find_package(${CMAKE_WORKSPACE_NAME}_thread)
find_package(${CMAKE_WORKSPACE_NAME}_system)
find_package(${CMAKE_WORKSPACE_NAME}_date_time)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_wave
                        boost::any
                        boost::program_options
                        boost::lexical_cast
                        boost::filesystem
                        boost::thread
                        boost::system
                        boost::date_time
                        )
#testlexers
#[[
cm_test(NAME wave_test_testlexers_test_slex_lexer SOURCES ${CMAKE_CURRENT_BINARY_DIR}/testlexers/test_slex_lexer.cpp)
target_compile_definitions(wave_test_testlexers_test_slex_lexer PRIVATE -D_SCL_SECURE_NO_DEPRECATE -D_CRT_SECURE_NO_DEPRECATE)

cm_test(NAME wave_test_testlexers_test_re2c_lexer SOURCES ${CMAKE_CURRENT_BINARY_DIR}/testlexers/test_re2c_lexer.cpp)
target_compile_definitions(wave_test_testlexers_test_re2c_lexer PRIVATE -D_SCL_SECURE_NO_DEPRECATE -D_CRT_SECURE_NO_DEPRECATE)

#testwave
#Fix it.
set(SOURCES_STATIC testwave testwave_app)
#Fix it.
set(SOURCES_DYNAMIC testwave_dll testwave_app_dll)
set(TESTWAVE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/testwave/testfiles)
set(TESTWAVE_FILES test.cfg)
set(TESTWAVE_ARGUMENTS
    -d4
    --hooks=1
    -S${TESTWAVE_DIR}
    -S${BOOST_ROOT} -I${BOOST_ROOT})

foreach(NAME ${SOURCES_STATIC})
    cm_test(NAME wave_test_${NAME} SOURCES ${CURRENT_TEST_SOURCES_DIR}/testwave/${NAME}.cpp ARGS ${TESTWAVE_ARGUMENTS}
             --config-file ${TESTWAVE_DIR}/${TESTWAVE_FILES})
    target_compile_definitions(wave_test_${NAME} PRIVATE -D_SCL_SECURE_NO_DEPRECATE -D_CRT_SECURE_NO_DEPRECATE)
endforeach()

foreach(NAME ${SOURCES_DYNAMIC})
    cm_test(NAME wave_test_${NAME} SOURCES ${CURRENT_TEST_SOURCES_DIR}/testwave/${NAME}.cpp ARGS ${TESTWAVE_ARGUMENTS}
             --config-file ${TESTWAVE_DIR}/${TESTWAVE_FILES})
    target_compile_definitions(wave_test_${NAME} PRIVATE -DBOOST_ALL_DYN_LINK=1 -D_SCL_SECURE_NO_DEPRECATE -D_CRT_SECURE_NO_DEPRECATE)
endforeach()]]