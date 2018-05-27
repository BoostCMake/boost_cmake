cmake_minimum_required(VERSION 3.5)
project(${CMAKE_WORKSPACE_NAME}_date_time)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(${CMAKE_WORKSPACE_NAME}_static_assert)
find_package(${CMAKE_WORKSPACE_NAME}_algorithm)
find_package(${CMAKE_WORKSPACE_NAME}_tokenizer)
find_package(${CMAKE_WORKSPACE_NAME}_mpl)
find_package(${CMAKE_WORKSPACE_NAME}_assert)
find_package(${CMAKE_WORKSPACE_NAME}_range)
find_package(${CMAKE_WORKSPACE_NAME}_type_traits)
find_package(${CMAKE_WORKSPACE_NAME}_smart_ptr)
find_package(${CMAKE_WORKSPACE_NAME}_io)
find_package(${CMAKE_WORKSPACE_NAME}_serialization)
find_package(${CMAKE_WORKSPACE_NAME}_lexical_cast)
find_package(${CMAKE_WORKSPACE_NAME}_config)
find_package(${CMAKE_WORKSPACE_NAME}_throw_exception)
find_package(${CMAKE_WORKSPACE_NAME}_utility)

bcm_setup_version(VERSION 1.58.0)

add_library(${CMAKE_WORKSPACE_NAME}_date_time
            src/gregorian/greg_month.cpp
            src/gregorian/greg_weekday.cpp
            src/gregorian/date_generators.cpp
            )

if(BUILD_SHARED_LIBS)
    target_compile_definitions(${CMAKE_WORKSPACE_NAME}_date_time PRIVATE -DBOOST_DATE_TIME_DYN_LINK=1)
else()
    target_compile_definitions(${CMAKE_WORKSPACE_NAME}_date_time PRIVATE -DBOOST_DATE_TIME_STATIC_LINK=1)
endif()

set_property(TARGET ${CMAKE_WORKSPACE_NAME}_date_time PROPERTY EXPORT_NAME date_time)

target_include_directories(${CMAKE_WORKSPACE_NAME}_date_time PRIVATE include)

target_link_libraries(${CMAKE_WORKSPACE_NAME}_date_time PUBLIC boost::static_assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_date_time PUBLIC boost::algorithm)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_date_time PUBLIC boost::tokenizer)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_date_time PUBLIC boost::mpl)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_date_time PUBLIC boost::assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_date_time PUBLIC boost::range)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_date_time PUBLIC boost::type_traits)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_date_time PUBLIC boost::smart_ptr)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_date_time PUBLIC boost::io)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_date_time PUBLIC boost::lexical_cast)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_date_time PUBLIC boost::config)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_date_time PUBLIC boost::throw_exception)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_date_time PUBLIC boost::utility)

bcm_deploy(TARGETS ${CMAKE_WORKSPACE_NAME}_date_time INCLUDE include NAMESPACE ${CMAKE_WORKSPACE_NAME}::)

add_subdirectory(test)
