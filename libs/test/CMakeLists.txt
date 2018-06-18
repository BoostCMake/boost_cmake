cmake_minimum_required(VERSION 3.5)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

cm_project(${CMAKE_WORKSPACE_NAME} test)

if(CMAKE_SOURCES_DIR)
    set(CURRENT_SOURCES_DIR ${CMAKE_SOURCES_DIR}/libs/${CURRENT_PROJECT_NAME})
endif()

find_package(${CMAKE_WORKSPACE_NAME}_lexical_cast)
find_package(${CMAKE_WORKSPACE_NAME}_function)
find_package(${CMAKE_WORKSPACE_NAME}_core)
find_package(${CMAKE_WORKSPACE_NAME}_exception)
find_package(${CMAKE_WORKSPACE_NAME}_iterator)
find_package(${CMAKE_WORKSPACE_NAME}_algorithm)
find_package(${CMAKE_WORKSPACE_NAME}_static_assert)
find_package(${CMAKE_WORKSPACE_NAME}_bind)
find_package(${CMAKE_WORKSPACE_NAME}_mpl)
find_package(${CMAKE_WORKSPACE_NAME}_detail)
find_package(${CMAKE_WORKSPACE_NAME}_timer)
find_package(${CMAKE_WORKSPACE_NAME}_assert)
find_package(${CMAKE_WORKSPACE_NAME}_type_traits)
find_package(${CMAKE_WORKSPACE_NAME}_optional)
find_package(${CMAKE_WORKSPACE_NAME}_smart_ptr)
find_package(${CMAKE_WORKSPACE_NAME}_io)
find_package(${CMAKE_WORKSPACE_NAME}_utility)
find_package(${CMAKE_WORKSPACE_NAME}_config)
find_package(${CMAKE_WORKSPACE_NAME}_numeric_conversion)
find_package(${CMAKE_WORKSPACE_NAME}_preprocessor)

cm_setup_version(VERSION 1.58.0)

add_library(${CMAKE_WORKSPACE_NAME}_prg_exec_monitor
            ${CURRENT_SOURCES_DIR}/src/execution_monitor.cpp
            ${CURRENT_SOURCES_DIR}/src/debug.cpp
            ${CURRENT_SOURCES_DIR}/src/cpp_main.cpp
            )

if(BUILD_SHARED_LIBS)
    target_compile_definitions(${CMAKE_WORKSPACE_NAME}_prg_exec_monitor PRIVATE -DBOOST_TEST_DYN_LINK=1)
endif()

target_include_directories(${CMAKE_WORKSPACE_NAME}_prg_exec_monitor PRIVATE include)

target_link_libraries(${CMAKE_WORKSPACE_NAME}_prg_exec_monitor PUBLIC
                      ${CMAKE_WORKSPACE_NAME}::lexical_cast
                      ${CMAKE_WORKSPACE_NAME}::algorithm
                      ${CMAKE_WORKSPACE_NAME}::config
                      ${CMAKE_WORKSPACE_NAME}::detail
                      ${CMAKE_WORKSPACE_NAME}::concept_check
                      ${CMAKE_WORKSPACE_NAME}::exception
                      ${CMAKE_WORKSPACE_NAME}::function
                      ${CMAKE_WORKSPACE_NAME}::type_traits
                      )
set_property(TARGET ${CMAKE_WORKSPACE_NAME}_prg_exec_monitor PROPERTY EXPORT_NAME prg_exec_monitor)

add_library(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME}_exec_monitor STATIC
            ${CURRENT_SOURCES_DIR}/src/compiler_log_formatter.cpp
            ${CURRENT_SOURCES_DIR}/src/debug.cpp
            ${CURRENT_SOURCES_DIR}/src/execution_monitor.cpp
            ${CURRENT_SOURCES_DIR}/src/framework.cpp
            ${CURRENT_SOURCES_DIR}/src/plain_report_formatter.cpp
            ${CURRENT_SOURCES_DIR}/src/progress_monitor.cpp
            ${CURRENT_SOURCES_DIR}/src/results_collector.cpp
            ${CURRENT_SOURCES_DIR}/src/results_reporter.cpp
            ${CURRENT_SOURCES_DIR}/src/test_main.cpp
            ${CURRENT_SOURCES_DIR}/src/test_tools.cpp
            ${CURRENT_SOURCES_DIR}/src/unit_${CURRENT_PROJECT_NAME}_log.cpp
            ${CURRENT_SOURCES_DIR}/src/unit_${CURRENT_PROJECT_NAME}_main.cpp
            ${CURRENT_SOURCES_DIR}/src/unit_${CURRENT_PROJECT_NAME}_monitor.cpp
            ${CURRENT_SOURCES_DIR}/src/unit_${CURRENT_PROJECT_NAME}_parameters.cpp
            ${CURRENT_SOURCES_DIR}/src/unit_${CURRENT_PROJECT_NAME}_suite.cpp
            ${CURRENT_SOURCES_DIR}/src/xml_log_formatter.cpp
            ${CURRENT_SOURCES_DIR}/src/xml_report_formatter.cpp

            #            ${CURRENT_SOURCES_DIR}/src/decorator.cpp
            #            ${CURRENT_SOURCES_DIR}/src/test_tree.cpp
            #            ${CURRENT_SOURCES_DIR}/src/junit_log_formatter.cpp
            )

set_property(TARGET ${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME}_exec_monitor PROPERTY EXPORT_NAME test_exec_monitor)

