cmake_minimum_required(VERSION 3.5)

find_package(CM)
include(CMDeploy)
include(CMSetupVersion)

cm_project(${CMAKE_WORKSPACE_NAME} locale)

find_package(${CMAKE_WORKSPACE_NAME}_function)
find_package(${CMAKE_WORKSPACE_NAME}_static_assert)
find_package(${CMAKE_WORKSPACE_NAME}_thread)
find_package(${CMAKE_WORKSPACE_NAME}_iterator)
find_package(${CMAKE_WORKSPACE_NAME}_assert)
find_package(${CMAKE_WORKSPACE_NAME}_type_traits)
find_package(${CMAKE_WORKSPACE_NAME}_smart_ptr)
find_package(${CMAKE_WORKSPACE_NAME}_config)
find_package(${CMAKE_WORKSPACE_NAME}_unordered)
find_package(${CMAKE_WORKSPACE_NAME}_align)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)
find_package(ICU COMPONENTS uc dt in)
find_package(ICONV)

if(CMAKE_SYSTEM MATCHES "SunOS.*")
    set(BOOST_LOCALE_WITH_STD Off CACHE BOOL "")
else()
    set(BOOST_LOCALE_WITH_STD On CACHE BOOL "")
endif()

cm_setup_version(VERSION 1.60.0)

add_library(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME}
        ${CURRENT_SOURCES_DIR}/src/encoding/codepage.cpp
        ${CURRENT_SOURCES_DIR}/src/shared/date_time.cpp
        ${CURRENT_SOURCES_DIR}/src/shared/format.cpp
        ${CURRENT_SOURCES_DIR}/src/shared/formatting.cpp
        ${CURRENT_SOURCES_DIR}/src/shared/generator.cpp
        ${CURRENT_SOURCES_DIR}/src/shared/ids.cpp
        ${CURRENT_SOURCES_DIR}/src/shared/localization_backend.cpp
        ${CURRENT_SOURCES_DIR}/src/shared/message.cpp
        ${CURRENT_SOURCES_DIR}/src/shared/mo_lambda.cpp
        ${CURRENT_SOURCES_DIR}/src/util/codecvt_converter.cpp
        ${CURRENT_SOURCES_DIR}/src/util/default_${CURRENT_PROJECT_NAME}.cpp
        ${CURRENT_SOURCES_DIR}/src/util/info.cpp
        ${CURRENT_SOURCES_DIR}/src/util/locale_data.cpp
            )

if(BUILD_SHARED_LIBS)
    target_compile_definitions(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PRIVATE -DBOOST_LOCALE_DYN_LINK=1)
endif()

target_compile_options(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PRIVATE -std=c++11)
set_property(TARGET ${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PROPERTY EXPORT_NAME locale)

if(BOOST_LOCALE_WITH_STD)
    target_sources(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PRIVATE
            ${CURRENT_SOURCES_DIR}/src/std/codecvt.cpp
            ${CURRENT_SOURCES_DIR}/src/std/collate.cpp
            ${CURRENT_SOURCES_DIR}/src/std/converter.cpp
            ${CURRENT_SOURCES_DIR}/src/std/numeric.cpp
            ${CURRENT_SOURCES_DIR}/src/std/std_backend.cpp
            ${CURRENT_SOURCES_DIR}/src/util/gregorian.cpp
                   )
else()
    target_compile_definitions(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC BOOST_LOCALE_NO_STD_BACKEND=1)
endif()
if(ICONV_FOUND)
    target_compile_definitions(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC BOOST_LOCALE_WITH_ICONV=1)
    target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ICONV::ICONV)
endif()
if(ICU_FOUND)
    target_compile_definitions(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC BOOST_LOCALE_WITH_ICU=1)
    target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ICU::uc ICU::dt ICU::in)
    target_sources(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PRIVATE
            ${CURRENT_SOURCES_DIR}/src/icu/boundary.cpp
            ${CURRENT_SOURCES_DIR}/src/icu/codecvt.cpp
            ${CURRENT_SOURCES_DIR}/src/icu/collator.cpp
            ${CURRENT_SOURCES_DIR}/src/icu/conversion.cpp
            ${CURRENT_SOURCES_DIR}/src/icu/date_time.cpp
            ${CURRENT_SOURCES_DIR}/src/icu/formatter.cpp
            ${CURRENT_SOURCES_DIR}/src/icu/icu_backend.cpp
            ${CURRENT_SOURCES_DIR}/src/icu/numeric.cpp
            ${CURRENT_SOURCES_DIR}/src/icu/time_zone.cpp
                   )
endif()
if(WIN32)
    target_sources(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PRIVATE
            ${CURRENT_SOURCES_DIR}/src/win32/collate.cpp
            ${CURRENT_SOURCES_DIR}/src/win32/converter.cpp
            ${CURRENT_SOURCES_DIR}/src/win32/numeric.cpp
            ${CURRENT_SOURCES_DIR}/src/win32/win_backend.cpp
                   )
else()
    target_compile_definitions(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC BOOST_LOCALE_NO_WINAPI_BACKEND=1)
endif()
if(UNIX)
    target_sources(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PRIVATE
            ${CURRENT_SOURCES_DIR}/src/posix/collate.cpp
            ${CURRENT_SOURCES_DIR}/src/posix/converter.cpp
            ${CURRENT_SOURCES_DIR}/src/posix/numeric.cpp
            ${CURRENT_SOURCES_DIR}/src/posix/codecvt.cpp
            ${CURRENT_SOURCES_DIR}/src/posix/posix_backend.cpp
                   )
else()
    target_compile_definitions(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC BOOST_LOCALE_NO_POSIX_BACKEND=1)
endif()

target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::function)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::static_assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::thread)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::iterator)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::type_traits)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::smart_ptr)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::config)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::unordered)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::align)

target_include_directories(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PRIVATE ${CURRENT_SOURCES_DIR}/include)

cm_deploy(TARGETS ${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} INCLUDE ${CURRENT_SOURCES_DIR}/include NAMESPACE ${CMAKE_WORKSPACE_NAME}::)

add_subdirectory(test)