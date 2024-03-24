// Create a function that finds the middle node of a linked list. For example:
// 1 -> 2 -> 3 -> 4 -> null
// // middle is 3
// 1 -> 2 -> 3 -> null
// // middle is 2

// One solution is to have two references traverse down the nodes of the list, where one
// is twice as fast as the other. Once the faster reference reaches the end, the slower
// reference will be in the middle. Update the function to the following:

import 'linked_list.dart';

Node<E>? getMiddle<E>(LinkedList<E> list) {
  var slow = list.head;
  var fast = list.head;
  while (fast?.next != null) {
    fast = fast?.next?.next;
    slow = slow?.next;
  }

  return slow;
}

// In the while loop, fast checks the next two nodes while slow only gets one. This is
// known as the runner’s technique.

main() {
  var list = LinkedList<int>(null, null);
  list.push(3);
  list.push(2);
  list.push(1);
  print(list);
  final middleNode = getMiddle(list);
  print('Middle: ${middleNode?.value}');
}
