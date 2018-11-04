include(CMTest)

find_package(${CMAKE_WORKSPACE_NAME}_any)
find_package(${CMAKE_WORKSPACE_NAME}_program_options)
find_package(${CMAKE_WORKSPACE_NAME}_lexical_cast)
find_package(${CMAKE_WORKSPACE_NAME}_filesystem)
find_package(${CMAKE_WORKSPACE_NAME}_thread)
find_package(${CMAKE_WORKSPACE_NAME}_system)
find_package(${CMAKE_WORKSPACE_NAME}_date_time)
find_package(${CMAKE_WORKSPACE_NAME}_test)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_wave
                        ${CMAKE_WORKSPACE_NAME}::any
                        ${CMAKE_WORKSPACE_NAME}::program_options
                        ${CMAKE_WORKSPACE_NAME}::lexical_cast
                        ${CMAKE_WORKSPACE_NAME}::filesystem
                        ${CMAKE_WORKSPACE_NAME}::thread
                        ${CMAKE_WORKSPACE_NAME}::system
                        ${CMAKE_WORKSPACE_NAME}::date_time
                        ${CMAKE_WORKSPACE_NAME}::test
                        )
#testlexers
cm_test(NAME wave_test_testlexers_test_slex_lexer SOURCES ${CURRENT_TEST_SOURCES_DIR}/testlexers/test_slex_lexer.cpp)
target_compile_definitions(wave_test_testlexers_test_slex_lexer PRIVATE -D_SCL_SECURE_NO_DEPRECATE -D_CRT_SECURE_NO_DEPRECATE)
target_include_directories(wave_test_testlexers_test_slex_lexer PRIVATE ${CMAKE_WORKSPACE_SOURCES_DIR})

cm_test(NAME wave_test_testlexers_test_re2c_lexer SOURCES ${CURRENT_TEST_SOURCES_DIR}/testlexers/test_re2c_lexer.cpp)
target_compile_definitions(wave_test_testlexers_test_re2c_lexer PRIVATE -D_SCL_SECURE_NO_DEPRECATE -D_CRT_SECURE_NO_DEPRECATE)

#testwave
set(SOURCES_STATIC testwave testwave_app)
# TODO: fix test. Reason error: 1) No testwave_app::print_version() functions 2) No enter point 
#set(SOURCES_DYNAMIC testwave_dll testwave_app_dll)
set(TESTWAVE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/testwave/testfiles)
set(TESTWAVE_FILES test.cfg)
set(TESTWAVE_ARGUMENTS
    -d4
    --hooks=1
    -S${TESTWAVE_DIR}
    -S${BOOST_ROOT} -I${BOOST_ROOT})

if(NOT BUILD_SHARED_LIBS)
    foreach(NAME ${SOURCES_STATIC})
        cm_test(NAME wave_test_testwave_${NAME} SOURCES ${CURRENT_TEST_SOURCES_DIR}/testwave/${NAME}.cpp ARGS ${TESTWAVE_ARGUMENTS}
                 --config-file ${TESTWAVE_DIR}/${TESTWAVE_FILES})
        target_compile_definitions(wave_test_testwave_${NAME} PRIVATE -D_SCL_SECURE_NO_DEPRECATE -D_CRT_SECURE_NO_DEPRECATE)
    endforeach()
else()
    foreach(NAME ${SOURCES_DYNAMIC})
        #if (${NAME} STREQUAL testwave_dll_patched)
            #cm_test(NAME wave_test_testwave_${NAME} SOURCES ${CMAKE_CURRENT_BINARY_DIR}/testwave/${NAME}.cpp 
                    #SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR}/testwave/ ARGS ${TESTWAVE_ARGUMENTS}
                    #--config-file ${TESTWAVE_DIR}/${TESTWAVE_FILES})
        #else()
            cm_test(NAME wave_test_testwave_${NAME} SOURCES ${CURRENT_TEST_SOURCES_DIR}/testwave/${NAME}.cpp ARGS ${TESTWAVE_ARGUMENTS}
                    --config-file ${TESTWAVE_DIR}/${TESTWAVE_FILES})
        #endif()
        target_compile_definitions(wave_test_testwave_${NAME} PRIVATE -DBOOST_ALL_DYN_LINK=1 -D_SCL_SECURE_NO_DEPRECATE -D_CRT_SECURE_NO_DEPRECATE)
    endforeach()
endif()
