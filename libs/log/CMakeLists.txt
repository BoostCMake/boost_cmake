cmake_minimum_required(VERSION 3.5)
project(${CMAKE_WORKSPACE_NAME}_log)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

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

bcm_setup_version(VERSION 1.58.0)

add_library(${CMAKE_WORKSPACE_NAME}_log
            src/thread_id.cpp
            src/attribute_set.cpp
            src/format_parser.cpp
            src/event.cpp
            src/global_logger_storage.cpp
            src/thread_specific.cpp
            src/unhandled_exception_count.cpp
            src/severity_level.cpp
            src/text_multifile_backend.cpp
            #           src/permissions.cpp
            src/once_block.cpp
            src/threadsafe_queue.cpp
            src/timer.cpp
            src/exceptions.cpp
            src/timestamp.cpp
            src/process_name.cpp
            src/default_sink.cpp
            src/syslog_backend.cpp
            src/date_time_format_parser.cpp
            src/process_id.cpp
            src/record_ostream.cpp
            src/core.cpp
            src/default_attribute_names.cpp
            src/text_file_backend.cpp
            src/attribute_name.cpp
            src/attribute_value_set.cpp
            src/text_ostream_backend.cpp
            src/spirit_encoding.cpp
            src/code_conversion.cpp
            src/trivial.cpp
            src/dump.cpp
            src/named_scope_format_parser.cpp
            src/named_scope.cpp
            )

if(BUILD_SHARED_LIBS)
    target_compile_definitions(${CMAKE_WORKSPACE_NAME}_log PRIVATE -DBOOST_LOG_DYN_LINK=1 -DBOOST_LOG_SETUP_DLL -DBOOST_LOG_SETUP_BUILDING_THE_LIB=1)
endif()

set_property(TARGET ${CMAKE_WORKSPACE_NAME}_log PROPERTY EXPORT_NAME log)

target_link_libraries(${CMAKE_WORKSPACE_NAME}_log PUBLIC boost::predef)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_log PUBLIC boost::property_tree)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_log PUBLIC boost::locale)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_log PUBLIC boost::move)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_log PUBLIC boost::xpressive)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_log PUBLIC boost::type_index)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_log PUBLIC boost::atomic)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_log PUBLIC boost::io)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_log PUBLIC boost::array)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_log PUBLIC boost::iterator)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_log PUBLIC boost::utility)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_log PUBLIC boost::regex)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_log PUBLIC boost::static_assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_log PUBLIC boost::bind)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_log PUBLIC boost::proto)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_log PUBLIC boost::system)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_log PUBLIC boost::type_traits)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_log PUBLIC boost::smart_ptr)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_log PUBLIC boost::intrusive)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_log PUBLIC boost::config)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_log PUBLIC boost::core)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_log PUBLIC boost::random)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_log PUBLIC boost::phoenix)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_log PUBLIC boost::winapi)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_log PUBLIC boost::mpl)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_log PUBLIC boost::asio)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_log PUBLIC boost::assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_log PUBLIC boost::interprocess)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_log PUBLIC boost::fusion)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_log PUBLIC boost::preprocessor)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_log PUBLIC boost::optional)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_log PUBLIC boost::spirit)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_log PUBLIC boost::function_types)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_log PUBLIC boost::date_time)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_log PUBLIC boost::exception)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_log PUBLIC boost::thread)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_log PUBLIC boost::parameter)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_log PUBLIC boost::align)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_log PUBLIC boost::range)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_log PUBLIC boost::filesystem)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_log PUBLIC boost::lexical_cast)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_log PUBLIC boost::throw_exception)

target_compile_definitions(${CMAKE_WORKSPACE_NAME}_log PUBLIC
                           __STDC_CONSTANT_MACROS # Use system-defined macros for integer constants, if possible
                           BOOST_SPIRIT_USE_PHOENIX_V3=1
                           )
