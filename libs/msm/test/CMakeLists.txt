include(BCMTest)

find_package(${CMAKE_WORKSPACE_NAME}_test)

bcm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_msm
                        boost::test
                        )

# test/Jamfile.v2 controls building of MSM Library unit tests
#
# Copyright (c) 2010 Christophe Henry
#
# Use, modification and distribution is subject to the Boost Software License,
# Version 1.0. (See accompanying file LICENSE_1_0.txt or copy at
# http://www.boost.org/LICENSE_1_0.txt)


bcm_test(NAME msm_test_anonymous SOURCES Anonymous.cpp)
bcm_test(NAME msm_test_anonymousEuml SOURCES AnonymousEuml.cpp)
bcm_test(NAME msm_test_compositeEuml SOURCES CompositeEuml.cpp)
bcm_test(NAME msm_test_compositeMachine SOURCES CompositeMachine.cpp)
bcm_test(NAME msm_test_constructor SOURCES Constructor.cpp)
bcm_test(NAME msm_test_entries SOURCES Entries.cpp)
bcm_test(NAME msm_test_history SOURCES History.cpp)
bcm_test(NAME msm_test_orthogonalDeferred SOURCES OrthogonalDeferred.cpp)
bcm_test(NAME msm_test_orthogonalDeferred2 SOURCES OrthogonalDeferred2.cpp)
bcm_test(NAME msm_test_orthogonalDeferredEuml SOURCES OrthogonalDeferredEuml.cpp)
bcm_test(NAME msm_test_simpleEuml SOURCES SimpleEuml.cpp)
bcm_test(NAME msm_test_simpleEuml2 SOURCES SimpleEuml2.cpp)
bcm_test(NAME msm_test_simpleInternal SOURCES SimpleInternal.cpp)
bcm_test(NAME msm_test_simpleInternalEuml SOURCES SimpleInternalEuml.cpp)
bcm_test(NAME msm_test_simpleInternalFunctors SOURCES SimpleInternalFunctors.cpp)
bcm_test(NAME msm_test_simpleMachine SOURCES SimpleMachine.cpp)
bcm_test(NAME msm_test_simpleWithFunctors SOURCES SimpleWithFunctors.cpp)
bcm_test(NAME msm_test_serialize SOURCES Serialize.cpp)
bcm_test(NAME msm_test_serializeWithHistory SOURCES SerializeWithHistory.cpp)
bcm_test(NAME msm_test_serializeSimpleEuml SOURCES SerializeSimpleEuml.cpp)
bcm_test(NAME msm_test_testConstructor SOURCES TestConstructor.cpp)


