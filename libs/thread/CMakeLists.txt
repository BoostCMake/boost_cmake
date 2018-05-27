cmake_minimum_required(VERSION 3.5)
project(${CMAKE_WORKSPACE_NAME}_thread)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(${CMAKE_WORKSPACE_NAME}_predef)
find_package(${CMAKE_WORKSPACE_NAME}_move)
find_package(${CMAKE_WORKSPACE_NAME}_functional)
find_package(${CMAKE_WORKSPACE_NAME}_concept_check)
find_package(${CMAKE_WORKSPACE_NAME}_atomic)
find_package(${CMAKE_WORKSPACE_NAME}_io)
find_package(${CMAKE_WORKSPACE_NAME}_utility)
find_package(${CMAKE_WORKSPACE_NAME}_static_assert)
find_package(${CMAKE_WORKSPACE_NAME}_container)
find_package(${CMAKE_WORKSPACE_NAME}_system)
find_package(${CMAKE_WORKSPACE_NAME}_type_traits)
find_package(${CMAKE_WORKSPACE_NAME}_smart_ptr)
find_package(${CMAKE_WORKSPACE_NAME}_intrusive)
find_package(${CMAKE_WORKSPACE_NAME}_config)
find_package(${CMAKE_WORKSPACE_NAME}_function)
find_package(${CMAKE_WORKSPACE_NAME}_core)
find_package(${CMAKE_WORKSPACE_NAME}_tuple)
find_package(${CMAKE_WORKSPACE_NAME}_winapi)
find_package(${CMAKE_WORKSPACE_NAME}_mpl)
find_package(${CMAKE_WORKSPACE_NAME}_assert)
find_package(${CMAKE_WORKSPACE_NAME}_preprocessor)
find_package(${CMAKE_WORKSPACE_NAME}_optional)
find_package(${CMAKE_WORKSPACE_NAME}_date_time)
find_package(${CMAKE_WORKSPACE_NAME}_exception)
find_package(${CMAKE_WORKSPACE_NAME}_algorithm)
find_package(${CMAKE_WORKSPACE_NAME}_chrono)
find_package(${CMAKE_WORKSPACE_NAME}_bind)
find_package(${CMAKE_WORKSPACE_NAME}_lexical_cast)
find_package(${CMAKE_WORKSPACE_NAME}_throw_exception)

bcm_setup_version(VERSION 1.58.0)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")
message(STATUS "Compiler is g++ c++11")

add_library(${CMAKE_WORKSPACE_NAME}_thread
            src/future.cpp
            src/tss_null.cpp
            )

if(BUILD_SHARED_LIBS)
    target_compile_definitions(${CMAKE_WORKSPACE_NAME}_thread PRIVATE -DBOOST_THREAD_USE_DLL=1)
else()
    target_compile_definitions(${CMAKE_WORKSPACE_NAME}_thread PRIVATE -DBOOST_THREAD_USE_LIB=1)
endif()

set_property(TARGET ${CMAKE_WORKSPACE_NAME}_thread PROPERTY EXPORT_NAME thread)

target_link_libraries(${CMAKE_WORKSPACE_NAME}_thread PUBLIC boost::predef)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_thread PUBLIC boost::move)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_thread PUBLIC boost::functional)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_thread PUBLIC boost::concept_check)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_thread PUBLIC boost::atomic)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_thread PUBLIC boost::io)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_thread PUBLIC boost::utility)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_thread PUBLIC boost::static_assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_thread PUBLIC boost::container)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_thread PUBLIC boost::system)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_thread PUBLIC boost::type_traits)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_thread PUBLIC boost::smart_ptr)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_thread PUBLIC boost::intrusive)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_thread PUBLIC boost::config)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_thread PUBLIC boost::function)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_thread PUBLIC boost::core)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_thread PUBLIC boost::tuple)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_thread PUBLIC boost::winapi)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_thread PUBLIC boost::mpl)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_thread PUBLIC boost::assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_thread PUBLIC boost::preprocessor)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_thread PUBLIC boost::optional)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_thread PUBLIC boost::date_time)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_thread PUBLIC boost::exception)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_thread PUBLIC boost::algorithm)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_thread PUBLIC boost::chrono)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_thread PUBLIC boost::bind)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_thread PUBLIC boost::lexical_cast)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_thread PUBLIC boost::throw_exception)

find_package(Threads)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_thread PUBLIC Threads::Threads)

if(WIN32)
    target_sources(${CMAKE_WORKSPACE_NAME}_thread PRIVATE
                   src/win32/thread.cpp
                   src/win32/tss_dll.cpp
                   src/win32/tss_pe.cpp
                   )
else()
    target_sources(${CMAKE_WORKSPACE_NAME}_thread PRIVATE
                   src/pthread/thread.cpp
                   src/pthread/once.cpp
                   )
endif()


target_include_directories(${CMAKE_WORKSPACE_NAME}_thread PRIVATE include)

bcm_deploy(TARGETS ${CMAKE_WORKSPACE_NAME}_thread INCLUDE include NAMESPACE ${CMAKE_WORKSPACE_NAME}::)

add_subdirectory(test)
