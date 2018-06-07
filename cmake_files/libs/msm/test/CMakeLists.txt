include(BCMTest)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)

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


bcm_test(NAME msm_test_anonymous SOURCES ${CMAKE_WORKSPACE_SOURCE}/Anonymous.cpp)
bcm_test(NAME msm_test_anonymousEuml SOURCES ${CMAKE_WORKSPACE_SOURCE}/AnonymousEuml.cpp)
bcm_test(NAME msm_test_compositeEuml SOURCES ${CMAKE_WORKSPACE_SOURCE}/CompositeEuml.cpp)
bcm_test(NAME msm_test_compositeMachine SOURCES ${CMAKE_WORKSPACE_SOURCE}/CompositeMachine.cpp)
bcm_test(NAME msm_test_constructor SOURCES ${CMAKE_WORKSPACE_SOURCE}/Constructor.cpp)
bcm_test(NAME msm_test_entries SOURCES ${CMAKE_WORKSPACE_SOURCE}/Entries.cpp)
bcm_test(NAME msm_test_history SOURCES ${CMAKE_WORKSPACE_SOURCE}/History.cpp)
bcm_test(NAME msm_test_orthogonalDeferred SOURCES ${CMAKE_WORKSPACE_SOURCE}/OrthogonalDeferred.cpp)
bcm_test(NAME msm_test_orthogonalDeferred2 SOURCES ${CMAKE_WORKSPACE_SOURCE}/OrthogonalDeferred2.cpp)
bcm_test(NAME msm_test_orthogonalDeferredEuml SOURCES ${CMAKE_WORKSPACE_SOURCE}/OrthogonalDeferredEuml.cpp)
bcm_test(NAME msm_test_simpleEuml SOURCES ${CMAKE_WORKSPACE_SOURCE}/SimpleEuml.cpp)
bcm_test(NAME msm_test_simpleEuml2 SOURCES ${CMAKE_WORKSPACE_SOURCE}/SimpleEuml2.cpp)
bcm_test(NAME msm_test_simpleInternal SOURCES ${CMAKE_WORKSPACE_SOURCE}/SimpleInternal.cpp)
bcm_test(NAME msm_test_simpleInternalEuml SOURCES ${CMAKE_WORKSPACE_SOURCE}/SimpleInternalEuml.cpp)
bcm_test(NAME msm_test_simpleInternalFunctors SOURCES ${CMAKE_WORKSPACE_SOURCE}/SimpleInternalFunctors.cpp)
bcm_test(NAME msm_test_simpleMachine SOURCES ${CMAKE_WORKSPACE_SOURCE}/SimpleMachine.cpp)
bcm_test(NAME msm_test_simpleWithFunctors SOURCES ${CMAKE_WORKSPACE_SOURCE}/SimpleWithFunctors.cpp)
bcm_test(NAME msm_test_serialize SOURCES ${CMAKE_WORKSPACE_SOURCE}/Serialize.cpp)
bcm_test(NAME msm_test_serializeWithHistory SOURCES ${CMAKE_WORKSPACE_SOURCE}/SerializeWithHistory.cpp)
bcm_test(NAME msm_test_serializeSimpleEuml SOURCES ${CMAKE_WORKSPACE_SOURCE}/SerializeSimpleEuml.cpp)
bcm_test(NAME msm_test_testConstructor SOURCES ${CMAKE_WORKSPACE_SOURCE}/TestConstructor.cpp)


