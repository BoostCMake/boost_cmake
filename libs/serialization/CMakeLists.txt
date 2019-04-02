cmake_minimum_required(VERSION 3.5)


find_package(CM)
include(CMDeploy)
include(CMSetupVersion)

cm_project(${CMAKE_WORKSPACE_NAME} serialization)

find_package(${CMAKE_WORKSPACE_NAME}_predef)
find_package(${CMAKE_WORKSPACE_NAME}_move)
find_package(${CMAKE_WORKSPACE_NAME}_io)
find_package(${CMAKE_WORKSPACE_NAME}_array)
find_package(${CMAKE_WORKSPACE_NAME}_unordered)
find_package(${CMAKE_WORKSPACE_NAME}_utility)
find_package(${CMAKE_WORKSPACE_NAME}_static_assert)
find_package(${CMAKE_WORKSPACE_NAME}_iterator)
find_package(${CMAKE_WORKSPACE_NAME}_detail)
find_package(${CMAKE_WORKSPACE_NAME}_type_traits)
find_package(${CMAKE_WORKSPACE_NAME}_smart_ptr)
find_package(${CMAKE_WORKSPACE_NAME}_config)
find_package(${CMAKE_WORKSPACE_NAME}_function)
find_package(${CMAKE_WORKSPACE_NAME}_core)
find_package(${CMAKE_WORKSPACE_NAME}_mpl)
find_package(${CMAKE_WORKSPACE_NAME}_variant)
find_package(${CMAKE_WORKSPACE_NAME}_assert)
find_package(${CMAKE_WORKSPACE_NAME}_preprocessor)
find_package(${CMAKE_WORKSPACE_NAME}_integer)
find_package(${CMAKE_WORKSPACE_NAME}_optional)
find_package(${CMAKE_WORKSPACE_NAME}_spirit)

cm_setup_version(VERSION 1.58.0)

#
# Compiler settings
#

message(STATUS "Compiler is ${CMAKE_CXX_COMPILER_ID}")

