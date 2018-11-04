include(CMTest)

patch_directory(${CURRENT_TEST_SOURCES_DIR} ${CMAKE_CURRENT_SOURCE_DIR}/files ${CMAKE_CURRENT_BINARY_DIR})

find_package(${CMAKE_WORKSPACE_NAME}_test)
find_package(${CMAKE_WORKSPACE_NAME}_timer)
find_package(${CMAKE_WORKSPACE_NAME}_assign)
find_package(${CMAKE_WORKSPACE_NAME}_filesystem)
find_package(${CMAKE_WORKSPACE_NAME}_disjoint_sets)
#find_package(${CMAKE_WORKSPACE_NAME}_graph_parallel)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_graph
                        ${CMAKE_WORKSPACE_NAME}::test
                        ${CMAKE_WORKSPACE_NAME}::timer
                        ${CMAKE_WORKSPACE_NAME}::assign
                        ${CMAKE_WORKSPACE_NAME}::filesystem
                        ${CMAKE_WORKSPACE_NAME}::disjoint_sets
                        #${CMAKE_WORKSPACE_NAME}::graph_parallel
                        )

# Copyright (c) 2002 Trustees of Indiana University
#
# Distributed under the Boost Software License, Version 1.0.
# (See accompanying file LICENSE_1_0.txt or copy at
# http://www.boost.org/LICENSE_1_0.txt)

# Define SGB (stanford graph base top level directory) and
# LEDA (also top level directory) at the command line of jam using -s

set(TEST_DIR ${CMAKE_CURRENT_SOURCE_DIR})
set(PLANAR_INPUT_FILES ${CMAKE_CURRENT_SOURCE_DIR}/planar_input_graphs)
set(CYCLE_RATIO_INPUT_FILE ${CMAKE_CURRENT_SOURCE_DIR}/cycle_ratio_s382.90.dot)
set(METIS_INPUT_FILE ${CMAKE_CURRENT_SOURCE_DIR}/weighted_graph.gr)

#test-suite graph_test
# TODO: fix test. Reason error: # pragma message("NOTE: Use of this header (ice_not.hpp) is deprecated")
# cm_test(NAME graph_test_test_graphs SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_graphs.cpp)

cm_test(NAME graph_test_index_graph SOURCES ${CURRENT_TEST_SOURCES_DIR}/index_graph.cpp)
cm_test(NAME graph_test_labeled_graph SOURCES ${CURRENT_TEST_SOURCES_DIR}/labeled_graph.cpp)

cm_test(NAME graph_test_transitive_closure_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/transitive_closure_test.cpp)
cm_test(NAME graph_test_adj_list_cc SOURCES ${CURRENT_TEST_SOURCES_DIR}/adj_list_cc.cpp COMPILE_ONLY)

cm_test(NAME graph_test_adj_list_edge_list_set SOURCES ${CURRENT_TEST_SOURCES_DIR}/adj_list_edge_list_set.cpp)
cm_test(NAME graph_test_adj_list_loops SOURCES ${CURRENT_TEST_SOURCES_DIR}/adj_list_loops.cpp)
cm_test(NAME graph_test_adj_matrix_cc SOURCES ${CURRENT_TEST_SOURCES_DIR}/adj_matrix_cc.cpp COMPILE_ONLY)
cm_test(NAME graph_test_bfs SOURCES ${CURRENT_TEST_SOURCES_DIR}/bfs.cpp)
cm_test(NAME graph_test_bfs_cc SOURCES ${CURRENT_TEST_SOURCES_DIR}/bfs_cc.cpp COMPILE_ONLY)
cm_test(NAME graph_test_bellman-test SOURCES ${CURRENT_TEST_SOURCES_DIR}/bellman-test.cpp)
cm_test(NAME graph_test_betweenness_centrality_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/betweenness_centrality_test.cpp)
cm_test(NAME graph_test_bidir_remove_edge SOURCES ${CURRENT_TEST_SOURCES_DIR}/bidir_remove_edge.cpp)
cm_test(NAME graph_test_bipartite_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/bipartite_test.cpp)

