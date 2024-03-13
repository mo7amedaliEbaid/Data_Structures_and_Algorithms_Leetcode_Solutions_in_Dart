# Basic Data Structures in Dart
## List.
- A list is a general-purpose, generic container for storing an ordered collection of elements, and it’s used commonly in all sorts of Dart programs. In many other programming languages, this data type is called an array.
- Dart defines List as an abstract class with methods for accessing and modifying the elements of the collection by index.
```dart
final people = ['Pablo', 'Manda', 'Megan'];
people.add('Edith');
print(people); // [Pablo, Manda, Megan, Edith]
people.insert(0, 'Ray');
// [Ray, Pablo, Manda, Megan, Edith]
```
## Map
- A map is collection that holds key-value pairs.
- The abstract Map class itself in Dart doesn’t have any guarantees of order, nor can you insert at a specific index.
- Although Map itself doesn’t guarantee an order, the default Dart implementation of Map is LinkedHashMap , which, unlike HashMap , promises to maintain the insertion order.
```dart
final scores = {'Eric': 9, 'Mark': 12, 'Wayne': 1};
scores['Andrew'] = 0;
print(scores);
// {Eric: 9, Mark: 12, Wayne: 1, Andrew: 0}
```
```dart
import 'dart:collection';
final hashMap = HashMap.of(scores);
print(hashMap);
// {Andrew: 0, Eric: 9, Wayne: 1, Mark: 12}
// Now the order has changed since HashMap makes no guarantees about order.
```
- Inserting into a map always takes a constant amount of time.
- Lookup operations are also constant-time. This is significantly faster than searching for a particular element in a list, which requires a walk from the beginning of the list to the insertion point.
## Set
- A set is a container that holds unique values.
```dart
var bag = {'Candy', 'Juice', 'Gummy'};
bag.add('Candy');
print(bag); // {Candy, Juice, Gummy}
```
- Dart’s default implementation of Set uses LinkedHashSet , which, unlike HashSet , promises to maintain insertion order.
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