target_include_directories(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME}_exec_monitor PRIVATE ${CURRENT_SOURCES_DIR}/include)

target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME}_exec_monitor PUBLIC
                      ${CMAKE_WORKSPACE_NAME}::lexical_cast
                      ${CMAKE_WORKSPACE_NAME}::numeric_conversion
                      ${CMAKE_WORKSPACE_NAME}::algorithm
                      ${CMAKE_WORKSPACE_NAME}::detail
                      ${CMAKE_WORKSPACE_NAME}::concept_check
                      ${CMAKE_WORKSPACE_NAME}::timer
                      ${CMAKE_WORKSPACE_NAME}::function
                      ${CMAKE_WORKSPACE_NAME}::type_traits
                      ${CMAKE_WORKSPACE_NAME}::io
                      ${CMAKE_WORKSPACE_NAME}::optional
                      )

add_library(${CMAKE_WORKSPACE_NAME}_unit_${CURRENT_PROJECT_NAME}_framework
            ${CURRENT_SOURCES_DIR}/src/compiler_log_formatter.cpp
            ${CURRENT_SOURCES_DIR}/src/debug.cpp
            ${CURRENT_SOURCES_DIR}/src/exception_safety.cpp
            ${CURRENT_SOURCES_DIR}/src/execution_monitor.cpp
            ${CURRENT_SOURCES_DIR}/src/framework.cpp
            ${CURRENT_SOURCES_DIR}/src/interaction_based.cpp
            ${CURRENT_SOURCES_DIR}/src/logged_expectations.cpp
            ${CURRENT_SOURCES_DIR}/src/plain_report_formatter.cpp
            ${CURRENT_SOURCES_DIR}/src/progress_monitor.cpp
            ${CURRENT_SOURCES_DIR}/src/results_collector.cpp
            ${CURRENT_SOURCES_DIR}/src/results_reporter.cpp
            ${CURRENT_SOURCES_DIR}/src/test_tools.cpp
            ${CURRENT_SOURCES_DIR}/src/unit_${CURRENT_PROJECT_NAME}_log.cpp
            ${CURRENT_SOURCES_DIR}/src/unit_${CURRENT_PROJECT_NAME}_main.cpp
            ${CURRENT_SOURCES_DIR}/src/unit_${CURRENT_PROJECT_NAME}_monitor.cpp
            ${CURRENT_SOURCES_DIR}/src/unit_${CURRENT_PROJECT_NAME}_parameters.cpp
            ${CURRENT_SOURCES_DIR}/src/unit_${CURRENT_PROJECT_NAME}_suite.cpp
            ${CURRENT_SOURCES_DIR}/src/xml_log_formatter.cpp
            ${CURRENT_SOURCES_DIR}/src/xml_report_formatter.cpp

            #            ${CURRENT_SOURCES_DIR}/src/decorator.cpp
            #            ${CURRENT_SOURCES_DIR}/src/test_tree.cpp
            #            ${CURRENT_SOURCES_DIR}/src/junit_log_formatter.cpp
            )

if(BUILD_SHARED_LIBS)
    target_compile_definitions(${CMAKE_WORKSPACE_NAME}_unit_${CURRENT_PROJECT_NAME}_framework PRIVATE -DBOOST_TEST_DYN_LINK=1)
endif()

set_property(TARGET ${CMAKE_WORKSPACE_NAME}_unit_${CURRENT_PROJECT_NAME}_framework PROPERTY EXPORT_NAME unit_${CURRENT_PROJECT_NAME}_framework)

target_include_directories(${CMAKE_WORKSPACE_NAME}_unit_${CURRENT_PROJECT_NAME}_framework PRIVATE ${CURRENT_SOURCES_DIR}/include)

target_link_libraries(${CMAKE_WORKSPACE_NAME}_unit_${CURRENT_PROJECT_NAME}_framework PUBLIC
                      ${CMAKE_WORKSPACE_NAME}::lexical_cast
                      ${CMAKE_WORKSPACE_NAME}::numeric_conversion
                      ${CMAKE_WORKSPACE_NAME}::concept_check
                      ${CMAKE_WORKSPACE_NAME}::detail
                      ${CMAKE_WORKSPACE_NAME}::algorithm
                      ${CMAKE_WORKSPACE_NAME}::timer
                      ${CMAKE_WORKSPACE_NAME}::function
                      ${CMAKE_WORKSPACE_NAME}::type_traits
                      ${CMAKE_WORKSPACE_NAME}::iterator
                      ${CMAKE_WORKSPACE_NAME}::io
                      ${CMAKE_WORKSPACE_NAME}::optional
                      ${CMAKE_WORKSPACE_NAME}::smart_ptr
                      )

add_library(${CMAKE_WORKSPACE_NAME}::test ALIAS ${CMAKE_WORKSPACE_NAME}_unit_${CURRENT_PROJECT_NAME}_framework)
cm_shadow_notify(${CMAKE_WORKSPACE_NAME}::test)

cm_deploy(TARGETS ${CMAKE_WORKSPACE_NAME}_prg_exec_monitor ${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME}_exec_monitor ${CMAKE_WORKSPACE_NAME}_unit_${CURRENT_PROJECT_NAME}_framework INCLUDE ${CURRENT_SOURCES_DIR}/include NAMESPACE ${CMAKE_WORKSPACE_NAME}::)

add_subdirectory(test)