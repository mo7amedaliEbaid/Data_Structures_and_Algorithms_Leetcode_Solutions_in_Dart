// You are given a positive integer n representing the number of nodes of a Directed Acyclic Graph (DAG). The nodes are numbered from 0 to n - 1 (inclusive).
//
// You are also given a 2D integer array edges, where edges[i] = [fromi, toi] denotes that there is a unidirectional edge from fromi to toi in the graph.
//
// Return a list answer, where answer[i] is the list of ancestors of the ith node, sorted in ascending order.
//
// A node u is an ancestor of another node v if u can reach v via a set of edges.
//
//
//
// Example 1:
//
//
// Input: n = 8, edgeList = [[0,3],[0,4],[1,3],[2,4],[2,7],[3,5],[3,6],[3,7],[4,6]]
// Output: [[],[],[],[0,1],[0,2],[0,1,3],[0,1,2,3,4],[0,1,2,3]]
// Explanation:
// The above diagram represents the input graph.
// - Nodes 0, 1, and 2 do not have any ancestors.
// - Node 3 has two ancestors 0 and 1.
// - Node 4 has two ancestors 0 and 2.
// - Node 5 has three ancestors 0, 1, and 3.
// - Node 6 has five ancestors 0, 1, 2, 3, and 4.
// - Node 7 has four ancestors 0, 1, 2, and 3.

class Solution {
  List<List<int>> getAncestors(int n, List<List<int>> edges) {
    // Step 1: Initialize data structures
    List<List<int>> graph = List.generate(n, (_) => []);
    List<Set<int>> ancestors = List.generate(n, (_) => <int>{});

    // Step 2: Build the graph
    for (var edge in edges) {
      int from = edge[0];
      int to = edge[1];
      graph[from].add(to);
    }

    // Step 3: DFS to find ancestors
    void dfs(int node, Set<int> currentAncestors) {
      for (var child in graph[node]) {
        bool added = false;
        for (var ancestor in currentAncestors) {
          added = ancestors[child].add(ancestor) || added;
        }
        added = ancestors[child].add(node) || added;

        if (added) {
          dfs(child, {...currentAncestors, node});
        }
      }
    }

    for (int i = 0; i < n; i++) {
      dfs(i, {});
    }

    // Step 4: Convert sets to sorted lists
    List<List<int>> result = List.generate(n, (i) {
      List<int> sortedAncestors = ancestors[i].toList()..sort();
      return sortedAncestors;
    });

    // Step 5: Return result
    return result;
  }
}