include(BCMTest)

find_package(${CMAKE_WORKSPACE_NAME}_static_assert)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_typeof
                       ${CMAKE_WORKSPACE_NAME}::static_assert
                       )

# Copyright (C) 2006 Vladimir Prus
# Copyright (C) 2006 Arkadiy Vertleyb
# Use, modification and distribution is subject to the Boost Software
# License, Version 1.0. (http://www.boost.org/LICENSE_1_0.txt)

# Boost Typeof Library test Jamfile


# The special requirement is not ported yet.
#
#local rule special-requirements ( toolset variant : properties * )
#{
#    # Tru64/CXX6.5 hangs on most tests, so just turn it off completely.
#
#    if $(UNIX) && $(OS) = OSF
#    {
#        switch $(toolset)
#        {
#            case tru64cxx65* : properties =
#                [ replace-properties $(properties) : <build>no ] ;
#        }
#    }
#
#    return $(properties) ;
#}

# cm_test(NAME $(source:B)_native SOURCES $(source) COMPILE_ONLY)
# target_compile_definitions($(source:B)_native PUBLIC BOOST_TYPEOF_NATIVE)
# cm_test(NAME $(source:B)_emulation SOURCES $(source) COMPILE_ONLY)
# target_compile_definitions($(source:B)_emulation PUBLIC BOOST_TYPEOF_EMULATION)

#    for local t in [ set.difference [ glob *.cpp ] : odr1.cpp odr2.cpp ]
file(GLOB test_sources RELATIVE "${CMAKE_CURRENT_SOURCE_DIR}" *_test*.cpp)
foreach(item ${test_sources})
    if(${item} MATCHES "odr*.cpp")
        list(REMOVE_ITEM test_sources ${item})
    endif(${item} MATCHES "odr*.cpp")
endforeach(item)

foreach(source IN LISTS test_sources)
    message(${source})
    string(REPLACE ".cpp" "" name "${source}")

    cm_test(typeof_test_${name}_native SOURCES ${source} COMPILE_ONLY)
    target_compile_definitions(typeof_test_${name}_native PUBLIC BOOST_TYPEOF_NATIVE)

    cm_test(typeof_test_${name}__emulation SOURCES ${source} COMPILE_ONLY)
    target_compile_definitions(typeof_test_${name}__emulation PUBLIC BOOST_TYPEOF_EMULATION)
endforeach()

cm_test(NAME typeof_test_odr_native SOURCES odr1.cpp)
target_compile_definitions(typeof_test_odr_native PUBLIC BOOST_TYPEOF_NATIVE)
cm_test(NAME typeof_test_odr_emulation SOURCES odr1.cpp)
target_compile_definitions(typeof_test_odr_emulation PUBLIC BOOST_TYPEOF_EMULATION)
cm_test(NAME typeof_test_odr_no_uns SOURCES odr_no_uns1.cpp)
target_compile_definitions(typeof_test_odr_no_uns PUBLIC BOOST_TYPEOF_EMULATION)


