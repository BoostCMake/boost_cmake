# 
# Functions to create tests from the .ipp files
# 
function(create_test BOOST_CONFIG_MACRO BOOST_CONFIG_FILE POSITIVE_TEST EXPECT_SUCCESS PREFIX)
    string(TOLOWER ${BOOST_CONFIG_MACRO} BOOST_CONFIG_NS)
    if(${POSITIVE_TEST} EQUAL ${EXPECT_SUCCESS})
        set(BOOST_CONFIG_IFDEF "#ifdef")
    else()
        set(BOOST_CONFIG_IFDEF "#ifndef")
    endif()

    if(BOOST_CONFIG_MACRO MATCHES "BOOST_HAS_TR1.*")
        set(BOOST_CONFIG_TR1_INCLUDE "#include <boost/tr1/detail/config.hpp>")
    else()
        set(BOOST_CONFIG_TR1_INCLUDE "")
    endif()

    if(${EXPECT_SUCCESS})
        configure_file(pass.cpp ${BOOST_CONFIG_FILE}_pass.cpp)
        cm_test(NAME ${PREFIX}_${BOOST_CONFIG_FILE}_pass SOURCES ${CMAKE_CURRENT_BINARY_DIR}/${BOOST_CONFIG_FILE}_pass.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
        target_link_libraries(${PREFIX}_${BOOST_CONFIG_FILE}_pass config_threads)
    else()
        configure_file(fail.cpp ${BOOST_CONFIG_FILE}_fail.cpp)
        cm_test(NAME ${PREFIX}_${BOOST_CONFIG_FILE}_fail SOURCES ${CMAKE_CURRENT_BINARY_DIR}/${BOOST_CONFIG_FILE}_fail.cpp COMPILE_ONLY WILL_FAIL SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
        if(MSVC)
            target_compile_options(${PREFIX}_${BOOST_CONFIG_FILE}_fail PUBLIC /WX)
        else()
            target_compile_options(${PREFIX}_${BOOST_CONFIG_FILE}_fail PUBLIC -Werror -Wall)
        endif()
    endif()
endfunction()

function(parse_test SRC PREFIX)
    if(SRC MATCHES "boost_has_tr1.*")
        # Skip tr1 tests for now
        return()
    endif()
    set(MACRO_REGEX "//[ ]*MACRO[ ]*:[ ]*([A-Za-z0-9_]+)")
    file(STRINGS ${SRC} SRC_MACRO_LINE REGEX ${MACRO_REGEX})
    string(REGEX REPLACE ${MACRO_REGEX} "\\1" BOOST_CONFIG_MACRO ${SRC_MACRO_LINE})
    get_filename_component(BOOST_CONFIG_FILE ${SRC} NAME_WE)

    if(SRC MATCHES "boost_no_")
        set(POSITIVE_TEST 0)
    else()
        set(POSITIVE_TEST 1)
    endif()

    create_test(${BOOST_CONFIG_MACRO} ${BOOST_CONFIG_FILE} ${POSITIVE_TEST} 1 ${PREFIX})
    create_test(${BOOST_CONFIG_MACRO} ${BOOST_CONFIG_FILE} ${POSITIVE_TEST} 0 ${PREFIX})

endfunction()
