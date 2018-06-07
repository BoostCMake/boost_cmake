include(BCMTest)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)

find_package(${CMAKE_WORKSPACE_NAME}_serialization)

bcm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_date_time
                        boost::serialization)

add_library(data_time_tests_properties INTERFACE)
target_compile_definitions(data_time_tests_properties INTERFACE BOOST_DATE_TIME_POSIX_TIME_STD_CONFIG)
bcm_test_link_libraries(data_time_tests_properties)

bcm_test(NAME date_time_test_testint_adapter SOURCES ${CMAKE_WORKSPACE_SOURCE}/testint_adapter.cpp)
bcm_test(NAME date_time_test_testint64_range SOURCES ${CMAKE_WORKSPACE_SOURCE}/testint64_range.cpp)
bcm_test(NAME date_time_test_testtime_resolution_traits SOURCES ${CMAKE_WORKSPACE_SOURCE}/testtime_resolution_traits.cpp)
bcm_test(NAME date_time_test_testwrapping_int SOURCES ${CMAKE_WORKSPACE_SOURCE}/testwrapping_int.cpp)
bcm_test(NAME date_time_test_testconstrained_value SOURCES ${CMAKE_WORKSPACE_SOURCE}/testconstrained_value.cpp)
bcm_test(NAME date_time_test_testgregorian_calendar SOURCES ${CMAKE_WORKSPACE_SOURCE}/testgregorian_calendar.cpp)
bcm_test(NAME date_time_test_testgeneric_period SOURCES ${CMAKE_WORKSPACE_SOURCE}/testgeneric_period.cpp)

