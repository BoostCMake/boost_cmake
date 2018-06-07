include(BCMTest)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)

find_package(${CMAKE_WORKSPACE_NAME}_function)
find_package(${CMAKE_WORKSPACE_NAME}_mpl)
find_package(${CMAKE_WORKSPACE_NAME}_move)

bcm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_type_traits
                        boost::function
                        boost::mpl
                        boost::move
                        )

include(BCMProperties)

# TODO: We currently need to prepend ${CMAKE_WORKSPACE_NAME}_type_traits_ to all the tests
# we add here, otherwise some of them will conflict with tests in other
# Boost libraries. This is madness!

# Wrapper around bcm_test to set our own warning levels
function(type_traits_add_test target)
    bcm_test(NAME ${target} ${ARGN})
    if (NOT CMAKE_CXX_COMPILER_ID MATCHES "GNU")
        target_compile_options(${target} PRIVATE -Wall -Wno-ignored-qualifiers -Wno-unneeded-internal-declaration)
    else()
        target_compile_options(${target} PRIVATE -Wall)
    endif()
    set_target_properties(${target} PROPERTIES CXX_WARNINGS_AS_ERRORS On)
endfunction()

file(GLOB test_sources RELATIVE "${CMAKE_WORKSPACE_SOURCE}" ${CMAKE_WORKSPACE_SOURCE}/*_test*.cpp)
foreach(source IN LISTS test_sources)
    string(REPLACE ".cpp" "" name "${source}")
    type_traits_add_test(type_traits_test_${name} SOURCES ${CMAKE_WORKSPACE_SOURCE}/${source})
    set_target_properties(type_traits_test_${name} PROPERTIES CXX_RTTI On)
endforeach()

# These traits have both intrinsic support, and a std conforming version, test
# a version with intrinsics disabled for better code coverage:
set(intrinsic_tests has_nothrow_assign_test
    has_nothrow_constr_test
    has_nothrow_copy_test
    is_nothrow_move_assignable_test
    is_nothrow_move_constructible_test)
foreach(test IN LISTS intrinsic_tests)
    type_traits_add_test(type_traits_test_${test}_no_intrinsics SOURCES ${CMAKE_WORKSPACE_SOURCE}/${test}.cpp)
    target_compile_definitions(type_traits_test_${test}_no_intrinsics PRIVATE BOOST_TT_DISABLE_INTRINSICS)
endforeach()

bcm_test(NAME type_traits_test_common_type_fail SOURCES ${CMAKE_WORKSPACE_SOURCE}/common_type_fail.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME type_traits_test_is_copy_assignable SOURCES ${CMAKE_WORKSPACE_SOURCE}/is_copy_assignable.cpp)
bcm_test(NAME type_traits_test_udt_specialisations SOURCES ${CMAKE_WORKSPACE_SOURCE}/udt_specialisations.cpp)

if (NOT CMAKE_CXX_COMPILER_ID MATCHES "GNU")
    target_compile_options(type_traits_test_aligned_storage_test_a2 PRIVATE -Wall -Wno-missing-braces -Wno-c++11-narrowing)
endif()

if (CMAKE_CXX_COMPILER_ID MATCHES "GNU")
    target_compile_options(type_traits_test_has_multiplies_test PRIVATE -Wall -Wno-int-in-bool-context)
    target_compile_options(type_traits_test_has_complement_test PRIVATE -Wall -Wno-bool-operation)
    target_compile_options(type_traits_test_promote_mpl_test PRIVATE -Wall -Wno-parentheses)
    target_compile_options(type_traits_test_has_left_shift_test PRIVATE -Wall -Wno-int-in-bool-context)
endif()

if (APPLE)
    target_compile_options(type_traits_test_promote_enum_msvc_bug_test PRIVATE -Wall -Wno-unused-local-typedef)
    target_compile_options(type_traits_test_promote_basic_test PRIVATE -Wall -Wno-unused-local-typedef)
    target_compile_options(type_traits_test_promote_enum_test PRIVATE -Wall -Wno-unused-local-typedef)
    target_compile_options(type_traits_test_promote_mpl_test PRIVATE -Wall -Wno-unused-local-typedef)
endif()
