#### Hash tables are a fundamental data structure in computer science,offering efficient storage and retrieval of key-value pairs. In Dart, hash tables are commonly implemented using the `Map` class. 
# Hash Tables
- Hash Table is a data structure which organizes data using hash functions in order to support quick insertion and search.
- A hash table is a data structure that stores key-value pairs.
- It provides fast insertion, deletion, and lookup operations.
- The key advantage of hash tables lies in their ability to achieve constant-time complexity for these operations on average, making them suitable for a wide range of applications.
- In Dart, hash tables are represented by the `Map` class. 

## How Hash Tables Work
- Internally, a hash table uses an array-like data structure to store key-value pairs.
- When you insert a key-value pair into a hash table, a hash function is applied to the key to generate a unique index called a hash code.
- This hash code determines the position in the array where the key-value pair will be stored.

## Good Points
- Collision Resolution
  - Collision occurs when two different keys produce the same hash code, 
  - resulting in them attempting to occupy the same position in the hash table.
  - Dart's Map class handles collisions internally using techniques like chaining or open addressing.

- Handling Missing Keys
  - When accessing values in a hash table, it's crucial to handle cases where the key may not exist.
  - Dart provides various methods for safe key retrieval, such as `containsKey()` and `putIfAbsent()`.

## Hash Tables Types
- There are two different kinds of hash tables: hash set and hash map.
### Hash Set

- The hash set is one of the implementations of a set data structure to store no repeated values.
- Dart does support hash sets.
- A hash set is a collection of unique elements where each element is distinct and the order of elements is not guaranteed.
- Dart's `HashSet` class provides a set implementation based on hashing for efficient element lookup.
- Dart's `HashSet` provides efficient operations for adding, removing, and checking for the existence of elements,
- making it suitable for scenarios where unique elements need to be stored and efficiently accessed.
- Uses hashing to ensure uniqueness and efficient lookup.
- Elements are not ordered.
- Accessed directly as elements.
- Examples: { 'element1', 'element2', 'element3' }

### Hash Map
- The hash map is one of the implementations of a map data structure to store (key, value) pairs.
- Uses a hash table internally for efficient storage and retrieval.
- Keys must be unique.
- Accessed using keys.
- Examples: { 'key1': 'value1', 'key2': 'value2' }