if (NOT (CMAKE_CXX_COMPILER_ID MATCHES "Clang"))
    cm_test(NAME graph_test_csr_graph_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/csr_graph_test.cpp)
endif()

cm_test(NAME graph_test_dag_longest_paths SOURCES ${CURRENT_TEST_SOURCES_DIR}/dag_longest_paths.cpp)
cm_test(NAME graph_test_dfs SOURCES ${CURRENT_TEST_SOURCES_DIR}/dfs.cpp)
cm_test(NAME graph_test_undirected_dfs SOURCES ${CURRENT_TEST_SOURCES_DIR}/undirected_dfs.cpp)
cm_test(NAME graph_test_dfs_cc SOURCES ${CURRENT_TEST_SOURCES_DIR}/dfs_cc.cpp COMPILE_ONLY)
cm_test(NAME graph_test_dijkstra_cc SOURCES ${CURRENT_TEST_SOURCES_DIR}/dijkstra_cc.cpp COMPILE_ONLY)
cm_test(NAME graph_test_dijkstra_heap_performance SOURCES ${CURRENT_TEST_SOURCES_DIR}/dijkstra_heap_performance.cpp ARGS 10000)
cm_test(NAME graph_test_dijkstra_no_color_map_compare SOURCES ${CURRENT_TEST_SOURCES_DIR}/dijkstra_no_color_map_compare.cpp ARGS 10000)
cm_test(NAME graph_test_dominator_tree_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/dominator_tree_test.cpp)
cm_test(NAME graph_test_relaxed_heap_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/relaxed_heap_test.cpp ARGS 5000 15000)
cm_test(NAME graph_test_edge_list_cc SOURCES ${CURRENT_TEST_SOURCES_DIR}/edge_list_cc.cpp COMPILE_ONLY)
cm_test(NAME graph_test_filtered_graph_cc SOURCES ${CURRENT_TEST_SOURCES_DIR}/filtered_graph_cc.cpp COMPILE_ONLY)
cm_test(NAME graph_test_generator_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/generator_test.cpp)
cm_test(NAME graph_test_graph SOURCES ${CURRENT_TEST_SOURCES_DIR}/graph.cpp)
cm_test(NAME graph_test_graph_concepts SOURCES ${CURRENT_TEST_SOURCES_DIR}/graph_concepts.cpp COMPILE_ONLY)
cm_test(NAME graph_test_graphviz_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/graphviz_test.cpp)
cm_test(NAME graph_test_metis_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/metis_test.cpp ARGS ${METIS_INPUT_FILE})
cm_test(NAME graph_test_gursoy_atun_layout_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/gursoy_atun_layout_test.cpp)
cm_test(NAME graph_test_layout_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/layout_test.cpp)

# TODO: fix test. Error: need add graph_parallel
#cm_test(NAME graph_test_serialize SOURCES ${CURRENT_TEST_SOURCES_DIR}/serialize.cpp)

cm_test(NAME graph_test_reverse_graph_cc SOURCES ${CURRENT_TEST_SOURCES_DIR}/reverse_graph_cc.cpp COMPILE_ONLY)
cm_test(NAME graph_test_sequential_vertex_coloring SOURCES ${CURRENT_TEST_SOURCES_DIR}/sequential_vertex_coloring.cpp)

cm_test(NAME graph_test_subgraph SOURCES ${CURRENT_TEST_SOURCES_DIR}/subgraph.cpp)
cm_test(NAME graph_test_subgraph_bundled SOURCES ${CURRENT_TEST_SOURCES_DIR}/subgraph_bundled.cpp)
cm_test(NAME graph_test_subgraph_props SOURCES ${CURRENT_TEST_SOURCES_DIR}/subgraph_props.cpp)

cm_test(NAME graph_test_isomorphism SOURCES ${CURRENT_TEST_SOURCES_DIR}/isomorphism.cpp)

# TODO: fix test. Reason error: # pragma message("NOTE: Use of this header (ice_not.hpp) is deprecated")
# cm_test(NAME graph_test_adjacency_matrix_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/adjacency_matrix_test.cpp)

