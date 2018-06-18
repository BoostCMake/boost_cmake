include(BCMTest)

find_package(${CMAKE_WORKSPACE_NAME}_filesystem)
find_package(${CMAKE_WORKSPACE_NAME}_lexical_cast)
find_package(${CMAKE_WORKSPACE_NAME}_math)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_serialization
                       ${CMAKE_WORKSPACE_NAME}_wserialization
                       ${CMAKE_WORKSPACE_NAME}::filesystem
                       ${CMAKE_WORKSPACE_NAME}::lexical_cast
                       ${CMAKE_WORKSPACE_NAME}::math
                       )

# Boost serialization Library test Jamfile

#  (C) Copyright Robert Ramey 2002-2004.
#  Use, modification, and distribution are subject to the
#  Boost Software License, Version 1.0. (See accompanying file
#  LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)
#

include(CheckIncludeFileCXX)
# TODO: Deduce this value using Boost.Config
# set(COMPILER_SUPPORTS_CXX11 On)
check_cxx_compiler_flag("-std=c++11" COMPILER_SUPPORTS_CXX11)

# import rules for testing conditional on config file variables

# import rules from the boost serialization test
# import ../util/test : test-bsl-run-no-lib ;


add_library(serialization_test_dll_a_lib STATIC dll_a.cpp)
target_link_libraries(serialization_test_dll_a_lib ${CMAKE_WORKSPACE_NAME}_serialization)
cm_mark_as_test(serialization_test_dll_a_lib)

add_library(serialization_test_dll_base_lib STATIC dll_base.cpp)
target_link_libraries(serialization_test_dll_base_lib ${CMAKE_WORKSPACE_NAME}_serialization)
cm_mark_as_test(serialization_test_dll_base_lib)

add_library(serialization_test_dll_derived2_lib STATIC dll_derived2.cpp)
target_link_libraries(serialization_test_dll_derived2_lib ${CMAKE_WORKSPACE_NAME}_serialization serialization_test_dll_base_lib)
cm_mark_as_test(serialization_test_dll_derived2_lib)

add_library(serialization_test_dll_polymorphic_derived2_lib STATIC polymorphic_derived2.cpp)
target_link_libraries(serialization_test_dll_polymorphic_derived2_lib ${CMAKE_WORKSPACE_NAME}_serialization)
cm_mark_as_test(serialization_test_dll_polymorphic_derived2_lib)


# should compile
# cm_test(NAME serialization_test_strong_typedef_compile SOURCES test_strong_typedef.cpp COMPILE_ONLY)

# Running the following test requires that the test know the directory
# in which the dll is stored. I don't know how to extract this from bjam
# [ test-bsl-run test_dll_plugin : : dll_polymorphic_derived2_lib ]

#[ test-bsl-run test_z ]

# should fail compilation

# should compile with a warning message
# note - library unable to detect these errors for now
#[ compile test_const_save_warn1_nvp.cpp ]
#[ compile test_const_save_warn2_nvp.cpp ]
#[ compile test_const_save_warn3_nvp.cpp ]

function(serialization_test test_name)
    set(arglist)
    foreach(a IN ITEMS ${ARGN})
        set(arglist ${arglist} ${a}.cpp)
    endforeach()
    cm_test(NAME serialization_test_${test_name} SOURCES ${test_name}.cpp ${arglist})
endfunction(serialization_test)

function(serialization_archive_test test_name)
    set(arglist)
    foreach(a IN ITEMS ${ARGN})
        set(arglist ${arglist} ${a}.cpp)
    endforeach()
    foreach(
            archive-name
            IN ITEMS text_archive text_warchive binary_archive xml_archive xml_warchive
    )
        set(amended_test_name ${test_name}_${archive-name})
        cm_test(NAME serialization_test_${amended_test_name} SOURCES ${test_name}.cpp ${arglist})
        target_compile_definitions(serialization_test_${amended_test_name} PUBLIC BOOST_ARCHIVE_TEST=${archive-name}.hpp)
    endforeach()
endfunction(serialization_archive_test)

function(serialization_polymorphic_archive_test test_name)
    set(arglist)
    foreach(a IN ITEMS ${ARGN})
        set(arglist ${arglist} ${a}.cpp)
    endforeach()
    foreach(
            archive-name
            IN ITEMS text_archive text_warchive binary_archive xml_archive xml_warchive
    )
        set(amended_test_name ${test_name}_polymorphic_${archive-name})
        cm_test(NAME serialization_test_${amended_test_name} SOURCES ${test_name}.cpp ${arglist})
        target_compile_definitions(serialization_test_${amended_test_name} PUBLIC BOOST_ARCHIVE_TEST=polymorphic_${archive-name}.hpp)
    endforeach()
endfunction(serialization_polymorphic_archive_test)

serialization_test(test_dll_exported polymorphic_derived2)
# serialization_test(test_dll_simple polymorphic_derived2)
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
serialization_test(test_z)
# serialization_test(test_strong_typedef)

# serialization_archive_test(test_native_array A)
# serialization_archive_test(test_${CMAKE_WORKSPACE_NAME}_array A)
if(COMPILER_SUPPORTS_CXX11)
    serialization_archive_test(test_array A)
