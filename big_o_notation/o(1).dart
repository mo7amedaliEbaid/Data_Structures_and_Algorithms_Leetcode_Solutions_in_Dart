// O(1) - Constant Time Complexity - Examples

void constantTimeExample(List<int> numbers) {
  int firstNumber = numbers[0];
  print('First number: $firstNumber');
}

/*- Accessing an Element in an Array
- This function directly accesses the element at the specified index in the list numbers.
- Regardless of the size of the list, the time required to access the element remains constant.*/

// O(1) - Constant Time Complexity
int getElementAtIndex(List<int> numbers, int index) {
  return numbers[index]; // Direct access to element
}
// Performing Simple Arithmetic Operation

// O(1) - Constant Time Complexity
int add(int a, int b) {
  return a + b; // Simple arithmetic operation
}
// In this function, the addition operation a + b takes constant time, irrespective of the values of a and b.