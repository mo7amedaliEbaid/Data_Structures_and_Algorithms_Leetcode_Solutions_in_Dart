
# Elementary Data Structures
## Satck.
- The stack data structure is identical in concept to a physical stack of objects. When you add an item to a stack, you place it on top of the stack. When you remove an item from a stack, you always remove the top-most item.
- There are only two essential operations for a stack:
  - push : Add an element to the top of the stack.
  - pop : Remove the top element of the stack.
- push and pop are both constant-time operations.
- A stack is known as a LIFO (last-in-first-out) data structure. Elements that are pushed in last are the first ones to be popped out.
```dart
class Stack<E> {
Stack() : _storage = <E>[];
final List<E> _storage;

void push(E element) => _storage.add(element);
E pop() => _storage.removeLast();

E get peek => _storage.last;
bool get isEmpty => _storage.isEmpty;
bool get isNotEmpty => !isEmpty;
// peek is an operation that is often attributed to the stack interface. The idea of peek
// is to look at the top element of the stack without mutating its contents.

//You might want to take an existing iterable collection and convert it to a stack so
// that the access order is guaranteed.
Stack.of(Iterable<E> elements) : _storage =
List<E>.of(elements);

@override
String toString() {
return '--- Top ---\n'
'${_storage.reversed.join('\n')}'
'\n-----------';
}
}

void main() {

final stack = Stack<int>();
stack.push(1);
stack.push(2);
stack.push(3);
stack.push(4);
print(stack);
final element = stack.pop();
print('Popped: $element');

const list = ['S', 'M', 'O', 'K', 'E'];
final smokeStack = Stack.of(list);
print(smokeStack);
smokeStack.pop();

}
```
- Output.
```
--- Top ---
4
3
2
1
-----------
Popped: 4
--- Top ---
E
K
O
M
S
-----------

```
```dart
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
```
