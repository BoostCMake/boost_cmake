include(BCMTest)

find_package(${CMAKE_WORKSPACE_NAME}_tuple)
find_package(${CMAKE_WORKSPACE_NAME}_bind)
find_package(${CMAKE_WORKSPACE_NAME}_foreach)
find_package(${CMAKE_WORKSPACE_NAME}_test)
find_package(${CMAKE_WORKSPACE_NAME}_lexical_cast)

bcm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_coroutine
                        boost::tuple
                        boost::bind
                        boost::foreach
                        boost::test
                        boost::lexical_cast
                        )

# Boost.Coroutine Library Tests Jamfile

#          Copyright Oliver Kowalke 2009.
# Distributed under the Boost Software License, Version 1.0.
#    (See accompanying file LICENSE_1_0.txt or copy at
#          http://www.boost.org/LICENSE_1_0.txt)


bcm_test(NAME coroutine_test_test_asymmetric_coroutine SOURCES test_asymmetric_coroutine.cpp)
bcm_test(NAME coroutine_test_test_symmetric_coroutine SOURCES test_symmetric_coroutine.cpp)