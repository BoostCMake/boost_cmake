include(BCMTest)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)

find_package(${CMAKE_WORKSPACE_NAME}_static_assert)

bcm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_typeof
                        boost::static_assert
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

# bcm_test(NAME $(source:B)_native SOURCES $(source) COMPILE_ONLY)
# target_compile_definitions($(source:B)_native PUBLIC BOOST_TYPEOF_NATIVE)
# bcm_test(NAME $(source:B)_emulation SOURCES $(source) COMPILE_ONLY)
# target_compile_definitions($(source:B)_emulation PUBLIC BOOST_TYPEOF_EMULATION)

#    for local t in [ set.difference [ glob *.cpp ] : odr1.cpp odr2.cpp ]
file(GLOB test_sources RELATIVE "${CMAKE_CURRENT_SOURCE_DIR}" *_test*.cpp)
FOREACH(item ${test_sources})
    IF(${item} MATCHES "odr*.cpp")
        LIST(REMOVE_ITEM test_sources ${item})
    ENDIF(${item} MATCHES "odr*.cpp")
ENDFOREACH(item)

foreach(source IN LISTS test_sources)
    message(${source})
    string(REPLACE ".cpp" "" name "${source}")

    bcm_test(typeof_test_${name}_native SOURCES ${source} COMPILE_ONLY)
    target_compile_definitions(typeof_test_${name}_native PUBLIC BOOST_TYPEOF_NATIVE)

    bcm_test(typeof_test_${name}__emulation SOURCES ${source} COMPILE_ONLY)
    target_compile_definitions(typeof_test_${name}__emulation PUBLIC BOOST_TYPEOF_EMULATION)
endforeach()

bcm_test(NAME typeof_test_odr_native SOURCES ${CMAKE_WORKSPACE_SOURCE}/odr1.cpp)
target_compile_definitions(typeof_test_odr_native PUBLIC BOOST_TYPEOF_NATIVE)
bcm_test(NAME typeof_test_odr_emulation SOURCES ${CMAKE_WORKSPACE_SOURCE}/odr1.cpp)
target_compile_definitions(typeof_test_odr_emulation PUBLIC BOOST_TYPEOF_EMULATION)
bcm_test(NAME typeof_test_odr_no_uns SOURCES ${CMAKE_WORKSPACE_SOURCE}/odr_no_uns1.cpp)
target_compile_definitions(typeof_test_odr_no_uns PUBLIC BOOST_TYPEOF_EMULATION)


