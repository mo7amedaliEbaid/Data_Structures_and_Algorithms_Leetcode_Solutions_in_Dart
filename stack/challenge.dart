import 'stack.dart';

// Challenge 1: Reverse a List
// Create a function that prints the contents of a list in reverse order.

class Challenge{

  // One of the prime use cases for stacks is to facilitate backtracking. If you push a
  // sequence of values into the stack, sequentially popping the stack will give you the
  // values in reverse order.

  void printInReverse<E>(List<E> list) {
    var stack = Stack<E>();
    for (E value in list) {
      stack.push(value);
    }

    while (stack.isNotEmpty) {
      print(stack.pop());
    }
  }

}
void main(){
  Challenge().printInReverse(['j','k','l']);
  // The time complexity of pushing all of the list elements into the stack is O(n). The
  // time complexity of popping the stack to print the values is also O(n). Overall, the
  // time complexity of this algorithm is O(n)
}