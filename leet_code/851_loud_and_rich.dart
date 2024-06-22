// There is a group of n people labeled from 0 to n - 1 where each person has a different amount of money and a different level of quietness.
//
// You are given an array richer where richer[i] = [ai, bi] indicates that ai has more money than bi and an integer array quiet
// where quiet[i] is the quietness of the ith person. All the given data in richer are logically correct
// (i.e., the data will not lead you to a situation where x is richer than y and y is richer than x at the same time).
//
// Return an integer array answer where answer[x] = y if y is the least quiet person
// (that is, the person y with the smallest value of quiet[y]) among all people who definitely have equal to or more money than the person x.
//
//
//
// Example 1:
//
// Input: richer = [[1,0],[2,1],[3,1],[3,7],[4,3],[5,3],[6,3]], quiet = [3,2,5,4,6,1,7,0]
// Output: [5,5,2,5,4,5,6,7]
// Explanation:
// answer[0] = 5.
// Person 5 has more money than 3, which has more money than 1, which has more money than 0.
// The only person who is quieter (has lower quiet[x]) is person 7, but it is not clear if they have more money than person 0.
// answer[7] = 7.
// Among all people that definitely have equal to or more money than person 7 (which could be persons 3, 4, 5, 6, or 7),
// the person who is the quietest (has lower quiet[x]) is person 7.
// The other answers can be filled out with similar reasoning.
// Example 2:
//
// Input: richer = [], quiet = [0]
// Output: [0]


// We can represent the richer relationships as a directed graph,
// where each node represents a person and each edge (a, b) indicates that person a is richer than person b.
// Here's how the graph looks for the example provided:
//    1   2
//   / \ / \
//  0   3   7
//     /|\
//    4 5 6

// In this graph:
//
// Person 0 has more money than person 1.
// Person 1 has more money than persons 2 and 3.
// Person 3 has more money than persons 4, 5, 6, and 7.
// The numbers inside the nodes represent the person's label (index in the quiet array),
// and the edges indicate the richer relationships between people.
//
// This graph helps visualize the richer relationships between people,
// which we can then use to determine the quietest person among those who are richer than each individual.
// Or
//   (richer)
//    (2) -> (1) -> (0)
//           ^
//           | (richer)
//           v
//    (3) -> (7)
//           ^
//           | (richer)
//           v
//    (4) -> (3)
//         /   \ (richer)
//        /     \
//   (5)        (6)
// Vertices: Each vertex represents a person labeled from 0 to n-1.
// Directed Edges: An edge goes from vertex A to vertex B if person A has more money than person B (information from the richer array).
// Explanation:
//
// In this example, we see person 2 has more money than person 1 (2 -> 1),
// who has more money than person 0 (1 -> 0). They form a chain representing the flow of money.
// Similarly, person 3 has more money than person 7 (3 -> 7).
// Person 4 has more money than person 3 (4 -> 3). We can further connect person 5 and 6 to person 3 based on the richer information
// (not shown here for simplicity).
// Finding the answer:
//
// We need to find the least quiet person among those who have equal or more money than a specific person (x).
// Traverse the graph starting from vertex x.
// Any vertex reachable from x (including x itself) represents someone with equal or more money than x.
// Among these reachable vertices, the one with the lowest quiet value is the answer for x.
// Note:
//
// This graph doesn't show quietness directly, but it helps us identify who has more money than whom.
// We can use the quiet array separately to find the quietest person among those with equal or more money (identified through the graph traversal).


// To solve this problem in Dart, we need to find, for each person, the quietest person among those who are richer than them.
// We can start by building a directed graph representing the richer relationships.
// Then, we can perform a depth-first search (DFS) to traverse this graph, keeping track of the quietest person among those who are richer.
class Solution {
  List<int> loudAndRich(List<List<int>> richer, List<int> quiet) {
    // Build adjacency list representation of the richer relationships
    Map<int, List<int>> graph = Map();
    for (List<int> relation in richer) {
      int richerPerson = relation[0];
      int poorerPerson = relation[1];
      if (!graph.containsKey(poorerPerson)) {
        graph[poorerPerson] = [];
      }
      graph[poorerPerson]?.add(richerPerson);
    }

    // Initialize answer array with -1 as placeholder
    List<int> answer = List.filled(quiet.length, -1);

    // Perform DFS for each person
    for (int person = 0; person < quiet.length; person++) {
      dfs(person, graph, quiet, answer);
    }

    return answer;
  }

  void dfs(int person, Map<int, List<int>> graph, List<int> quiet, List<int> answer) {
    // If answer is already calculated for this person, return
    if (answer[person] != -1) return;

    // By default, assume person himself is the quietest among those richer or equal
    answer[person] = person;

    // If this person has no richer neighbors, return
    if (!graph.containsKey(person)) return;

    // Iterate through richer neighbors and perform DFS
    for (int richerPerson in graph[person]!) {
      dfs(richerPerson, graph, quiet, answer);
      // Update answer if the current richer person is quieter than the current answer
      if (quiet[answer[person]] > quiet[answer[richerPerson]]) {
        answer[person] = answer[richerPerson];
      }
    }
  }
}

// In this Dart code:
//
// We define a class Solution with a method loudAndRich which takes the richer array and quiet array as input and returns the answer array.
// We build a directed graph using a map where each person is mapped to a list of their richer neighbors.
// We initialize the answer array with -1 as a placeholder value.
// We perform DFS for each person in the town, updating the answer array based on the quietest person among their richer neighbors.
// Finally, we return the answer array.

void main() {
  Solution solution = Solution();

  // Test case
  print(solution.loudAndRich(
      [[1, 0], [2, 1], [3, 1], [3, 7], [4, 3], [5, 3], [6, 3]],
      [3, 2, 5, 4, 6, 1, 7, 0])); // Output: [5, 5, 2, 5, 4, 5, 6, 7]
}



// Depth-first search (DFS) is an algorithm for traversing or searching tree or graph data structures.
// It starts at a root node (any starting node in the case of a graph) and explores as far as possible along each branch before backtracking.
//
// Here's a breakdown of how DFS works:
//
// Start at a Node: Begin at a chosen node (usually the root node in a tree or any node in a graph).
// Explore Neighbors: Visit all the unvisited neighbor nodes of the current node.
// Mark Visited: Add the current node to a list of visited nodes to avoid revisiting it.
// Recursive Call: For each unvisited neighbor, recursively call the DFS algorithm on that neighbor node.
// Backtrack: If there are no more unvisited neighbors of the current node, backtrack to the previous node in the search path.
// DFS uses a stack data structure to keep track of the nodes to be explored. As the algorithm explores a branch,
// it pushes the neighbor nodes onto the stack. When it reaches a dead end (no more unvisited neighbors),
// it pops a node from the stack and repeats the process from that node.
//
// Here are some common applications of DFS:
//
// Finding connected components in a graph
// Topological sorting (ordering a directed acyclic graph)
// Finding paths in a maze
// Cycle detection in graphs