bcm_test(NAME date_time_test_gregorian_testdate SOURCES ${CMAKE_WORKSPACE_SOURCE}/gregorian/testdate.cpp)
bcm_test(NAME date_time_test_gregorian_testcurrent_day SOURCES ${CMAKE_WORKSPACE_SOURCE}/gregorian/testcurrent_day.cpp)
bcm_test(NAME date_time_test_gregorian_testdate_duration SOURCES ${CMAKE_WORKSPACE_SOURCE}/gregorian/testdate_duration.cpp)
bcm_test(NAME date_time_test_gregorian_testgreg_durations SOURCES ${CMAKE_WORKSPACE_SOURCE}/gregorian/testgreg_durations.cpp)
bcm_test(NAME date_time_test_gregorian_testperiod SOURCES ${CMAKE_WORKSPACE_SOURCE}/gregorian/testperiod.cpp)
bcm_test(NAME date_time_test_gregorian_testdate_iterator SOURCES ${CMAKE_WORKSPACE_SOURCE}/gregorian/testdate_iterator.cpp)
bcm_test(NAME date_time_test_gregorian_testformatters SOURCES ${CMAKE_WORKSPACE_SOURCE}/gregorian/testformatters.cpp)
#bcm_test(NAME date_time_test_gregorian_testformat_date_parser SOURCES ${CMAKE_WORKSPACE_SOURCE}/gregorian/testformat_date_parser.cpp)
###  streaming
bcm_test(NAME date_time_test_gregorian_testdate_facet_new SOURCES ${CMAKE_WORKSPACE_SOURCE}/gregorian/testdate_facet_new.cpp)
bcm_test(NAME date_time_test_gregorian_testdate_input_facet SOURCES ${CMAKE_WORKSPACE_SOURCE}/gregorian/testdate_input_facet.cpp)
###
bcm_test(NAME date_time_test_gregorian_testgenerators SOURCES ${CMAKE_WORKSPACE_SOURCE}/gregorian/testgenerators.cpp)
bcm_test(NAME date_time_test_gregorian_testgreg_cal SOURCES ${CMAKE_WORKSPACE_SOURCE}/gregorian/testgreg_cal.cpp)
bcm_test(NAME date_time_test_gregorian_testgreg_day SOURCES ${CMAKE_WORKSPACE_SOURCE}/gregorian/testgreg_day.cpp)
bcm_test(NAME date_time_test_gregorian_testgreg_month SOURCES ${CMAKE_WORKSPACE_SOURCE}/gregorian/testgreg_month.cpp)
bcm_test(NAME date_time_test_gregorian_testgreg_year SOURCES ${CMAKE_WORKSPACE_SOURCE}/gregorian/testgreg_year.cpp)
bcm_test(NAME date_time_test_testdate_dll SOURCES ${CMAKE_WORKSPACE_SOURCE}/gregorian/testdate.cpp)
bcm_test(NAME date_time_test_testdate_duration_dll SOURCES ${CMAKE_WORKSPACE_SOURCE}/gregorian/testdate_duration.cpp)
bcm_test(NAME date_time_test_testperiod_dll SOURCES ${CMAKE_WORKSPACE_SOURCE}/gregorian/testperiod.cpp)
bcm_test(NAME date_time_test_testdate_iterator_dll SOURCES ${CMAKE_WORKSPACE_SOURCE}/gregorian/testdate_iterator.cpp)
bcm_test(NAME date_time_test_testformatters_dll SOURCES ${CMAKE_WORKSPACE_SOURCE}/gregorian/testformatters.cpp)
###  streaming
bcm_test(NAME date_time_test_testdate_facet_new_dll SOURCES ${CMAKE_WORKSPACE_SOURCE}/gregorian/testdate_facet_new.cpp)
bcm_test(NAME date_time_test_testdate_input_facet_dll SOURCES ${CMAKE_WORKSPACE_SOURCE}/gregorian/testdate_input_facet.cpp)
###
bcm_test(NAME date_time_test_testgenerators_dll SOURCES ${CMAKE_WORKSPACE_SOURCE}/gregorian/testgenerators.cpp)
bcm_test(NAME date_time_test_testgreg_cal_dll SOURCES ${CMAKE_WORKSPACE_SOURCE}/gregorian/testgreg_cal.cpp)
bcm_test(NAME date_time_test_testgreg_day_dll SOURCES ${CMAKE_WORKSPACE_SOURCE}/gregorian/testgreg_day.cpp)
bcm_test(NAME date_time_test_testgreg_month_dll SOURCES ${CMAKE_WORKSPACE_SOURCE}/gregorian/testgreg_month.cpp)
bcm_test(NAME date_time_test_testgreg_year_dll SOURCES ${CMAKE_WORKSPACE_SOURCE}/gregorian/testgreg_year.cpp)
bcm_test(NAME date_time_test_testgreg_durations_dll SOURCES ${CMAKE_WORKSPACE_SOURCE}/gregorian/testgreg_durations.cpp)

