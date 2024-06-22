/*
A doubly linked list is simply a linked list in which nodes
also contain a reference to the previous node.*/

class Node<E> {
  E? value;
  Node<E>? prev;
  Node<E>? next;

  Node(this.value, {this.prev, this.next});
}

class DoublyLinkedList<E> {
  Node<E>? _head;
  Node<E>? _tail;
  int _size = 0;

  DoublyLinkedList() {
    _head = null;
    _tail = null;
    _size = 0;
  }

  int get size => _size;

  bool get isEmpty => _size == 0;

  Node<E>? get head => _head;

  Node<E>? get tail => _tail;

  void append(E element) {
    Node<E> newNode = Node(element);
    if (_tail == null) {
      _head = newNode;
      _tail = newNode;
    } else {
      newNode.prev = _tail;
      _tail!.next = newNode;
      _tail = newNode;
    }
    _size++;
  }

  E? pop() {
    if (_head == null) return null;

    E? value = _head!.value;
    _head = _head!.next;
    if (_head == null) {
      _tail = null;
    } else {
      _head!.prev = null;
    }
    _size--;
    return value;
  }

  @override
  String toString() {
    List<String> elements = [];
    Node<E>? current = _head;
    while (current != null) {
      elements.add(current.value.toString());
      current = current.next;
    }
    return elements.join(' -> ');
  }
}

abstract class Queue<E> {
  bool enqueue(E element);

  E? dequeue();

  bool get isEmpty;

  E? get peek;
}

class QueueLinkedList<E> implements Queue<E> {
  final _list = DoublyLinkedList<E>();

  @override
  bool enqueue(E element) {
    _list.append(element);
    return true;
  }

  @override
  E? dequeue() => _list.pop();

  @override
  bool get isEmpty => _list.isEmpty;

  @override
  E? get peek => _list.head?.value;

  @override
  String toString() => _list.toString();
}

void main() {
  QueueLinkedList<int> queue = QueueLinkedList<int>();

  print('Is the queue empty? ${queue.isEmpty}');

  queue.enqueue(1);
  queue.enqueue(2);
  queue.enqueue(3);

  print('After enqueueing 1, 2, 3: $queue');

  print('Peek: ${queue.peek}');

  print('Dequeue: ${queue.dequeue()}');
  print('After dequeueing: $queue');

  final anotherQueue = QueueLinkedList<String>();
  anotherQueue.enqueue('Ray');
  anotherQueue.enqueue('Brian');
  anotherQueue.enqueue('Eric');
  print(anotherQueue); // [Ray, Brian, Eric]
  anotherQueue.dequeue();
  print(anotherQueue); // [Brian, Eric]
  anotherQueue.peek;
  print(anotherQueue); // [Brian, Eric]
}
