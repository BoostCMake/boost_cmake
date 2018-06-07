include(BCMTest)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)

find_package(${CMAKE_WORKSPACE_NAME}_tuple)
find_package(${CMAKE_WORKSPACE_NAME}_utility)

bcm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_flyweight
                        boost::tuple
                        boost::utility
                        )

# See http://www.boost.org/libs/flyweight for library home page.

add_library(flyweight_test_intermod_holder_dll ${CMAKE_WORKSPACE_SOURCE}/intermod_holder_dll.cpp)
bcm_mark_as_test(flyweight_test_intermod_holder_dll)
bcm_target_link_test_libs(flyweight_test_intermod_holder_dll)
if(BUILD_SHARED_LIBS)
    target_compile_definitions(flyweight_test_intermod_holder_dll PUBLIC BOOST_FLYWEIGHT_TEST_INTERMOD_HOLDER_DLL_SOURCE=1)
endif()

if ((NOT CMAKE_CXX_COMPILER_ID MATCHES "GNU") OR (PROJECT_VERSION GREATER 1.59))
    bcm_test(NAME flyweight_test_test_assoc_cont_factory SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_assoc_cont_factory.cpp ${CMAKE_WORKSPACE_SOURCE}/test_assoc_cont_fact_main.cpp)
endif()
bcm_test(NAME flyweight_test_test_basic SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_basic.cpp ${CMAKE_WORKSPACE_SOURCE}/test_basic_main.cpp)
bcm_test(NAME flyweight_test_test_custom_factory SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_custom_factory.cpp ${CMAKE_WORKSPACE_SOURCE}/test_custom_factory_main.cpp)
bcm_test(NAME flyweight_test_test_init SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_init.cpp ${CMAKE_WORKSPACE_SOURCE}/test_init_main.cpp)
bcm_test(NAME flyweight_test_test_intermod_holder SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_intermod_holder.cpp ${CMAKE_WORKSPACE_SOURCE}/test_intermod_holder_main.cpp)
target_link_libraries(flyweight_test_test_intermod_holder flyweight_test_intermod_holder_dll)

bcm_test(NAME flyweight_test_flyweight_test_test_multictor SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_multictor.cpp ${CMAKE_WORKSPACE_SOURCE}/test_multictor_main.cpp)
bcm_test(NAME flyweight_test_flyweight_test_test_no_locking SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_no_locking.cpp ${CMAKE_WORKSPACE_SOURCE}/test_no_locking_main.cpp)
bcm_test(NAME flyweight_test_test_no_tracking SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_no_tracking.cpp ${CMAKE_WORKSPACE_SOURCE}/test_no_tracking_main.cpp)
bcm_test(NAME flyweight_test_test_serialization SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_serialization.cpp ${CMAKE_WORKSPACE_SOURCE}/test_serialization_main.cpp)
bcm_test(NAME flyweight_test_test_set_factory SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_set_factory.cpp ${CMAKE_WORKSPACE_SOURCE}/test_set_factory_main.cpp)
