include(BCMTest)

find_package(${CMAKE_WORKSPACE_NAME}_serialization)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_date_time
                        boost::serialization)

add_library(data_time_tests_properties INTERFACE)
target_compile_definitions(data_time_tests_properties INTERFACE BOOST_DATE_TIME_POSIX_TIME_STD_CONFIG)
cm_test_link_libraries(data_time_tests_properties)

cm_test(NAME date_time_test_testint_adapter SOURCES ${CURRENT_TEST_SOURCES_DIR}/testint_adapter.cpp)
cm_test(NAME date_time_test_testint64_range SOURCES ${CURRENT_TEST_SOURCES_DIR}/testint64_range.cpp)
cm_test(NAME date_time_test_testtime_resolution_traits SOURCES ${CURRENT_TEST_SOURCES_DIR}/testtime_resolution_traits.cpp)
cm_test(NAME date_time_test_testwrapping_int SOURCES ${CURRENT_TEST_SOURCES_DIR}/testwrapping_int.cpp)
cm_test(NAME date_time_test_testconstrained_value SOURCES ${CURRENT_TEST_SOURCES_DIR}/testconstrained_value.cpp)
cm_test(NAME date_time_test_testgregorian_calendar SOURCES ${CURRENT_TEST_SOURCES_DIR}/testgregorian_calendar.cpp)
cm_test(NAME date_time_test_testgeneric_period SOURCES ${CURRENT_TEST_SOURCES_DIR}/testgeneric_period.cpp)