endif()
serialization_archive_test(test_binary)
serialization_archive_test(test_bitset)
serialization_archive_test(test_class_info_save)
serialization_archive_test(test_class_info_load)
serialization_archive_test(test_complex)
serialization_archive_test(test_contained_class A)
serialization_archive_test(test_cyclic_ptrs A)
serialization_archive_test(test_delete_pointer)
serialization_archive_test(test_deque A)
serialization_archive_test(test_derived)
serialization_archive_test(test_derived_class A)
serialization_archive_test(test_derived_class_ptr A)
serialization_archive_test(test_diamond)
serialization_archive_test(test_diamond_complex)
serialization_archive_test(test_exported polymorphic_base)
# serialization_archive_test(test_forward_list A)
# serialization_archive_test(test_forward_list_ptrs A)
serialization_archive_test(test_helper_support)
serialization_archive_test(test_interrupts)
serialization_archive_test(test_list A)
serialization_archive_test(test_list_ptrs A)
serialization_archive_test(test_map A)
# serialization_archive_test(test_map_${CMAKE_WORKSPACE_NAME}_unordered A)
serialization_archive_test(test_mi)
serialization_archive_test(test_multiple_ptrs A)
serialization_archive_test(test_multiple_inheritance)
serialization_archive_test(test_no_rtti polymorphic_base polymorphic_derived1)
serialization_archive_test(test_new_operator A)
serialization_archive_test(test_non_intrusive)
serialization_archive_test(test_non_default_ctor)
serialization_archive_test(test_non_default_ctor2)
serialization_archive_test(test_null_ptr)
serialization_archive_test(test_nvp A)
serialization_archive_test(test_object)
serialization_archive_test(test_optional)
serialization_archive_test(test_primitive)
serialization_archive_test(test_priority_queue A)
# serialization_archive_test(test_private_base)
# serialization_archive_test(test_private_base2)
serialization_archive_test(test_queue A)
serialization_archive_test(test_recursion A)
serialization_archive_test(test_registered)
serialization_archive_test(test_shared_ptr)
serialization_archive_test(test_shared_ptr_multi_base)
serialization_archive_test(test_shared_ptr_132)
serialization_archive_test(test_simple_class A)
serialization_archive_test(test_simple_class_ptr A)
check_include_file_cxx(slist SLIST_FOUND)
if(SLIST_FOUND)
    message(STATUS "slist header found")
    serialization_archive_test(test_slist A)
    serialization_archive_test(test_slist_ptr A)
else()
    message(STATUS "slist header NOT found")
endif()
serialization_archive_test(test_stack A)
serialization_archive_test(test_split)
serialization_archive_test(test_tracking)
serialization_archive_test(test_unregistered)
serialization_archive_test(test_unique_ptr)
serialization_archive_test(test_valarray)
serialization_archive_test(test_variant A)
serialization_archive_test(test_vector A)
serialization_archive_test(test_set A)
# serialization_archive_test(test_set_${CMAKE_WORKSPACE_NAME}_unordered A)
if(COMPILER_SUPPORTS_CXX11)
    # serialization_archive_test(test_set_unordered A)
else()
    check_include_file_cxx(hash_set HASH_SET_FOUND)
    if(HASH_SET_FOUND)
        serialization_archive_test(test_set_hashed A)
    endif()
endif()
if(COMPILER_SUPPORTS_CXX11)
    # serialization_archive_test(test_map_unordered A)
else()
    check_include_file_cxx(hash_map HASH_MAP_FOUND)
    if(HASH_MAP_FOUND)
        serialization_archive_test(test_map_hashed A)
    endif()
endif()

serialization_polymorphic_archive_test(test_polymorphic test_polymorphic_A A)
serialization_polymorphic_archive_test(test_polymorphic2 test_polymorphic2imp)
# serialization_polymorphic_archive_test(test_polymorphic_helper)

# should compile
cm_test(NAME serialization_test_test_dll_plugin SOURCES test_dll_plugin.cpp COMPILE_ONLY)
cm_test(NAME serialization_test_test_not_serializable SOURCES test_not_serializable.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME serialization_test_test_traits_fail SOURCES test_traits_fail.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME serialization_test_test_const_load_fail1 SOURCES test_const_load_fail1.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME serialization_test_test_const_load_fail2 SOURCES test_const_load_fail2.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME serialization_test_test_const_load_fail3 SOURCES test_const_load_fail3.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME serialization_test_test_const_load_fail1_nvp SOURCES test_const_load_fail1_nvp.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME serialization_test_test_const_load_fail2_nvp SOURCES test_const_load_fail2_nvp.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME serialization_test_test_const_load_fail3_nvp SOURCES test_const_load_fail3_nvp.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME serialization_test_test_check SOURCES test_check.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME serialization_test_test_static_warning SOURCES test_static_warning.cpp COMPILE_ONLY)
cm_test(NAME serialization_test_test_const_save_warn1 SOURCES test_const_save_warn1.cpp COMPILE_ONLY)
cm_test(NAME serialization_test_test_const_save_warn2 SOURCES test_const_save_warn2.cpp COMPILE_ONLY)
cm_test(NAME serialization_test_test_const_save_warn3 SOURCES test_const_save_warn3.cpp COMPILE_ONLY)
cm_test(NAME serialization_test_test_traits_pass SOURCES test_traits_pass.cpp COMPILE_ONLY)
cm_test(NAME serialization_test_test_const_pass SOURCES test_const_pass.cpp COMPILE_ONLY)
