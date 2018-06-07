include(BCMTest)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)

find_package(${CMAKE_WORKSPACE_NAME}_test)
find_package(${CMAKE_WORKSPACE_NAME}_functional)

bcm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_array
                        boost::test
                        boost::functional
                        )

#~ Copyright Rene Rivera 2008
#~ Distributed under the Boost Software License, Version 1.0.
#~ (See accompanying file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)


bcm_test(NAME array_test_array0 SOURCES ${CMAKE_WORKSPACE_SOURCE}/array0.cpp)
bcm_test(NAME array_test_array1 SOURCES ${CMAKE_WORKSPACE_SOURCE}/array1.cpp)
bcm_test(NAME array_test_array2 SOURCES ${CMAKE_WORKSPACE_SOURCE}/array2.cpp)
bcm_test(NAME array_test_array3 SOURCES ${CMAKE_WORKSPACE_SOURCE}/array3.cpp)
bcm_test(NAME array_test_array4 SOURCES ${CMAKE_WORKSPACE_SOURCE}/array4.cpp)
bcm_test(NAME array_test_array5 SOURCES ${CMAKE_WORKSPACE_SOURCE}/array5.cpp)
bcm_test(NAME array_test_array6 SOURCES ${CMAKE_WORKSPACE_SOURCE}/array6.cpp)
# bcm_test(NAME array_test_array7 SOURCES ${CMAKE_WORKSPACE_SOURCE}/array7.cpp)
# bcm_test(NAME array_test_array_getfail1 SOURCES ${CMAKE_WORKSPACE_SOURCE}/array_getfail1.cpp COMPILE_ONLY WILL_FAIL)
# bcm_test(NAME array_test_array_getfail2 SOURCES ${CMAKE_WORKSPACE_SOURCE}/array_getfail2.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME array_test_array_hash SOURCES ${CMAKE_WORKSPACE_SOURCE}/array_hash.cpp)
