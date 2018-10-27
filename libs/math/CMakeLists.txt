cmake_minimum_required(VERSION 3.5)

find_package(CM)
include(CMDeploy)
include(CMSetupVersion)
include(CheckTypeSize)

cm_project(${CMAKE_WORKSPACE_NAME} math)

find_package(${CMAKE_WORKSPACE_NAME}_format)
find_package(${CMAKE_WORKSPACE_NAME}_function)
find_package(${CMAKE_WORKSPACE_NAME}_core)
find_package(${CMAKE_WORKSPACE_NAME}_static_assert)
find_package(${CMAKE_WORKSPACE_NAME}_predef)
find_package(${CMAKE_WORKSPACE_NAME}_tuple)
find_package(${CMAKE_WORKSPACE_NAME}_array)
find_package(${CMAKE_WORKSPACE_NAME}_mpl)
find_package(${CMAKE_WORKSPACE_NAME}_atomic)
find_package(${CMAKE_WORKSPACE_NAME}_detail)
find_package(${CMAKE_WORKSPACE_NAME}_fusion)
find_package(${CMAKE_WORKSPACE_NAME}_assert)
find_package(${CMAKE_WORKSPACE_NAME}_range)
find_package(${CMAKE_WORKSPACE_NAME}_type_traits)
find_package(${CMAKE_WORKSPACE_NAME}_concept_check)
find_package(${CMAKE_WORKSPACE_NAME}_smart_ptr)
find_package(${CMAKE_WORKSPACE_NAME}_lexical_cast)
find_package(${CMAKE_WORKSPACE_NAME}_utility)
find_package(${CMAKE_WORKSPACE_NAME}_config)
find_package(${CMAKE_WORKSPACE_NAME}_throw_exception)
find_package(${CMAKE_WORKSPACE_NAME}_lambda)
find_package(${CMAKE_WORKSPACE_NAME}_test)

cm_setup_version(VERSION 1.60.0)

add_library(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} INTERFACE)

set_property(TARGET ${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} PROPERTY EXPORT_NAME math)

target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} INTERFACE ${CMAKE_WORKSPACE_NAME}::format)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} INTERFACE ${CMAKE_WORKSPACE_NAME}::function)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} INTERFACE ${CMAKE_WORKSPACE_NAME}::core)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} INTERFACE ${CMAKE_WORKSPACE_NAME}::static_assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} INTERFACE ${CMAKE_WORKSPACE_NAME}::predef)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} INTERFACE ${CMAKE_WORKSPACE_NAME}::tuple)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} INTERFACE ${CMAKE_WORKSPACE_NAME}::array)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} INTERFACE ${CMAKE_WORKSPACE_NAME}::mpl)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} INTERFACE ${CMAKE_WORKSPACE_NAME}::atomic)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} INTERFACE ${CMAKE_WORKSPACE_NAME}::detail)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} INTERFACE ${CMAKE_WORKSPACE_NAME}::fusion)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} INTERFACE ${CMAKE_WORKSPACE_NAME}::assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} INTERFACE ${CMAKE_WORKSPACE_NAME}::range)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} INTERFACE ${CMAKE_WORKSPACE_NAME}::type_traits)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} INTERFACE ${CMAKE_WORKSPACE_NAME}::concept_check)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} INTERFACE ${CMAKE_WORKSPACE_NAME}::smart_ptr)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} INTERFACE ${CMAKE_WORKSPACE_NAME}::lexical_cast)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} INTERFACE ${CMAKE_WORKSPACE_NAME}::utility)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} INTERFACE ${CMAKE_WORKSPACE_NAME}::config)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} INTERFACE ${CMAKE_WORKSPACE_NAME}::throw_exception)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} INTERFACE ${CMAKE_WORKSPACE_NAME}::lambda)
#target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} INTERFACE ${CMAKE_WORKSPACE_NAME}::test)

