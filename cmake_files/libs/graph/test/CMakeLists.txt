include(BCMTest)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)

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

bcm_test(NAME graph_test_test_graphs SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_graphs.cpp)
bcm_test(NAME graph_test_index_graph SOURCES ${CMAKE_WORKSPACE_SOURCE}/index_graph.cpp)
bcm_test(NAME graph_test_labeled_graph SOURCES ${CMAKE_WORKSPACE_SOURCE}/labeled_graph.cpp)
# bcm_test(NAME graph_test_finish_edge_bug SOURCES ${CMAKE_WORKSPACE_SOURCE}/finish_edge_bug.cpp)

bcm_test(NAME graph_test_transitive_closure_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/transitive_closure_test.cpp)
bcm_test(NAME graph_test_adj_list_cc SOURCES ${CMAKE_WORKSPACE_SOURCE}/adj_list_cc.cpp COMPILE_ONLY)


bcm_test(NAME graph_test_adj_list_edge_list_set SOURCES ${CMAKE_WORKSPACE_SOURCE}/adj_list_edge_list_set.cpp)
bcm_test(NAME graph_test_adj_list_loops SOURCES ${CMAKE_WORKSPACE_SOURCE}/adj_list_loops.cpp)
bcm_test(NAME graph_test_adj_matrix_cc SOURCES ${CMAKE_WORKSPACE_SOURCE}/adj_matrix_cc.cpp COMPILE_ONLY)
bcm_test(NAME graph_test_bfs SOURCES ${CMAKE_WORKSPACE_SOURCE}/bfs.cpp)
bcm_test(NAME graph_test_bfs_cc SOURCES ${CMAKE_WORKSPACE_SOURCE}/bfs_cc.cpp COMPILE_ONLY)
bcm_test(NAME graph_test_bellman-test SOURCES ${CMAKE_WORKSPACE_SOURCE}/bellman-test.cpp)
bcm_test(NAME graph_test_betweenness_centrality_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/betweenness_centrality_test.cpp)
bcm_test(NAME graph_test_bidir_remove_edge SOURCES ${CMAKE_WORKSPACE_SOURCE}/bidir_remove_edge.cpp)
bcm_test(NAME graph_test_bipartite_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/bipartite_test.cpp)
bcm_test(NAME graph_test_csr_graph_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/csr_graph_test.cpp)
bcm_test(NAME graph_test_dag_longest_paths SOURCES ${CMAKE_WORKSPACE_SOURCE}/dag_longest_paths.cpp)
bcm_test(NAME graph_test_dfs SOURCES ${CMAKE_WORKSPACE_SOURCE}/dfs.cpp)
bcm_test(NAME graph_test_undirected_dfs SOURCES ${CMAKE_WORKSPACE_SOURCE}/undirected_dfs.cpp)
bcm_test(NAME graph_test_dfs_cc SOURCES ${CMAKE_WORKSPACE_SOURCE}/dfs_cc.cpp COMPILE_ONLY)
bcm_test(NAME graph_test_dijkstra_cc SOURCES ${CMAKE_WORKSPACE_SOURCE}/dijkstra_cc.cpp COMPILE_ONLY)
bcm_test(NAME graph_test_dijkstra_heap_performance SOURCES ${CMAKE_WORKSPACE_SOURCE}/dijkstra_heap_performance.cpp ARGS 10000)
bcm_test(NAME graph_test_dijkstra_no_color_map_compare SOURCES ${CMAKE_WORKSPACE_SOURCE}/dijkstra_no_color_map_compare.cpp ARGS 10000)
bcm_test(NAME graph_test_dominator_tree_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/dominator_tree_test.cpp)
bcm_test(NAME graph_test_relaxed_heap_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/relaxed_heap_test.cpp ARGS 5000 15000)
bcm_test(NAME graph_test_edge_list_cc SOURCES ${CMAKE_WORKSPACE_SOURCE}/edge_list_cc.cpp COMPILE_ONLY)
bcm_test(NAME graph_test_filtered_graph_cc SOURCES ${CMAKE_WORKSPACE_SOURCE}/filtered_graph_cc.cpp COMPILE_ONLY)
bcm_test(NAME graph_test_generator_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/generator_test.cpp)
bcm_test(NAME graph_test_graph SOURCES ${CMAKE_WORKSPACE_SOURCE}/graph.cpp)
bcm_test(NAME graph_test_graph_concepts SOURCES ${CMAKE_WORKSPACE_SOURCE}/graph_concepts.cpp COMPILE_ONLY)
bcm_test(NAME graph_test_graphviz_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/graphviz_test.cpp)
bcm_test(NAME graph_test_metis_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/metis_test.cpp ARGS ${METIS_INPUT_FILE})
bcm_test(NAME graph_test_gursoy_atun_layout_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/gursoy_atun_layout_test.cpp)
bcm_test(NAME graph_test_layout_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/layout_test.cpp)

