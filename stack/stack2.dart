void main() {
  var stack = Stack<int>();
  stack.push(1);
  stack.push(2);
  stack.push(3);

  print(stack.pop()); // Output: 3
  print(stack.pop()); // Output: 2
  print(stack.pop()); // Output: 1
}

class Stack<E> {
  Stack() : _storage = <E>[];
  final List<E> _storage;

  void push(E element) {
    _storage.add(element);
  }

  E pop() {
    if (_storage.isNotEmpty) {
      return _storage.removeLast();
    }
    throw Exception('Stack is empty');
  }
}