cm_test(NAME graph_test_vector_graph_cc SOURCES ${CURRENT_TEST_SOURCES_DIR}/vector_graph_cc.cpp COMPILE_ONLY)
cm_test(NAME graph_test_copy SOURCES ${CURRENT_TEST_SOURCES_DIR}/copy.cpp COMPILE_ONLY)
cm_test(NAME graph_test_swap SOURCES ${CURRENT_TEST_SOURCES_DIR}/swap.cpp COMPILE_ONLY)
cm_test(NAME graph_test_property_iter SOURCES ${CURRENT_TEST_SOURCES_DIR}/property_iter.cpp COMPILE_ONLY)

# TODO: fix test. Reason error: # pragma message("NOTE: Use of this header (ice_not.hpp) is deprecated")
# cm_test(NAME graph_test_bundled_properties SOURCES ${CURRENT_TEST_SOURCES_DIR}/bundled_properties.cpp)
# TODO: fix test. Reason error: # pragma message("NOTE: Use of this header (ice_not.hpp) is deprecated")
# cm_test(NAME graph_test_floyd_warshall_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/floyd_warshall_test.cpp)

cm_test(NAME graph_test_astar_search_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/astar_search_test.cpp)
cm_test(NAME graph_test_biconnected_components_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/biconnected_components_test.cpp)
cm_test(NAME graph_test_cuthill_mckee_ordering SOURCES ${CURRENT_TEST_SOURCES_DIR}/cuthill_mckee_ordering.cpp)
cm_test(NAME graph_test_king_ordering SOURCES ${CURRENT_TEST_SOURCES_DIR}/king_ordering.cpp)

# TODO: fix test. Reason error: # pragma message("NOTE: Use of this header (ice_not.hpp) is deprecated")
# cm_test(NAME graph_test_matching_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/matching_test.cpp)

cm_test(NAME graph_test_max_flow_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/max_flow_test.cpp)

# TODO: fix test. Reason error: # pragma message("NOTE: Use of this header (ice_not.hpp) is deprecated")
# cm_test(NAME graph_test_boykov_kolmogorov_max_flow_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/boykov_kolmogorov_max_flow_test.cpp)
# TODO: fix test. Reason error: # pragma message("NOTE: Use of this header (ice_not.hpp) is deprecated")
# cm_test(NAME graph_test_cycle_ratio_tests SOURCES ${CURRENT_TEST_SOURCES_DIR}/cycle_ratio_tests.cpp ARGS ${CYCLE_RATIO_INPUT_FILE})

cm_test(NAME graph_test_basic_planarity_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/basic_planarity_test.cpp)
cm_test(NAME graph_test_make_connected_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/make_connected_test.cpp)
cm_test(NAME graph_test_make_bicon_planar_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/make_bicon_planar_test.cpp)
cm_test(NAME graph_test_make_maximal_planar_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/make_maximal_planar_test.cpp)
cm_test(NAME graph_test_named_vertices_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/named_vertices_test.cpp)
cm_test(NAME graph_test_all_planar_input_files_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/all_planar_input_files_test.cpp ARGS ${PLANAR_INPUT_FILES})
cm_test(NAME graph_test_parallel_edges_loops_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/parallel_edges_loops_test.cpp ARGS ${PLANAR_INPUT_FILES})
cm_test(NAME graph_test_r_c_shortest_paths_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/r_c_shortest_paths_test.cpp)
cm_test(NAME graph_test_rcsp_custom_vertex_id SOURCES ${CURRENT_TEST_SOURCES_DIR}/rcsp_custom_vertex_id.cpp)
cm_test(NAME graph_test_is_straight_line_draw_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/is_straight_line_draw_test.cpp)

# TODO: fix test. Reason error: # pragma message("NOTE: Use of this header (ice_not.hpp) is deprecated")
# cm_test(NAME graph_test_metric_tsp_approx SOURCES ${CURRENT_TEST_SOURCES_DIR}/metric_tsp_approx.cpp ARGS metric_tsp_approx.graph)

