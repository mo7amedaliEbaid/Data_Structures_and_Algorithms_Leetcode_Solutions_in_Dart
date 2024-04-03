// A vertex has a unique index within its
// graph and holds a piece of data.

class Vertex<T> {
  const Vertex({
    required this.index,
    required this.data,
  });

  final int index;
  final T data;

  @override
  String toString() => data.toString();
}

// Edge connects two vertices and has an optional weight.
class Edge<T> {
  const Edge(
    this.source,
    this.destination, [
    this.weight,
  ]);

  final Vertex<T> source;
  final Vertex<T> destination;
  final double? weight;
}

enum EdgeType { directed, undirected }

abstract class Graph<E> {
  Iterable<Vertex<E>> get vertices;

  Vertex<E> createVertex(E data);

  void addEdge(
    Vertex<E> source,
    Vertex<E> destination, {
    EdgeType edgeType,
    double? weight,
  });

  List<Edge<E>> edges(Vertex<E> source);

  double? weight(
    Vertex<E> source,
    Vertex<E> destination,
  );
}
// This interface describes the common operations for a graph:
// • vertices: Returns all of the vertices in the graph.
// • createVertex : Creates a vertex and adds it to the graph.
// • addEdge : Connects two vertices in the graph with either a directed or undirected
// edge. The weight is optional.
// • edges : Returns a list of outgoing edges from a specific vertex.
// • weight : Returns the weight of the edge between two vertices.

class AdjacencyList<E> implements Graph<E> {
  final Map<Vertex<E>, List<Edge<E>>> _connections = {};
  var _nextIndex = 0;

  // You’ve defined an AdjacencyList class that uses a map to store the outgoing edges
// for each vertex. You’ll use _nextIndex to assign a unique index to each new vertex.
// If you need the vertices, you can obtain them from the vertices getter.

  @override
  Iterable<Vertex<E>> get vertices => _connections.keys;

  @override
  Vertex<E> createVertex(E data) {
// 1
    final vertex = Vertex(
      index: _nextIndex,
      data: data,
    );
    _nextIndex++;
// 2
    _connections[vertex] = [];
    return vertex;
  }

  // Here’s what’s happening:
// 1. You first create a new vertex with a unique index.
// 2. Then you add the vertex as a key in the _connections map. You haven’t
// connected it to any other vertices in the graph yet, so the list of outgoing edges is
// empty.

// To connect two vertices, you need to add an edge. Recall that there are directed and
// undirected edges:
  @override
  void addEdge(
      Vertex<E> source,
      Vertex<E> destination, {
        EdgeType edgeType = EdgeType.undirected,
        double? weight,
      }) {
// 1
    _connections[source]?.add(
      Edge(source, destination, weight),
    );
// 2
    if (edgeType == EdgeType.undirected) {
      _connections[destination]?.add(
        Edge(destination, source, weight),
      );
    }
  }
  // Every edge in an undirected graph can be traversed in both directions. So if it’s an
// undirected graph, you need to add two edges, one from the source to the destination
// and another from the destination to the source.

// Here’s what’s happening in the method body:
// 1. Since source is a vertex, check if it exists in the _connections map. If it does,
// create a new directed edge from the source to the destination . Then add it to
// the vertex’s list of edges.
// 2. If this is an undirected graph, then also add an edge going the other direction.

  @override
  List<Edge<E>> edges(Vertex<E> source) {
    return _connections[source] ?? [];
  }
// This gets the stored outgoing edges for the provided vertex. If source is unknown,
// the method returns an empty list.

  // Recall that the weight is the cost of going from one vertex to another. For example, if
  // the cost of a ticket between Singapore and Tokyo is $500, the weight of this
  // bidirectional edge is 500:
  @override
  double? weight(
      Vertex<E> source,
      Vertex<E> destination,
      ) {
    final match = edges(source).where((edge) {
      return edge.destination == destination;
    });
    if (match.isEmpty) return null;
    return match.first.weight;
  }

  // Here, you search for an edge from source to destination . If it exists, you return its
// weight.