if(CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
    add_definitions(-ftemplate-depth=300)
    # we use gcc to test for C++03 compatibility
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++03")
    message(STATUS "Compiler is g++ c++03")
elseif(CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
    add_definitions(/wd4996)
    message(STATUS "Compiler is MSVC")
elseif(CMAKE_CXX_COMPILER_ID MATCHES "Clang")
    add_definitions(-ftemplate-depth=300)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")
elseif(APPLE)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -ftemplate-depth=300")
    #set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++98")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")
    set(CMAKE_CXX_FLAGS_DEBUG "-g -O0")
    set(CMAKE_CXX_FLAGS_RELWITHDEBINFO "-g -O3")
    set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -stdlib=libc++ -dead_strip")
endif()

#
# IDE settings
#

if(CMAKE_HOST_APPLE)
    # note: it seems that bjam builds both address models in any case
    # so we can defer this decision to the IDE just as we do for debug/release
    # so we'll not use this now
    # set(Boost_ADDRESS_MODEL 64 CACHE INTEGER "32/64 bits")
    set(Boost_USE_STATIC_LIBS ON CACHE BOOL "Link to Boost static libraries")
    set(Boost_USE_MULTITHREADED ON)
else()
    set(Boost_ADDRESS_MODEL 64 CACHE INTEGER "32/64 bits")
    set(Boost_USE_STATIC_LIBS ON CACHE BOOL "Link to Boost static libraries")
    set(Boost_USE_MULTITHREADED ON)
endif()

###########################
# library builds

add_library(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME}
        ${CURRENT_SOURCES_DIR}/src/basic_archive.cpp
        ${CURRENT_SOURCES_DIR}/src/basic_iarchive.cpp
        ${CURRENT_SOURCES_DIR}/src/basic_iserializer.cpp
        ${CURRENT_SOURCES_DIR}/src/basic_oarchive.cpp
        ${CURRENT_SOURCES_DIR}/src/basic_oserializer.cpp
        ${CURRENT_SOURCES_DIR}/src/basic_pointer_iserializer.cpp
        ${CURRENT_SOURCES_DIR}/src/basic_pointer_oserializer.cpp
        ${CURRENT_SOURCES_DIR}/src/basic_serializer_map.cpp
        ${CURRENT_SOURCES_DIR}/src/basic_text_iprimitive.cpp
        ${CURRENT_SOURCES_DIR}/src/basic_text_oprimitive.cpp
        ${CURRENT_SOURCES_DIR}/src/basic_xml_archive.cpp
        ${CURRENT_SOURCES_DIR}/src/binary_iarchive.cpp
        ${CURRENT_SOURCES_DIR}/src/binary_oarchive.cpp
        ${CURRENT_SOURCES_DIR}/src/extended_type_info.cpp
        ${CURRENT_SOURCES_DIR}/src/extended_type_info_typeid.cpp
        ${CURRENT_SOURCES_DIR}/src/extended_type_info_no_rtti.cpp
        ${CURRENT_SOURCES_DIR}/src/polymorphic_iarchive.cpp
        ${CURRENT_SOURCES_DIR}/src/polymorphic_oarchive.cpp
        ${CURRENT_SOURCES_DIR}/src/stl_port.cpp
        ${CURRENT_SOURCES_DIR}/src/text_iarchive.cpp
        ${CURRENT_SOURCES_DIR}/src/text_oarchive.cpp
        ${CURRENT_SOURCES_DIR}/src/void_cast.cpp
        ${CURRENT_SOURCES_DIR}/src/archive_exception.cpp
        ${CURRENT_SOURCES_DIR}/src/xml_grammar.cpp
        ${CURRENT_SOURCES_DIR}/src/xml_iarchive.cpp
        ${CURRENT_SOURCES_DIR}/src/xml_oarchive.cpp
        ${CURRENT_SOURCES_DIR}/src/xml_archive_exception.cpp
            # src/basic_xml_grammar.ipp # doesn't show up in "Source Files" in Xcode"'
            )

add_library(${CMAKE_WORKSPACE_NAME}_wserialization
        ${CURRENT_SOURCES_DIR}/src/basic_text_wiprimitive.cpp
        ${CURRENT_SOURCES_DIR}/src/basic_text_woprimitive.cpp
        ${CURRENT_SOURCES_DIR}/src/text_wiarchive.cpp
        ${CURRENT_SOURCES_DIR}/src/text_woarchive.cpp
        ${CURRENT_SOURCES_DIR}/src/utf8_codecvt_facet.cpp
        ${CURRENT_SOURCES_DIR}/src/xml_wgrammar.cpp
        ${CURRENT_SOURCES_DIR}/src/xml_wiarchive.cpp
        ${CURRENT_SOURCES_DIR}/src/xml_woarchive.cpp
        ${CURRENT_SOURCES_DIR}/src/codecvt_null.cpp
            )

if(BUILD_SHARED_LIBS)
    target_compile_definitions(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PRIVATE -DBOOST_SERIALIZATION_DYN_LINK=1)
    target_compile_definitions(${CMAKE_WORKSPACE_NAME}_wserialization PRIVATE -DBOOST_SERIALIZATION_DYN_LINK=1)
endif()
# end library build
###########################

set_property(TARGET ${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PROPERTY EXPORT_NAME serialization)
set_property(TARGET ${CMAKE_WORKSPACE_NAME}_wserialization PROPERTY EXPORT_NAME wserialization)

target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC boost::predef)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC boost::move)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC boost::io)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC boost::array)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC boost::unordered)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC boost::utility)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC boost::static_assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC boost::iterator)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC boost::detail)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC boost::type_traits)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC boost::smart_ptr)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC boost::config)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC boost::function)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC boost::core)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC boost::mpl)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC boost::variant)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC boost::assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC boost::preprocessor)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC boost::integer)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC boost::optional)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PUBLIC boost::spirit)

target_link_libraries(${CMAKE_WORKSPACE_NAME}_wserialization PUBLIC boost::move)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_wserialization PUBLIC boost::io)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_wserialization PUBLIC boost::array)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_wserialization PUBLIC boost::unordered)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_wserialization PUBLIC boost::utility)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_wserialization PUBLIC boost::static_assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_wserialization PUBLIC boost::iterator)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_wserialization PUBLIC boost::detail)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_wserialization PUBLIC boost::type_traits)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_wserialization PUBLIC boost::smart_ptr)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_wserialization PUBLIC boost::config)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_wserialization PUBLIC boost::function)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_wserialization PUBLIC boost::core)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_wserialization PUBLIC boost::mpl)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_wserialization PUBLIC boost::variant)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_wserialization PUBLIC boost::assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_wserialization PUBLIC boost::preprocessor)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_wserialization PUBLIC boost::integer)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_wserialization PUBLIC boost::optional)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_wserialization PUBLIC boost::spirit)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_wserialization PUBLIC boost::serialization)

target_include_directories(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PRIVATE ${CURRENT_SOURCES_DIR}/include)
target_include_directories(${CMAKE_WORKSPACE_NAME}_wserialization PRIVATE ${CURRENT_SOURCES_DIR}/include)

cm_deploy(TARGETS ${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} ${CMAKE_WORKSPACE_NAME}_wserialization INCLUDE ${CURRENT_SOURCES_DIR}/include NAMESPACE ${CMAKE_WORKSPACE_NAME}::)

#add_subdirectory(test)