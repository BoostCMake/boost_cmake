include(CMTest)

find_package(${CMAKE_WORKSPACE_NAME}_timer)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_container
                        ${CMAKE_WORKSPACE_NAME}::timer
                        )

file(GLOB TEST_FILES ${CURRENT_TEST_SOURCES_DIR}/*.cpp)
foreach(FILEB ${TEST_FILES})
    get_filename_component(NAME ${FILEB} NAME_WE)
    cm_test(NAME container_test_${NAME} SOURCES ${FILEB})
endforeach()
