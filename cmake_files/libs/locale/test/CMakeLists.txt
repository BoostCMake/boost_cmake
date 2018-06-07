include(BCMTest)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)


bcm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_locale
                        )

#
# Copyright 2011 Artyom Beilis
#
# Distributed under the Boost Software License, Version 1.0.
# (See accompanying file LICENSE_1_0.txt or copy at
# http://www.boost.org/LICENSE_1_0.txt.


# Make sure we get all defines we need
# Otherwise we would have problem knowing
# what backends are actually in use

# Shared boost.locale tests

# Configuration Information
bcm_test(NAME local_test_test_config SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_config.cpp)
# Shared
bcm_test(NAME local_test_test_utf SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_utf.cpp)
bcm_test(NAME local_test_test_date_time SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_date_time.cpp)
bcm_test(NAME local_test_test_ios_prop SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_ios_prop.cpp)
# bcm_test(NAME local_test_test_codecvt SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_codecvt.cpp)
bcm_test(NAME local_test_test_codepage_converter SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_codepage_converter.cpp)
bcm_test(NAME local_test_test_codepage SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_codepage.cpp)
bcm_test(NAME local_test_test_message SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_message.cpp)
bcm_test(NAME local_test_test_generator SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_generator.cpp)
# icu
bcm_test(NAME local_test_test_collate SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_collate.cpp)
bcm_test(NAME local_test_test_convert SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_convert.cpp)
bcm_test(NAME local_test_test_boundary SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_boundary.cpp)
bcm_test(NAME local_test_test_formatting SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_formatting.cpp)
bcm_test(NAME local_test_test_icu_vs_os_timezone SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_icu_vs_os_timezone.cpp)
# winapi
bcm_test(NAME local_test_test_winapi_collate SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_winapi_collate.cpp)
bcm_test(NAME local_test_test_winapi_convert SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_winapi_convert.cpp)
bcm_test(NAME local_test_test_winapi_formatting SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_winapi_formatting.cpp)
# posix
bcm_test(NAME local_test_test_posix_collate SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_posix_collate.cpp)
bcm_test(NAME local_test_test_posix_convert SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_posix_convert.cpp)
bcm_test(NAME local_test_test_posix_formatting SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_posix_formatting.cpp)
# std
bcm_test(NAME local_test_test_std_collate SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_std_collate.cpp)
bcm_test(NAME local_test_test_std_convert SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_std_convert.cpp)
bcm_test(NAME local_test_test_std_formatting SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_std_formatting.cpp)

# vim: tabstop=4 expandtab shiftwidth=4 softtabstop=4


