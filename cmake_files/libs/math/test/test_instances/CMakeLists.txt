workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)

file(GLOB SOURCES ${CMAKE_WORKSPACE_SOURCE}/*.cpp)
add_library(test_instances STATIC ${SOURCES})
target_link_libraries(test_instances ${CMAKE_WORKSPACE_NAME}_math)