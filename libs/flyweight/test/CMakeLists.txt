include(CMTest)

find_package(${CMAKE_WORKSPACE_NAME}_tuple)
find_package(${CMAKE_WORKSPACE_NAME}_utility)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_flyweight
                        ${CMAKE_WORKSPACE_NAME}::tuple
                        ${CMAKE_WORKSPACE_NAME}::utility
                        )

# See http://www.boost.org/libs/flyweight for library home page.

add_library(flyweight_test_intermod_holder_dll ${CURRENT_TEST_SOURCES_DIR}/intermod_holder_dll.cpp)
cm_mark_as_test(flyweight_test_intermod_holder_dll)
cm_target_link_test_libs(flyweight_test_intermod_holder_dll)
if(BUILD_SHARED_LIBS)
    target_compile_definitions(flyweight_test_intermod_holder_dll PUBLIC BOOST_FLYWEIGHT_TEST_INTERMOD_HOLDER_DLL_SOURCE=1)
endif()

#if ((NOT CMAKE_CXX_COMPILER_ID MATCHES "GNU") OR (PROJECT_VERSION GREATER 1.59))
    #reason: stl_tree.h:452:21: error: static assertion failed: comparison object must be invocable with two arguments of key type
cm_test(NAME flyweight_test_test_assoc_cont_factory SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_assoc_cont_factory.cpp ${CURRENT_TEST_SOURCES_DIR}/test_assoc_cont_fact_main.cpp)
#endif()

cm_test(NAME flyweight_test_test_basic SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_basic.cpp ${CURRENT_TEST_SOURCES_DIR}/test_basic_main.cpp)
cm_test(NAME flyweight_test_test_custom_factory SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_custom_factory.cpp ${CURRENT_TEST_SOURCES_DIR}/test_custom_factory_main.cpp)
cm_test(NAME flyweight_test_test_init SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_init.cpp ${CURRENT_TEST_SOURCES_DIR}/test_init_main.cpp)
cm_test(NAME flyweight_test_test_intermod_holder SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_intermod_holder.cpp ${CURRENT_TEST_SOURCES_DIR}/test_intermod_holder_main.cpp)
target_link_libraries(flyweight_test_test_intermod_holder flyweight_test_intermod_holder_dll)

cm_test(NAME flyweight_test_flyweight_test_test_multictor SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_multictor.cpp ${CURRENT_TEST_SOURCES_DIR}/test_multictor_main.cpp)
cm_test(NAME flyweight_test_flyweight_test_test_no_locking SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_no_locking.cpp ${CURRENT_TEST_SOURCES_DIR}/test_no_locking_main.cpp)
cm_test(NAME flyweight_test_test_no_tracking SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_no_tracking.cpp ${CURRENT_TEST_SOURCES_DIR}/test_no_tracking_main.cpp)
cm_test(NAME flyweight_test_test_serialization SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_serialization.cpp ${CURRENT_TEST_SOURCES_DIR}/test_serialization_main.cpp)
cm_test(NAME flyweight_test_test_set_factory SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_set_factory.cpp ${CURRENT_TEST_SOURCES_DIR}/test_set_factory_main.cpp)
