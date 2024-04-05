import 'dart:collection';

void main() {
  // Creating a hash set
  HashSet<int> numbers = HashSet();

  // Adding elements to the hash set
  numbers.add(1);
  numbers.add(2);
  numbers.add(3);

  print(numbers); // Output: {1, 2, 3}

  // Adding a duplicate element (ignored)
  numbers.add(2);

  // Removing an element from the hash set
  numbers.remove(3);

  print(numbers); // Output: {1, 2}

  // Checking if an element exists in the hash set
  print(numbers.contains(2)); // Output: true
  print(numbers.contains(4)); // Output: false

  // Iterating over the hash set
  for (int num in numbers) {
    print(num);
  }
}
