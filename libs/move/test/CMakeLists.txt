include(CMTest)

find_package(${CMAKE_WORKSPACE_NAME}_container)
find_package(${CMAKE_WORKSPACE_NAME}_timer)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_move
                        ${CMAKE_WORKSPACE_NAME}::container
                        ${CMAKE_WORKSPACE_NAME}::timer
                        )

##############################################################################
##
## (C) Copyright Ion Gaztanaga 2008-2009 Distributed under the Boost
## Software License, Version 1.0. (See accompanying file
## LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)
##
##
##############################################################################

file(GLOB TEST_FILES ${CURRENT_TEST_SOURCES_DIR}/*.cpp)
foreach(FILEB ${TEST_FILES})
    get_filename_component(NAME ${FILEB} NAME_WE)
    cm_test(NAME move_test_${NAME} SOURCES ${FILEB})
endforeach()
