cmake_minimum_required(VERSION 3.5)
project(${CMAKE_WORKSPACE_NAME}_python)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

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

bcm_setup_version(VERSION 1.58.0)

add_library(${CMAKE_WORKSPACE_NAME}_python
            src/str.cpp
            src/exec.cpp
            src/object_operators.cpp
            src/tuple.cpp
            src/dict.cpp
            src/wrapper.cpp
            src/list.cpp
            src/object_protocol.cpp
            src/module.cpp
            src/import.cpp
            src/numeric.cpp
            src/errors.cpp
            src/long.cpp
            src/slice.cpp
            )

set_property(TARGET ${CMAKE_WORKSPACE_NAME}_python PROPERTY EXPORT_NAME python)

target_link_libraries(${CMAKE_WORKSPACE_NAME}_python PUBLIC boost::function)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_python PUBLIC boost::core)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_python PUBLIC boost::static_assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_python PUBLIC boost::iterator)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_python PUBLIC boost::tuple)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_python PUBLIC boost::bind)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_python PUBLIC boost::mpl)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_python PUBLIC boost::smart_ptr)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_python PUBLIC boost::detail)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_python PUBLIC boost::property_map)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_python PUBLIC boost::type_traits)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_python PUBLIC boost::preprocessor)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_python PUBLIC boost::conversion)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_python PUBLIC boost::foreach)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_python PUBLIC boost::integer)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_python PUBLIC boost::lexical_cast)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_python PUBLIC boost::config)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_python PUBLIC boost::numeric_conversion)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_python PUBLIC boost::utility)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_python PUBLIC boost::graph)

find_package(PythonLibs)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_python PUBLIC ${PYTHON_LIBRARIES})
target_include_directories(${CMAKE_WORKSPACE_NAME}_python PUBLIC ${PYTHON_INCLUDE_DIRS})

target_sources(${CMAKE_WORKSPACE_NAME}_python PRIVATE
               src/converter/arg_to_python_base.cpp
               src/converter/builtin_converters.cpp
               src/converter/from_python.cpp
               src/converter/registry.cpp
               src/converter/type_id.cpp
               src/object/class.cpp
               src/object/enum.cpp
               src/object/function.cpp
               src/object/function_doc_signature.cpp
               src/object/inheritance.cpp
               src/object/iterator.cpp
               src/object/life_support.cpp
               src/object/pickle_support.cpp
               src/object/stl_iterator.cpp
               src/object_operators.cpp
               src/object_protocol.cpp
               )

if(NOT BUILD_SHARED_LIBS)
    target_compile_definitions(${CMAKE_WORKSPACE_NAME}_python PRIVATE -DBOOST_PYTHON_STATIC_LIB=1)
endif()

target_include_directories(${CMAKE_WORKSPACE_NAME}_python PRIVATE include)

bcm_deploy(TARGETS ${CMAKE_WORKSPACE_NAME}_python INCLUDE include NAMESPACE ${CMAKE_WORKSPACE_NAME}::)

add_subdirectory(test)