  @override
  String toString() {
    final result = StringBuffer();
// 1
    _connections.forEach((vertex, edges) {
// 2
      final destinations = edges.map((edge) {
        return edge.destination;
      }).join(', ');
// 3
      result.writeln('$vertex --> $destinations');
    });
    return result.toString();
  }

  // Here’s what’s going on in the code above:
// 1. You loop through every key-value pair in _connections .
// 2. For every vertex, find all of the destinations and join them into a single, comma-
// separated string.
// 3. Put each vertex and its destinations on a new line.
// This will produce output with lines in the following format:
// Singapore --> Hong Kong, Tokyo
}

void main() {
  adjacencyList();
 // adjacencyMatrix();
}

void adjacencyList() {
  final graph = AdjacencyList<String>();

  final singapore = graph.createVertex('Singapore');
  final tokyo = graph.createVertex('Tokyo');
  final hongKong = graph.createVertex('Hong Kong');
  final detroit = graph.createVertex('Detroit');
  final sanFrancisco = graph.createVertex('San Francisco');
  final washingtonDC = graph.createVertex('Washington DC');
  final austinTexas = graph.createVertex('Austin Texas');
  final seattle = graph.createVertex('Seattle');

  graph.addEdge(singapore, hongKong, weight: 300);
  graph.addEdge(singapore, tokyo, weight: 500);
  graph.addEdge(hongKong, tokyo, weight: 250);
  graph.addEdge(tokyo, detroit, weight: 450);
  graph.addEdge(tokyo, washingtonDC, weight: 300);
  graph.addEdge(hongKong, sanFrancisco, weight: 600);
  graph.addEdge(detroit, austinTexas, weight: 50);
  graph.addEdge(austinTexas, washingtonDC, weight: 292);
  graph.addEdge(sanFrancisco, washingtonDC, weight: 337);
  graph.addEdge(washingtonDC, seattle, weight: 277);
  graph.addEdge(sanFrancisco, seattle, weight: 218);
  graph.addEdge(austinTexas, sanFrancisco, weight: 297);

  print(graph);

  final cost = graph.weight(singapore, tokyo)?.toInt();
  print('It costs \$$cost to fly from Singapore to Tokyo.');

  print('San Francisco Outgoing Flights: ');
  print('-------------------------------- ');
  for (final edge in graph.edges(sanFrancisco)) {
    print('${edge.source} to ${edge.destination}');
  }
}

/*
void adjacencyMatrix() {
  final graph = AdjacencyMatrix<String>();

  final singapore = graph.createVertex('Singapore');
  final tokyo = graph.createVertex('Tokyo');
  final hongKong = graph.createVertex('Hong Kong');
  final detroit = graph.createVertex('Detroit');
  final sanFrancisco = graph.createVertex('San Francisco');
  final washingtonDC = graph.createVertex('Washington DC');
  final austinTexas = graph.createVertex('Austin Texas');
  final seattle = graph.createVertex('Seattle');

  graph.addEdge(singapore, hongKong, weight: 300);
  graph.addEdge(singapore, tokyo, weight: 500);
  graph.addEdge(hongKong, tokyo, weight: 250);
  graph.addEdge(tokyo, detroit, weight: 450);
  graph.addEdge(tokyo, washingtonDC, weight: 300);
  graph.addEdge(hongKong, sanFrancisco, weight: 600);
  graph.addEdge(detroit, austinTexas, weight: 50);
  graph.addEdge(austinTexas, washingtonDC, weight: 292);
  graph.addEdge(sanFrancisco, washingtonDC, weight: 337);
  graph.addEdge(washingtonDC, seattle, weight: 277);
  graph.addEdge(sanFrancisco, seattle, weight: 218);
  graph.addEdge(austinTexas, sanFrancisco, weight: 297);

  print(graph);

  final cost = graph.weight(singapore, tokyo)?.toInt();
  print('It costs \$$cost to fly from Singapore to Tokyo.');

  print('San Francisco Outgoing Flights: ');
  print('-------------------------------- ');
  for (final edge in graph.edges(sanFrancisco)) {
    print('${edge.source} to ${edge.destination}');
  }
}*/
