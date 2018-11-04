include(CMTest)

patch_directory(${CURRENT_TEST_SOURCES_DIR} ${CMAKE_CURRENT_SOURCE_DIR}/files ${CMAKE_CURRENT_BINARY_DIR})

find_package(${CMAKE_WORKSPACE_NAME}_filesystem)
find_package(${CMAKE_WORKSPACE_NAME}_lexical_cast)
find_package(${CMAKE_WORKSPACE_NAME}_math)
find_package(${CMAKE_WORKSPACE_NAME}_test)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_serialization
                        ${CMAKE_WORKSPACE_NAME}_wserialization
                        ${CMAKE_WORKSPACE_NAME}::filesystem
                        ${CMAKE_WORKSPACE_NAME}::lexical_cast
                        ${CMAKE_WORKSPACE_NAME}::math
                        ${CMAKE_WORKSPACE_NAME}::test
                        )

# Boost serialization Library test Jamfile

#  (C) Copyright Robert Ramey 2002-2004.
#  Use, modification, and distribution are subject to the
#  Boost Software License, Version 1.0. (See accompanying file
#  LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

add_library(serialization_test_dll_a_lib STATIC ${CURRENT_TEST_SOURCES_DIR}/dll_a.cpp)
target_link_libraries(serialization_test_dll_a_lib ${CMAKE_WORKSPACE_NAME}_serialization)
cm_mark_as_test(serialization_test_dll_a_lib)

add_library(serialization_test_dll_base_lib STATIC ${CURRENT_TEST_SOURCES_DIR}/dll_base.cpp)
target_link_libraries(serialization_test_dll_base_lib ${CMAKE_WORKSPACE_NAME}_serialization)
cm_mark_as_test(serialization_test_dll_base_lib)

add_library(serialization_test_dll_derived2_lib STATIC ${CURRENT_TEST_SOURCES_DIR}/dll_derived2.cpp)
target_link_libraries(serialization_test_dll_derived2_lib ${CMAKE_WORKSPACE_NAME}_serialization serialization_test_dll_base_lib)
cm_mark_as_test(serialization_test_dll_derived2_lib)

add_library(serialization_test_dll_polymorphic_derived2_lib STATIC ${CURRENT_TEST_SOURCES_DIR}/polymorphic_derived2.cpp)
target_link_libraries(serialization_test_dll_polymorphic_derived2_lib ${CMAKE_WORKSPACE_NAME}_serialization)
cm_mark_as_test(serialization_test_dll_polymorphic_derived2_lib)

function(serialization_test test_name)
    set(arglist)
    foreach(a IN ITEMS ${ARGN})
        set(arglist ${arglist} ${CURRENT_TEST_SOURCES_DIR}/${a}.cpp)
    endforeach()
    cm_test(NAME serialization_test_${test_name} SOURCES ${CURRENT_TEST_SOURCES_DIR}/${test_name}.cpp ${arglist})
endfunction(serialization_test)

