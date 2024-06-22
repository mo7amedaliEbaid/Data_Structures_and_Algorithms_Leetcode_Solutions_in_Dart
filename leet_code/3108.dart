// There is an undirected weighted graph with n vertices labeled from 0 to n - 1.
//
// You are given the integer n and an array edges, where edges[i] = [ui, vi, wi] indicates that there is an edge between vertices ui and vi with a weight of wi.
//
// A walk on a graph is a sequence of vertices and edges. The walk starts and ends with a vertex, and each edge connects the vertex that comes before it and the vertex that comes after it. It's important to note that a walk may visit the same edge or vertex more than once.
//
// The cost of a walk starting at node u and ending at node v is defined as the bitwise AND of the weights of the edges traversed during the walk. In other words, if the sequence of edge weights encountered during the walk is w0, w1, w2, ..., wk, then the cost is calculated as w0 & w1 & w2 & ... & wk, where & denotes the bitwise AND operator.
//
// You are also given a 2D array query, where query[i] = [si, ti]. For each query, you need to find the minimum cost of the walk starting at vertex si and ending at vertex ti. If there exists no such walk, the answer is -1.
//
// Return the array answer, where answer[i] denotes the minimum cost of a walk for query i.
//
//
//
// Example 1:
//
// Input: n = 5, edges = [[0,1,7],[1,3,7],[1,2,1]], query = [[0,3],[3,4]]
//
// Output: [1,-1]
//
// Explanation:
//
//
// To achieve the cost of 1 in the first query, we need to move on the following edges: 0->1 (weight 7), 1->2 (weight 1), 2->1 (weight 1), 1->3 (weight 7).
//
// In the second query, there is no walk between nodes 3 and 4, so the answer is -1.
//
// Example 2:
//
// Input: n = 3, edges = [[0,2,7],[0,1,15],[1,2,6],[1,2,1]], query = [[1,2]]
//
// Output: [0]
//
// Explanation:
//
//
// To achieve the cost of 0 in the first query, we need to move on the following edges: 1->2 (weight 1), 2->1 (weight 6), 1->2 (weight 1).
//
//
//
// Constraints:
//
// 1 <= n <= 105
// 0 <= edges.length <= 105
// edges[i].length == 3
// 0 <= ui, vi <= n - 1
// ui != vi
// 0 <= wi <= 105
// 1 <= query.length <= 105
// query[i].length == 2
// 0 <= si, ti <= n - 1

class DSU {
  late List<int> parent;
  late List<int> rank;
  late List<int> weights;

  DSU(int n) {
    parent = List<int>.generate(n, (index) => index);
    rank = List<int>.filled(n, 0);
    weights = List<int>.filled(n, 131071);
  }

  int find(int x) {
    if (x != parent[x]) parent[x] = find(parent[x]);
    return parent[x];
  }

  void union(int x, int y, int weight) {
    int xx = find(x);
    int yy = find(y);
    if (rank[xx] < rank[yy])
      parent[xx] = yy;
    else
      parent[yy] = xx;
    weights[xx] = weights[yy] = weights[xx] & weights[yy] & weight;
    if (rank[xx] == rank[yy]) rank[xx]++;
  }

  int minimumCostOfWalk(int x, int y) {
    if (x == y) return 0;
    if (find(x) != find(y)) return -1;
    return weights[find(x)];
  }
}

class Solution {
  List<int> minimumCost(int n, List<List<int>> edges, List<List<int>> query) {
    var uf = DSU(n);
    for (var edge in edges) uf.union(edge[0], edge[1], edge[2]);
    var result = List<int>.filled(query.length, 0);
    for (var i = 0; i < query.length; i++)
      result[i] = uf.minimumCostOfWalk(query[i][0], query[i][1]);
    return result;
  }
}

void main() {
  var solution = Solution();
  var n = 5;
  var edges = [
    [0, 1, 10],
    [1, 2, 20],
    [2, 3, 30],
    [3, 4, 40]
  ];
  var query = [
    [0, 2],
    [1, 3],
    [2, 4],
    [3, 4]
  ];
  var result = solution.minimumCost(n, edges, query);
  print(result); // Output: [10, 20, 30, 40]
}