cm_test(NAME date_time_test_gregorian_testdate SOURCES ${CURRENT_TEST_SOURCES_DIR}/gregorian/testdate.cpp)
cm_test(NAME date_time_test_gregorian_testcurrent_day SOURCES ${CURRENT_TEST_SOURCES_DIR}/gregorian/testcurrent_day.cpp)
cm_test(NAME date_time_test_gregorian_testdate_duration SOURCES ${CURRENT_TEST_SOURCES_DIR}/gregorian/testdate_duration.cpp)
cm_test(NAME date_time_test_gregorian_testgreg_durations SOURCES ${CURRENT_TEST_SOURCES_DIR}/gregorian/testgreg_durations.cpp)
cm_test(NAME date_time_test_gregorian_testperiod SOURCES ${CURRENT_TEST_SOURCES_DIR}/gregorian/testperiod.cpp)
cm_test(NAME date_time_test_gregorian_testdate_iterator SOURCES ${CURRENT_TEST_SOURCES_DIR}/gregorian/testdate_iterator.cpp)
cm_test(NAME date_time_test_gregorian_testformatters SOURCES ${CURRENT_TEST_SOURCES_DIR}/gregorian/testformatters.cpp)
#cm_test(NAME date_time_test_gregorian_testformat_date_parser SOURCES ${CURRENT_TEST_SOURCES_DIR}/gregorian/testformat_date_parser.cpp)
###  streaming
cm_test(NAME date_time_test_gregorian_testdate_facet_new SOURCES ${CURRENT_TEST_SOURCES_DIR}/gregorian/testdate_facet_new.cpp)
cm_test(NAME date_time_test_gregorian_testdate_input_facet SOURCES ${CURRENT_TEST_SOURCES_DIR}/gregorian/testdate_input_facet.cpp)
###
cm_test(NAME date_time_test_gregorian_testgenerators SOURCES ${CURRENT_TEST_SOURCES_DIR}/gregorian/testgenerators.cpp)
cm_test(NAME date_time_test_gregorian_testgreg_cal SOURCES ${CURRENT_TEST_SOURCES_DIR}/gregorian/testgreg_cal.cpp)
cm_test(NAME date_time_test_gregorian_testgreg_day SOURCES ${CURRENT_TEST_SOURCES_DIR}/gregorian/testgreg_day.cpp)
cm_test(NAME date_time_test_gregorian_testgreg_month SOURCES ${CURRENT_TEST_SOURCES_DIR}/gregorian/testgreg_month.cpp)
cm_test(NAME date_time_test_gregorian_testgreg_year SOURCES ${CURRENT_TEST_SOURCES_DIR}/gregorian/testgreg_year.cpp)
cm_test(NAME date_time_test_testdate_dll SOURCES ${CURRENT_TEST_SOURCES_DIR}/gregorian/testdate.cpp)
cm_test(NAME date_time_test_testdate_duration_dll SOURCES ${CURRENT_TEST_SOURCES_DIR}/gregorian/testdate_duration.cpp)
cm_test(NAME date_time_test_testperiod_dll SOURCES ${CURRENT_TEST_SOURCES_DIR}/gregorian/testperiod.cpp)
cm_test(NAME date_time_test_testdate_iterator_dll SOURCES ${CURRENT_TEST_SOURCES_DIR}/gregorian/testdate_iterator.cpp)
cm_test(NAME date_time_test_testformatters_dll SOURCES ${CURRENT_TEST_SOURCES_DIR}/gregorian/testformatters.cpp)
###  streaming
cm_test(NAME date_time_test_testdate_facet_new_dll SOURCES ${CURRENT_TEST_SOURCES_DIR}/gregorian/testdate_facet_new.cpp)
cm_test(NAME date_time_test_testdate_input_facet_dll SOURCES ${CURRENT_TEST_SOURCES_DIR}/gregorian/testdate_input_facet.cpp)
###
cm_test(NAME date_time_test_testgenerators_dll SOURCES ${CURRENT_TEST_SOURCES_DIR}/gregorian/testgenerators.cpp)
cm_test(NAME date_time_test_testgreg_cal_dll SOURCES ${CURRENT_TEST_SOURCES_DIR}/gregorian/testgreg_cal.cpp)
cm_test(NAME date_time_test_testgreg_day_dll SOURCES ${CURRENT_TEST_SOURCES_DIR}/gregorian/testgreg_day.cpp)
cm_test(NAME date_time_test_testgreg_month_dll SOURCES ${CURRENT_TEST_SOURCES_DIR}/gregorian/testgreg_month.cpp)
cm_test(NAME date_time_test_testgreg_year_dll SOURCES ${CURRENT_TEST_SOURCES_DIR}/gregorian/testgreg_year.cpp)
cm_test(NAME date_time_test_testgreg_durations_dll SOURCES ${CURRENT_TEST_SOURCES_DIR}/gregorian/testgreg_durations.cpp)

