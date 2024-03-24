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

/*extension ReversibleLinkedList<E> on LinkedList<E> {
  void reverse() {
    final tempList = LinkedList<E>(null, null);
    for (final value in this) {
      tempList.push(value);
    }
    head = tempList.head;
  }
}*/

// You first start by pushing the current values in your list to a new temporary list. This
// will create a list in reverse order. After that point the head of the list to the reversed
// nodes.
// O(n) time complexity.


extension BetterReversibleLinkedList<E> on LinkedList<E> {
  void reverse() {
    tail = head;
    var previous = head;
    var current = head?.next;
    previous?.next = null;
    // You begin by assigning head to tail . Next, you create two references — previous
// and current — to keep track of traversal. The strategy is fairly straightforward: each
// node points to the next node down the list. You’ll traverse the list and make each
// node point to the previous node instead:
    while (current != null) {
      final next = current.next;
      current.next = previous;
      previous = current;
      current = next;
      //Each time you perform the reversal, you create a new reference to the next node.
      // After every reversal procedure, you move the two pointers to the next two nodes.
      // Once you’ve finished reversing all the pointers, you’ll set the head to the last node of
      // this list. Add the following at the end of the reverse method:
      head = previous;
    }
  }
}

main(){
  var list = LinkedList<int>(null,null);
  list.push(3);
  list.push(2);
  list.push(1);
  print('Original list: $list');
  list.reverse();
  print('Reversed list: $list');
  // The time complexity of your new reverse method is still O(n), the same as the
  // trivial implementation discussed earlier. However, you didn’t need to use a
  // temporary list or allocate any new Node objects, which significantly improves the
  // performance of this algorithm.
}