# Graph
- A graph is a data structure that captures relationships between objects. It’s made up of vertices connected by edges.

## Weighted Graphs
- In a weighted graph, every edge has a weight associated with it that represents the cost of using this edge. These weights let you choose the cheapest or shortest path between two vertices.

## Directed Graphs
- As well as assigning a weight to an edge, your graphs can also have direction.
- Directed graphs are more restrictive to traverse because an edge may only permit traversal in one direction.


## Undirected Graphs
- You can think of an undirected graph as a directed graph where all edges are bi-directional.
- In an undirected graph:
  - Two connected vertices have edges going back and forth. 
  - The weight of an edge applies to both directions.
  

### Adjacency List
- An adjacency list is a way of representing graphs in computer science. 
- It uses an array of lists to store the connections between nodes (vertices) in the graph.  
- Imagine an address book where each entry (vertex) has a list of all their contacts (neighboring vertices).