set(BOOST_MATH_c99_SOURCES
        ${CURRENT_SOURCES_DIR}/src/tr1/acosh
        ${CURRENT_SOURCES_DIR}/src/tr1/asinh
        ${CURRENT_SOURCES_DIR}/src/tr1/atanh
        ${CURRENT_SOURCES_DIR}/src/tr1/cbrt
        ${CURRENT_SOURCES_DIR}/src/tr1/copysign
        ${CURRENT_SOURCES_DIR}/src/tr1/erfc
        ${CURRENT_SOURCES_DIR}/src/tr1/erf
        ${CURRENT_SOURCES_DIR}/src/tr1/expm1
        ${CURRENT_SOURCES_DIR}/src/tr1/fmax
        ${CURRENT_SOURCES_DIR}/src/tr1/fmin
        ${CURRENT_SOURCES_DIR}/src/tr1/fpclassify
        ${CURRENT_SOURCES_DIR}/src/tr1/hypot
        ${CURRENT_SOURCES_DIR}/src/tr1/lgamma
        ${CURRENT_SOURCES_DIR}/src/tr1/llround
        ${CURRENT_SOURCES_DIR}/src/tr1/log1p
        ${CURRENT_SOURCES_DIR}/src/tr1/lround
        ${CURRENT_SOURCES_DIR}/src/tr1/nextafter
        ${CURRENT_SOURCES_DIR}/src/tr1/nexttoward
        ${CURRENT_SOURCES_DIR}/src/tr1/round
        ${CURRENT_SOURCES_DIR}/src/tr1/tgamma
        ${CURRENT_SOURCES_DIR}/src/tr1/trunc
    )

set(BOOST_MATH_tr1_SOURCES
        ${CURRENT_SOURCES_DIR}/src/tr1/assoc_laguerre
        ${CURRENT_SOURCES_DIR}/src/tr1/assoc_legendre
        ${CURRENT_SOURCES_DIR}/src/tr1/beta
        ${CURRENT_SOURCES_DIR}/src/tr1/comp_ellint_1
        ${CURRENT_SOURCES_DIR}/src/tr1/comp_ellint_2
        ${CURRENT_SOURCES_DIR}/src/tr1/comp_ellint_3
        ${CURRENT_SOURCES_DIR}/src/tr1/cyl_bessel_i
        ${CURRENT_SOURCES_DIR}/src/tr1/cyl_bessel_j
        ${CURRENT_SOURCES_DIR}/src/tr1/cyl_bessel_k
        ${CURRENT_SOURCES_DIR}/src/tr1/cyl_neumann
        ${CURRENT_SOURCES_DIR}/src/tr1/ellint_1
        ${CURRENT_SOURCES_DIR}/src/tr1/ellint_2
        ${CURRENT_SOURCES_DIR}/src/tr1/ellint_3
        ${CURRENT_SOURCES_DIR}/src/tr1/expint
        ${CURRENT_SOURCES_DIR}/src/tr1/hermite
        ${CURRENT_SOURCES_DIR}/src/tr1/laguerre
        ${CURRENT_SOURCES_DIR}/src/tr1/legendre
        ${CURRENT_SOURCES_DIR}/src/tr1/riemann_zeta
        ${CURRENT_SOURCES_DIR}/src/tr1/sph_bessel
        ${CURRENT_SOURCES_DIR}/src/tr1/sph_legendre
        ${CURRENT_SOURCES_DIR}/src/tr1/sph_neumann
    )

function(add_boost_math_library NAME)
    set(SOURCES)
    foreach(SOURCE ${BOOST_MATH_${NAME}_SOURCES})
        list(APPEND SOURCES ${SOURCE}${ARGN}.cpp)
    endforeach()

    add_library(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME}_${NAME}${ARGN} ${SOURCES})

    if(BUILD_SHARED_LIBS)
        target_compile_definitions(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME}_${NAME}${ARGN} PRIVATE -DBOOST_MATH_TR1_DYN_LINK=1)
    endif()

    set_property(TARGET ${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME}_${NAME}${ARGN} PROPERTY EXPORT_NAME math_${NAME}${ARGN})
    target_include_directories(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME}_${NAME}${ARGN} PRIVATE ${CURRENT_SOURCES_DIR}/src/tr1)
    target_link_libraries(${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME}_${NAME}${ARGN} ${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME})
endfunction()

check_type_size("long double" SIZEOF_LONG_DOUBLE)

add_boost_math_library(tr1)
add_boost_math_library(tr1 f)
if(HAVE_SIZEOF_LONG_DOUBLE)
    add_boost_math_library(tr1 l)
endif()

add_boost_math_library(c99)
add_boost_math_library(c99 f)
if(HAVE_SIZEOF_LONG_DOUBLE)
    add_boost_math_library(c99 l)
endif()

cm_deploy(TARGETS ${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME} ${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME}_c99 ${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME}_c99f ${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME}_c99l ${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME}_tr1 ${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME}_tr1f ${CMAKE_WORKSPACE_NAME}_${CURRENT_PROJECT_NAME}_tr1l INCLUDE ${CURRENT_SOURCES_DIR}/include ${CURRENT_SOURCES_DIR}/include_private NAMESPACE ${CMAKE_WORKSPACE_NAME}::)

add_subdirectory(test)