function(serialization_archive_test)
    set(oneValueArgs NAME SOURCES)
    set(multiValueArgs ARGS)
    cmake_parse_arguments(PARSE "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})
    set(arglist)
    foreach(a IN ITEMS ${PARSE_ARGS})
        set(arglist ${arglist} ${CURRENT_TEST_SOURCES_DIR}/${a}.cpp)
    endforeach()
    foreach(
            archive-name
            IN ITEMS text_archive text_warchive binary_archive xml_archive xml_warchive
    )
        set(amended_test_name ${PARSE_NAME}_${archive-name})
        if (PARSE_SOURCES)
            cm_test(NAME serialization_test_${amended_test_name} SOURCES ${PARSE_SOURCES}/${PARSE_NAME}.cpp ${arglist})
        else()
            cm_test(NAME serialization_test_${amended_test_name} SOURCES ${CURRENT_TEST_SOURCES_DIR}/${PARSE_NAME}.cpp ${arglist})
        endif()
        target_compile_definitions(serialization_test_${amended_test_name} PUBLIC BOOST_ARCHIVE_TEST=${archive-name}.hpp)
        if ((${PARSE_NAME} STREQUAL test_map_unordered) OR (${PARSE_NAME} STREQUAL test_set_unordered))
            target_compile_options(serialization_test_${amended_test_name} PRIVATE -std=c++11)
        endif()
        
    endforeach()
    
    
endfunction(serialization_archive_test)

function(serialization_polymorphic_archive_test test_name)
    set(arglist)
    foreach(a IN ITEMS ${ARGN})
        set(arglist ${arglist} ${CURRENT_TEST_SOURCES_DIR}/${a}.cpp)
    endforeach()
    foreach(
            archive-name
            IN ITEMS text_archive text_warchive binary_archive xml_archive xml_warchive
    )
        set(amended_test_name ${test_name}_polymorphic_${archive-name})
        cm_test(NAME serialization_test_${amended_test_name} SOURCES ${CURRENT_TEST_SOURCES_DIR}/${test_name}.cpp ${arglist})
        target_compile_definitions(serialization_test_${amended_test_name} PUBLIC BOOST_ARCHIVE_TEST=polymorphic_${archive-name}.hpp)
    endforeach()
endfunction(serialization_polymorphic_archive_test)

serialization_test(test_dll_exported)
target_link_libraries(serialization_test_test_dll_exported serialization_test_dll_polymorphic_derived2_lib)
serialization_test(test_dll_simple)
target_link_libraries(serialization_test_test_dll_simple serialization_test_dll_a_lib)
serialization_test(test_private_ctor)
serialization_test(test_reset_object_address A)
serialization_test(test_void_cast)
serialization_test(test_mult_archive_types)
serialization_test(test_iterators)
serialization_test(test_iterators_base64)
serialization_test(test_inclusion)
serialization_test(test_smart_cast)
serialization_test(test_codecvt_null ../src/codecvt_null)
serialization_test(test_utf8_codecvt ../src/utf8_codecvt_facet)

#test-suite "serialization"
serialization_archive_test(NAME test_array ARGS A)
serialization_archive_test(NAME test_binary)
serialization_archive_test(NAME test_bitset)
serialization_archive_test(NAME test_class_info_save)
serialization_archive_test(NAME test_class_info_load)
serialization_archive_test(NAME test_complex)
serialization_archive_test(NAME test_contained_class ARGS A)
serialization_archive_test(NAME test_cyclic_ptrs ARGS A)
serialization_archive_test(NAME test_delete_pointer)
serialization_archive_test(NAME test_deque ARGS A)
serialization_archive_test(NAME test_derived)
serialization_archive_test(NAME test_derived_class ARGS A)
serialization_archive_test(NAME test_derived_class_ptr ARGS A)
serialization_archive_test(NAME test_diamond)
serialization_archive_test(NAME test_diamond_complex)
serialization_archive_test(NAME test_exported polymorphic_base)
serialization_archive_test(NAME test_helper_support)
serialization_archive_test(NAME test_interrupts)
serialization_archive_test(NAME test_list ARGS A)
serialization_archive_test(NAME test_list_ptrs ARGS A)
serialization_archive_test(NAME test_map ARGS A)
serialization_archive_test(NAME test_map_unordered ARGS A)
serialization_archive_test(NAME test_map_boost_unordered ARGS A)
serialization_archive_test(NAME test_mi)
serialization_archive_test(NAME test_multiple_ptrs ARGS A)
serialization_archive_test(NAME test_multiple_inheritance)
# TODO: fix test. error: polymorphic_derived1.hpp:27: undefined reference to `vtable for polymorphic_derived1'
# serialization_archive_test(NAME test_no_rtti polymorphic_base polymorphic_derived1)
serialization_archive_test(NAME test_non_intrusive)
serialization_archive_test(NAME test_non_default_ctor)
serialization_archive_test(NAME test_non_default_ctor2)
serialization_archive_test(NAME test_null_ptr)
serialization_archive_test(NAME test_nvp ARGS A)
serialization_archive_test(NAME test_object)
serialization_archive_test(NAME test_primitive)
serialization_archive_test(NAME test_priority_queue ARGS A)
serialization_archive_test(NAME test_queue ARGS A)
serialization_archive_test(NAME test_recursion ARGS A)
serialization_archive_test(NAME test_registered)
serialization_archive_test(NAME test_set ARGS A)
serialization_archive_test(NAME test_set_hashed ARGS A)
serialization_archive_test(NAME test_set_unordered ARGS A)
serialization_archive_test(NAME test_set_boost_unordered ARGS A)
serialization_archive_test(NAME test_simple_class ARGS A)
serialization_archive_test(NAME test_simple_class_ptr ARGS A)
serialization_archive_test(NAME test_split)
serialization_archive_test(NAME test_stack ARGS A)
serialization_archive_test(NAME test_tracking)
serialization_archive_test(NAME test_unregistered)
serialization_archive_test(NAME test_unique_ptr)
serialization_archive_test(NAME test_valarray)
serialization_archive_test(NAME test_variant ARGS A)
serialization_archive_test(NAME test_vector ARGS A)
serialization_archive_test(NAME test_new_operator ARGS A)
serialization_archive_test(NAME test_optional)
serialization_archive_test(NAME test_shared_ptr)
serialization_archive_test(NAME test_shared_ptr_multi_base)
serialization_archive_test(NAME test_shared_ptr_132)
serialization_polymorphic_archive_test(test_polymorphic test_polymorphic_A A)
serialization_polymorphic_archive_test(test_polymorphic2 test_polymorphic2imp)
serialization_polymorphic_archive_test(test_polymorphic_helper)
        
cm_test(NAME serialization_test_test_dll_plugin SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_dll_plugin.cpp COMPILE_ONLY)

# Running the following test requires that the test know the directory 
# in which the dll is stored. I don't know how to extract this from bjam
# [ test-bsl-run test_dll_plugin : : dll_polymorphic_derived2_lib ]
serialization_archive_test(NAME test_private_ctor)
serialization_archive_test(NAME test_reset_object_address ARGS A)
serialization_archive_test(NAME test_void_cast)
serialization_archive_test(NAME test_mult_archive_types)

serialization_archive_test(NAME test_iterators)
serialization_archive_test(NAME test_iterators_base64)
serialization_archive_test(NAME test_inclusion)
serialization_archive_test(NAME test_smart_cast)

serialization_archive_test(NAME test_utf8_codecvt)
serialization_archive_test(NAME test_codecvt_null)

#[ test-bsl-run-no-lib test_z ]
cm_test(NAME serialization_test_test_not_serializable SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_not_serializable.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME serialization_test_test_traits_fail SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_traits_fail.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME serialization_test_test_const_load_fail1 SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_const_load_fail1.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME serialization_test_test_const_load_fail2 SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_const_load_fail2.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME serialization_test_test_const_load_fail3 SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_const_load_fail3.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME serialization_test_test_const_load_fail1_nvp SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_const_load_fail1_nvp.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME serialization_test_test_const_load_fail2_nvp SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_const_load_fail2_nvp.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME serialization_test_test_const_load_fail3_nvp SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_const_load_fail3_nvp.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME serialization_test_test_check SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_check.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME serialization_test_test_static_warning SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_static_warning.cpp COMPILE_ONLY)
cm_test(NAME serialization_test_test_const_save_warn1 SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_const_save_warn1.cpp COMPILE_ONLY)
cm_test(NAME serialization_test_test_const_save_warn2 SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_const_save_warn2.cpp COMPILE_ONLY)
cm_test(NAME serialization_test_test_const_save_warn3 SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_const_save_warn3.cpp COMPILE_ONLY)

# note - library unable to detect these errors for now
#[ compile test_const_save_warn1_nvp.cpp ]
#[ compile test_const_save_warn2_nvp.cpp ]
#[ compile test_const_save_warn3_nvp.cpp ]
cm_test(NAME serialization_test_test_traits_pass SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_traits_pass.cpp COMPILE_ONLY)
cm_test(NAME serialization_test_test_const_pass SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_const_pass.cpp COMPILE_ONLY)
