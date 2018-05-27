cmake_minimum_required(VERSION 3.5)
project(${CMAKE_WORKSPACE_NAME}_program_options)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(${CMAKE_WORKSPACE_NAME}_function)
find_package(${CMAKE_WORKSPACE_NAME}_core)
find_package(${CMAKE_WORKSPACE_NAME}_static_assert)
find_package(${CMAKE_WORKSPACE_NAME}_tokenizer)
find_package(${CMAKE_WORKSPACE_NAME}_iterator)
find_package(${CMAKE_WORKSPACE_NAME}_bind)
find_package(${CMAKE_WORKSPACE_NAME}_detail)
find_package(${CMAKE_WORKSPACE_NAME}_throw_exception)
find_package(${CMAKE_WORKSPACE_NAME}_type_traits)
find_package(${CMAKE_WORKSPACE_NAME}_smart_ptr)
find_package(${CMAKE_WORKSPACE_NAME}_lexical_cast)
find_package(${CMAKE_WORKSPACE_NAME}_config)
find_package(${CMAKE_WORKSPACE_NAME}_any)

bcm_setup_version(VERSION 1.58.0)

add_library(${CMAKE_WORKSPACE_NAME}_program_options
            src/options_description.cpp
            src/winmain.cpp
            src/cmdline.cpp
            src/convert.cpp
            src/parsers.cpp
            src/config_file.cpp
            src/positional_options.cpp
            src/value_semantic.cpp
            src/split.cpp
            src/variables_map.cpp
            src/utf8_codecvt_facet.cpp
            )

if(BUILD_SHARED_LIBS)
    target_compile_definitions(${CMAKE_WORKSPACE_NAME}_program_options PRIVATE -DBOOST_PROGRAM_OPTIONS_DYN_LINK=1)
endif()

set_property(TARGET ${CMAKE_WORKSPACE_NAME}_program_options PROPERTY EXPORT_NAME program_options)

target_link_libraries(${CMAKE_WORKSPACE_NAME}_program_options PUBLIC boost::function)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_program_options PUBLIC boost::core)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_program_options PUBLIC boost::static_assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_program_options PUBLIC boost::tokenizer)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_program_options PUBLIC boost::iterator)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_program_options PUBLIC boost::bind)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_program_options PUBLIC boost::detail)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_program_options PUBLIC boost::throw_exception)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_program_options PUBLIC boost::type_traits)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_program_options PUBLIC boost::smart_ptr)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_program_options PUBLIC boost::lexical_cast)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_program_options PUBLIC boost::config)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_program_options PUBLIC boost::any)

target_include_directories(${CMAKE_WORKSPACE_NAME}_program_options PRIVATE include)

bcm_deploy(TARGETS ${CMAKE_WORKSPACE_NAME}_program_options INCLUDE include NAMESPACE ${CMAKE_WORKSPACE_NAME}::)

add_subdirectory(test)