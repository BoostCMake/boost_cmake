include(BCMTest)

find_package(${CMAKE_WORKSPACE_NAME}_test)
find_package(${CMAKE_WORKSPACE_NAME}_timer)
find_package(${CMAKE_WORKSPACE_NAME}_assign)
find_package(${CMAKE_WORKSPACE_NAME}_filesystem)
find_package(${CMAKE_WORKSPACE_NAME}_disjoint_sets)
#find_package(${CMAKE_WORKSPACE_NAME}_graph_parallel)

bcm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_graph
                        boost::test
                        boost::timer
                        boost::assign
                        boost::filesystem
                        boost::disjoint_sets
                        #boost::graph_parallel
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

bcm_test(NAME graph_test_test_graphs SOURCES test_graphs.cpp)
bcm_test(NAME graph_test_index_graph SOURCES index_graph.cpp)
bcm_test(NAME graph_test_labeled_graph SOURCES labeled_graph.cpp)
# bcm_test(NAME graph_test_finish_edge_bug SOURCES finish_edge_bug.cpp)

bcm_test(NAME graph_test_transitive_closure_test SOURCES transitive_closure_test.cpp)
bcm_test(NAME graph_test_adj_list_cc SOURCES adj_list_cc.cpp COMPILE_ONLY)


bcm_test(NAME graph_test_adj_list_edge_list_set SOURCES adj_list_edge_list_set.cpp)
bcm_test(NAME graph_test_adj_list_loops SOURCES adj_list_loops.cpp)
bcm_test(NAME graph_test_adj_matrix_cc SOURCES adj_matrix_cc.cpp COMPILE_ONLY)
bcm_test(NAME graph_test_bfs SOURCES bfs.cpp)
bcm_test(NAME graph_test_bfs_cc SOURCES bfs_cc.cpp COMPILE_ONLY)
bcm_test(NAME graph_test_bellman-test SOURCES bellman-test.cpp)
bcm_test(NAME graph_test_betweenness_centrality_test SOURCES betweenness_centrality_test.cpp)
bcm_test(NAME graph_test_bidir_remove_edge SOURCES bidir_remove_edge.cpp)
bcm_test(NAME graph_test_bipartite_test SOURCES bipartite_test.cpp)
bcm_test(NAME graph_test_csr_graph_test SOURCES csr_graph_test.cpp)
bcm_test(NAME graph_test_dag_longest_paths SOURCES dag_longest_paths.cpp)
bcm_test(NAME graph_test_dfs SOURCES dfs.cpp)
bcm_test(NAME graph_test_undirected_dfs SOURCES undirected_dfs.cpp)
bcm_test(NAME graph_test_dfs_cc SOURCES dfs_cc.cpp COMPILE_ONLY)
bcm_test(NAME graph_test_dijkstra_cc SOURCES dijkstra_cc.cpp COMPILE_ONLY)
bcm_test(NAME graph_test_dijkstra_heap_performance SOURCES dijkstra_heap_performance.cpp ARGS 10000)
bcm_test(NAME graph_test_dijkstra_no_color_map_compare SOURCES dijkstra_no_color_map_compare.cpp ARGS 10000)
bcm_test(NAME graph_test_dominator_tree_test SOURCES dominator_tree_test.cpp)
bcm_test(NAME graph_test_relaxed_heap_test SOURCES relaxed_heap_test.cpp ARGS 5000 15000)
bcm_test(NAME graph_test_edge_list_cc SOURCES edge_list_cc.cpp COMPILE_ONLY)
bcm_test(NAME graph_test_filtered_graph_cc SOURCES filtered_graph_cc.cpp COMPILE_ONLY)
bcm_test(NAME graph_test_generator_test SOURCES generator_test.cpp)
bcm_test(NAME graph_test_graph SOURCES graph.cpp)
bcm_test(NAME graph_test_graph_concepts SOURCES graph_concepts.cpp COMPILE_ONLY)
bcm_test(NAME graph_test_graphviz_test SOURCES graphviz_test.cpp)
bcm_test(NAME graph_test_metis_test SOURCES metis_test.cpp ARGS ${METIS_INPUT_FILE})
bcm_test(NAME graph_test_gursoy_atun_layout_test SOURCES gursoy_atun_layout_test.cpp)
bcm_test(NAME graph_test_layout_test SOURCES layout_test.cpp)

