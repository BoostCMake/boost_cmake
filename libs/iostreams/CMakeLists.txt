cmake_minimum_required(VERSION 3.7)
project(${CMAKE_WORKSPACE_NAME}_iostreams)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(${CMAKE_WORKSPACE_NAME}_regex)
find_package(${CMAKE_WORKSPACE_NAME}_core)
find_package(${CMAKE_WORKSPACE_NAME}_static_assert)
find_package(${CMAKE_WORKSPACE_NAME}_function)
find_package(${CMAKE_WORKSPACE_NAME}_bind)
find_package(${CMAKE_WORKSPACE_NAME}_mpl)
find_package(${CMAKE_WORKSPACE_NAME}_random)
find_package(${CMAKE_WORKSPACE_NAME}_detail)
find_package(${CMAKE_WORKSPACE_NAME}_assert)
find_package(${CMAKE_WORKSPACE_NAME}_range)
find_package(${CMAKE_WORKSPACE_NAME}_type_traits)
find_package(${CMAKE_WORKSPACE_NAME}_preprocessor)
find_package(${CMAKE_WORKSPACE_NAME}_smart_ptr)
find_package(${CMAKE_WORKSPACE_NAME}_integer)
find_package(${CMAKE_WORKSPACE_NAME}_config)
find_package(${CMAKE_WORKSPACE_NAME}_throw_exception)
find_package(${CMAKE_WORKSPACE_NAME}_utility)

bcm_setup_version(VERSION 1.58.0)

add_library(${CMAKE_WORKSPACE_NAME}_iostreams
            src/gzip.cpp
            src/file_descriptor.cpp
            src/mapped_file.cpp
            )

if(BUILD_SHARED_LIBS)
    target_compile_definitions(${CMAKE_WORKSPACE_NAME}_iostreams PRIVATE -DBOOST_IOSTREAMS_DYN_LINK=1)
endif()

set_property(TARGET ${CMAKE_WORKSPACE_NAME}_iostreams PROPERTY EXPORT_NAME iostreams)

target_link_libraries(${CMAKE_WORKSPACE_NAME}_iostreams PUBLIC boost::regex)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_iostreams PUBLIC boost::core)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_iostreams PUBLIC boost::static_assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_iostreams PUBLIC boost::function)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_iostreams PUBLIC boost::bind)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_iostreams PUBLIC boost::mpl)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_iostreams PUBLIC boost::random)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_iostreams PUBLIC boost::detail)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_iostreams PUBLIC boost::assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_iostreams PUBLIC boost::range)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_iostreams PUBLIC boost::type_traits)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_iostreams PUBLIC boost::preprocessor)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_iostreams PUBLIC boost::smart_ptr)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_iostreams PUBLIC boost::integer)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_iostreams PUBLIC boost::config)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_iostreams PUBLIC boost::throw_exception)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_iostreams PUBLIC boost::utility)

find_package(ZLIB)
find_package(BZip2)

if(ZLIB_FOUND)
    target_link_libraries(${CMAKE_WORKSPACE_NAME}_iostreams PUBLIC ZLIB::ZLIB)
    target_sources(${CMAKE_WORKSPACE_NAME}_iostreams PRIVATE src/zlib.cpp)
endif()

if(BZip2_FOUND)
    target_link_libraries(${CMAKE_WORKSPACE_NAME}_iostreams PUBLIC BZip2::BZip2)
    target_sources(${CMAKE_WORKSPACE_NAME}_iostreams PRIVATE src/bzip2.cpp)
endif()


target_include_directories(${CMAKE_WORKSPACE_NAME}_iostreams PRIVATE include)

bcm_deploy(TARGETS ${CMAKE_WORKSPACE_NAME}_iostreams INCLUDE include NAMESPACE ${CMAKE_WORKSPACE_NAME}::)

add_subdirectory(test)
