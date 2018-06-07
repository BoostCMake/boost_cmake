include(BCMTest)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)

find_package(${CMAKE_WORKSPACE_NAME}_core)

bcm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_conversion
                        boost::core
                        )

# Copyright (C) 2001-2003 Douglas Gregor
# Copyright (C) 2011-2014 Antony Polukhin
#
# Distributed under the Boost Software License, Version 1.0. (See accompanying
# file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)
#

bcm_test(NAME conversion_test_implicit_cast SOURCES ${CMAKE_WORKSPACE_SOURCE}/implicit_cast.cpp)
bcm_test(NAME conversion_test_implicit_cast_fail SOURCES ${CMAKE_WORKSPACE_SOURCE}/implicit_cast_fail.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME conversion_test_cast_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/cast_test.cpp)
bcm_test(NAME conversion_test_polymorphic_cast_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/polymorphic_cast_test.cpp)
bcm_test(NAME conversion_test_implicit_cast_fail2 SOURCES ${CMAKE_WORKSPACE_SOURCE}/implicit_cast_fail2.cpp COMPILE_ONLY WILL_FAIL)
