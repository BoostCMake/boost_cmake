include(BCMTest)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_locale
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
cm_test(NAME local_test_test_config SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_config.cpp)
# Shared
cm_test(NAME local_test_test_utf SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_utf.cpp)
cm_test(NAME local_test_test_date_time SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_date_time.cpp)
cm_test(NAME local_test_test_ios_prop SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_ios_prop.cpp)
# cm_test(NAME local_test_test_codecvt SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_codecvt.cpp)
cm_test(NAME local_test_test_codepage_converter SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_codepage_converter.cpp)
cm_test(NAME local_test_test_codepage SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_codepage.cpp)
cm_test(NAME local_test_test_message SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_message.cpp)
cm_test(NAME local_test_test_generator SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_generator.cpp)
# icu
cm_test(NAME local_test_test_collate SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_collate.cpp)
cm_test(NAME local_test_test_convert SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_convert.cpp)
cm_test(NAME local_test_test_boundary SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_boundary.cpp)
cm_test(NAME local_test_test_formatting SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_formatting.cpp)
cm_test(NAME local_test_test_icu_vs_os_timezone SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_icu_vs_os_timezone.cpp)
# winapi
cm_test(NAME local_test_test_winapi_collate SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_winapi_collate.cpp)
cm_test(NAME local_test_test_winapi_convert SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_winapi_convert.cpp)
cm_test(NAME local_test_test_winapi_formatting SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_winapi_formatting.cpp)
# posix
cm_test(NAME local_test_test_posix_collate SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_posix_collate.cpp)
cm_test(NAME local_test_test_posix_convert SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_posix_convert.cpp)
cm_test(NAME local_test_test_posix_formatting SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_posix_formatting.cpp)
# std
cm_test(NAME local_test_test_std_collate SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_std_collate.cpp)
cm_test(NAME local_test_test_std_convert SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_std_convert.cpp)
cm_test(NAME local_test_test_std_formatting SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_std_formatting.cpp)

# vim: tabstop=4 expandtab shiftwidth=4 softtabstop=4


