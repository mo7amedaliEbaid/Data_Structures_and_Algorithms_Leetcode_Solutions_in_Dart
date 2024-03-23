class Node<E> {
  E data;
  Node<E>? prev;
  Node<E>? next;

  Node(this.data, {this.prev, this.next});
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

  void add(E element) {
    Node<E> newNode = Node(element);
    if (_head == null) {
      _head = newNode;
      _tail = newNode;
    } else {
      newNode.prev = _tail;
      _tail!.next = newNode;
      _tail = newNode;
    }
    _size++;
  }

  void remove(E element) {
    Node<E>? current = _head;
    while (current != null) {
      if (current.data == element) {
        if (current.prev != null) {
          current.prev!.next = current.next;
        } else {
          _head = current.next;
        }
        if (current.next != null) {
          current.next!.prev = current.prev;
        } else {
          _tail = current.prev;
        }
        _size--;
        break;
      }
      current = current.next;
    }
  }

  void printList() {
    Node<E>? current = _head;
    while (current != null) {
      print('${current.data} ');
      current = current.next;
    }
  }
}

void main() {
  DoublyLinkedList<int> dll = DoublyLinkedList<int>();

  dll.add(1);
  dll.add(2);
  dll.add(3);
  dll.add(4);

  print('Initial list:');
  dll.printList(); // Output: 1 2 3 4

  dll.remove(3);

  print('\nList after removing 3:');
  dll.printList(); // Output: 1 2 4
}
