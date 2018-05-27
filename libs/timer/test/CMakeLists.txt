include(BCMTest)

find_package(${CMAKE_WORKSPACE_NAME}_detail)

bcm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_timer
                        boost::detail
                        )

# Boost Timer Library test Jamfile

# Copyright Beman Dawes 2003, 2006, 2011

# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

# See library home page at http://www.boost.org/libs/timer

# when run from another directory, such as boost-root/status


#     [ run /boost/tools/inspect//inspect/<variant>release
#       : $(parent) -text -brief # command line
#       : # input files
#       : <dependency>/boost/filesystem//${CMAKE_WORKSPACE_NAME}_filesystem
#         <test-info>always_show_run_output # requirements
#       : inspect # test name
#     ]
bcm_test(NAME timer_test___example_auto_cpu_timer_example SOURCES ../example/auto_cpu_timer_example.cpp)
bcm_test(NAME timer_test_cpu_timer_info SOURCES cpu_timer_info.cpp)
bcm_test(NAME timer_test_cpu_timer_test SOURCES cpu_timer_test.cpp)
bcm_test(NAME timer_test___example_timex SOURCES ../example/timex.cpp ARGS echo "Hello, world")
bcm_test(NAME timer_test_original_timer_test SOURCES original_timer_test.cpp COMPILE_ONLY)