# TODO: Skip serialization, since this requires grap_parallel
#bcm_test(NAME graph_test_serialize SOURCES ${CMAKE_WORKSPACE_SOURCE}/serialize.cpp)

bcm_test(NAME graph_test_reverse_graph_cc SOURCES ${CMAKE_WORKSPACE_SOURCE}/reverse_graph_cc.cpp COMPILE_ONLY)
bcm_test(NAME graph_test_sequential_vertex_coloring SOURCES ${CMAKE_WORKSPACE_SOURCE}/sequential_vertex_coloring.cpp)

bcm_test(NAME graph_test_subgraph SOURCES ${CMAKE_WORKSPACE_SOURCE}/subgraph.cpp)
bcm_test(NAME graph_test_subgraph_bundled SOURCES ${CMAKE_WORKSPACE_SOURCE}/subgraph_bundled.cpp)
bcm_test(NAME graph_test_subgraph_props SOURCES ${CMAKE_WORKSPACE_SOURCE}/subgraph_props.cpp)

bcm_test(NAME graph_test_isomorphism SOURCES ${CMAKE_WORKSPACE_SOURCE}/isomorphism.cpp)
bcm_test(NAME graph_test_adjacency_matrix_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/adjacency_matrix_test.cpp)
bcm_test(NAME graph_test_vector_graph_cc SOURCES ${CMAKE_WORKSPACE_SOURCE}/vector_graph_cc.cpp COMPILE_ONLY)
bcm_test(NAME graph_test_copy SOURCES ${CMAKE_WORKSPACE_SOURCE}/copy.cpp COMPILE_ONLY)
bcm_test(NAME graph_test_swap SOURCES ${CMAKE_WORKSPACE_SOURCE}/swap.cpp COMPILE_ONLY)
bcm_test(NAME graph_test_property_iter SOURCES ${CMAKE_WORKSPACE_SOURCE}/property_iter.cpp COMPILE_ONLY)
bcm_test(NAME graph_test_bundled_properties SOURCES ${CMAKE_WORKSPACE_SOURCE}/bundled_properties.cpp)
bcm_test(NAME graph_test_floyd_warshall_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/floyd_warshall_test.cpp)
bcm_test(NAME graph_test_astar_search_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/astar_search_test.cpp)
bcm_test(NAME graph_test_biconnected_components_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/biconnected_components_test.cpp)
bcm_test(NAME graph_test_cuthill_mckee_ordering SOURCES ${CMAKE_WORKSPACE_SOURCE}/cuthill_mckee_ordering.cpp)
bcm_test(NAME graph_test_king_ordering SOURCES ${CMAKE_WORKSPACE_SOURCE}/king_ordering.cpp)
bcm_test(NAME graph_test_matching_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/matching_test.cpp)
bcm_test(NAME graph_test_max_flow_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/max_flow_test.cpp)
bcm_test(NAME graph_test_boykov_kolmogorov_max_flow_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/boykov_kolmogorov_max_flow_test.cpp)
bcm_test(NAME graph_test_cycle_ratio_tests SOURCES ${CMAKE_WORKSPACE_SOURCE}/cycle_ratio_tests.cpp ARGS ${CYCLE_RATIO_INPUT_FILE})
bcm_test(NAME graph_test_basic_planarity_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/basic_planarity_test.cpp)
bcm_test(NAME graph_test_make_connected_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/make_connected_test.cpp)
bcm_test(NAME graph_test_make_bicon_planar_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/make_bicon_planar_test.cpp)
bcm_test(NAME graph_test_make_maximal_planar_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/make_maximal_planar_test.cpp)
bcm_test(NAME graph_test_named_vertices_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/named_vertices_test.cpp)
bcm_test(NAME graph_test_all_planar_input_files_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/all_planar_input_files_test.cpp ARGS ${PLANAR_INPUT_FILES})
bcm_test(NAME graph_test_parallel_edges_loops_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/parallel_edges_loops_test.cpp ARGS ${PLANAR_INPUT_FILES})
bcm_test(NAME graph_test_r_c_shortest_paths_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/r_c_shortest_paths_test.cpp)
bcm_test(NAME graph_test_rcsp_custom_vertex_id SOURCES ${CMAKE_WORKSPACE_SOURCE}/rcsp_custom_vertex_id.cpp)
bcm_test(NAME graph_test_is_straight_line_draw_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/is_straight_line_draw_test.cpp)
bcm_test(NAME graph_test_metric_tsp_approx SOURCES ${CMAKE_WORKSPACE_SOURCE}/metric_tsp_approx.cpp ARGS metric_tsp_approx.graph)
bcm_test(NAME graph_test_dimacs SOURCES ${CMAKE_WORKSPACE_SOURCE}/dimacs.cpp COMPILE_ONLY)
bcm_test(NAME graph_test_bron_kerbosch_all_cliques SOURCES ${CMAKE_WORKSPACE_SOURCE}/bron_kerbosch_all_cliques.cpp)
bcm_test(NAME graph_test_tiernan_all_cycles SOURCES ${CMAKE_WORKSPACE_SOURCE}/tiernan_all_cycles.cpp)
bcm_test(NAME graph_test_closeness_centrality SOURCES ${CMAKE_WORKSPACE_SOURCE}/closeness_centrality.cpp)
bcm_test(NAME graph_test_degree_centrality SOURCES ${CMAKE_WORKSPACE_SOURCE}/degree_centrality.cpp)
bcm_test(NAME graph_test_mean_geodesic SOURCES ${CMAKE_WORKSPACE_SOURCE}/mean_geodesic.cpp)
bcm_test(NAME graph_test_eccentricity SOURCES ${CMAKE_WORKSPACE_SOURCE}/eccentricity.cpp)
bcm_test(NAME graph_test_clustering_coefficient SOURCES ${CMAKE_WORKSPACE_SOURCE}/clustering_coefficient.cpp)
bcm_test(NAME graph_test_core_numbers_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/core_numbers_test.cpp)
bcm_test(NAME graph_test_read_propmap SOURCES ${CMAKE_WORKSPACE_SOURCE}/read_propmap.cpp)
bcm_test(NAME graph_test_mcgregor_subgraphs_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/mcgregor_subgraphs_test.cpp)
bcm_test(NAME graph_test_grid_graph_cc SOURCES ${CMAKE_WORKSPACE_SOURCE}/grid_graph_cc.cpp COMPILE_ONLY)
bcm_test(NAME graph_test_grid_graph_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/grid_graph_test.cpp)
bcm_test(NAME graph_test_incremental_components_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/incremental_components_test.cpp)
bcm_test(NAME graph_test_two_graphs_common_spanning_trees_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/two_graphs_common_spanning_trees_test.cpp)
bcm_test(NAME graph_test_random_spanning_tree_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/random_spanning_tree_test.cpp)
bcm_test(NAME graph_test_graphml_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/graphml_test.cpp ARGS "graphml_test.xml")
bcm_test(NAME graph_test_mas_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/mas_test.cpp ARGS ${TEST_DIR} NEED_PATCH)
bcm_test(NAME graph_test_stoer_wagner_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/stoer_wagner_test.cpp ARGS ${TEST_DIR} NEED_PATCH)
bcm_test(NAME graph_test_filtered_graph_properties_dijkstra SOURCES ${CMAKE_WORKSPACE_SOURCE}/filtered_graph_properties_dijkstra.cpp COMPILE_ONLY)
bcm_test(NAME graph_test_vf2_sub_graph_iso_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/vf2_sub_graph_iso_test.cpp)
bcm_test(NAME graph_test_vf2_sub_graph_iso_test_2 SOURCES ${CMAKE_WORKSPACE_SOURCE}/vf2_sub_graph_iso_test_2.cpp)
bcm_test(NAME graph_test_hawick_circuits SOURCES ${CMAKE_WORKSPACE_SOURCE}/hawick_circuits.cpp)
bcm_test(NAME graph_test_successive_shortest_path_nonnegative_weights_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/successive_shortest_path_nonnegative_weights_test.cpp)
bcm_test(NAME graph_test_cycle_canceling_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/cycle_canceling_test.cpp)
# bcm_test(NAME graph_test_strong_components_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/strong_components_test.cpp)
# bcm_test(NAME graph_test_find_flow_cost_bundled_properties_and_named_params_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/find_flow_cost_bundled_properties_and_named_params_test.cpp)
# bcm_test(NAME graph_test_max_flow_algorithms_bundled_properties_and_named_params SOURCES ${CMAKE_WORKSPACE_SOURCE}/max_flow_algorithms_bundled_properties_and_named_params.cpp)

# Run SDB tests only when -DSDB=1 is set.
if(SDB)
    bcm_test(NAME graph_test_stanford_graph_cc SOURCES ${CMAKE_WORKSPACE_SOURCE}/stanford_graph_cc.cpp COMPILE_ONLY)
endif()

# Run LEDA tests only when -DLEDA=1 is set.
if(LEDA)
    bcm_test(NAME graph_test_leda_graph_cc SOURCES ${CMAKE_WORKSPACE_SOURCE}/leda_graph_cc.cpp COMPILE_ONLY)
endif()