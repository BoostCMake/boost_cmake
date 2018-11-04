cmake_minimum_required(VERSION 3.5)

list(APPEND CMAKE_MODULE_PATH
     "${CMAKE_CURRENT_LIST_DIR}/cmake"
     "${CMAKE_CURRENT_LIST_DIR}/cmake/modules/share/modules/cmake")

include(CMConfig)
include(CMSetupVersion)

set(BUILD_WITH_SOURCES_DIR "Sources directory" CACHE string "")

if(BUILD_WITH_SOURCES_DIR)
    cm_workspace(boost SOURCES_DIR ${BUILD_WITH_SOURCES_DIR})
else()
    cm_workspace(boost)
endif()

cm_setup_version(VERSION 1.60.0)

execute_process(COMMAND grep ${PROJECT_VERSION_MAJOR}_${PROJECT_VERSION_MINOR} ${CMAKE_WORKSPACE_SOURCES_DIR}/libs/config/include/boost/version.hpp
        RESULT_VARIABLE BAD_EXECUTE_RESULT OUTPUT_QUIET
        )

if (${BAD_EXECUTE_RESULT})
    message(FATAL_ERROR "Wrong boost version. Check boost version at ${CMAKE_WORKSPACE_SOURCES_DIR}/libs/config/include/boost/version.hpp")
endif()

macro(find_package NAME)
    if(NOT "${NAME}" MATCHES "^${CMAKE_WORKSPACE_NAME}_.*$" AND NOT "${NAME}" STREQUAL CM)
        _find_package(${ARGV})
    else()
        set(${ARGV0}_FOUND ON CACHE BOOL "")
    endif()
endmacro()

set(EXCLUDE_LIBS)

option(BUILD_SHARED_LIBS "Build shared libraries" TRUE)
option(BUILD_MULTITHREADED_LIBRARIES "Build multithreaded libraries" TRUE)

set(BUILD_WITH_TARGET_ARCHITECTURE "" CACHE string "Target build architecture")
set(APPLE_CODE_SIGN_IDENTITY "iPhone Developer: nemo1369@gmail.com (S686GL5RJ6)" CACHE STRING "Sign identity name")

#if(BUILD_WITH_TARGET_ARCHITECTURE)
#    set(CMAKE_TARGET_ARCHITECTURE ${BUILD_WITH_TARGET_ARCHITECTURE})
#else()
#    target_architecture(CMAKE_TARGET_ARCHITECTURE)
#endif()

set(Python_ADDITIONAL_VERSIONS 2)
find_package(PythonLibs 2 EXACT REQUIRED)
if(NOT PythonLibs_FOUND)
    list(APPEND EXCLUDE_LIBS python)
endif()
message (STATUS "Found Python: ${PYTHON_LIBRARIES}")


find_package(MPI)
if(NOT MPI_FOUND)
    list(APPEND EXCLUDE_LIBS mpi)
endif()

add_subdirectories(libs SUBMODULE_DEFINITION_HEADER "project\\(")
