// Create a function that reverses a linked list. You do this by manipulating the nodes
// so that they’re linked in the other direction. For example:
// // before
// 1 -> 2 -> 3 -> null
// // after
// 3 -> 2 -> 1 -> null

// To reverse a linked list, you must visit each node and update the next reference to
// point in the other direction. This can be a tricky task since you’ll need to manage
// multiple references to multiple nodes.

// The Easy Way
// You can trivially reverse a list by using the push method along with a new temporary
// list. Either add a reverse method to LinkedList or create an extension like so:

import 'linked_list.dart';

extension ReversibleLinkedList<E> on LinkedList<E> {
  void reverse() {
    final tempList = LinkedList<E>(null, null);
    for (final value in this) {
      tempList.push(value);
    }
    head = tempList.head;
  }
}

// You first start by pushing the current values in your list to a new temporary list. This
// will create a list in reverse order. After that point the head of the list to the reversed
// nodes.
// O(n) time complexity.
