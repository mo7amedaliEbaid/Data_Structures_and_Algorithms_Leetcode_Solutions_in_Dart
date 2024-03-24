// Create a function that prints the nodes of a linked list in reverse order. For example:
// 1 -> 2 -> 3 -> null
//  should print out the following:
// 3
// 2
// 1

// A straightforward way to solve this problem is to use recursion. Since recursion
// allows you to build a call stack, you just need to call the print statements as the call
// stack unwinds.
import 'linked_list.dart';

void printNodesRecursively<T>(Node<T>? node) {
// 1
  if (node == null) return;
// 2
  printNodesRecursively(node.next);

// 3
  print(node.value);
}

void printListInReverse<E>(LinkedList<E> list) {
  printNodesRecursively(list.head);
}

main() {
  var list = LinkedList<int>(null, null);
  list.push(3);
  list.push(2);
  list.push(1);
  print('Original list: $list');
  print("Printing in reverse:");
  printListInReverse(list);
}
// The time complexity of this algorithm is O(n) since you have to traverse each node of
// the list. The space complexity is likewise O(n) since you implicitly use the function
// call stack to process each element.