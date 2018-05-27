include(BCMTest)

find_package(${CMAKE_WORKSPACE_NAME}_variant)
find_package(${CMAKE_WORKSPACE_NAME}_test)
find_package(${CMAKE_WORKSPACE_NAME}_array)
find_package(${CMAKE_WORKSPACE_NAME}_lexical_cast)
find_package(${CMAKE_WORKSPACE_NAME}_utility)

bcm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_context
                        boost::variant
                        boost::test
                        boost::array
                        boost::lexical_cast
                        boost::utility
                        )

# Boost.Context Library Tests Jamfile

#          Copyright Oliver Kowalke 2009.
# Distributed under the Boost Software License, Version 1.0.
#    (See accompanying file LICENSE_1_0.txt or copy at
#          http://www.boost.org/LICENSE_1_0.txt)


bcm_test(NAME context_test_test_context SOURCES test_context.cpp)
#bcm_test(NAME test_invoke SOURCES test_invoke.cpp)
#bcm_test(NAME test_apply SOURCES test_apply.cpp)
#bcm_test(NAME test_fcontext SOURCES test_fcontext.cpp)
#bcm_test(NAME test_execution_context SOURCES test_execution_context.cpp)
#bcm_test(NAME test_callcc SOURCES test_callcc.cpp)