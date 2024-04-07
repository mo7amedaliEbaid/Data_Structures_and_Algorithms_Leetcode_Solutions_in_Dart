// There is an undirected weighted graph with n vertices labeled from 0 to n - 1.
//
//You are given the integer n and an array edges, where edges[i] = [ui, vi, wi] indicates that there is an edge between vertices ui and vi with a weight of wi.
//
//A walk on a graph is a sequence of vertices and edges. The walk starts and ends with a vertex, and each edge connects the vertex that comes before it and the vertex that comes after it. It's important to note that a walk may visit the same edge or vertex more than once.
//
//The cost of a walk starting at node u and ending at node v is defined as the bitwise AND of the weights of the edges traversed during the walk. In other words, if the sequence of edge weights encountered during the walk is w0, w1, w2, ..., wk, then the cost is calculated as w0 & w1 & w2 & ... & wk, where & denotes the bitwise AND operator.
//
//You are also given a 2D array query, where query[i] = [si, ti]. For each query, you need to find the minimum cost of the walk starting at vertex si and ending at vertex ti. If there exists no such walk, the answer is -1.
//
//Return the array answer, where answer[i] denotes the minimum cost of a walk for query i.
//
//
//
//Example 1:
//
//Input: n = 5, edges = [[0,1,7],[1,3,7],[1,2,1]], query = [[0,3],[3,4]]
//
//Output: [1,-1]
//
//Explanation:
//
//
//To achieve the cost of 1 in the first query, we need to move on the following edges: 0->1 (weight 7), 1->2 (weight 1), 2->1 (weight 1), 1->3 (weight 7).
//
//In the second query, there is no walk between nodes 3 and 4, so the answer is -1.
//
//Example 2:
//
//Input: n = 3, edges = [[0,2,7],[0,1,15],[1,2,6],[1,2,1]], query = [[1,2]]
//
//Output: [0]
//
//Explanation:
//
//
//To achieve the cost of 0 in the first query, we need to move on the following edges: 1->2 (weight 1), 2->1 (weight 6), 1->2 (weight 1).
//
//
//
//Constraints:
//
//1 <= n <= 105
//0 <= edges.length <= 105
//edges[i].length == 3
//0 <= ui, vi <= n - 1
//ui != vi
//0 <= wi <= 105
//1 <= query.length <= 105
//query[i].length == 2
//0 <= si, ti <= n - 1

// When navigating the graph, we use bitwise AND operations between edges to calculate the path's cost. Additionally, we can reuse the same edges multiple times. By performing bitwise AND, the cost may decrease or remain the same. Hence, our objective is to maximize edge utilization to minimize path cost. We can organize vertices into groups reachable via connected edges. Within each group, traversing any two nodes results in the same cost since we traverse all edges in the group, ensuring the minimum cost. Consequently, for each group of interconnected vertices, the cost remains constant, equivalent to the AND operation of all connecting edges within the group.
//
//Approach
//Perform union find on edges to find the groups of connected vertices
//During the union-find operation, maintain a list called weights to represent the weight of each connected group. When performing a union operation between two vertices, compute the new weight of the group by performing a bitwise AND operation between the existing weight of each group and the cost of the edge connecting them. This process updates the cost of the group of vertices to reflect the addition of the new edge
//All weights are initialized to 131071. 131071 is chosen because it is 11111111111111111 in binary and is greater than 10^5.
//When returning result for a query if si is equal to ti return 0 because start and target are same
//If si and ti don't belong to the same group return -1
//If si and ti are members of the same group, return the result of performing the AND operation on all edges within that group.
//Complexity
//Time complexity: $O(N)$. Time complexity of union find with path compresson and rank is close to $O(N)$
//Space complexity: $O(N)$. We create new arrays in the DSU class which incur a space complexity of $O(N)$.
class DSU {
  int[] parent, rank, weights;
  public DSU(int n) {
    parent = new int[n];
    rank = new int[n];
    weights = new int[n];
    Arrays.fill(weights, 131071);
    for (int i = 0; i < n; i++)
      parent[i] = i;
  }
  public int find(int x) {
    if (x != parent[x])
      parent[x] = find(parent[x]);
    return parent[x];
  }
  public void union(int x, int y, int weight) {
    int xx = find(x);
    int yy = find(y);
    if (rank[xx] < rank[yy])
      parent[xx] = yy;
    else
      parent[yy] = xx;
    weights[xx] = weights[yy] = weights[xx] & weights[yy] & weight;
    if (rank[xx] == rank[yy])
      rank[xx]++;
  }
  public int minimumCostOfWalk(int x, int y) {
    if (x == y)
      return 0;
    if (find(x) != find(y))
      return -1;
    return weights[find(x)];
  }
}
class Solution {
  public int[] minimumCost(int n, int[][] edges, int[][] query) {
    DSU uf = new DSU(n);
    for (int[] edge : edges)
      uf.union(edge[0], edge[1], edge[2]);
    int[] result = new int[query.length];
    for (int i = 0; i < query.length; i++)
      result[i] = uf.minimumCostOfWalk(query[i][0], query[i][1]);
    return result;
  }
}