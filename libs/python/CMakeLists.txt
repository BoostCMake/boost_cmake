cmake_minimum_required(VERSION 3.5)


find_package(CM)
include(CMDeploy)
include(CMSetupVersion)

cm_project(${CMAKE_WORKSPACE_NAME} python)

find_package(${CMAKE_WORKSPACE_NAME}_function)
find_package(${CMAKE_WORKSPACE_NAME}_core)
find_package(${CMAKE_WORKSPACE_NAME}_static_assert)
find_package(${CMAKE_WORKSPACE_NAME}_iterator)
find_package(${CMAKE_WORKSPACE_NAME}_tuple)
find_package(${CMAKE_WORKSPACE_NAME}_bind)
find_package(${CMAKE_WORKSPACE_NAME}_mpl)
find_package(${CMAKE_WORKSPACE_NAME}_smart_ptr)
find_package(${CMAKE_WORKSPACE_NAME}_detail)
find_package(${CMAKE_WORKSPACE_NAME}_property_map)
find_package(${CMAKE_WORKSPACE_NAME}_type_traits)
find_package(${CMAKE_WORKSPACE_NAME}_preprocessor)
find_package(${CMAKE_WORKSPACE_NAME}_conversion)
find_package(${CMAKE_WORKSPACE_NAME}_foreach)
find_package(${CMAKE_WORKSPACE_NAME}_integer)
find_package(${CMAKE_WORKSPACE_NAME}_lexical_cast)
find_package(${CMAKE_WORKSPACE_NAME}_config)
find_package(${CMAKE_WORKSPACE_NAME}_numeric_conversion)
find_package(${CMAKE_WORKSPACE_NAME}_utility)
find_package(${CMAKE_WORKSPACE_NAME}_graph)

cm_setup_version(VERSION 1.59.0)

add_library(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME}
        ${CURRENT_SOURCES_DIR}/src/str.cpp
        ${CURRENT_SOURCES_DIR}/src/exec.cpp
        ${CURRENT_SOURCES_DIR}/src/object_operators.cpp
        ${CURRENT_SOURCES_DIR}/src/tuple.cpp
        ${CURRENT_SOURCES_DIR}/src/dict.cpp
        ${CURRENT_SOURCES_DIR}/src/wrapper.cpp
        ${CURRENT_SOURCES_DIR}/src/list.cpp
        ${CURRENT_SOURCES_DIR}/src/object_protocol.cpp
        ${CURRENT_SOURCES_DIR}/src/module.cpp
        ${CURRENT_SOURCES_DIR}/src/import.cpp
        ${CURRENT_SOURCES_DIR}/src/numeric.cpp
        ${CURRENT_SOURCES_DIR}/src/errors.cpp
        ${CURRENT_SOURCES_DIR}/src/long.cpp
        ${CURRENT_SOURCES_DIR}/src/slice.cpp
            )

set_property(TARGET ${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PROPERTY EXPORT_NAME python)

target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC boost::function)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC boost::core)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC boost::static_assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC boost::iterator)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC boost::tuple)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC boost::bind)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC boost::mpl)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC boost::smart_ptr)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC boost::detail)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC boost::property_map)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC boost::type_traits)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC boost::preprocessor)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC boost::conversion)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC boost::foreach)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC boost::integer)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC boost::lexical_cast)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC boost::config)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC boost::numeric_conversion)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC boost::utility)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC boost::graph)

find_package(PythonLibs)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${PYTHON_LIBRARIES})
target_include_directories(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC ${PYTHON_INCLUDE_DIRS})

target_sources(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PRIVATE
        ${CURRENT_SOURCES_DIR}/src/converter/arg_to_${CURRENT_PROJECT_NAME}_base.cpp
        ${CURRENT_SOURCES_DIR}/src/converter/builtin_converters.cpp
        ${CURRENT_SOURCES_DIR}/src/converter/from_${CURRENT_PROJECT_NAME}.cpp
        ${CURRENT_SOURCES_DIR}/src/converter/registry.cpp
        ${CURRENT_SOURCES_DIR}/src/converter/type_id.cpp
        ${CURRENT_SOURCES_DIR}/src/object/class.cpp
        ${CURRENT_SOURCES_DIR}/src/object/enum.cpp
        ${CURRENT_SOURCES_DIR}/src/object/function.cpp
        ${CURRENT_SOURCES_DIR}/src/object/function_doc_signature.cpp
        ${CURRENT_SOURCES_DIR}/src/object/inheritance.cpp
        ${CURRENT_SOURCES_DIR}/src/object/iterator.cpp
        ${CURRENT_SOURCES_DIR}/src/object/life_support.cpp
        ${CURRENT_SOURCES_DIR}/src/object/pickle_support.cpp
        ${CURRENT_SOURCES_DIR}/src/object/stl_iterator.cpp
        ${CURRENT_SOURCES_DIR}/src/object_operators.cpp
        ${CURRENT_SOURCES_DIR}/src/object_protocol.cpp
               )

if(NOT BUILD_SHARED_LIBS)
    target_compile_definitions(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PRIVATE -DBOOST_PYTHON_STATIC_LIB=1)
endif()

target_include_directories(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PRIVATE ${CURRENT_SOURCES_DIR}/include)

cm_deploy(TARGETS ${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} INCLUDE ${CURRENT_SOURCES_DIR}/include NAMESPACE ${CMAKE_WORKSPACE_NAME}::)

add_subdirectory(test)
