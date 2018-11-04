cmake_minimum_required(VERSION 3.5)

find_package(CM)
include(CMDeploy)
include(CMSetupVersion)

cm_project(${CMAKE_WORKSPACE_NAME} log)

find_package(${CMAKE_WORKSPACE_NAME}_predef)
find_package(${CMAKE_WORKSPACE_NAME}_property_tree)
find_package(${CMAKE_WORKSPACE_NAME}_locale)
find_package(${CMAKE_WORKSPACE_NAME}_move)
find_package(${CMAKE_WORKSPACE_NAME}_xpressive)
find_package(${CMAKE_WORKSPACE_NAME}_type_index)
find_package(${CMAKE_WORKSPACE_NAME}_atomic)
find_package(${CMAKE_WORKSPACE_NAME}_io)
find_package(${CMAKE_WORKSPACE_NAME}_array)
find_package(${CMAKE_WORKSPACE_NAME}_iterator)
find_package(${CMAKE_WORKSPACE_NAME}_utility)
find_package(${CMAKE_WORKSPACE_NAME}_regex)
find_package(${CMAKE_WORKSPACE_NAME}_static_assert)
find_package(${CMAKE_WORKSPACE_NAME}_bind)
find_package(${CMAKE_WORKSPACE_NAME}_proto)
find_package(${CMAKE_WORKSPACE_NAME}_system)
find_package(${CMAKE_WORKSPACE_NAME}_type_traits)
find_package(${CMAKE_WORKSPACE_NAME}_smart_ptr)
find_package(${CMAKE_WORKSPACE_NAME}_intrusive)
find_package(${CMAKE_WORKSPACE_NAME}_config)
find_package(${CMAKE_WORKSPACE_NAME}_core)
find_package(${CMAKE_WORKSPACE_NAME}_random)
find_package(${CMAKE_WORKSPACE_NAME}_phoenix)
find_package(${CMAKE_WORKSPACE_NAME}_winapi)
find_package(${CMAKE_WORKSPACE_NAME}_mpl)
find_package(${CMAKE_WORKSPACE_NAME}_asio)
find_package(${CMAKE_WORKSPACE_NAME}_assert)
find_package(${CMAKE_WORKSPACE_NAME}_interprocess)
find_package(${CMAKE_WORKSPACE_NAME}_fusion)
find_package(${CMAKE_WORKSPACE_NAME}_preprocessor)
find_package(${CMAKE_WORKSPACE_NAME}_optional)
find_package(${CMAKE_WORKSPACE_NAME}_spirit)
find_package(${CMAKE_WORKSPACE_NAME}_function_types)
find_package(${CMAKE_WORKSPACE_NAME}_date_time)
find_package(${CMAKE_WORKSPACE_NAME}_exception)
find_package(${CMAKE_WORKSPACE_NAME}_thread)
find_package(${CMAKE_WORKSPACE_NAME}_parameter)
find_package(${CMAKE_WORKSPACE_NAME}_align)
find_package(${CMAKE_WORKSPACE_NAME}_range)
find_package(${CMAKE_WORKSPACE_NAME}_filesystem)
find_package(${CMAKE_WORKSPACE_NAME}_lexical_cast)
find_package(${CMAKE_WORKSPACE_NAME}_throw_exception)

cm_setup_version(VERSION 1.60.0)