# TODO: Skip serialization, since this requires grap_parallel
#bcm_test(NAME graph_test_serialize SOURCES serialize.cpp)

bcm_test(NAME graph_test_reverse_graph_cc SOURCES reverse_graph_cc.cpp COMPILE_ONLY)
bcm_test(NAME graph_test_sequential_vertex_coloring SOURCES sequential_vertex_coloring.cpp)

bcm_test(NAME graph_test_subgraph SOURCES subgraph.cpp)
bcm_test(NAME graph_test_subgraph_bundled SOURCES subgraph_bundled.cpp)
bcm_test(NAME graph_test_subgraph_props SOURCES subgraph_props.cpp)

bcm_test(NAME graph_test_isomorphism SOURCES isomorphism.cpp)
bcm_test(NAME graph_test_adjacency_matrix_test SOURCES adjacency_matrix_test.cpp)
bcm_test(NAME graph_test_vector_graph_cc SOURCES vector_graph_cc.cpp COMPILE_ONLY)
bcm_test(NAME graph_test_copy SOURCES copy.cpp COMPILE_ONLY)
bcm_test(NAME graph_test_swap SOURCES swap.cpp COMPILE_ONLY)
bcm_test(NAME graph_test_property_iter SOURCES property_iter.cpp COMPILE_ONLY)
bcm_test(NAME graph_test_bundled_properties SOURCES bundled_properties.cpp)
bcm_test(NAME graph_test_floyd_warshall_test SOURCES floyd_warshall_test.cpp)
bcm_test(NAME graph_test_astar_search_test SOURCES astar_search_test.cpp)
bcm_test(NAME graph_test_biconnected_components_test SOURCES biconnected_components_test.cpp)
bcm_test(NAME graph_test_cuthill_mckee_ordering SOURCES cuthill_mckee_ordering.cpp)
bcm_test(NAME graph_test_king_ordering SOURCES king_ordering.cpp)
bcm_test(NAME graph_test_matching_test SOURCES matching_test.cpp)
bcm_test(NAME graph_test_max_flow_test SOURCES max_flow_test.cpp)
bcm_test(NAME graph_test_boykov_kolmogorov_max_flow_test SOURCES boykov_kolmogorov_max_flow_test.cpp)
bcm_test(NAME graph_test_cycle_ratio_tests SOURCES cycle_ratio_tests.cpp ARGS ${CYCLE_RATIO_INPUT_FILE})
bcm_test(NAME graph_test_basic_planarity_test SOURCES basic_planarity_test.cpp)
bcm_test(NAME graph_test_make_connected_test SOURCES make_connected_test.cpp)
bcm_test(NAME graph_test_make_bicon_planar_test SOURCES make_bicon_planar_test.cpp)
bcm_test(NAME graph_test_make_maximal_planar_test SOURCES make_maximal_planar_test.cpp)
bcm_test(NAME graph_test_named_vertices_test SOURCES named_vertices_test.cpp)
bcm_test(NAME graph_test_all_planar_input_files_test SOURCES all_planar_input_files_test.cpp ARGS ${PLANAR_INPUT_FILES})
bcm_test(NAME graph_test_parallel_edges_loops_test SOURCES parallel_edges_loops_test.cpp ARGS ${PLANAR_INPUT_FILES})
bcm_test(NAME graph_test_r_c_shortest_paths_test SOURCES r_c_shortest_paths_test.cpp)
bcm_test(NAME graph_test_rcsp_custom_vertex_id SOURCES rcsp_custom_vertex_id.cpp)
bcm_test(NAME graph_test_is_straight_line_draw_test SOURCES is_straight_line_draw_test.cpp)
bcm_test(NAME graph_test_metric_tsp_approx SOURCES metric_tsp_approx.cpp ARGS metric_tsp_approx.graph)
bcm_test(NAME graph_test_dimacs SOURCES dimacs.cpp COMPILE_ONLY)
bcm_test(NAME graph_test_bron_kerbosch_all_cliques SOURCES bron_kerbosch_all_cliques.cpp)
bcm_test(NAME graph_test_tiernan_all_cycles SOURCES tiernan_all_cycles.cpp)
bcm_test(NAME graph_test_closeness_centrality SOURCES closeness_centrality.cpp)
bcm_test(NAME graph_test_degree_centrality SOURCES degree_centrality.cpp)
bcm_test(NAME graph_test_mean_geodesic SOURCES mean_geodesic.cpp)
bcm_test(NAME graph_test_eccentricity SOURCES eccentricity.cpp)
bcm_test(NAME graph_test_clustering_coefficient SOURCES clustering_coefficient.cpp)
bcm_test(NAME graph_test_core_numbers_test SOURCES core_numbers_test.cpp)
bcm_test(NAME graph_test_read_propmap SOURCES read_propmap.cpp)
bcm_test(NAME graph_test_mcgregor_subgraphs_test SOURCES mcgregor_subgraphs_test.cpp)
bcm_test(NAME graph_test_grid_graph_cc SOURCES grid_graph_cc.cpp COMPILE_ONLY)
bcm_test(NAME graph_test_grid_graph_test SOURCES grid_graph_test.cpp)
bcm_test(NAME graph_test_incremental_components_test SOURCES incremental_components_test.cpp)
bcm_test(NAME graph_test_two_graphs_common_spanning_trees_test SOURCES two_graphs_common_spanning_trees_test.cpp)
bcm_test(NAME graph_test_random_spanning_tree_test SOURCES random_spanning_tree_test.cpp)
bcm_test(NAME graph_test_graphml_test SOURCES graphml_test.cpp ARGS "graphml_test.xml")
bcm_test(NAME graph_test_mas_test SOURCES mas_test.cpp ARGS ${TEST_DIR})
bcm_test(NAME graph_test_stoer_wagner_test SOURCES stoer_wagner_test.cpp ARGS ${TEST_DIR})
bcm_test(NAME graph_test_filtered_graph_properties_dijkstra SOURCES filtered_graph_properties_dijkstra.cpp COMPILE_ONLY)
bcm_test(NAME graph_test_vf2_sub_graph_iso_test SOURCES vf2_sub_graph_iso_test.cpp)
bcm_test(NAME graph_test_vf2_sub_graph_iso_test_2 SOURCES vf2_sub_graph_iso_test_2.cpp)
bcm_test(NAME graph_test_hawick_circuits SOURCES hawick_circuits.cpp)
bcm_test(NAME graph_test_successive_shortest_path_nonnegative_weights_test SOURCES successive_shortest_path_nonnegative_weights_test.cpp)
bcm_test(NAME graph_test_cycle_canceling_test SOURCES cycle_canceling_test.cpp)
# bcm_test(NAME graph_test_strong_components_test SOURCES strong_components_test.cpp)
# bcm_test(NAME graph_test_find_flow_cost_bundled_properties_and_named_params_test SOURCES find_flow_cost_bundled_properties_and_named_params_test.cpp)
# bcm_test(NAME graph_test_max_flow_algorithms_bundled_properties_and_named_params SOURCES max_flow_algorithms_bundled_properties_and_named_params.cpp)

# Run SDB tests only when -DSDB=1 is set.
if(SDB)
    bcm_test(NAME graph_test_stanford_graph_cc SOURCES stanford_graph_cc.cpp COMPILE_ONLY)
endif()

# Run LEDA tests only when -DLEDA=1 is set.
if(LEDA)
    bcm_test(NAME graph_test_leda_graph_cc SOURCES leda_graph_cc.cpp COMPILE_ONLY)
endif()