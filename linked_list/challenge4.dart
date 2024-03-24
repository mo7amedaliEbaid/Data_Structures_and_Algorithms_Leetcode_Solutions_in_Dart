// Create a function that removes all occurrences of a specific element from a linked
// list. The implementation is similar to the removeAfter method that you
// implemented earlier. For example:
// // original list
// 1 -> 3 -> 3 -> 3 -> 4
// // list after removing all occurrences of 3
// 1 -> 4

// This solution traverses down the list, removing all nodes that match the element you
// want to remove. Each time you perform a removal, you need to reconnect the
// predecessor node with the successor node. While this can get complicated, it’s well
// worth it to practice this technique. Many data structures and algorithms will rely on
// clever uses of pointer arithmetic.
// There are a few cases you need to consider. The first case to consider is when the
// head of the list contains the value that you want to remove.

import 'linked_list.dart';

extension RemovableLinkedList<E> on LinkedList {
  void removeAll(E value) {
    while (head != null && head!.value == value) {
      head = head!.next;
    }
    var previous = head;
    var current = head?.next;
    while (current != null) {
      if (current.value == value) {
        previous?.next = current.next;
        current = previous?.next;
        continue;
      }
      previous = current;
      current = current.next;
      tail = previous;
    }
  }
}

main() {
  var list = LinkedList<int>(null, null);
  list.push(3);
  list.push(2);
  list.push(2);
  list.push(1);
  list.push(1);
  list.removeAll(3);
  print(list);
  // This algorithm has a time complexity of O(n) since you need to go through all the
  // elements.
}
