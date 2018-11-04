include(CMTest)

find_package(${CMAKE_WORKSPACE_NAME}_function)
find_package(${CMAKE_WORKSPACE_NAME}_mpl)
find_package(${CMAKE_WORKSPACE_NAME}_move)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_type_traits
                        ${CMAKE_WORKSPACE_NAME}::function
                        ${CMAKE_WORKSPACE_NAME}::mpl
                        ${CMAKE_WORKSPACE_NAME}::move
                        )

include(CMProperties)

# Wrapper around cm_test to set our own warning levels
function(type_traits_add_test target)
    cm_test(NAME ${target} ${ARGN})
    if (NOT CMAKE_CXX_COMPILER_ID MATCHES "GNU")
        target_compile_options(${target} PRIVATE -Wall -Wno-ignored-qualifiers -Wno-unneeded-internal-declaration)
    else()
        target_compile_options(${target} PRIVATE -Wall)
    endif()
    set_target_properties(${target} PROPERTIES CXX_WARNINGS_AS_ERRORS On)
endfunction()

file(GLOB test_sources RELATIVE "${CURRENT_TEST_SOURCES_DIR}" ${CURRENT_TEST_SOURCES_DIR}/*_test*.cpp)
foreach(source IN LISTS test_sources)
    string(REPLACE ".cpp" "" name "${source}")
    type_traits_add_test(type_traits_test_${name} SOURCES ${CURRENT_TEST_SOURCES_DIR}/${source})
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
    type_traits_add_test(type_traits_test_${test}_no_intrinsics SOURCES ${CURRENT_TEST_SOURCES_DIR}/${test}.cpp)
    target_compile_definitions(type_traits_test_${test}_no_intrinsics PRIVATE -DBOOST_TT_DISABLE_INTRINSICS)
endforeach()