bcm_test(NAME date_time_test_posix_time_testfiletime_functions SOURCES ${CMAKE_WORKSPACE_SOURCE}/posix_time/testfiletime_functions.cpp)
bcm_test(NAME date_time_test_posix_time_testlocal_adjustor SOURCES ${CMAKE_WORKSPACE_SOURCE}/posix_time/testlocal_adjustor.cpp)
bcm_test(NAME date_time_test_posix_time_testc_local_adjustor SOURCES ${CMAKE_WORKSPACE_SOURCE}/posix_time/testc_local_adjustor.cpp)
bcm_test(NAME date_time_test_posix_time_testclock SOURCES ${CMAKE_WORKSPACE_SOURCE}/posix_time/testclock.cpp)
bcm_test(NAME date_time_test_posix_time_testdst_rules SOURCES ${CMAKE_WORKSPACE_SOURCE}/posix_time/testdst_rules.cpp)
bcm_test(NAME date_time_test_posix_time_testduration SOURCES ${CMAKE_WORKSPACE_SOURCE}/posix_time/testduration.cpp)
bcm_test(NAME date_time_test_posix_time_testformatters SOURCES ${CMAKE_WORKSPACE_SOURCE}/posix_time/testformatters.cpp)
bcm_test(NAME date_time_test_posix_time_testiterator SOURCES ${CMAKE_WORKSPACE_SOURCE}/posix_time/testiterator.cpp)
bcm_test(NAME date_time_test_posix_time_testparse_time SOURCES ${CMAKE_WORKSPACE_SOURCE}/posix_time/testparse_time.cpp)
bcm_test(NAME date_time_test_posix_time_testtime_period SOURCES ${CMAKE_WORKSPACE_SOURCE}/posix_time/testtime_period.cpp)
bcm_test(NAME date_time_test_posix_time_testperiod SOURCES ${CMAKE_WORKSPACE_SOURCE}/posix_time/testperiod.cpp)
bcm_test(NAME date_time_test_posix_time_testtime SOURCES ${CMAKE_WORKSPACE_SOURCE}/posix_time/testtime.cpp)
bcm_test(NAME date_time_test_posix_time_testmicrosec_time_clock SOURCES ${CMAKE_WORKSPACE_SOURCE}/posix_time/testmicrosec_time_clock.cpp)
bcm_test(NAME date_time_test_posix_time_testtime_formatters SOURCES ${CMAKE_WORKSPACE_SOURCE}/posix_time/testtime_formatters.cpp)
bcm_test(NAME date_time_test_posix_time_testgreg_duration_operators SOURCES ${CMAKE_WORKSPACE_SOURCE}/posix_time/testgreg_duration_operators.cpp)
### streaming
bcm_test(NAME date_time_test_posix_time_testtime_facet SOURCES ${CMAKE_WORKSPACE_SOURCE}/posix_time/testtime_facet.cpp)
bcm_test(NAME date_time_test_posix_time_testtime_input_facet SOURCES ${CMAKE_WORKSPACE_SOURCE}/posix_time/testtime_input_facet.cpp)
###
bcm_test(NAME date_time_test_gregorian_testgreg_wstream SOURCES ${CMAKE_WORKSPACE_SOURCE}/gregorian/testgreg_wstream.cpp)
target_compile_definitions(date_time_test_gregorian_testgreg_wstream PUBLIC USE_DATE_TIME_PRE_1_33_FACET_IO)
bcm_test(NAME date_time_test_posix_time_testtime_wstream SOURCES ${CMAKE_WORKSPACE_SOURCE}/posix_time/testtime_wstream.cpp)
target_compile_definitions(date_time_test_posix_time_testtime_wstream PUBLIC USE_DATE_TIME_PRE_1_33_FACET_IO)

bcm_test(NAME date_time_test_testfacet_dll SOURCES ${CMAKE_WORKSPACE_SOURCE}/gregorian/testfacet.cpp)
target_compile_definitions(date_time_test_testfacet_dll PUBLIC USE_DATE_TIME_PRE_1_33_FACET_IO)
#  [ run gregorian/testparse_date.cpp ../build//${CMAKE_WORKSPACE_NAME}_date_time : : : $(DATE_TIME_DYNAMIC_PROPERTIES)  <define>USE_DATE_TIME_PRE_1_33_FACET_IO : testparse_date_dll ]
bcm_test(NAME date_time_test_gregorian_testfacet SOURCES ${CMAKE_WORKSPACE_SOURCE}/gregorian/testfacet.cpp)
target_compile_definitions(date_time_test_gregorian_testfacet PUBLIC USE_DATE_TIME_PRE_1_33_FACET_IO)
bcm_test(NAME date_time_test_gregorian_testparse_date SOURCES ${CMAKE_WORKSPACE_SOURCE}/gregorian/testparse_date.cpp)
target_compile_definitions(date_time_test_gregorian_testparse_date PUBLIC USE_DATE_TIME_PRE_1_33_FACET_IO)

bcm_test(NAME date_time_test_posix_time_teststreams SOURCES ${CMAKE_WORKSPACE_SOURCE}/posix_time/teststreams.cpp)
target_compile_definitions(date_time_test_posix_time_teststreams PUBLIC USE_DATE_TIME_PRE_1_33_FACET_IO)