add_library(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME}
        ${CURRENT_SOURCES_DIR}/src/thread_id.cpp
        ${CURRENT_SOURCES_DIR}/src/attribute_set.cpp
        ${CURRENT_SOURCES_DIR}/src/format_parser.cpp
        ${CURRENT_SOURCES_DIR}/src/event.cpp
        ${CURRENT_SOURCES_DIR}/src/global_${CURRENT_PROJECT_NAME}ger_storage.cpp
        ${CURRENT_SOURCES_DIR}/src/thread_specific.cpp
        ${CURRENT_SOURCES_DIR}/src/unhandled_exception_count.cpp
        ${CURRENT_SOURCES_DIR}/src/severity_level.cpp
        ${CURRENT_SOURCES_DIR}/src/text_multifile_backend.cpp
            #           src/permissions.cpp
        ${CURRENT_SOURCES_DIR}/src/once_block.cpp
        ${CURRENT_SOURCES_DIR}/src/threadsafe_queue.cpp
        ${CURRENT_SOURCES_DIR}/src/timer.cpp
        ${CURRENT_SOURCES_DIR}/src/exceptions.cpp
        ${CURRENT_SOURCES_DIR}/src/timestamp.cpp
        ${CURRENT_SOURCES_DIR}/src/process_name.cpp
        ${CURRENT_SOURCES_DIR}/src/default_sink.cpp
        ${CURRENT_SOURCES_DIR}/src/syslog_backend.cpp
        ${CURRENT_SOURCES_DIR}/src/date_time_format_parser.cpp
        ${CURRENT_SOURCES_DIR}/src/process_id.cpp
        ${CURRENT_SOURCES_DIR}/src/record_ostream.cpp
        ${CURRENT_SOURCES_DIR}/src/core.cpp
        ${CURRENT_SOURCES_DIR}/src/default_attribute_names.cpp
        ${CURRENT_SOURCES_DIR}/src/text_file_backend.cpp
        ${CURRENT_SOURCES_DIR}/src/attribute_name.cpp
        ${CURRENT_SOURCES_DIR}/src/attribute_value_set.cpp
        ${CURRENT_SOURCES_DIR}/src/text_ostream_backend.cpp
        ${CURRENT_SOURCES_DIR}/src/spirit_encoding.cpp
        ${CURRENT_SOURCES_DIR}/src/code_conversion.cpp
        ${CURRENT_SOURCES_DIR}/src/trivial.cpp
        ${CURRENT_SOURCES_DIR}/src/dump.cpp
        ${CURRENT_SOURCES_DIR}/src/named_scope_format_parser.cpp
        ${CURRENT_SOURCES_DIR}/src/named_scope.cpp
            )

if(BUILD_SHARED_LIBS)
    target_compile_definitions(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PRIVATE -DBOOST_LOG_DYN_LINK=1 -DBOOST_LOG_SETUP_DLL -DBOOST_LOG_SETUP_BUILDING_THE_LIB=1)
endif()

set_property(TARGET ${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PROPERTY EXPORT_NAME log)

target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::predef)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::property_tree)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::locale)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::move)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::xpressive)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::type_index)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::atomic)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::io)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::array)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::iterator)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::utility)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::regex)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::static_assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::bind)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::proto)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::system)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::type_traits)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::smart_ptr)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::intrusive)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::config)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::core)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::random)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::phoenix)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::winapi)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::mpl)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::asio)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::interprocess)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::fusion)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::preprocessor)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::optional)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::spirit)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::function_types)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::date_time)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::exception)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::thread)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::parameter)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::align)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::range)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::filesystem)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::lexical_cast)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::throw_exception)

target_compile_definitions(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC
                           __STDC_CONSTANT_MACROS # Use system-defined macros for integer constants, if possible
                           BOOST_SPIRIT_USE_PHOENIX_V3=1
                           )
if(MSVC)
    # Disable warnings about using 'insecure' standard C functions
    target_compile_definitions(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC
                               _SCL_SECURE_NO_WARNINGS
                               _SCL_SECURE_NO_DEPRECATE
                               _CRT_SECURE_NO_WARNINGS
                               _CRT_SECURE_NO_DEPRECATE
                               )
    target_compile_options(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC
                           /bigobj
                           /wd4503 # decorated name length exceeded, name was truncated
                           /wd4456 # declaration of 'A' hides previous local declaration
                           /wd4459 # declaration of 'A' hides global declaration
                           /wd4003 # not enough actual parameters for macro 'X' - caused by BOOST_PP_IS_EMPTY and BOOST_PP_IS_BEGIN_PARENS which are used by Fusion
                           )
endif()

if(${CMAKE_C_COMPILER} MATCHES "icc.*$")
    # Disable Intel warnings:
    # warning #177: function "X" was declared but never referenced
    # warning #780: using-declaration ignored -- it refers to the current namespace
    # warning #2196: routine is both "inline" and "noinline"
    # remark #1782: #pragma once is obsolete. Use #ifndef guard instead.
    # remark #193: zero used for undefined preprocessing identifier "X"
    # remark #304: access control not specified ("public" by default)
    # remark #981: operands are evaluated in unspecified order
    # remark #1418: external function definition with no prior declaration
    # Mostly comes from Boost.Phoenix: warning #411: class "X" defines no constructor to initialize the following: reference member "Y"...
    # warning #734: "X" (declared at line N of "file.hpp"), required for copy that was eliminated, is inaccessible
    # warning #279: controlling expression is constant
    if(MSVC)
        target_compile_options(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PRIVATE "/Qwd177,780,2196,1782,193,304,981,1418,411,734,279")
    elseif(APPLE)
        target_compile_options(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PRIVATE "-wd177,780,2196,1782,193,304,981,1418,411,734,279")
    elseif(UNIX)
        target_compile_options(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PRIVATE "-wd177,780,2196,1782,193,304,981,1418,411,734,279")
    endif()
