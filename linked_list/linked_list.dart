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

class _LinkedListIterator<E> implements Iterator<E> {
  _LinkedListIterator(LinkedList<E> list) : _list = list;
  final LinkedList<E> _list;

  Node<E>? _currentNode;

  @override
  E get current => _currentNode!.value;

  bool _firstPass = true;

  @override
  bool moveNext() {
// 1
    if (_list.isEmpty) return false;
// 2
    if (_firstPass) {
      _currentNode = _list.head;
      _firstPass = false;
    } else {
      _currentNode = _currentNode?.next;
    }

// 3
    return _currentNode != null;
  }
}

class LinkedList<E> extends Iterable<E> {
  LinkedList(this.head, this.tail);

  Node<E>? head;
  Node<E>? tail;

  @override
  bool get isEmpty => head == null;

  void push(E value) {
    head = Node(value: value, next: head);
    tail ??= head;
  }

  void append(E value) {
// 1
    if (isEmpty) {
      push(value);
      return;
    }
// 2
    tail!.next = Node(value: value);

// 3
    tail = tail!.next;
  }

  Node<E>? nodeAt(int index) {
// 1
    var currentNode = head;
    var currentIndex = 0;

// 2
    while (currentNode != null && currentIndex < index) {
      currentNode = currentNode.next;
      currentIndex += 1;

      return currentNode;
    }
    return null;
  }

  Node<E> insertAfter(Node<E> node, E value) {
// 1
    if (tail == node) {
      append(value);
      return tail!;
    }

// 2
    node.next = Node(value: value, next: node.next);
    return node.next!;
  }

  E? pop() {
    final value = head?.value;
    head = head?.next;
    if (isEmpty) {
      tail = null;
    }
    return value;
  }

//  removeLast requires you to traverse all the way down the list. This makes for an O(n)
//  operation, which is relatively expensive.
  E? removeLast() {
// 1
    if (head?.next == null) return pop();
// 2
    var current = head;
    while (current!.next != tail) {
      current = current.next;
    }

// 3
    final value = tail?.value;
    tail = current;
    tail?.next = null;
    return value;
  }

  E? removeAfter(Node<E> node) {
    final value = node.next?.value;
    if (node.next == tail) {
      tail = node;
    }
    node.next = node.next?.next;
    return value;
  }

  @override
  String toString() {
    if (isEmpty) return 'Empty list';
    return head.toString();
  }

  @override
  Iterator<E> get iterator => _LinkedListIterator(this);
}

void main() {
  final node1 = Node(value: 1);
  final node2 = Node(value: 2);
  final node3 = Node(value: 3);
  node1.next = node2;
  node2.next = node3;
  // You know that the list is empty if the head is null . Also, since you already designed
  // Node to recursively print any nodes that follow it, you can print the entire linked list
  // just by calling head.toString
  print(node1);
  final linkedList = LinkedList(node1, node3);
  final linkedList1 = LinkedList(null, null);
  print(linkedList);
  print(linkedList1);
  final list = LinkedList<int>(null, null);
  list.push(3);
  list.push(2);
  list.push(1);
  print(list);
  list.append(1);
  list.append(2);
  list.append(3);
  print(list);
  final anotherList = LinkedList<int>(null, null);
  anotherList.push(4);
  anotherList.push(5);
  anotherList.push(6);
  print('Before: $anotherList');
  var middleNode = anotherList.nodeAt(1)!;
  anotherList.insertAfter(middleNode, 42);
  print('After:$anotherList');
  final poppedValue = anotherList.pop();
  print('After: $anotherList');
  print('Popped value: $poppedValue');
  final removedValue = anotherList.removeLast();
  print('After: $anotherList');
  print('Removed value: $removedValue');
  final list2 = LinkedList<int>(null, null);
  list2.push(3);
  list2.push(2);
  list2.push(1);
  print('Before: $list2');
  final firstNode = list2.nodeAt(1);
  final removedValueList2 = list2.removeAfter(firstNode!);
  print('After: $list2');
  print('Removed value: $removedValueList2');
  final list3 = LinkedList<int>(null, null);
  list3.push(3);
  list3.push(2);
  list3.push(1);
  for (final element in list3) {
    print(element);
  }
  // Looping through a collection is not the only benefit of implementing Iterable . You
  // now have access to all sorts of methods like where , map , contains , and elementAt .
  // Just keep in mind that these are O(n) operations, though. Even the innocuous-
  // looking length requires iterating through the whole list to calculate.

}
