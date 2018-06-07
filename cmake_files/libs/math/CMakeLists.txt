cmake_minimum_required(VERSION 3.5)
project(${CMAKE_WORKSPACE_NAME}_math)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)
include(CheckTypeSize)

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

bcm_setup_version(VERSION 1.58.0)

add_library(${CMAKE_WORKSPACE_NAME}_math INTERFACE)

set_property(TARGET ${CMAKE_WORKSPACE_NAME}_math PROPERTY EXPORT_NAME math)

target_link_libraries(${CMAKE_WORKSPACE_NAME}_math INTERFACE boost::format)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_math INTERFACE boost::function)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_math INTERFACE boost::core)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_math INTERFACE boost::static_assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_math INTERFACE boost::predef)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_math INTERFACE boost::tuple)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_math INTERFACE boost::array)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_math INTERFACE boost::mpl)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_math INTERFACE boost::atomic)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_math INTERFACE boost::detail)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_math INTERFACE boost::fusion)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_math INTERFACE boost::assert)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_math INTERFACE boost::range)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_math INTERFACE boost::type_traits)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_math INTERFACE boost::concept_check)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_math INTERFACE boost::smart_ptr)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_math INTERFACE boost::lexical_cast)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_math INTERFACE boost::utility)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_math INTERFACE boost::config)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_math INTERFACE boost::throw_exception)
target_link_libraries(${CMAKE_WORKSPACE_NAME}_math INTERFACE boost::lambda)

set(BOOST_MATH_c99_SOURCES
        ${CMAKE_WORKSPACE_SOURCE}/src/tr1/acosh
        ${CMAKE_WORKSPACE_SOURCE}/src/tr1/asinh
        ${CMAKE_WORKSPACE_SOURCE}/src/tr1/atanh
        ${CMAKE_WORKSPACE_SOURCE}/src/tr1/cbrt
        ${CMAKE_WORKSPACE_SOURCE}/src/tr1/copysign
        ${CMAKE_WORKSPACE_SOURCE}/src/tr1/erfc
        ${CMAKE_WORKSPACE_SOURCE}/src/tr1/erf
        ${CMAKE_WORKSPACE_SOURCE}/src/tr1/expm1
        ${CMAKE_WORKSPACE_SOURCE}/src/tr1/fmax
        ${CMAKE_WORKSPACE_SOURCE}/src/tr1/fmin
        ${CMAKE_WORKSPACE_SOURCE}/src/tr1/fpclassify
        ${CMAKE_WORKSPACE_SOURCE}/src/tr1/hypot
        ${CMAKE_WORKSPACE_SOURCE}/src/tr1/lgamma
        ${CMAKE_WORKSPACE_SOURCE}/src/tr1/llround
        ${CMAKE_WORKSPACE_SOURCE}/src/tr1/log1p
        ${CMAKE_WORKSPACE_SOURCE}/src/tr1/lround
        ${CMAKE_WORKSPACE_SOURCE}/src/tr1/nextafter
        ${CMAKE_WORKSPACE_SOURCE}/src/tr1/nexttoward
        ${CMAKE_WORKSPACE_SOURCE}/src/tr1/round
        ${CMAKE_WORKSPACE_SOURCE}/src/tr1/tgamma
        ${CMAKE_WORKSPACE_SOURCE}/src/tr1/trunc
    )

set(BOOST_MATH_tr1_SOURCES
        ${CMAKE_WORKSPACE_SOURCE}/src/tr1/assoc_laguerre
        ${CMAKE_WORKSPACE_SOURCE}/src/tr1/assoc_legendre
        ${CMAKE_WORKSPACE_SOURCE}/src/tr1/beta
        ${CMAKE_WORKSPACE_SOURCE}/src/tr1/comp_ellint_1
        ${CMAKE_WORKSPACE_SOURCE}/src/tr1/comp_ellint_2
        ${CMAKE_WORKSPACE_SOURCE}/src/tr1/comp_ellint_3
        ${CMAKE_WORKSPACE_SOURCE}/src/tr1/cyl_bessel_i
        ${CMAKE_WORKSPACE_SOURCE}/src/tr1/cyl_bessel_j
        ${CMAKE_WORKSPACE_SOURCE}/src/tr1/cyl_bessel_k
        ${CMAKE_WORKSPACE_SOURCE}/src/tr1/cyl_neumann
        ${CMAKE_WORKSPACE_SOURCE}/src/tr1/ellint_1
        ${CMAKE_WORKSPACE_SOURCE}/src/tr1/ellint_2
        ${CMAKE_WORKSPACE_SOURCE}/src/tr1/ellint_3
        ${CMAKE_WORKSPACE_SOURCE}/src/tr1/expint
        ${CMAKE_WORKSPACE_SOURCE}/src/tr1/hermite
        ${CMAKE_WORKSPACE_SOURCE}/src/tr1/laguerre
        ${CMAKE_WORKSPACE_SOURCE}/src/tr1/legendre
        ${CMAKE_WORKSPACE_SOURCE}/src/tr1/riemann_zeta
        ${CMAKE_WORKSPACE_SOURCE}/src/tr1/sph_bessel
        ${CMAKE_WORKSPACE_SOURCE}/src/tr1/sph_legendre
        ${CMAKE_WORKSPACE_SOURCE}/src/tr1/sph_neumann
    )

function(add_boost_math_library NAME)
    set(SOURCES)
    foreach(SOURCE ${BOOST_MATH_${NAME}_SOURCES})
        list(APPEND SOURCES ${SOURCE}${ARGN}.cpp)
    endforeach()

    add_library(${CMAKE_WORKSPACE_NAME}_math_${NAME}${ARGN} ${SOURCES})

    if(BUILD_SHARED_LIBS)
        target_compile_definitions(${CMAKE_WORKSPACE_NAME}_math_${NAME}${ARGN} PRIVATE -DBOOST_MATH_TR1_DYN_LINK=1)
    endif()

    set_property(TARGET ${CMAKE_WORKSPACE_NAME}_math_${NAME}${ARGN} PROPERTY EXPORT_NAME math_${NAME}${ARGN})
    target_include_directories(${CMAKE_WORKSPACE_NAME}_math_${NAME}${ARGN} PRIVATE ${CMAKE_WORKSPACE_SOURCE}/src/tr1)
    target_link_libraries(${CMAKE_WORKSPACE_NAME}_math_${NAME}${ARGN} ${CMAKE_WORKSPACE_NAME}_math)
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

bcm_deploy(TARGETS ${CMAKE_WORKSPACE_NAME}_math ${CMAKE_WORKSPACE_NAME}_math_c99 ${CMAKE_WORKSPACE_NAME}_math_c99f ${CMAKE_WORKSPACE_NAME}_math_c99l ${CMAKE_WORKSPACE_NAME}_math_tr1 ${CMAKE_WORKSPACE_NAME}_math_tr1f ${CMAKE_WORKSPACE_NAME}_math_tr1l INCLUDE ${CMAKE_WORKSPACE_SOURCE}/include ${CMAKE_WORKSPACE_SOURCE}/include_private NAMESPACE ${CMAKE_WORKSPACE_NAME}::)

add_subdirectory(test)