bcm_test(NAME date_time_test_local_time_testdst_transition_day_rule SOURCES ${CMAKE_WORKSPACE_SOURCE}/local_time/testdst_transition_day_rule.cpp)
bcm_test(NAME date_time_test_local_time_testcustom_time_zone SOURCES ${CMAKE_WORKSPACE_SOURCE}/local_time/testcustom_time_zone.cpp)
bcm_test(NAME date_time_test_local_time_testposix_time_zone SOURCES ${CMAKE_WORKSPACE_SOURCE}/local_time/testposix_time_zone.cpp)
bcm_test(NAME date_time_test_local_time_testwcustom_time_zone SOURCES ${CMAKE_WORKSPACE_SOURCE}/local_time/testwcustom_time_zone.cpp)
bcm_test(NAME date_time_test_local_time_testwposix_time_zone SOURCES ${CMAKE_WORKSPACE_SOURCE}/local_time/testwposix_time_zone.cpp)
bcm_test(NAME date_time_test_local_time_testtz_database SOURCES ${CMAKE_WORKSPACE_SOURCE}/local_time/testtz_database.cpp)
bcm_test(NAME date_time_test_local_time_testlocal_time SOURCES ${CMAKE_WORKSPACE_SOURCE}/local_time/testlocal_time.cpp)
bcm_test(NAME date_time_test_local_time_testlocal_time_iterator SOURCES ${CMAKE_WORKSPACE_SOURCE}/local_time/testlocal_time_iterator.cpp)
bcm_test(NAME date_time_test_local_time_testlocal_time_period SOURCES ${CMAKE_WORKSPACE_SOURCE}/local_time/testlocal_time_period.cpp)
### streaming
bcm_test(NAME date_time_test_local_time_testlocal_time_facet SOURCES ${CMAKE_WORKSPACE_SOURCE}/local_time/testlocal_time_facet.cpp)
bcm_test(NAME date_time_test_local_time_testlocal_time_input_facet SOURCES ${CMAKE_WORKSPACE_SOURCE}/local_time/testlocal_time_input_facet.cpp)
###
bcm_test(NAME date_time_test_local_time_testclocks SOURCES ${CMAKE_WORKSPACE_SOURCE}/local_time/testclocks.cpp)


bcm_test(NAME date_time_test_testgreg_serialize_xml SOURCES ${CMAKE_WORKSPACE_SOURCE}/gregorian/testgreg_serialize.cpp)
target_compile_definitions(date_time_test_testgreg_serialize_xml PUBLIC DATE_TIME_XML_SERIALIZE)
bcm_test(NAME date_time_test_testtime_serialize_xml_std_config SOURCES ${CMAKE_WORKSPACE_SOURCE}/posix_time/testtime_serialize.cpp)
target_compile_definitions(date_time_test_testtime_serialize_xml_std_config PUBLIC DATE_TIME_XML_SERIALIZE BOOST_DATE_TIME_POSIX_TIME_STD_CONFIG)
bcm_test(NAME date_time_test_posix_time_testtime_serialize_xml SOURCES ${CMAKE_WORKSPACE_SOURCE}/posix_time/testtime_serialize.cpp)
target_compile_definitions(date_time_test_posix_time_testtime_serialize_xml PUBLIC DATE_TIME_XML_SERIALIZE)

bcm_test(NAME date_time_test_gregorian_testgreg_serialize SOURCES ${CMAKE_WORKSPACE_SOURCE}/gregorian/testgreg_serialize.cpp)
bcm_test(NAME date_time_test_posix_time_testtime_serialize SOURCES ${CMAKE_WORKSPACE_SOURCE}/posix_time/testtime_serialize.cpp)


# Copyright (c) 2000-2005
# CrystalClear Software, Inc.
# Subject to the Boost Software License, Version 1.0.
# (See accompanying file LICENSE_1_0.txt or
# http://www.boost.org/LICENSE_1_0.txt)