endif()

if(NOT MSVC)
    target_compile_options(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC -ftemplate-depth-1024)
endif()

if(WIN32)
    target_compile_definitions(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC
                               NOMINMAX
                               WIN32_LEAN_AND_MEAN
                               SECURITY_WIN32
                               BOOST_USE_WINDOWS_H
                               )
    target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC
                          -lws2_32
                          -lmswsock
                          -ladvapi32
                          )
endif()

if(${CMAKE_SYSTEM_NAME} STREQUAL "Linux")
    target_compile_definitions(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC _XOPEN_SOURCE=600)
    target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC -lrt)
endif()

if(WIN32)
    target_sources(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PRIVATE
            ${CURRENT_SOURCES_DIR}/src/debug_output_backend.cpp
            ${CURRENT_SOURCES_DIR}/src/light_rw_mutex.cpp
                   )
    if(NOT BOOST_LOG_WITHOUT_IPC)
        target_sources(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PRIVATE
                ${CURRENT_SOURCES_DIR}/src/windows/object_name.cpp
                ${CURRENT_SOURCES_DIR}/src/windows/mapped_shared_memory.cpp
                ${CURRENT_SOURCES_DIR}/src/windows/ipc_sync_wrappers.cpp
                ${CURRENT_SOURCES_DIR}/src/windows/ipc_reliable_message_queue.cpp
                       )
        target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC -lsecur32)
    endif()
    if(NOT BOOST_LOG_WITHOUT_DEBUG_OUTPUT)
        target_sources(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PRIVATE ${CURRENT_SOURCES_DIR}/src/windows/debug_output_backend.cpp)
    endif()
    if(NOT BOOST_LOG_WITHOUT_EVENT_LOG)
        target_sources(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PRIVATE
                       #                       src/windows/simple_event_${CURRENT_PROJECT_NAME}.mc
                       #                       src/windows/event_${CURRENT_PROJECT_NAME}_backend.cpp
                       )
        target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC -lpsapi)
    endif()
else()
    target_compile_definitions(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC BOOST_LOG_WITHOUT_EVENT_LOG BOOST_LOG_WITHOUT_DEBUG_OUTPUT)
    #    target_sources(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PRIVATE
    #                   src/posix/object_name.cpp
    #                   src/posix/ipc_reliable_message_queue.cpp
    #                   )
endif()

target_compile_definitions(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC BOOST_LOG_BUILDING_THE_LIB=1)
target_include_directories(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PRIVATE ${CURRENT_SOURCES_DIR}/src/)

add_library(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME}_setup
        ${CURRENT_SOURCES_DIR}/src/parser_utils.cpp
        ${CURRENT_SOURCES_DIR}/src/init_from_stream.cpp
        ${CURRENT_SOURCES_DIR}/src/init_from_settings.cpp
        ${CURRENT_SOURCES_DIR}/src/settings_parser.cpp
        ${CURRENT_SOURCES_DIR}/src/filter_parser.cpp
        ${CURRENT_SOURCES_DIR}/src/formatter_parser.cpp
        ${CURRENT_SOURCES_DIR}/src/default_filter_factory.cpp
        ${CURRENT_SOURCES_DIR}/src/matches_relation_factory.cpp
        ${CURRENT_SOURCES_DIR}/src/default_formatter_factory.cpp
            )

if(BUILD_SHARED_LIBS)
    target_compile_definitions(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME}_setup PRIVATE -DBOOST_LOG_DYN_LINK=1 -DBOOST_LOG_SETUP_DLL -DBOOST_LOG_SETUP_DYN_LINK=1)
endif()

target_compile_definitions(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME}_setup PUBLIC BOOST_LOG_SETUP_BUILDING_THE_LIB=1)
target_include_directories(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME}_setup PRIVATE ${CURRENT_SOURCES_DIR}/src)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME}_setup ${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME})


target_include_directories(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PRIVATE ${CURRENT_SOURCES_DIR}/include)

cm_deploy(TARGETS ${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} INCLUDE ${CURRENT_SOURCES_DIR}/include NAMESPACE ${CMAKE_WORKSPACE_NAME}::)

add_subdirectory(test)