cm_test(NAME date_time_test_posix_time_testfiletime_functions SOURCES ${CURRENT_TEST_SOURCES_DIR}/posix_time/testfiletime_functions.cpp)
cm_test(NAME date_time_test_posix_time_testlocal_adjustor SOURCES ${CURRENT_TEST_SOURCES_DIR}/posix_time/testlocal_adjustor.cpp)
cm_test(NAME date_time_test_posix_time_testc_local_adjustor SOURCES ${CURRENT_TEST_SOURCES_DIR}/posix_time/testc_local_adjustor.cpp)
cm_test(NAME date_time_test_posix_time_testclock SOURCES ${CURRENT_TEST_SOURCES_DIR}/posix_time/testclock.cpp)
cm_test(NAME date_time_test_posix_time_testdst_rules SOURCES ${CURRENT_TEST_SOURCES_DIR}/posix_time/testdst_rules.cpp)
cm_test(NAME date_time_test_posix_time_testduration SOURCES ${CURRENT_TEST_SOURCES_DIR}/posix_time/testduration.cpp)
cm_test(NAME date_time_test_posix_time_testformatters SOURCES ${CURRENT_TEST_SOURCES_DIR}/posix_time/testformatters.cpp)
cm_test(NAME date_time_test_posix_time_testiterator SOURCES ${CURRENT_TEST_SOURCES_DIR}/posix_time/testiterator.cpp)
cm_test(NAME date_time_test_posix_time_testparse_time SOURCES ${CURRENT_TEST_SOURCES_DIR}/posix_time/testparse_time.cpp)
cm_test(NAME date_time_test_posix_time_testtime_period SOURCES ${CURRENT_TEST_SOURCES_DIR}/posix_time/testtime_period.cpp)
cm_test(NAME date_time_test_posix_time_testperiod SOURCES ${CURRENT_TEST_SOURCES_DIR}/posix_time/testperiod.cpp)
cm_test(NAME date_time_test_posix_time_testtime SOURCES ${CURRENT_TEST_SOURCES_DIR}/posix_time/testtime.cpp)
cm_test(NAME date_time_test_posix_time_testmicrosec_time_clock SOURCES ${CURRENT_TEST_SOURCES_DIR}/posix_time/testmicrosec_time_clock.cpp)
cm_test(NAME date_time_test_posix_time_testtime_formatters SOURCES ${CURRENT_TEST_SOURCES_DIR}/posix_time/testtime_formatters.cpp)
cm_test(NAME date_time_test_posix_time_testgreg_duration_operators SOURCES ${CURRENT_TEST_SOURCES_DIR}/posix_time/testgreg_duration_operators.cpp)
### streaming
cm_test(NAME date_time_test_posix_time_testtime_facet SOURCES ${CURRENT_TEST_SOURCES_DIR}/posix_time/testtime_facet.cpp)
cm_test(NAME date_time_test_posix_time_testtime_input_facet SOURCES ${CURRENT_TEST_SOURCES_DIR}/posix_time/testtime_input_facet.cpp)
###
cm_test(NAME date_time_test_gregorian_testgreg_wstream SOURCES ${CURRENT_TEST_SOURCES_DIR}/gregorian/testgreg_wstream.cpp)
target_compile_definitions(date_time_test_gregorian_testgreg_wstream PUBLIC USE_DATE_TIME_PRE_1_33_FACET_IO)
cm_test(NAME date_time_test_posix_time_testtime_wstream SOURCES ${CURRENT_TEST_SOURCES_DIR}/posix_time/testtime_wstream.cpp)
target_compile_definitions(date_time_test_posix_time_testtime_wstream PUBLIC USE_DATE_TIME_PRE_1_33_FACET_IO)

cm_test(NAME date_time_test_testfacet_dll SOURCES ${CURRENT_TEST_SOURCES_DIR}/gregorian/testfacet.cpp)
target_compile_definitions(date_time_test_testfacet_dll PUBLIC USE_DATE_TIME_PRE_1_33_FACET_IO)
#  [ run gregorian/testparse_date.cpp ../build//${CMAKE_WORKSPACE_NAME}_date_time : : : $(DATE_TIME_DYNAMIC_PROPERTIES)  <define>USE_DATE_TIME_PRE_1_33_FACET_IO : testparse_date_dll ]
cm_test(NAME date_time_test_gregorian_testfacet SOURCES ${CURRENT_TEST_SOURCES_DIR}/gregorian/testfacet.cpp)
target_compile_definitions(date_time_test_gregorian_testfacet PUBLIC USE_DATE_TIME_PRE_1_33_FACET_IO)
cm_test(NAME date_time_test_gregorian_testparse_date SOURCES ${CURRENT_TEST_SOURCES_DIR}/gregorian/testparse_date.cpp)
target_compile_definitions(date_time_test_gregorian_testparse_date PUBLIC USE_DATE_TIME_PRE_1_33_FACET_IO)

cm_test(NAME date_time_test_posix_time_teststreams SOURCES ${CURRENT_TEST_SOURCES_DIR}/posix_time/teststreams.cpp)
target_compile_definitions(date_time_test_posix_time_teststreams PUBLIC USE_DATE_TIME_PRE_1_33_FACET_IO)


