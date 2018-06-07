cmake_minimum_required(VERSION 3.5)
project(${CMAKE_WORKSPACE_NAME}_locale)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

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

list(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake)
find_package(ICU COMPONENTS uc dt in)
find_package(ICONV)

if(CMAKE_SYSTEM MATCHES "SunOS.*")
    set(BOOST_LOCALE_WITH_STD Off CACHE BOOL "")
else()
    set(BOOST_LOCALE_WITH_STD On CACHE BOOL "")
endif()

bcm_setup_version(VERSION 1.58.0)

add_library(${CMAKE_WORKSPACE_NAME}_locale
        ${CMAKE_WORKSPACE_SOURCE}/src/encoding/codepage.cpp
        ${CMAKE_WORKSPACE_SOURCE}/src/shared/date_time.cpp
        ${CMAKE_WORKSPACE_SOURCE}/src/shared/format.cpp
        ${CMAKE_WORKSPACE_SOURCE}/src/shared/formatting.cpp
        ${CMAKE_WORKSPACE_SOURCE}/src/shared/generator.cpp
        ${CMAKE_WORKSPACE_SOURCE}/src/shared/ids.cpp
        ${CMAKE_WORKSPACE_SOURCE}/src/shared/localization_backend.cpp
        ${CMAKE_WORKSPACE_SOURCE}/src/shared/message.cpp
        ${CMAKE_WORKSPACE_SOURCE}/src/shared/mo_lambda.cpp
        ${CMAKE_WORKSPACE_SOURCE}/src/util/codecvt_converter.cpp
        ${CMAKE_WORKSPACE_SOURCE}/src/util/default_locale.cpp
        ${CMAKE_WORKSPACE_SOURCE}/src/util/info.cpp
        ${CMAKE_WORKSPACE_SOURCE}/src/util/locale_data.cpp
            )

if(BUILD_SHARED_LIBS)
    target_compile_definitions(${CMAKE_WORKSPACE_NAME}_locale PRIVATE -DBOOST_LOCALE_DYN_LINK=1)
endif()

set_property(TARGET ${CMAKE_WORKSPACE_NAME}_locale PROPERTY EXPORT_NAME locale)

if(BOOST_LOCALE_WITH_STD)
    target_sources(${CMAKE_WORKSPACE_NAME}_locale PRIVATE
            ${CMAKE_WORKSPACE_SOURCE}/src/std/codecvt.cpp
            ${CMAKE_WORKSPACE_SOURCE}/src/std/collate.cpp
            ${CMAKE_WORKSPACE_SOURCE}/src/std/converter.cpp
            ${CMAKE_WORKSPACE_SOURCE}/src/std/numeric.cpp
            ${CMAKE_WORKSPACE_SOURCE}/src/std/std_backend.cpp
            ${CMAKE_WORKSPACE_SOURCE}/src/util/gregorian.cpp
                   )
else()
    target_compile_definitions(${CMAKE_WORKSPACE_NAME}_locale PUBLIC BOOST_LOCALE_NO_STD_BACKEND=1)
endif()
if(ICONV_FOUND)
    target_compile_definitions(${CMAKE_WORKSPACE_NAME}_locale PUBLIC BOOST_LOCALE_WITH_ICONV=1)
    target_link_libraries(${CMAKE_WORKSPACE_NAME}_locale PUBLIC ICONV::ICONV)
endif()
if(ICU_FOUND)
    target_compile_definitions(${CMAKE_WORKSPACE_NAME}_locale PUBLIC BOOST_LOCALE_WITH_ICU=1)
    target_link_libraries(${CMAKE_WORKSPACE_NAME}_locale PUBLIC ICU::uc ICU::dt ICU::in)
    target_sources(${CMAKE_WORKSPACE_NAME}_locale PRIVATE
            ${CMAKE_WORKSPACE_SOURCE}/src/icu/boundary.cpp
            ${CMAKE_WORKSPACE_SOURCE}/src/icu/codecvt.cpp
            ${CMAKE_WORKSPACE_SOURCE}/src/icu/collator.cpp
            ${CMAKE_WORKSPACE_SOURCE}/src/icu/conversion.cpp
            ${CMAKE_WORKSPACE_SOURCE}/src/icu/date_time.cpp
            ${CMAKE_WORKSPACE_SOURCE}/src/icu/formatter.cpp
            ${CMAKE_WORKSPACE_SOURCE}/src/icu/icu_backend.cpp
            ${CMAKE_WORKSPACE_SOURCE}/src/icu/numeric.cpp
            ${CMAKE_WORKSPACE_SOURCE}/src/icu/time_zone.cpp
                   )
endif()
if(WIN32)
    target_sources(${CMAKE_WORKSPACE_NAME}_locale PRIVATE
            ${CMAKE_WORKSPACE_SOURCE}/src/win32/collate.cpp
            ${CMAKE_WORKSPACE_SOURCE}/src/win32/converter.cpp
            ${CMAKE_WORKSPACE_SOURCE}/src/win32/numeric.cpp
            ${CMAKE_WORKSPACE_SOURCE}/src/win32/win_backend.cpp
                   )
else()
    target_compile_definitions(${CMAKE_WORKSPACE_NAME}_locale PUBLIC BOOST_LOCALE_NO_WINAPI_BACKEND=1)
endif()
if(UNIX)
    target_sources(${CMAKE_WORKSPACE_NAME}_locale PRIVATE
            ${CMAKE_WORKSPACE_SOURCE}/src/posix/collate.cpp
            ${CMAKE_WORKSPACE_SOURCE}/src/posix/converter.cpp
            ${CMAKE_WORKSPACE_SOURCE}/src/posix/numeric.cpp
            ${CMAKE_WORKSPACE_SOURCE}/src/posix/codecvt.cpp
            ${CMAKE_WORKSPACE_SOURCE}/src/posix/posix_backend.cpp
                   )
else()
    target_compile_definitions(${CMAKE_WORKSPACE_NAME}_locale PUBLIC BOOST_LOCALE_NO_POSIX_BACKEND=1)
endif()

target_link_libraries(${CMAKE_WORKSPACE_NAME}_locale PUBLIC boost::function)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_locale PUBLIC boost::static_assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_locale PUBLIC boost::thread)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_locale PUBLIC boost::iterator)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_locale PUBLIC boost::assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_locale PUBLIC boost::type_traits)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_locale PUBLIC boost::smart_ptr)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_locale PUBLIC boost::config)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_locale PUBLIC boost::unordered)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_locale PUBLIC boost::align)

target_include_directories(${CMAKE_WORKSPACE_NAME}_locale PRIVATE ${CMAKE_WORKSPACE_SOURCE}/include)

bcm_deploy(TARGETS ${CMAKE_WORKSPACE_NAME}_locale INCLUDE ${CMAKE_WORKSPACE_SOURCE}/include NAMESPACE ${CMAKE_WORKSPACE_NAME}::)

add_subdirectory(test)
