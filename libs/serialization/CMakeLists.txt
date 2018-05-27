cmake_minimum_required(VERSION 3.5)
project(${CMAKE_WORKSPACE_NAME}_serialization)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

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

bcm_setup_version(VERSION 1.58.0)

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

add_library(${CMAKE_WORKSPACE_NAME}_serialization
            src/basic_archive.cpp
            src/basic_iarchive.cpp
            src/basic_iserializer.cpp
            src/basic_oarchive.cpp
            src/basic_oserializer.cpp
            src/basic_pointer_iserializer.cpp
            src/basic_pointer_oserializer.cpp
            src/basic_serializer_map.cpp
            src/basic_text_iprimitive.cpp
            src/basic_text_oprimitive.cpp
            src/basic_xml_archive.cpp
            src/binary_iarchive.cpp
            src/binary_oarchive.cpp
            src/extended_type_info.cpp
            src/extended_type_info_typeid.cpp
            src/extended_type_info_no_rtti.cpp
            src/polymorphic_iarchive.cpp
            src/polymorphic_oarchive.cpp
            src/stl_port.cpp
            src/text_iarchive.cpp
            src/text_oarchive.cpp
            src/void_cast.cpp
            src/archive_exception.cpp
            src/xml_grammar.cpp
            src/xml_iarchive.cpp
            src/xml_oarchive.cpp
            src/xml_archive_exception.cpp
            # src/basic_xml_grammar.ipp # doesn't show up in "Source Files" in Xcode"'
            )

add_library(${CMAKE_WORKSPACE_NAME}_wserialization
            src/basic_text_wiprimitive.cpp
            src/basic_text_woprimitive.cpp
            src/text_wiarchive.cpp
            src/text_woarchive.cpp
            src/utf8_codecvt_facet.cpp
            src/xml_wgrammar.cpp
            src/xml_wiarchive.cpp
            src/xml_woarchive.cpp
            src/codecvt_null.cpp
            )

if(BUILD_SHARED_LIBS)
    target_compile_definitions(${CMAKE_WORKSPACE_NAME}_serialization PRIVATE -DBOOST_SERIALIZATION_DYN_LINK=1)
    target_compile_definitions(${CMAKE_WORKSPACE_NAME}_wserialization PRIVATE -DBOOST_SERIALIZATION_DYN_LINK=1)
endif()
# end library build
###########################

set_property(TARGET ${CMAKE_WORKSPACE_NAME}_serialization PROPERTY EXPORT_NAME serialization)
set_property(TARGET ${CMAKE_WORKSPACE_NAME}_wserialization PROPERTY EXPORT_NAME wserialization)

target_link_libraries(${CMAKE_WORKSPACE_NAME}_serialization PUBLIC boost::predef)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_serialization PUBLIC boost::move)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_serialization PUBLIC boost::io)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_serialization PUBLIC boost::array)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_serialization PUBLIC boost::unordered)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_serialization PUBLIC boost::utility)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_serialization PUBLIC boost::static_assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_serialization PUBLIC boost::iterator)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_serialization PUBLIC boost::detail)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_serialization PUBLIC boost::type_traits)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_serialization PUBLIC boost::smart_ptr)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_serialization PUBLIC boost::config)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_serialization PUBLIC boost::function)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_serialization PUBLIC boost::core)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_serialization PUBLIC boost::mpl)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_serialization PUBLIC boost::variant)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_serialization PUBLIC boost::assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_serialization PUBLIC boost::preprocessor)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_serialization PUBLIC boost::integer)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_serialization PUBLIC boost::optional)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_serialization PUBLIC boost::spirit)

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

target_include_directories(${CMAKE_WORKSPACE_NAME}_serialization PRIVATE include)
target_include_directories(${CMAKE_WORKSPACE_NAME}_wserialization PRIVATE include)

bcm_deploy(TARGETS ${CMAKE_WORKSPACE_NAME}_serialization ${CMAKE_WORKSPACE_NAME}_wserialization INCLUDE include NAMESPACE ${CMAKE_WORKSPACE_NAME}::)

add_subdirectory(test)