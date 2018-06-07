cmake_minimum_required(VERSION 3.5)
project(${CMAKE_WORKSPACE_NAME}_wave)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(${CMAKE_WORKSPACE_NAME}_core)
find_package(${CMAKE_WORKSPACE_NAME}_static_assert)
find_package(${CMAKE_WORKSPACE_NAME}_iterator)
find_package(${CMAKE_WORKSPACE_NAME}_mpl)
find_package(${CMAKE_WORKSPACE_NAME}_multi_index)
find_package(${CMAKE_WORKSPACE_NAME}_spirit)
find_package(${CMAKE_WORKSPACE_NAME}_assert)
find_package(${CMAKE_WORKSPACE_NAME}_type_traits)
find_package(${CMAKE_WORKSPACE_NAME}_concept_check)
find_package(${CMAKE_WORKSPACE_NAME}_preprocessor)
find_package(${CMAKE_WORKSPACE_NAME}_filesystem)
find_package(${CMAKE_WORKSPACE_NAME}_serialization)
find_package(${CMAKE_WORKSPACE_NAME}_config)
find_package(${CMAKE_WORKSPACE_NAME}_throw_exception)
find_package(${CMAKE_WORKSPACE_NAME}_pool)
find_package(${CMAKE_WORKSPACE_NAME}_smart_ptr)

bcm_setup_version(VERSION 1.58.0)

add_library(${CMAKE_WORKSPACE_NAME}_wave
        ${CMAKE_WORKSPACE_SOURCE}/src/cpplexer/re2clex/aq.cpp
        ${CMAKE_WORKSPACE_SOURCE}/src/cpplexer/re2clex/cpp_re.cpp
        ${CMAKE_WORKSPACE_SOURCE}/src/wave_config_constant.cpp
        ${CMAKE_WORKSPACE_SOURCE}/src/instantiate_cpp_grammar.cpp
        ${CMAKE_WORKSPACE_SOURCE}/src/instantiate_re2c_lexer_str.cpp
        ${CMAKE_WORKSPACE_SOURCE}/src/instantiate_cpp_literalgrs.cpp
        ${CMAKE_WORKSPACE_SOURCE}/src/token_ids.cpp
        ${CMAKE_WORKSPACE_SOURCE}/src/instantiate_re2c_lexer.cpp
        ${CMAKE_WORKSPACE_SOURCE}/src/instantiate_cpp_exprgrammar.cpp
        ${CMAKE_WORKSPACE_SOURCE}/src/instantiate_predef_macros.cpp
        ${CMAKE_WORKSPACE_SOURCE}/src/instantiate_defined_grammar.cpp
            )

if(BUILD_SHARED_LIBS)
    target_compile_definitions(${CMAKE_WORKSPACE_NAME}_wave PRIVATE -DBOOST_ALL_DYN_LINK=1)
else()
    target_compile_definitions(${CMAKE_WORKSPACE_NAME}_wave PRIVATE -DBOOST_THREAD_USE_LIB=1)
endif()

set_property(TARGET ${CMAKE_WORKSPACE_NAME}_wave PROPERTY EXPORT_NAME wave)

target_link_libraries(${CMAKE_WORKSPACE_NAME}_wave PUBLIC boost::core)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_wave PUBLIC boost::static_assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_wave PUBLIC boost::iterator)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_wave PUBLIC boost::mpl)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_wave PUBLIC boost::multi_index)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_wave PUBLIC boost::spirit)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_wave PUBLIC boost::assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_wave PUBLIC boost::type_traits)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_wave PUBLIC boost::concept_check)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_wave PUBLIC boost::preprocessor)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_wave PUBLIC boost::filesystem)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_wave PUBLIC boost::serialization)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_wave PUBLIC boost::config)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_wave PUBLIC boost::throw_exception)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_wave PUBLIC boost::pool)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_wave PUBLIC boost::smart_ptr)


target_include_directories(${CMAKE_WORKSPACE_NAME}_wave PRIVATE ${CMAKE_WORKSPACE_SOURCE}/include)

bcm_deploy(TARGETS ${CMAKE_WORKSPACE_NAME}_wave INCLUDE ${CMAKE_WORKSPACE_SOURCE}/include NAMESPACE ${CMAKE_WORKSPACE_NAME}::)

add_subdirectory(test)
