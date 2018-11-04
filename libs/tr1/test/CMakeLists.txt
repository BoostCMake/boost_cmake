include(CMTest)

patch_directory(${CURRENT_TEST_SOURCES_DIR} ${CMAKE_CURRENT_SOURCE_DIR}/files ${CMAKE_CURRENT_BINARY_DIR})

find_package(${CMAKE_WORKSPACE_NAME}_test)
find_package(${CMAKE_WORKSPACE_NAME}_concept_check)
find_package(${CMAKE_WORKSPACE_NAME}_program_options)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_tr1
                        ${CMAKE_WORKSPACE_NAME}::test
                        ${CMAKE_WORKSPACE_NAME}::concept_check
                        ${CMAKE_WORKSPACE_NAME}::program_options
                        )

# Copyright John Maddock 2005.
# Use, modification and distribution are subject to the
# Boost Software License, Version 1.0. (See accompanying file
# LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)


# Borland's broken include mechanism needs these extra headers:
# Sunpro's broken include mechanism needs these extra headers:


#
# define the sources which need testing, mostly this is just
# all the files *_test.cpp, but any badly named examples can
# be added to this list :-)
#

# this rule enumerates through all the sources and invokes
# the run rule for each source, the result is a list of all
# the run rules, which we can pass on to the test_suite rule:
#ECHO executing test_all rule ;

file(GLOB TEST_FILES ${CURRENT_TEST_SOURCES_DIR}/test*.cpp)
foreach(FILEB ${TEST_FILES})
    get_filename_component(NAME ${FILEB} NAME_WE)
    cm_test(NAME tr1_test_${NAME} SOURCES ${FILEB} COMPILE_ONLY SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
    cm_test(NAME tr1_test_std_${NAME} SOURCES ${FILEB} COMPILE_ONLY SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
    target_compile_definitions(tr1_test_std_${NAME} PUBLIC -DTEST_STD_HEADERS=1)
    target_include_directories(tr1_test_std_${NAME} PRIVATE ../include/boost/tr1/tr1/sun)
    target_include_directories(tr1_test_std_${NAME} PRIVATE ../include/boost/tr1/tr1/bcc32)
endforeach()

if ((__GLIBCXX__) OR (__GLIBCPP__))
file(GLOB RUN_TEST_TYPE_TRAITS ${CURRENT_TEST_SOURCES_DIR}/run*.cpp)
foreach(FILEB ${RUN_TEST_TYPE_TRAITS})
     get_filename_component(NAME ${FILEB} NAME_WE)

     cm_test(NAME tr1_test_${NAME} SOURCES ${FILEB} SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})

     cm_test(NAME tr1_test_std_${NAME} SOURCES ${FILEB} SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
     target_compile_definitions(tr1_test_std_${NAME} PUBLIC -DTEST_STD_HEADERS=1)
     target_include_directories(tr1_test_std_${NAME} PRIVATE ../include/boost/tr1/tr1/sun)
     target_include_directories(tr1_test_std_${NAME} PRIVATE ../include/boost/tr1/tr1/bcc32)
 endforeach()
endif()

file(GLOB CONFIG_COMPILE_FAIL_TEST_FILES ${CURRENT_TEST_SOURCES_DIR}/config/tr1_has_tr1*fail.cpp)
foreach(FILEB ${CONFIG_COMPILE_FAIL_TEST_FILES})
    get_filename_component(NAME ${FILEB} NAME_WE)
    cm_test(NAME tr1_test_${NAME} SOURCES ${FILEB} COMPILE_ONLY WILL_FAIL SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
endforeach()

file(GLOB CONFIG_COMPILE_TEST_FILES ${CURRENT_TEST_SOURCES_DIR}/config/tr1_has_tr1*pass.cpp)
foreach(FILEB ${CONFIG_COMPILE_TEST_FILES})
    get_filename_component(NAME ${FILEB} NAME_WE)
    cm_test(NAME tr1_test_${NAME} SOURCES ${FILEB} COMPILE_ONLY SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
endforeach()

file(GLOB CONFIG_COMPILE_TEST_FILES ${CURRENT_TEST_SOURCES_DIR}/type_traits/*.cpp)
foreach(FILEB ${CONFIG_COMPILE_TEST_FILES})
    get_filename_component(NAME ${FILEB} NAME_WE)
    cm_test(NAME tr1_test_${NAME} SOURCES ${FILEB} COMPILE_ONLY SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
    target_compile_definitions(tr1_test_${NAME} PUBLIC -DTEST_STD=2005)
endforeach()


file(GLOB STD_HEADERS_COMPILE_TEST_FILES ${CURRENT_TEST_SOURCES_DIR}/std_headers/*.cpp)
foreach(FILEB ${STD_HEADERS_COMPILE_TEST_FILES})
    get_filename_component(NAME ${FILEB} NAME_WE)
    cm_test(NAME tr1_test_${NAME}_std_header SOURCES ${FILEB} COMPILE_ONLY SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
    target_compile_definitions(tr1_test_${NAME}_std_header PUBLIC -DTEST_STD=2005)
endforeach()


file(GLOB CYCLE_DEPEND_COMPILE_TEST_FILES ${CURRENT_TEST_SOURCES_DIR}/cyclic_depend/*.cpp)
foreach(FILEB ${CYCLE_DEPEND_COMPILE_TEST_FILES})
    get_filename_component(NAME ${FILEB} NAME_WE)
    cm_test(NAME tr1_test_${NAME} SOURCES ${FILEB} COMPILE_ONLY SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
endforeach()


