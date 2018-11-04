include(CMTest)

find_package(${CMAKE_WORKSPACE_NAME}_test)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_msm
                        ${CMAKE_WORKSPACE_NAME}::test
                        )

# test/Jamfile.v2 controls building of MSM Library unit tests
#
# Copyright (c) 2010 Christophe Henry
#
# Use, modification and distribution is subject to the Boost Software License,
# Version 1.0. (See accompanying file LICENSE_1_0.txt or copy at
# http://www.boost.org/LICENSE_1_0.txt)

#test-suite msm-unit-tests
cm_test(NAME msm_test_anonymous SOURCES ${CURRENT_TEST_SOURCES_DIR}/Anonymous.cpp)
cm_test(NAME msm_test_anonymousEuml SOURCES ${CURRENT_TEST_SOURCES_DIR}/AnonymousEuml.cpp)
cm_test(NAME msm_test_compositeEuml SOURCES ${CURRENT_TEST_SOURCES_DIR}/CompositeEuml.cpp)
cm_test(NAME msm_test_compositeMachine SOURCES ${CURRENT_TEST_SOURCES_DIR}/CompositeMachine.cpp)
cm_test(NAME msm_test_constructor SOURCES ${CURRENT_TEST_SOURCES_DIR}/Constructor.cpp)
cm_test(NAME msm_test_entries SOURCES ${CURRENT_TEST_SOURCES_DIR}/Entries.cpp)
cm_test(NAME msm_test_history SOURCES ${CURRENT_TEST_SOURCES_DIR}/History.cpp)
cm_test(NAME msm_test_orthogonalDeferred SOURCES ${CURRENT_TEST_SOURCES_DIR}/OrthogonalDeferred.cpp)
cm_test(NAME msm_test_orthogonalDeferred2 SOURCES ${CURRENT_TEST_SOURCES_DIR}/OrthogonalDeferred2.cpp)
cm_test(NAME msm_test_orthogonalDeferredEuml SOURCES ${CURRENT_TEST_SOURCES_DIR}/OrthogonalDeferredEuml.cpp)
cm_test(NAME msm_test_simpleEuml SOURCES ${CURRENT_TEST_SOURCES_DIR}/SimpleEuml.cpp)
cm_test(NAME msm_test_simpleEuml2 SOURCES ${CURRENT_TEST_SOURCES_DIR}/SimpleEuml2.cpp)
cm_test(NAME msm_test_simpleInternal SOURCES ${CURRENT_TEST_SOURCES_DIR}/SimpleInternal.cpp)
cm_test(NAME msm_test_simpleInternalEuml SOURCES ${CURRENT_TEST_SOURCES_DIR}/SimpleInternalEuml.cpp)
cm_test(NAME msm_test_simpleInternalFunctors SOURCES ${CURRENT_TEST_SOURCES_DIR}/SimpleInternalFunctors.cpp)
cm_test(NAME msm_test_simpleMachine SOURCES ${CURRENT_TEST_SOURCES_DIR}/SimpleMachine.cpp)
cm_test(NAME msm_test_simpleWithFunctors SOURCES ${CURRENT_TEST_SOURCES_DIR}/SimpleWithFunctors.cpp)
cm_test(NAME msm_test_serialize SOURCES ${CURRENT_TEST_SOURCES_DIR}/Serialize.cpp)
cm_test(NAME msm_test_serializeWithHistory SOURCES ${CURRENT_TEST_SOURCES_DIR}/SerializeWithHistory.cpp)
cm_test(NAME msm_test_serializeSimpleEuml SOURCES ${CURRENT_TEST_SOURCES_DIR}/SerializeSimpleEuml.cpp)
cm_test(NAME msm_test_testConstructor SOURCES ${CURRENT_TEST_SOURCES_DIR}/TestConstructor.cpp)
