# Basic Data Structures in Dart
## List.
- A list is a general-purpose, generic container for storing an ordered collection of elements, and it’s used commonly in all sorts of Dart programs. In many other programming languages, this data type is called an array.
- Dart defines List as an abstract class with methods for accessing and modifying the elements of the collection by index.
- List , like most other Dart collections, is an Iterable . This means that you can step through the elements sequentially. All iterables have a length getter that returns the number of elements in the collection. While this could take O(n) time for iterables that need to count every element, List will efficiently return length in O(1) time.

## Map
- A map is collection that holds key-value pairs.
- The abstract Map class itself in Dart doesn’t have any guarantees of order, nor can you insert at a specific index.
- Although Map itself doesn’t guarantee an order, the default Dart implementation of Map is LinkedHashMap , which, unlike HashMap , promises to maintain the insertion order.
- Inserting into a map always takes a constant amount of time.
- Lookup operations are also constant-time. This is significantly faster than searching for a particular element in a list, which requires a walk from the beginning of the list to the insertion point.

## Set
- A set is a container that holds unique values.
- Dart’s default implementation of Set uses LinkedHashSet , which, unlike HashSet , promises to maintain insertion order.