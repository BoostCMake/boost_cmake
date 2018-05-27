
file(GLOB SOURCES *.cpp)
add_library(test_instances STATIC ${SOURCES})
target_link_libraries(test_instances ${CMAKE_WORKSPACE_NAME}_math)
