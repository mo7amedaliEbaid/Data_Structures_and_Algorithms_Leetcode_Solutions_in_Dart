class Person {
  final String name;
  final int age;

  Person(this.name, this.age);

  @override
  int get hashCode {
    return name.hashCode ^ age.hashCode; // Combining hash codes of fields
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Person && other.name == name && other.age == age;
  }
}

void main() {
  var person1 = Person('Alice', 30);
  var person2 = Person('Bob', 25);

  print(person1.hashCode); // Output: 380414263
  print(person2.hashCode); // Output: 234952619

  // Hash codes should be the same for objects with equal values
  print(person1 == person2); // Output: false
}
// In this example, we define a Person class with name and age fields.
// We override the hashCode method to combine the hash codes of these fields,
// and we override the == operator to compare instances based on their values.