cm_test(NAME date_time_test_local_time_testdst_transition_day_rule SOURCES ${CURRENT_TEST_SOURCES_DIR}/local_time/testdst_transition_day_rule.cpp)
cm_test(NAME date_time_test_local_time_testcustom_time_zone SOURCES ${CURRENT_TEST_SOURCES_DIR}/local_time/testcustom_time_zone.cpp)
cm_test(NAME date_time_test_local_time_testposix_time_zone SOURCES ${CURRENT_TEST_SOURCES_DIR}/local_time/testposix_time_zone.cpp)
cm_test(NAME date_time_test_local_time_testwcustom_time_zone SOURCES ${CURRENT_TEST_SOURCES_DIR}/local_time/testwcustom_time_zone.cpp)
cm_test(NAME date_time_test_local_time_testwposix_time_zone SOURCES ${CURRENT_TEST_SOURCES_DIR}/local_time/testwposix_time_zone.cpp)
cm_test(NAME date_time_test_local_time_testtz_database SOURCES ${CURRENT_TEST_SOURCES_DIR}/local_time/testtz_database.cpp)
cm_test(NAME date_time_test_local_time_testlocal_time SOURCES ${CURRENT_TEST_SOURCES_DIR}/local_time/testlocal_time.cpp)
cm_test(NAME date_time_test_local_time_testlocal_time_iterator SOURCES ${CURRENT_TEST_SOURCES_DIR}/local_time/testlocal_time_iterator.cpp)
cm_test(NAME date_time_test_local_time_testlocal_time_period SOURCES ${CURRENT_TEST_SOURCES_DIR}/local_time/testlocal_time_period.cpp)
### streaming
cm_test(NAME date_time_test_local_time_testlocal_time_facet SOURCES ${CURRENT_TEST_SOURCES_DIR}/local_time/testlocal_time_facet.cpp)
cm_test(NAME date_time_test_local_time_testlocal_time_input_facet SOURCES ${CURRENT_TEST_SOURCES_DIR}/local_time/testlocal_time_input_facet.cpp)
###
cm_test(NAME date_time_test_local_time_testclocks SOURCES ${CURRENT_TEST_SOURCES_DIR}/local_time/testclocks.cpp)


cm_test(NAME date_time_test_testgreg_serialize_xml SOURCES ${CURRENT_TEST_SOURCES_DIR}/gregorian/testgreg_serialize.cpp)
target_compile_definitions(date_time_test_testgreg_serialize_xml PUBLIC DATE_TIME_XML_SERIALIZE)
cm_test(NAME date_time_test_testtime_serialize_xml_std_config SOURCES ${CURRENT_TEST_SOURCES_DIR}/posix_time/testtime_serialize.cpp)
target_compile_definitions(date_time_test_testtime_serialize_xml_std_config PUBLIC DATE_TIME_XML_SERIALIZE BOOST_DATE_TIME_POSIX_TIME_STD_CONFIG)
cm_test(NAME date_time_test_posix_time_testtime_serialize_xml SOURCES ${CURRENT_TEST_SOURCES_DIR}/posix_time/testtime_serialize.cpp)
target_compile_definitions(date_time_test_posix_time_testtime_serialize_xml PUBLIC DATE_TIME_XML_SERIALIZE)

cm_test(NAME date_time_test_gregorian_testgreg_serialize SOURCES ${CURRENT_TEST_SOURCES_DIR}/gregorian/testgreg_serialize.cpp)
cm_test(NAME date_time_test_posix_time_testtime_serialize SOURCES ${CURRENT_TEST_SOURCES_DIR}/posix_time/testtime_serialize.cpp)


# Copyright (c) 2000-2005
# CrystalClear Software, Inc.
# Subject to the Boost Software License, Version 1.0.
# (See accompanying file LICENSE_1_0.txt or
# http://www.boost.org/LICENSE_1_0.txt)
