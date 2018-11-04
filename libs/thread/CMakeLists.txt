cmake_minimum_required(VERSION 3.5)

find_package(CM)
include(CMDeploy)
include(CMSetupVersion)

cm_project(${CMAKE_WORKSPACE_NAME} thread)

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

cm_setup_version(VERSION 1.60.0)

add_library(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME}
        ${CURRENT_SOURCES_DIR}/src/future.cpp
        ${CURRENT_SOURCES_DIR}/src/tss_null.cpp
            )

if(BUILD_SHARED_LIBS)
    target_compile_definitions(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PRIVATE -DBOOST_THREAD_USE_DLL=1)
else()
    target_compile_definitions(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PRIVATE -DBOOST_THREAD_USE_LIB=1)
endif()

target_compile_options(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PRIVATE -std=c++11)

set_property(TARGET ${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PROPERTY EXPORT_NAME thread)

target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::predef)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::move)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::functional)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::concept_check)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::atomic)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::io)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::utility)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::static_assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::container)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::system)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::type_traits)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::smart_ptr)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::intrusive)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::config)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::function)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::core)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::tuple)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::winapi)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::mpl)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::preprocessor)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::optional)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::date_time)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::exception)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::algorithm)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::chrono)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::bind)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::lexical_cast)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::throw_exception)

find_package(Threads)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC Threads::Threads)

if(WIN32)
    target_sources(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PRIVATE
            ${CURRENT_SOURCES_DIR}/src/win32/thread.cpp
            ${CURRENT_SOURCES_DIR}/src/win32/tss_dll.cpp
            ${CURRENT_SOURCES_DIR}/src/win32/tss_pe.cpp
                   )
else()
    target_sources(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PRIVATE
            ${CURRENT_SOURCES_DIR}/src/pthread/thread.cpp
            ${CURRENT_SOURCES_DIR}/src/pthread/once.cpp
                   )
endif()

target_include_directories(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PRIVATE ${CURRENT_SOURCES_DIR}/include)

cm_deploy(TARGETS ${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} INCLUDE ${CURRENT_SOURCES_DIR}/include NAMESPACE ${CMAKE_WORKSPACE_NAME}::)

add_subdirectory(test)
