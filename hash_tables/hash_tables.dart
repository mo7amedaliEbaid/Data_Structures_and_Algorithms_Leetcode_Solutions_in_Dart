void main() {
  // Creating a hash table (Map) with String keys and int values
  Map<String, int> ages = {
    'Alice': 30,
    'Bob': 25,
    'Charlie': 35,
  };
  // Accessing values by keys
  print('Alice\'s age: ${ages['Alice']}'); // Output: Alice's age: 30

  // Collision Resolution
  Map<String, int> ages1 = {
    'Alice': 30,
    'Bob': 25,
    'Charlie': 35,
    'Eve': 40,
    'Mallory': 45,
  };
  // Adding a new key-value pair
  ages1['Bob'] = 26; // Overwrites Bob's age with 26
  print('Bob\'s age: ${ages1['Bob']}');

  // Handling Missing Keys
  Map<String, int> ages2 = {
    'Alice': 30,
    'Bob': 25,
    'Charlie': 35,
  };

  // Checking if a key exists
  if (ages.containsKey('Alice')) {
    print('Alice\'s age: ${ages2['Alice']}'); // Output: Alice's age: 30
  } else {
    print('Alice not found');
  }
  if (ages.containsKey('Mo')) {
    print('Mo\'s age: ${ages2['Mo']}'); // Output: Alice's age: 30
  } else {
    print('Mo not found');
  }
}
// In this example, we created a hash table ages with string keys representing names and integer values representing ages.
// We accessed the age of 'Alice' using the key 'Alice'.

// Hash function example
int hashFunction(String key, int tableSize) {
  int hash = 0;
  for (int i = 0; i < key.length; i++) {
    hash = (hash + key.codeUnitAt(i)) % tableSize;
  }
  return hash;
}
// The hash function takes a key and the size of the hash table (tableSize) as input and produces a hash code within the range of valid indices.
