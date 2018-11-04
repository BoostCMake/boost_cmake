include(CMTest)

find_package(${CMAKE_WORKSPACE_NAME}_core)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_conversion
                        ${CMAKE_WORKSPACE_NAME}::core
                        )

# Copyright (C) 2001-2003 Douglas Gregor
# Copyright (C) 2011-2014 Antony Polukhin
#
# Distributed under the Boost Software License, Version 1.0. (See accompanying
# file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)
#

#test-suite conversion
cm_test(NAME conversion_test_implicit_cast SOURCES ${CURRENT_TEST_SOURCES_DIR}/implicit_cast.cpp)
cm_test(NAME conversion_test_implicit_cast_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/implicit_cast_fail.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME conversion_test_cast_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/cast_test.cpp)
cm_test(NAME conversion_test_polymorphic_cast_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/polymorphic_cast_test.cpp)
cm_test(NAME conversion_test_implicit_cast_fail2 SOURCES ${CURRENT_TEST_SOURCES_DIR}/implicit_cast_fail2.cpp COMPILE_ONLY WILL_FAIL)
