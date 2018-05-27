cmake_minimum_required(VERSION 3.5)
project(${CMAKE_WORKSPACE_NAME}_locale)

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
            src/encoding/codepage.cpp
            src/shared/date_time.cpp
            src/shared/format.cpp
            src/shared/formatting.cpp
            src/shared/generator.cpp
            src/shared/ids.cpp
            src/shared/localization_backend.cpp
            src/shared/message.cpp
            src/shared/mo_lambda.cpp
            src/util/codecvt_converter.cpp
            src/util/default_locale.cpp
            src/util/info.cpp
            src/util/locale_data.cpp
            )

if(BUILD_SHARED_LIBS)
    target_compile_definitions(${CMAKE_WORKSPACE_NAME}_locale PRIVATE -DBOOST_LOCALE_DYN_LINK=1)
endif()

set_property(TARGET ${CMAKE_WORKSPACE_NAME}_locale PROPERTY EXPORT_NAME locale)

if(BOOST_LOCALE_WITH_STD)
    target_sources(${CMAKE_WORKSPACE_NAME}_locale PRIVATE
                   src/std/codecvt.cpp
                   src/std/collate.cpp
                   src/std/converter.cpp
                   src/std/numeric.cpp
                   src/std/std_backend.cpp
                   src/util/gregorian.cpp
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
                   src/icu/boundary.cpp
                   src/icu/codecvt.cpp
                   src/icu/collator.cpp
                   src/icu/conversion.cpp
                   src/icu/date_time.cpp
                   src/icu/formatter.cpp
                   src/icu/icu_backend.cpp
                   src/icu/numeric.cpp
                   src/icu/time_zone.cpp
                   )
endif()
if(WIN32)
    target_sources(${CMAKE_WORKSPACE_NAME}_locale PRIVATE
                   src/win32/collate.cpp
                   src/win32/converter.cpp
                   src/win32/numeric.cpp
                   src/win32/win_backend.cpp
                   )
else()
    target_compile_definitions(${CMAKE_WORKSPACE_NAME}_locale PUBLIC BOOST_LOCALE_NO_WINAPI_BACKEND=1)
endif()
if(UNIX)
    target_sources(${CMAKE_WORKSPACE_NAME}_locale PRIVATE
                   src/posix/collate.cpp
                   src/posix/converter.cpp
                   src/posix/numeric.cpp
                   src/posix/codecvt.cpp
                   src/posix/posix_backend.cpp
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

target_include_directories(${CMAKE_WORKSPACE_NAME}_locale PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/include)

bcm_deploy(TARGETS ${CMAKE_WORKSPACE_NAME}_locale INCLUDE include NAMESPACE ${CMAKE_WORKSPACE_NAME}::)

add_subdirectory(test)