if(MSVC)
    # Disable warnings about using 'insecure' standard C functions
    target_compile_definitions(${CMAKE_WORKSPACE_NAME}_log PUBLIC
                               _SCL_SECURE_NO_WARNINGS
                               _SCL_SECURE_NO_DEPRECATE
                               _CRT_SECURE_NO_WARNINGS
                               _CRT_SECURE_NO_DEPRECATE
                               )
    target_compile_options(${CMAKE_WORKSPACE_NAME}_log PUBLIC
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
        target_compile_options(${CMAKE_WORKSPACE_NAME}_log PRIVATE "/Qwd177,780,2196,1782,193,304,981,1418,411,734,279")
    elseif(APPLE)
        target_compile_options(${CMAKE_WORKSPACE_NAME}_log PRIVATE "-wd177,780,2196,1782,193,304,981,1418,411,734,279")
    elseif(UNIX)
        target_compile_options(${CMAKE_WORKSPACE_NAME}_log PRIVATE "-wd177,780,2196,1782,193,304,981,1418,411,734,279")
    endif()
endif()

if(NOT MSVC)
    target_compile_options(${CMAKE_WORKSPACE_NAME}_log PUBLIC -ftemplate-depth-1024)
endif()

if(WIN32)
    target_compile_definitions(${CMAKE_WORKSPACE_NAME}_log PUBLIC
                               NOMINMAX
                               WIN32_LEAN_AND_MEAN
                               SECURITY_WIN32
                               BOOST_USE_WINDOWS_H
                               )
    target_link_libraries(${CMAKE_WORKSPACE_NAME}_log PUBLIC
                          -lws2_32
                          -lmswsock
                          -ladvapi32
                          )
endif()

if(${CMAKE_SYSTEM_NAME} STREQUAL "Linux")
    target_compile_definitions(${CMAKE_WORKSPACE_NAME}_log PUBLIC _XOPEN_SOURCE=600)
    target_link_libraries(${CMAKE_WORKSPACE_NAME}_log PUBLIC -lrt)
endif()

if(WIN32)
    target_sources(${CMAKE_WORKSPACE_NAME}_log PRIVATE
                   src/debug_output_backend.cpp
                   src/light_rw_mutex.cpp
                   )
    if(NOT BOOST_LOG_WITHOUT_IPC)
        target_sources(${CMAKE_WORKSPACE_NAME}_log PRIVATE
                       src/windows/object_name.cpp
                       src/windows/mapped_shared_memory.cpp
                       src/windows/ipc_sync_wrappers.cpp
                       src/windows/ipc_reliable_message_queue.cpp
                       )
        target_link_libraries(${CMAKE_WORKSPACE_NAME}_log PUBLIC -lsecur32)
    endif()
    if(NOT BOOST_LOG_WITHOUT_DEBUG_OUTPUT)
        target_sources(${CMAKE_WORKSPACE_NAME}_log PRIVATE src/windows/debug_output_backend.cpp)
    endif()
    if(NOT BOOST_LOG_WITHOUT_EVENT_LOG)
        target_sources(${CMAKE_WORKSPACE_NAME}_log PRIVATE
                       #                       src/windows/simple_event_log.mc
                       #                       src/windows/event_log_backend.cpp
                       )
        target_link_libraries(${CMAKE_WORKSPACE_NAME}_log PUBLIC -lpsapi)
    endif()
else()
    target_compile_definitions(${CMAKE_WORKSPACE_NAME}_log PUBLIC BOOST_LOG_WITHOUT_EVENT_LOG BOOST_LOG_WITHOUT_DEBUG_OUTPUT)
    #    target_sources(${CMAKE_WORKSPACE_NAME}_log PRIVATE
    #                   src/posix/object_name.cpp
    #                   src/posix/ipc_reliable_message_queue.cpp
    #                   )
endif()

target_compile_definitions(${CMAKE_WORKSPACE_NAME}_log PUBLIC BOOST_LOG_BUILDING_THE_LIB=1)
target_include_directories(${CMAKE_WORKSPACE_NAME}_log PRIVATE src/)

add_library(${CMAKE_WORKSPACE_NAME}_log_setup
            src/parser_utils.cpp
            src/init_from_stream.cpp
            src/init_from_settings.cpp
            src/settings_parser.cpp
            src/filter_parser.cpp
            src/formatter_parser.cpp
            src/default_filter_factory.cpp
            src/matches_relation_factory.cpp
            src/default_formatter_factory.cpp
            )

if(BUILD_SHARED_LIBS)
    target_compile_definitions(${CMAKE_WORKSPACE_NAME}_log_setup PRIVATE -DBOOST_LOG_DYN_LINK=1 -DBOOST_LOG_SETUP_DLL -DBOOST_LOG_SETUP_DYN_LINK=1)
endif()

target_compile_definitions(${CMAKE_WORKSPACE_NAME}_log_setup PUBLIC BOOST_LOG_SETUP_BUILDING_THE_LIB=1)
target_include_directories(${CMAKE_WORKSPACE_NAME}_log_setup PRIVATE src)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_log_setup ${CMAKE_WORKSPACE_NAME}_log)


target_include_directories(${CMAKE_WORKSPACE_NAME}_log PRIVATE include)

bcm_deploy(TARGETS ${CMAKE_WORKSPACE_NAME}_log INCLUDE include NAMESPACE ${CMAKE_WORKSPACE_NAME}::)

add_subdirectory(test)