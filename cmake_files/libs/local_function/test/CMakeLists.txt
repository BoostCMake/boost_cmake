include(BCMTest)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)

find_package(${CMAKE_WORKSPACE_NAME}_function)
find_package(${CMAKE_WORKSPACE_NAME}_core)
find_package(${CMAKE_WORKSPACE_NAME}_functional)

bcm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_local_function
                        boost::function
                        boost::core
                        boost::functional
                        )


# Copyright (C) 2009-2012 Lorenzo Caminiti
# Distributed under the Boost Software License, Version 1.0
# (see accompanying file LICENSE_1_0.txt or a copy at
# http://www.boost.org/LICENSE_1_0.txt)
# Home at http://www.boost.org/libs/local_function


# Sun does not automatically detect type-of emulation mode (force it).


bcm_test(NAME local_function_test_ten_void SOURCES ${CMAKE_WORKSPACE_SOURCE}/ten_void.cpp)
bcm_test(NAME local_function_test_ten_void_nova SOURCES ${CMAKE_WORKSPACE_SOURCE}/ten_void_nova.cpp)

function(compile_fail_vaseq target)
    bcm_test(NAME local_function_test_${target} SOURCES ${CMAKE_WORKSPACE_SOURCE}/${target}.cpp COMPILE_ONLY WILL_FAIL)
    bcm_test(NAME local_function_test_${target}_seq SOURCES ${CMAKE_WORKSPACE_SOURCE}/${target}_seq.cpp COMPILE_ONLY WILL_FAIL)
    bcm_test(NAME local_function_test_${target}_seq_nova SOURCES ${CMAKE_WORKSPACE_SOURCE}/${target}_seq_nova.cpp COMPILE_ONLY WILL_FAIL)
endfunction(compile_fail_vaseq)

function(run_vaseq target)
    bcm_test(NAME local_function_test_${target} SOURCES ${CMAKE_WORKSPACE_SOURCE}/${target}.cpp)
    bcm_test(NAME local_function_test_${target}_seq SOURCES ${CMAKE_WORKSPACE_SOURCE}/${target}_seq.cpp)
    bcm_test(NAME local_function_test_${target}_seq_nova SOURCES ${CMAKE_WORKSPACE_SOURCE}/${target}_seq_nova.cpp)
endfunction(run_vaseq)

run_vaseq(add)
if ((COMPILER_SUPPORTS_CXX20) OR (NOT CMAKE_CXX_COMPILER_ID MATCHES "GNU") OR (PROJECT_VERSION GREATER 1.59))
    run_vaseq(add_classifiers)

    target_compile_definitions(local_function_test_add_classifiers_seq_nova PRIVATE BOOST_NO_CXX11_AUTO_DECLARATIONS)
    target_compile_definitions(local_function_test_add_classifiers_seq PRIVATE BOOST_NO_CXX11_AUTO_DECLARATIONS)
    target_compile_definitions(local_function_test_add_classifiers PRIVATE BOOST_NO_CXX11_AUTO_DECLARATIONS)
endif()
run_vaseq(add_default)
run_vaseq(add_except)
run_vaseq(add_inline)
run_vaseq(add_params_only)
run_vaseq(add_template)
run_vaseq(add_this)
run_vaseq(add_typed)
run_vaseq(add_with_default)
run_vaseq(all_decl)
run_vaseq(factorial)
run_vaseq(goto)
compile_fail_vaseq(goto_error)
run_vaseq(macro_commas)
run_vaseq(nesting)
run_vaseq(operator)
compile_fail_vaseq(operator_error)
run_vaseq(overload)
run_vaseq(return_assign)
run_vaseq(return_derivative)
run_vaseq(return_inc)
run_vaseq(return_setget)
run_vaseq(return_this)
run_vaseq(same_line)
run_vaseq(transform)
run_vaseq(typeof)
run_vaseq(typeof_template)
