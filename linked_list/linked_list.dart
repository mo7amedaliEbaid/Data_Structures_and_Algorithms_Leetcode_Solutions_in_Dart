class Node<T> {
  Node({required this.value, this.next});

  T value;
  Node<T>? next;

  // Note: When a method calls itself, this is known as recursion. A recursive
  // method must have a base case, which is its exit strategy so that the method
  // doesn’t keep calling itself forever. In the example above, the base case is when
  // the next node is null .

  @override
  String toString() {
    if (next == null) return '$value';
    return '$value -> ${next.toString()}';
  }
}

class LinkedList<E> {
  LinkedList(this.head, this.tail);

  Node<E>? head;
  Node<E>? tail;

  bool get isEmpty => head == null;

  @override
  String toString() {
    if (isEmpty) return 'Empty list';
    return head.toString();
  }
}

void main() {
  final node1 = Node(value: 1);
  final node2 = Node(value: 2);
  final node3 = Node(value: 3);
  node1.next = node2;
  node2.next = node3;
  print(node1);
  final linkedList = LinkedList(node1, node3);
  final linkedList1 = LinkedList(null, null);
  print(linkedList);
  print(linkedList1);
}
