cmake_minimum_required(VERSION 3.5)

find_package(CM)
include(CMDeploy)
include(CMSetupVersion)

cm_project(${CMAKE_WORKSPACE_NAME} signals)

find_package(${CMAKE_WORKSPACE_NAME}_align)
find_package(${CMAKE_WORKSPACE_NAME}_function)
find_package(${CMAKE_WORKSPACE_NAME}_core)
find_package(${CMAKE_WORKSPACE_NAME}_iterator)
find_package(${CMAKE_WORKSPACE_NAME}_optional)
find_package(${CMAKE_WORKSPACE_NAME}_mpl)
find_package(${CMAKE_WORKSPACE_NAME}_type_traits)
find_package(${CMAKE_WORKSPACE_NAME}_smart_ptr)
find_package(${CMAKE_WORKSPACE_NAME}_config)
find_package(${CMAKE_WORKSPACE_NAME}_any)
find_package(${CMAKE_WORKSPACE_NAME}_utility)

cm_setup_version(VERSION 1.60.0)

add_library(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME}
        ${CURRENT_SOURCES_DIR}/src/connection.cpp
        ${CURRENT_SOURCES_DIR}/src/slot.cpp
        ${CURRENT_SOURCES_DIR}/src/signal_base.cpp
        ${CURRENT_SOURCES_DIR}/src/named_slot_map.cpp
        ${CURRENT_SOURCES_DIR}/src/trackable.cpp
            )

if(BUILD_SHARED_LIBS)
    target_compile_definitions(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PRIVATE -DBOOST_SIGNALS_DYN_LINK=1 -DBOOST_SIGNALS_NO_LIB=1)
endif()

set_property(TARGET ${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PROPERTY EXPORT_NAME signals)

target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::align)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::function)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::core)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::iterator)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::optional)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::mpl)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::type_traits)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::smart_ptr)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::config)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::any)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${CMAKE_WORKSPACE_NAME}::utility)

target_include_directories(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PRIVATE ${CURRENT_SOURCES_DIR}/include)

cm_deploy(TARGETS ${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} INCLUDE ${CURRENT_SOURCES_DIR}/include NAMESPACE ${CMAKE_WORKSPACE_NAME}::)

add_subdirectory(test)
