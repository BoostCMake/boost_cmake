include(BCMTest)

find_package(${CMAKE_WORKSPACE_NAME}_test)
find_package(${CMAKE_WORKSPACE_NAME}_utility)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_numeric_conversion
                       ${CMAKE_WORKSPACE_NAME}::test
                       ${CMAKE_WORKSPACE_NAME}::utility
                       )

# Boost Numeric Conversion Library test Jamfile
#
# Copyright (C) 2003, Fernando Luis Cacciola Carballal.
#
# Distributed under the Boost Software License, Version 1.0. (See
# accompanying file LICENSE_1_0.txt or copy at
# http://www.boost.org/LICENSE_1_0.txt)
#
# import testing ;


cm_test(NAME numeric_conversion_test_bounds_test SOURCES bounds_test.cpp)
cm_test(NAME numeric_conversion_test_traits_test SOURCES traits_test.cpp)
cm_test(NAME numeric_conversion_test_converter_test SOURCES converter_test.cpp)
cm_test(NAME numeric_conversion_test_udt_support_test SOURCES udt_support_test.cpp)
cm_test(NAME numeric_conversion_test_numeric_cast_test SOURCES numeric_cast_test.cpp)
cm_test(NAME numeric_conversion_test_udt_example_0 SOURCES udt_example_0.cpp)
cm_test(NAME numeric_conversion_test_numeric_cast_traits_test SOURCES numeric_cast_traits_test.cpp)

cm_test(NAME numeric_conversion_test_compile_fail_built_in_numeric_cast_traits SOURCES compile_fail/built_in_numeric_cast_traits.cpp COMPILE_ONLY WILL_FAIL)


# support the old test target