cm_test(NAME graph_test_dimacs SOURCES ${CURRENT_TEST_SOURCES_DIR}/dimacs.cpp COMPILE_ONLY)
cm_test(NAME graph_test_bron_kerbosch_all_cliques SOURCES ${CURRENT_TEST_SOURCES_DIR}/bron_kerbosch_all_cliques.cpp)
cm_test(NAME graph_test_tiernan_all_cycles SOURCES ${CURRENT_TEST_SOURCES_DIR}/tiernan_all_cycles.cpp)
cm_test(NAME graph_test_closeness_centrality SOURCES ${CURRENT_TEST_SOURCES_DIR}/closeness_centrality.cpp)
cm_test(NAME graph_test_degree_centrality SOURCES ${CURRENT_TEST_SOURCES_DIR}/degree_centrality.cpp)
cm_test(NAME graph_test_mean_geodesic SOURCES ${CURRENT_TEST_SOURCES_DIR}/mean_geodesic.cpp)
cm_test(NAME graph_test_eccentricity SOURCES ${CURRENT_TEST_SOURCES_DIR}/eccentricity.cpp)
cm_test(NAME graph_test_clustering_coefficient SOURCES ${CURRENT_TEST_SOURCES_DIR}/clustering_coefficient.cpp)
cm_test(NAME graph_test_core_numbers_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/core_numbers_test.cpp)
cm_test(NAME graph_test_read_propmap SOURCES ${CURRENT_TEST_SOURCES_DIR}/read_propmap.cpp)
cm_test(NAME graph_test_mcgregor_subgraphs_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/mcgregor_subgraphs_test.cpp)
cm_test(NAME graph_test_grid_graph_cc SOURCES ${CURRENT_TEST_SOURCES_DIR}/grid_graph_cc.cpp COMPILE_ONLY)
cm_test(NAME graph_test_grid_graph_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/grid_graph_test.cpp)
cm_test(NAME graph_test_incremental_components_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/incremental_components_test.cpp)
cm_test(NAME graph_test_two_graphs_common_spanning_trees_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/two_graphs_common_spanning_trees_test.cpp)
cm_test(NAME graph_test_random_spanning_tree_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/random_spanning_tree_test.cpp)
cm_test(NAME graph_test_graphml_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/graphml_test.cpp ARGS "graphml_test.xml")
cm_test(NAME graph_test_mas_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/mas_test.cpp ARGS ${TEST_DIR} SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME graph_test_stoer_wagner_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/stoer_wagner_test.cpp ARGS ${TEST_DIR} SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME graph_test_filtered_graph_properties_dijkstra SOURCES ${CURRENT_TEST_SOURCES_DIR}/filtered_graph_properties_dijkstra.cpp COMPILE_ONLY)
cm_test(NAME graph_test_vf2_sub_graph_iso_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/vf2_sub_graph_iso_test.cpp)
cm_test(NAME graph_test_vf2_sub_graph_iso_test_2 SOURCES ${CURRENT_TEST_SOURCES_DIR}/vf2_sub_graph_iso_test_2.cpp)
cm_test(NAME graph_test_hawick_circuits SOURCES ${CURRENT_TEST_SOURCES_DIR}/hawick_circuits.cpp)
cm_test(NAME graph_test_successive_shortest_path_nonnegative_weights_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/successive_shortest_path_nonnegative_weights_test.cpp)
cm_test(NAME graph_test_cycle_canceling_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/cycle_canceling_test.cpp)

# TODO: Run SDB tests only when -DSDB=1 is set.
if(SDB)
    cm_test(NAME graph_test_stanford_graph_cc SOURCES ${CURRENT_TEST_SOURCES_DIR}/stanford_graph_cc.cpp COMPILE_ONLY)
endif()

# TODO: Run LEDA tests only when -DLEDA=1 is set.
if(LEDA)
    cm_test(NAME graph_test_leda_graph_cc SOURCES ${CURRENT_TEST_SOURCES_DIR}/leda_graph_cc.cpp COMPILE_ONLY)
endif()